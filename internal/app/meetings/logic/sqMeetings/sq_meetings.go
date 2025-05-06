// ==========================================================================
// GFast自动生成logic操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/logic/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package sqMeetings

import (
	"context"
	"fmt"
	"log"
	"math/rand"
	"time"

	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/tiger1103/gfast/v3/api/v1/meetings"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/dao"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/model"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

func init() {
	service.RegisterSqMeetings(New())
}

func New() service.ISqMeetings {
	return &sSqMeetings{}
}

type sSqMeetings struct {
}

func (s *sSqMeetings) Add(ctx context.Context, req *meetings.SqMeetingsAddReq) (err error) {
	// 参数合法性校验
	if req.Mode == string(MeetingModeRomingText) {
		if req.Distance <= 0 {
			return gerror.New("电子围栏半径不能小于等于0")
		}
	}
	if req.StartTime.Before(gtime.Now()) {
		return gerror.New("会议开始时间必须大于当前时间")
	}
	if req.StartTime.After(gtime.Now().AddDate(0, 3, 0)) {
		return gerror.New("会议预约时间不能超过三个月")
	}
	if req.EndTime != nil && req.EndTime.Before(req.StartTime) {
		return gerror.New("会议结束时间必须大于开始时间")
	}

	// 封装会议信息
	req.RoomNumber = s.GetRoomID(ctx)
	meetingData := do.SqMeetings{
		RoomNumber:       req.RoomNumber,
		Topic:            req.Topic,
		Mode:             s.GetMode(req.Mode),
		Distance:         req.Distance,
		Type:             s.GetType(req.Type),
		Status:           MeetingStatusCreated,
		Location:         req.Location,
		CreatorId:        req.CreatorId,
		Description:      req.Description,
		RecordingEnabled: req.RecordingEnabled,
		CreateTime:       gtime.Now(),
		StartTime:        req.StartTime,
		EndTime:          req.EndTime,
	}
	// 封装参会人员信息
	invitesData := make([]*do.SqMeetingsParticipants, 0)
	if req.CreatorId == req.ModeratorId { // 创建者和主持人是同一人
		invitesData = append(invitesData, &do.SqMeetingsParticipants{
			RoomNumber: req.RoomNumber,
			UserId:     req.CreatorId,
			UserName:   req.CreatorName,
			Role:       ParticipantRoleModerator | ParticipantRoleAdmin,
			Status:     ParticipantStatusUnhandled,
		})
	} else { // 创建者和主持人不是同一人
		invitesData = append(invitesData, &do.SqMeetingsParticipants{
			RoomNumber: req.RoomNumber,
			UserId:     req.CreatorId,
			UserName:   req.CreatorName,
			Role:       ParticipantRoleAdmin, // 创建者默认为管理员
			Status:     ParticipantStatusUnhandled,
		})
		invitesData = append(invitesData, &do.SqMeetingsParticipants{
			RoomNumber: req.RoomNumber,
			UserId:     req.ModeratorId,
			UserName:   req.ModeratorName,
			Role:       ParticipantRoleModerator, // 主持人
			Status:     ParticipantStatusUnhandled,
		})
	}
	for _, v := range req.MemberInfos {
		invitesData = append(invitesData, &do.SqMeetingsParticipants{
			RoomNumber: req.RoomNumber,
			UserId:     v.UserID,
			UserName:   v.UserName,
			Role:       ParticipantRoleMember,
			Status:     ParticipantStatusUnhandled,
		})
	}

	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = tx.Model(dao.SqMeetings.Table()).Ctx(ctx).Insert(meetingData)
			liberr.ErrIsNil(ctx, err, "会议信息添加失败")
			_, err = tx.Model(dao.SqMeetingsParticipants.Table()).Ctx(ctx).Insert(invitesData)
			liberr.ErrIsNil(ctx, err, "参会人员信息添加失败")
		})
		return err
	})

	return
}

func (s *sSqMeetings) GetByRoomNumber(ctx context.Context, roomNumber string) (res *meetings.SqMeetingsGetDetailsRes, err error) {
	res = &meetings.SqMeetingsGetDetailsRes{}
	m := &model.SqMeetingsDB{}
	var result []*model.SqMeetingsParticipantsDB
	err = g.Try(ctx, func(ctx context.Context) {
		err = dao.SqMeetings.Ctx(ctx).WithAll().Where(dao.SqMeetings.Columns().RoomNumber, roomNumber).Scan(m)
		liberr.ErrIsNil(ctx, err, "获取会议信息失败")
		err = dao.SqMeetingsParticipants.Ctx(ctx).WithAll().Where(dao.SqMeetingsParticipants.Columns().RoomNumber, roomNumber).Scan(&result)
		liberr.ErrIsNil(ctx, err, "获取参会人员信息失败")
	})
	// m.ParticipantsList = append(m.ParticipantsList, result...)

	res.SqMeetings = s.convertDataModel(m)
	for _, v := range result {
		if MeetingParticipantRole(v.Role)&ParticipantRoleAdmin != 0 {
			res.CreatorId = v.UserID
			res.CreatorName = v.UserName
		}
		if MeetingParticipantRole(v.Role)&ParticipantRoleModerator != 0 {
			res.ModeratorId = v.UserID
			res.ModeratorName = v.UserName
		}
		res.MemberInfos = append(res.MemberInfos, &model.SqMeetingsParticipants{
			UserID:     v.UserID,
			UserName:   v.UserName,
			RoomNumber: v.RoomNumber,
			Role:       s.GetParticipantRoles(v.Role),
			Status:     string(s.GetParticipantStatusText(v.Status)),
			UpdateTime: v.UpdateTime,
			JoinTime:   v.JoinTime,
			ExitTime:   v.ExitTime,
		})
	}

	return
}

func (s *sSqMeetings) GetHistoryByUserID(ctx context.Context, userID string) (res *meetings.SqMeetingsGetHistoryRes, err error) {
	roomIDs := make([]string, 0)
	err = g.Try(ctx, func(ctx context.Context) {
		result, err := dao.SqMeetingsParticipants.Ctx(ctx).Fields(dao.SqMeetingsParticipants.Columns().RoomNumber).
			Where(dao.SqMeetingsParticipants.Columns().UserID, userID).
			Array()
		liberr.ErrIsNil(ctx, err, "获取会议室ID失败")
		// log.Println(result)
		for _, v := range result {
			roomIDs = append(roomIDs, v.Val().(string))
		}
	})
	if len(roomIDs) == 0 {
		return
	}
	// log.Println("获取到用户加入的会议ID：", roomIDs)
	mInfos := make([]*meetings.SqMeetingsGetDetailsRes, 0)
	for _, v := range roomIDs {
		mInfo, err := s.GetByRoomNumber(ctx, v)
		liberr.ErrIsNil(ctx, err, "获取会议室信息失败")
		mInfos = append(mInfos, mInfo)
	}

	res = &meetings.SqMeetingsGetHistoryRes{}
	for _, v := range mInfos {
		if v.SqMeetings.EndTime != nil && gtime.Now().After(v.SqMeetings.EndTime) {
			res.List = append(res.List, &meetings.SqMeetingDetails{
				SqMeetings:    v.SqMeetings,
				ModeratorId:   v.ModeratorId,
				ModeratorName: v.ModeratorName,
				MemberInfos:   v.MemberInfos,
			})
		}
	}

	return
}

func (s *sSqMeetings) GetFutureByUserID(ctx context.Context, userID string) (res *meetings.SqMeetingsGetFutureRes, err error) {
	roomIDs := make([]string, 0)
	err = g.Try(ctx, func(ctx context.Context) {
		result, err := dao.SqMeetingsParticipants.Ctx(ctx).Fields(dao.SqMeetingsParticipants.Columns().RoomNumber).
			Where(dao.SqMeetingsParticipants.Columns().UserID, userID).
			Array()
		liberr.ErrIsNil(ctx, err, "获取会议室ID失败")
		// log.Println(result)
		for _, v := range result {
			roomIDs = append(roomIDs, v.Val().(string))
		}
	})
	if len(roomIDs) == 0 {
		return
	}
	// log.Println("获取到用户加入的会议ID：", roomIDs)
	mInfos := make([]*meetings.SqMeetingsGetDetailsRes, 0)
	for _, v := range roomIDs {
		mInfo, err := s.GetByRoomNumber(ctx, v)
		liberr.ErrIsNil(ctx, err, "获取会议室信息失败")
		mInfos = append(mInfos, mInfo)
	}

	res = &meetings.SqMeetingsGetFutureRes{}
	for _, v := range mInfos {
		if gtime.Now().Before(v.SqMeetings.StartTime) || v.SqMeetings.Status == string(MeetingStatusStarted) {
			res.List = append(res.List, &meetings.SqMeetingDetails{
				SqMeetings:    v.SqMeetings,
				ModeratorId:   v.ModeratorId,
				ModeratorName: v.ModeratorName,
				MemberInfos:   v.MemberInfos,
			})
		}
	}

	return
}

func (s *sSqMeetings) CancelByRoomNumber(ctx context.Context, roomNumber string) (err error) {
	var data g.Map = g.Map{}
	data[dao.SqMeetings.Columns().Status] = MeetingStatusCanceled
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SqMeetings.Ctx(ctx).Where(dao.SqMeetings.Columns().RoomNumber, roomNumber).Update(data)
		liberr.ErrIsNil(ctx, err, "取消会议失败")
	})

	return
}

func (s *sSqMeetings) Edit(ctx context.Context, req *meetings.SqMeetingsEditReq) (err error) {
	oldData, err := s.GetByRoomNumber(ctx, req.RoomNumber)
	liberr.ErrIsNil(ctx, err, "获取会议信息失败")

	var data g.Map = g.Map{}
	if req.Topic != "" && req.Topic != oldData.Topic {
		data[dao.SqMeetings.Columns().Topic] = req.Topic
	}
	if req.Mode != oldData.Mode {
		data[dao.SqMeetings.Columns().Mode] = s.GetMode(req.Mode)
	}
	if data[dao.SqMeetings.Columns().Mode] == MeetingModeRoming {
		if req.Distance != oldData.Distance {
			data[dao.SqMeetings.Columns().Distance] = req.Distance
		}
	} else {
		data[dao.SqMeetings.Columns().Distance] = 0
	}
	if req.Type != oldData.Type {
		data[dao.SqMeetings.Columns().Type] = s.GetType(req.Type)
	}
	if req.Location != oldData.Location {
		data[dao.SqMeetings.Columns().Location] = req.Location
	}
	if req.Description != "" && req.Description != oldData.Description {
		data[dao.SqMeetings.Columns().Description] = req.Description
	}
	if req.RecordingEnabled != oldData.RecordingEnabled {
		data[dao.SqMeetings.Columns().RecordingEnabled] = req.RecordingEnabled
	}
	if req.StartTime != oldData.StartTime {
		data[dao.SqMeetings.Columns().StartTime] = req.StartTime
	}
	if req.EndTime != nil && req.EndTime != oldData.EndTime {
		data[dao.SqMeetings.Columns().EndTime] = req.EndTime
	}

	insertData := make([]*do.SqMeetingsParticipants, 0)
	deleteData := make([]string, 0)
	m := make(map[string]string)
	for _, v := range req.MemberInfos {
		m[v.UserID] = v.UserName
	}
	for _, v := range oldData.MemberInfos {
		if _, ok := m[v.UserID]; !ok {
			deleteData = append(deleteData, v.UserID)
		} else {
			delete(m, v.UserID)
		}
	}
	m[req.CreatorId] = req.CreatorName
	m[req.ModeratorId] = req.ModeratorName
	for k, v := range m {
		insertData = append(insertData, &do.SqMeetingsParticipants{
			RoomNumber: req.RoomNumber,
			UserId:     k,
			UserName:   v,
			Role:       ParticipantRoleMember,
			Status:     ParticipantStatusUnhandled,
		})
	}

	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = dao.SqMeetings.Ctx(ctx).Where(dao.SqMeetings.Columns().RoomNumber, req.RoomNumber).Update(data)
			liberr.ErrIsNil(ctx, err, "会议信息修改失败")
			if len(deleteData) > 0 {
				_, err = dao.SqMeetingsParticipants.Ctx(ctx).Where(dao.SqMeetingsParticipants.Columns().RoomNumber, req.RoomNumber).
					WhereIn(dao.SqMeetingsParticipants.Columns().UserID, deleteData).Delete()
				liberr.ErrIsNil(ctx, err, "删除参会人员失败")
			}
			if len(insertData) > 0 {
				_, err = dao.SqMeetingsParticipants.Ctx(ctx).TX(tx).Insert(insertData)
				liberr.ErrIsNil(ctx, err, "添加参会人员失败")
			}
		})
		return err
	})

	return
}

func (s *sSqMeetings) List(ctx context.Context, req *model.SqMeetingsSearchReq) (listRes *model.SqMeetingsSearchRes, err error) {
	listRes = new(model.SqMeetingsSearchRes)
	err = g.Try(ctx, func(ctx context.Context) {
		m := dao.SqMeetings.Ctx(ctx).WithAll().As("t1")
		m = m.LeftJoin(dao.SqMeetingsParticipants.Table()+" as t2", "t1.room_number = t2.mid")
		m = m.Where("t2."+dao.SqMeetingsParticipants.Columns().UserID+"=?", req.UserName)

		listRes.Total, err = m.Count()
		liberr.ErrIsNil(ctx, err, "获取数据失败")
		if req.PageNum == 0 {
			req.PageNum = 1
		}
		listRes.CurrentPage = req.PageNum
		if req.PageSize == 0 {
			req.PageSize = consts.PageSize
		}
		order := "t1.create_time desc"
		if req.OrderBy != "" {
			order = req.OrderBy
		}
		var result []*model.SqMeetingsDB
		err = m.Page(req.PageNum, req.PageSize).Fields("t1.*").Order(order).Scan(&result)
		liberr.ErrIsNil(ctx, err, "获取数据失败")
		for _, v := range result {
			listRes.List = append(listRes.List, s.convertDataModel(v))
		}
	})
	return
}

func (s *sSqMeetings) convertDataModel(sqDB *model.SqMeetingsDB) *model.SqMeetings {
	return &model.SqMeetings{
		ID:               sqDB.ID,
		RoomNumber:       sqDB.RoomNumber,
		Topic:            sqDB.Topic,
		Mode:             string(s.GetModeText(sqDB.Mode)),
		Distance:         sqDB.Distance,
		Type:             string(s.GetTypeText(sqDB.Type)),
		Status:           string(s.GetStatusText(sqDB.Status)),
		Location:         sqDB.Location,
		CreatorId:        sqDB.CreatorId,
		Description:      sqDB.Description,
		RecordingEnabled: sqDB.RecordingEnabled,
		CreateTime:       sqDB.CreateTime,
		StartTime:        sqDB.StartTime,
		EndTime:          sqDB.EndTime,
	}

}

func (s *sSqMeetings) GetRoomID(ctx context.Context) (roomID string) {
	for {
		roomID = s.generateRoomID()
		num, err := dao.SqMeetings.Ctx(ctx).Count(fmt.Sprintf("room_number = %s", roomID))
		if err == nil && num == 0 {
			break
		}
		log.Println("生成会议室ID失败，正在重试...")
		time.Sleep(time.Millisecond * 500)
	}

	return roomID
}
func (s *sSqMeetings) generateRoomID() string {
	rand.Seed(time.Now().UnixNano())
	return fmt.Sprintf("%09d", rand.Intn(1000000000))
}

type MeetingMode int

const (
	MeetingModeUnknown      MeetingMode = iota // 未知模式
	MeetingModeRoming                          // 漫游模式
	MeetingModeMeetingRoom                     // 会议室模式
	MeetingModeVirtualHuman                    // 虚拟人模式
)

type MeetingModeText string

const (
	MeetingModeUnknownText      MeetingModeText = "未知模式"
	MeetingModeRomingText       MeetingModeText = "漫游模式"
	MeetingModeMeetingRoomText  MeetingModeText = "会议室模式"
	MeetingModeVirtualHumanText MeetingModeText = "虚拟人模式"
)

type MeetingType int

const (
	MeetingTypeUnknown   MeetingType = iota
	MeetingTypeInstant               // 即时会议
	MeetingTypeScheduled             // 预约会议
)

type MeetingTypeText string

const (
	MeetingTypeUnknownText   MeetingTypeText = "未知类型"
	MeetingTypeInstantText   MeetingTypeText = "即时会议"
	MeetingTypeScheduledText MeetingTypeText = "预约会议"
)

type MeetingStatus int

const (
	MeetingStatusUnknown  MeetingStatus = iota
	MeetingStatusCreated                // 已创建
	MeetingStatusStarted                // 进行中
	MeetingStatusEnded                  // 已结束
	MeetingStatusCanceled               // 已取消
)

type MeetingStatusText string

const (
	MeetingStatusUnknownText  MeetingStatusText = "未知状态"
	MeetingStatusCreatedText  MeetingStatusText = "已创建"
	MeetingStatusStartedText  MeetingStatusText = "进行中"
	MeetingStatusEndedText    MeetingStatusText = "已结束"
	MeetingStatusCanceledText MeetingStatusText = "已取消"
)

type MeetingParticipantRole uint

const (
	ParticipantRoleModerator MeetingParticipantRole = 1 << iota // 主持人
	ParticipantRoleAdmin                                        // 管理员
	ParticipantRoleMember                                       // 观众
)

type ParticipantRoleText string

const (
	ParticipantRoleUnknownText   ParticipantRoleText = "未知角色"
	ParticipantRoleModeratorText ParticipantRoleText = "主持人"
	ParticipantRoleAdminText     ParticipantRoleText = "管理员"
	ParticipantRoleMemberText    ParticipantRoleText = "观众"
)

type ParticipantStatus int

const (
	ParticipantStatusUnknown   ParticipantStatus = iota // 未知
	ParticipantStatusUnhandled                          // 未处理
	ParticipantStatusAccepted                           // 已接受
	ParticipantStatusRejected                           // 已拒绝
)

type ParticipantStatusText string

const (
	ParticipantStatusUnknownText   ParticipantStatusText = "未知"
	ParticipantStatusUnhandledText ParticipantStatusText = "未处理"
	ParticipantStatusAcceptedText  ParticipantStatusText = "已接受"
	ParticipantStatusRejectedText  ParticipantStatusText = "已拒绝"
)

func (s *sSqMeetings) GetParticipantStatusText(status int) ParticipantStatusText {
	switch ParticipantStatus(status) {
	case ParticipantStatusUnhandled:
		return ParticipantStatusUnhandledText
	case ParticipantStatusAccepted:
		return ParticipantStatusAcceptedText
	case ParticipantStatusRejected:
		return ParticipantStatusRejectedText
	default:
		return ParticipantStatusUnknownText
	}
}
func (s *sSqMeetings) GetParticipantRole(roleText string) MeetingParticipantRole {
	switch ParticipantRoleText(roleText) {
	case ParticipantRoleModeratorText:
		return ParticipantRoleModerator
	case ParticipantRoleAdminText:
		return ParticipantRoleAdmin
	case ParticipantRoleMemberText:
		return ParticipantRoleMember
	default:
		return MeetingParticipantRole(0)
	}
}

func (s *sSqMeetings) GetParticipantRoles(role int) (result []string) {
	r := MeetingParticipantRole(role)
	if r&ParticipantRoleModerator != 0 {
		result = append(result, string(ParticipantRoleModeratorText))
	}
	if r&ParticipantRoleAdmin != 0 {
		result = append(result, string(ParticipantRoleAdminText))
	}
	if r&ParticipantRoleMember != 0 {
		result = append(result, string(ParticipantRoleMemberText))
	}
	return result
}

func (s *sSqMeetings) GetParticipantRoleText(role int) ParticipantRoleText {
	switch MeetingParticipantRole(role) {
	case ParticipantRoleModerator:
		return ParticipantRoleModeratorText
	case ParticipantRoleAdmin:
		return ParticipantRoleAdminText
	case ParticipantRoleMember:
		return ParticipantRoleMemberText
	default:
		return ParticipantRoleUnknownText
	}
}

func (s *sSqMeetings) GetStatus(statusText string) MeetingStatus {
	switch MeetingStatusText(statusText) {
	case MeetingStatusCreatedText:
		return MeetingStatusCreated
	case MeetingStatusStartedText:
		return MeetingStatusStarted
	case MeetingStatusEndedText:
		return MeetingStatusEnded
	case MeetingStatusCanceledText:
		return MeetingStatusCanceled
	default:
		return MeetingStatusUnknown
	}
}

func (s *sSqMeetings) GetStatusText(status int) MeetingStatusText {
	switch MeetingStatus(status) {
	case MeetingStatusCreated:
		return MeetingStatusCreatedText
	case MeetingStatusStarted:
		return MeetingStatusStartedText
	case MeetingStatusEnded:
		return MeetingStatusEndedText
	case MeetingStatusCanceled:
		return MeetingStatusCanceledText
	default:
		return MeetingStatusUnknownText
	}
}

func (s *sSqMeetings) GetType(typeText string) MeetingType {
	switch MeetingTypeText(typeText) {
	case MeetingTypeInstantText:
		return MeetingTypeInstant
	case MeetingTypeScheduledText:
		return MeetingTypeScheduled
	default:
		return MeetingTypeUnknown
	}
}

func (s *sSqMeetings) GetTypeText(meetingType int) MeetingTypeText {
	switch MeetingType(meetingType) {
	case MeetingTypeInstant:
		return MeetingTypeInstantText
	case MeetingTypeScheduled:
		return MeetingTypeScheduledText
	default:
		return MeetingTypeUnknownText
	}
}

func (s *sSqMeetings) GetMode(modeText string) MeetingMode {
	switch MeetingModeText(modeText) {
	case MeetingModeRomingText:
		return MeetingModeRoming
	case MeetingModeMeetingRoomText:
		return MeetingModeMeetingRoom
	case MeetingModeVirtualHumanText:
		return MeetingModeVirtualHuman
	default:
		return MeetingModeUnknown
	}
}

func (s *sSqMeetings) GetModeText(mode int) MeetingModeText {
	switch MeetingMode(mode) {
	case MeetingModeRoming:
		return MeetingModeMeetingRoomText
	case MeetingModeMeetingRoom:
		return MeetingModeMeetingRoomText
	case MeetingModeVirtualHuman:
		return MeetingModeVirtualHumanText
	default:
		return MeetingModeUnknownText
	}
}
