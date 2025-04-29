package meeting

import (
	"context"
	"fmt"
	"log"
	"math/rand"
	"time"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/tiger1103/gfast/v3/api/v1/common"
	"github.com/tiger1103/gfast/v3/api/v1/meeting"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/dao"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/model"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/service"
	"github.com/tiger1103/gfast/v3/internal/consts"
	"github.com/tiger1103/gfast/v3/library/liberr"

	sysService "github.com/tiger1103/gfast/v3/internal/app/system/service"
)

func init() {
	service.RegisterMeeting(New())
}

func New() service.IMeeting {
	return &Meeting{}
}

type Meeting struct {
}

func (m *Meeting) Create(ctx context.Context, req *meeting.CreateReq) (res *meeting.CreateRes, err error) {
	// 数据格式转换
	modelData := &entity.Meeting{
		RoomNumber:  generateRoomID(ctx),
		Topic:       req.Topic,
		Mode:        entity.GetMode(req.Mode),
		Distance:    req.Distance,
		Type:        entity.GetType(req.Type),
		Status:      entity.MeetingStatusCreated,
		Location:    req.Location,
		Description: req.Description,
		CreatorInfo: &entity.UserInfo{
			UserID:   req.CreatorID,
			UserName: req.CreatorName,
		},
		ModeratorInfo: &entity.UserInfo{
			UserID:   req.ModeratorID,
			UserName: req.ModeratorName,
		},
		CreateTime: gtime.Now(),
		StartTime:  req.StartTime,
	}
	if err = entity.ValidateMeetingInfo(modelData); err != nil {
		return
	}

	// 封装会议信息
	meetingData := do.TMeeting{
		RoomNumber:  modelData.RoomNumber,
		Topic:       modelData.Topic,
		Mode:        modelData.Mode,
		Distance:    modelData.Distance,
		Type:        modelData.Type,
		Status:      modelData.Status,
		Location:    modelData.Location,
		CreatorId:   modelData.CreatorInfo.UserID,
		Description: modelData.Description,
		CreateTime:  modelData.CreateTime,
		StartTime:   modelData.StartTime,
		EndTime:     modelData.EndTime,
	}
	// 封装管理员、主持人信息
	existsMap := g.MapStrBool{}
	memberData := make([]*do.TMeetingParticipant, 0)
	if modelData.CreatorInfo.UserID == modelData.ModeratorInfo.UserID { // 创建者和主持人是同一人
		memberData = append(memberData, &do.TMeetingParticipant{
			MRoomNumber: modelData.RoomNumber,
			UserId:      modelData.CreatorInfo.UserID,
			UserName:    modelData.CreatorInfo.UserName,
			Role:        entity.ParticipantRoleAdmin | entity.ParticipantRoleModerator | entity.ParticipantRoleMember, // 主持人 + 管理员 + 成员
			Status:      entity.ParticipantStatusUnhandled,
		})
		existsMap[modelData.CreatorInfo.UserID] = true
	} else { // 创建者和主持人不是同一人, 创建者默认为管理员
		memberData = append(memberData, &do.TMeetingParticipant{
			MRoomNumber: modelData.RoomNumber,
			UserId:      modelData.CreatorInfo.UserID,
			UserName:    modelData.CreatorInfo.UserName,
			Role:        entity.ParticipantRoleAdmin | entity.ParticipantRoleMember, // 管理员 + 成员
			Status:      entity.ParticipantStatusUnhandled,
		})
		existsMap[modelData.CreatorInfo.UserID] = true
		memberData = append(memberData, &do.TMeetingParticipant{
			MRoomNumber: modelData.RoomNumber,
			UserId:      modelData.ModeratorInfo.UserID,
			UserName:    modelData.ModeratorInfo.UserName,
			Role:        entity.ParticipantRoleModerator | entity.ParticipantRoleMember, // 主持人 + 成员
			Status:      entity.ParticipantStatusUnhandled,
		})
		existsMap[modelData.ModeratorInfo.UserID] = true
	}
	// 封装成员信息
	for _, v := range req.MemberInfos {
		if _, ok := existsMap[v.UserID]; ok { // 数据去重
			continue
		}
		memberData = append(memberData, &do.TMeetingParticipant{
			MRoomNumber: modelData.RoomNumber,
			UserId:      v.UserID,
			UserName:    v.UserName,
			Role:        entity.ParticipantRoleMember,
			Status:      entity.ParticipantStatusUnhandled,
		})
		existsMap[v.UserID] = true
	}
	if len(memberData) <= 1 {
		err = gerror.New("请邀请至少一个参会人员")
		return
	}

	if err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = dao.TMeeting.Ctx(ctx).TX(tx).Insert(meetingData)
			liberr.ErrIsNil(ctx, err, "会议信息添加失败")
			_, err = dao.TMeetingParticipant.Ctx(ctx).TX(tx).Insert(memberData)
			liberr.ErrIsNil(ctx, err, "参会人员信息添加失败")
		})
		return err
	}); err != nil {
		return
	}

	res = &meeting.CreateRes{
		RoomNumber:    modelData.RoomNumber,
		Topic:         modelData.Topic,
		Type:          entity.GetTypeText(modelData.Type),
		Mode:          entity.GetModeText(modelData.Mode),
		Distance:      modelData.Distance,
		CreatorName:   modelData.CreatorInfo.UserName,
		ModeratorName: modelData.ModeratorInfo.UserName,
		Description:   modelData.Description,
		StartTime:     modelData.StartTime,
	}

	return
}

func (m *Meeting) GetByRoomNumber(ctx context.Context, roomNumber string) (res *meeting.GetDetailsRes, err error) {
	// 检查会议是否存在
	exists, err := dao.TMeeting.CheckExists(ctx, roomNumber)
	if err != nil {
		return
	}
	if !exists {
		err = gerror.New("会议不存在")
		return
	}

	meetingInfo, err := dao.TMeeting.GetByRoomID(ctx, roomNumber, nil)
	modelData := entity.ConvertMeetingToEntityModel(meetingInfo)

	res = &meeting.GetDetailsRes{}
	res.RoomNumber = modelData.RoomNumber
	res.Topic = modelData.Topic
	res.Mode = entity.GetModeText(modelData.Mode)
	res.Distance = modelData.Distance
	res.Type = entity.GetTypeText(modelData.Type)
	res.Status = entity.GetStatusText(modelData.Status)
	res.Location = modelData.Location
	res.Description = modelData.Description
	res.CreateTime = modelData.CreateTime
	res.StartTime = modelData.StartTime
	res.EndTime = modelData.EndTime
	res.CreatorInfo = &meeting.UserInfo{
		UserID:     modelData.CreatorInfo.UserID,
		UserName:   modelData.CreatorInfo.UserName,
		Roles:      entity.GetParticipantRoles(int(modelData.CreatorInfo.Role)),
		Status:     entity.GetParticipantStatusText(int(modelData.CreatorInfo.Status)),
		UpdateTime: modelData.CreatorInfo.UpdateTime,
		JoinTime:   modelData.CreatorInfo.JoinTime,
		ExitTime:   modelData.CreatorInfo.ExitTime,
	}
	res.ModeratorInfo = &meeting.UserInfo{
		UserID:     modelData.ModeratorInfo.UserID,
		UserName:   modelData.ModeratorInfo.UserName,
		Roles:      entity.GetParticipantRoles(int(modelData.ModeratorInfo.Role)),
		Status:     entity.GetParticipantStatusText(int(modelData.ModeratorInfo.Status)),
		UpdateTime: modelData.ModeratorInfo.UpdateTime,
		JoinTime:   modelData.ModeratorInfo.JoinTime,
		ExitTime:   modelData.ModeratorInfo.ExitTime,
	}
	for _, v := range modelData.Members {
		userInfo := &meeting.UserInfo{
			UserID:     v.UserID,
			UserName:   v.UserName,
			Roles:      entity.GetParticipantRoles(int(v.Role)),
			Status:     entity.GetParticipantStatusText(int(v.Status)),
			UpdateTime: v.UpdateTime,
			JoinTime:   v.JoinTime,
			ExitTime:   v.ExitTime,
		}
		res.MemberInfos = append(res.MemberInfos, userInfo)
	}
	if res.CreatorInfo.UserID == res.ModeratorInfo.UserID {
		res.Count = len(res.MemberInfos) + 1
	} else {
		res.Count = len(res.MemberInfos) + 2
	}

	return
}

func (m *Meeting) GetByScope(ctx context.Context, req *meeting.ListReq, scope string) (res *meeting.ListRes, err error) {
	userInfo := sysService.Context().GetLoginUser(ctx)

	// 获取当前用户的所有会议ID
	roomIDs := make([]string, 0)
	result, err := dao.TMeetingParticipant.Ctx(ctx).
		Fields(dao.TMeetingParticipant.Columns().MRoomNumber).
		Where(dao.TMeetingParticipant.Columns().UserId, userInfo.UserID).
		Array()
	if err != nil {
		return nil, gerror.New(fmt.Sprintf("获取会议信息失败: %v", err.Error()))
	}
	for _, v := range result {
		roomIDs = append(roomIDs, v.Val().(string))
	}
	if len(roomIDs) == 0 {
		return
	}

	sqlModel := dao.TMeeting.Ctx(ctx).Fields(dao.TMeeting.Columns().RoomNumber).WhereIn(dao.TMeeting.Columns().RoomNumber, roomIDs)
	if scope == "history" {
		// 获取最近三个月的会议
		sqlModel = sqlModel.WhereGT(dao.TMeeting.Columns().CreateTime, gtime.Now().AddDate(0, -3, 0)).
			Where(dao.TMeeting.Columns().Status, "3").
			WhereOr(dao.TMeeting.Columns().Status, "4")
	} else if scope == "future" {
		// 获取未结束、未开始的会议
		sqlModel = sqlModel.Where(dao.TMeeting.Columns().Status, "1").
			WhereOr(dao.TMeeting.Columns().Status, "2")
	} else {
		return
	}
	total, err := sqlModel.Count()
	if err != nil {
		return
	}

	if req.PageSize == 0 {
		req.PageSize = consts.PageSize
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	result, err = sqlModel.Page(req.PageNum, req.PageSize).OrderDesc(dao.TMeeting.Columns().CreateTime).Array()
	if err != nil {
		return
	}
	ids := make([]string, 0)
	for _, v := range result {
		ids = append(ids, v.Val().(string))
	}
	if len(ids) == 0 {
		return
	}

	meetingInfos := []*meeting.GetDetailsRes{}
	for _, id := range ids {
		info, err := m.GetByRoomNumber(ctx, id)
		if err != nil {
			return nil, err
		}
		meetingInfos = append(meetingInfos, info)
	}

	res = &meeting.ListRes{
		Meetings: meetingInfos,
		ListRes: &common.ListRes{
			CurrentPage: req.PageNum,
			Total:       total,
		},
	}

	return
}

func (m *Meeting) EditBasicInfo(ctx context.Context, req *meeting.EditReq) (err error) {
	// 数据格式转换
	newData := &entity.Meeting{
		RoomNumber:  req.RoomNumber,
		Topic:       req.Topic,
		StartTime:   req.StartTime,
		EndTime:     req.EndTime,
		Mode:        entity.GetMode(req.Mode),
		Distance:    req.Distance,
		Location:    req.Location,
		Type:        entity.GetType(req.Type),
		Description: req.Description,
	}
	if err = entity.ValidateMeetingInfo(newData); err != nil {
		return
	}

	exists, err := dao.TMeeting.CheckExists(ctx, req.RoomNumber)
	if err != nil {
		return
	}
	if !exists {
		err = gerror.New("会议不存在")
		return
	}
	result, err := dao.TMeeting.GetByRoomID(ctx, req.RoomNumber, nil)
	if err != nil {
		return
	}
	oldData := entity.ConvertMeetingToEntityModel(result)
	if oldData.Status == entity.MeetingStatusEnded || oldData.Status == entity.MeetingStatusCanceled {
		return gerror.New("会议已结束/取消，无法修改")
	}

	// 封装会议信息
	updateData := do.TMeeting{}
	if newData.Topic != oldData.Topic {
		updateData.Topic = newData.Topic
	}
	if newData.StartTime != oldData.StartTime {
		updateData.StartTime = newData.StartTime
	}
	if newData.EndTime != oldData.EndTime {
		updateData.EndTime = newData.EndTime
	}
	if newData.Mode != oldData.Mode {
		updateData.Mode = newData.Mode
	}
	if newData.Distance != oldData.Distance {
		updateData.Distance = newData.Distance
	}
	if newData.Type != oldData.Type {
		updateData.Type = newData.Type
	}
	if newData.Location != oldData.Location {
		updateData.Location = newData.Location
	}
	if newData.Description != oldData.Description {
		updateData.Description = newData.Description
	}

	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = dao.TMeeting.Ctx(ctx).TX(tx).
				Where(dao.TMeeting.Columns().RoomNumber, req.RoomNumber).
				Update(updateData)
			if err != nil {
				return
			}
		})
		return err
	})

	return
}

func (m *Meeting) Delete(ctx context.Context, roomNumbers []string) (err error) {
	if len(roomNumbers) == 0 {
		return
	}

	for _, v := range roomNumbers {
		err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
			err = g.Try(ctx, func(ctx context.Context) {
				_, err = dao.TMeetingParticipant.Ctx(ctx).TX(tx).Where(dao.TMeetingParticipant.Columns().MRoomNumber, v).Delete()
				liberr.ErrIsNil(ctx, err, "删除参会人员失败")

				_, err = dao.TMeeting.Ctx(ctx).TX(tx).Where(dao.TMeeting.Columns().RoomNumber, v).Delete()
				liberr.ErrIsNil(ctx, err, "删除会议失败")
			})
			return err
		})
		if err != nil {
			break
		}
	}

	return
}

func (m *Meeting) ListAll(ctx context.Context, req *meeting.ListAllReq) (res *meeting.ListRes, err error) {
	log.Println(req.RoomNumber)
	if req.RoomNumber != "" {
		info, err := m.GetByRoomNumber(ctx, req.RoomNumber)
		if err != nil {
			return nil, err
		}
		res = &meeting.ListRes{
			ListRes: &common.ListRes{
				CurrentPage: 1,
				Total:       1,
			},
			Meetings: []*meeting.GetDetailsRes{info},
		}

		return res, nil
	}

	if req.PageSize == 0 {
		req.PageSize = consts.PageSize
	}
	if req.PageNum == 0 {
		req.PageNum = 1
	}
	res = &meeting.ListRes{}
	sqlModel := dao.TMeeting.Ctx(ctx).
		Fields(dao.TMeeting.Columns().RoomNumber).
		WhereGT(dao.TMeeting.Columns().CreateTime, gtime.Now().AddDate(0, -3, 0))
	total, err := sqlModel.Count()
	if err != nil {
		return
	}
	roomIDs := make([]string, 0)
	result, err := sqlModel.Page(req.PageNum, req.PageSize).
		OrderDesc(dao.TMeeting.Columns().CreateTime).
		Array()
	if err != nil {
		return nil, gerror.New(fmt.Sprintf("Logic.ListAll: %v", err.Error()))
	}
	for _, v := range result {
		roomIDs = append(roomIDs, v.Val().(string))
	}
	if len(roomIDs) == 0 {
		return
	}

	for _, roomID := range roomIDs {
		mInfo, err := m.GetByRoomNumber(ctx, roomID)
		if err != nil {
			return nil, gerror.New(fmt.Sprintf("Logic.ListAll: %v", err.Error()))
		}
		res.Meetings = append(res.Meetings, mInfo)
	}

	res.ListRes = &common.ListRes{
		Total:       total,
		CurrentPage: req.PageNum,
	}

	return
}

func (m *Meeting) UpdateStatusByRoomNumber(ctx context.Context, roomNumber string, status int) (err error) {
	// info := sysService.Context().GetLoginUser(ctx)
	// // log.Printf("%+v\n", info)
	// operatorID := info.UserID
	// // 权限校验
	// // operatorID := ctx.Value(consts.TokenKey).(g.Map)["UserID"].(string)
	// operatorRole, err := dao.TMeetingParticipant.GetRoleByRoomNumberAndUserID(ctx, roomNumber, operatorID)
	// if err != nil {
	// 	return err
	// }
	// if !entity.IsAdmin(entity.MeetingParticipantRole(operatorRole)) &&
	// 	!entity.IsModerator(entity.MeetingParticipantRole(operatorRole)) {
	// 	return gerror.New("您没有更新会议状态的权限，请联系会议管理员/主持人")
	// }

	curStatus, err := dao.TMeeting.GetStatusByRoomNumber(ctx, roomNumber)
	if err != nil {
		return
	}
	oldStatus := entity.MeetingStatus(curStatus)
	newStatus := entity.MeetingStatus(status)
	if oldStatus == newStatus {
		return
	}

	var data g.Map = g.Map{}
	data[dao.TMeeting.Columns().Status] = newStatus
	if oldStatus == entity.MeetingStatusCreated {
		if newStatus == entity.MeetingStatusStarted {
			data[dao.TMeeting.Columns().StartTime] = gtime.Now()
		} else if newStatus == entity.MeetingStatusEnded || newStatus == entity.MeetingStatusCanceled {
			data[dao.TMeeting.Columns().EndTime] = gtime.Now()
		}
	} else if oldStatus == entity.MeetingStatusStarted {
		if newStatus == entity.MeetingStatusCreated {
			return gerror.New("会议进行中，不能将会议修改为已创建")
		} else if newStatus == entity.MeetingStatusCanceled {
			return gerror.New("会议进行中，不能将会议修改为已取消")
		} else {
			data[dao.TMeeting.Columns().EndTime] = gtime.Now()
		}
	} else {
		return gerror.New("会议已取消/已结束，不能修改会议状态")
	}

	_, err = dao.TMeeting.Ctx(ctx).Where(dao.TMeeting.Columns().RoomNumber, roomNumber).Update(data)
	if err != nil {
		return
	}

	return
}

// InviteParticipant 邀请用户加入会议
// 操作权限：是否有权限邀请用户
// 会议状态：会议是否存在；会议是否已经结束/取消
// 用户信息：信息是否重复；被邀请的用户是否已经存在会议邀请表中
// 插入数据
func (m *Meeting) InviteParticipants(ctx context.Context, roomNumber string, userInfos []*model.UserInfo) (err error) {
	// 操作权限
	info := sysService.Context().GetLoginUser(ctx)
	operatorID := info.UserID
	operatorRole, err := dao.TMeetingParticipant.GetRoleByRoomNumberAndUserID(ctx, roomNumber, operatorID)
	if err != nil {
		return err
	}
	if !entity.IsAdmin(entity.MeetingParticipantRole(operatorRole)) &&
		!entity.IsModerator(entity.MeetingParticipantRole(operatorRole)) {
		return gerror.New("您没有邀请参会人员的权限，请联系会议管理员/主持人")
	}

	// 去重
	mExists := g.MapStrBool{}
	newUserInfos := make([]*model.UserInfo, 0)
	for _, userInfo := range userInfos {
		if mExists[userInfo.ID] {
			continue
		}
		mExists[userInfo.ID] = true
		newUserInfos = append(newUserInfos, userInfo)
	}

	// 若用户已在会议邀请列表中，跳过；否则封装新的参会人员记录。
	invitesData := make([]*do.TMeetingParticipant, 0)
	for _, userInfo := range newUserInfos {
		exists, err := dao.TMeetingParticipant.CheckParticipantExists(ctx, roomNumber, userInfo.ID)
		if err != nil {
			return err
		}
		if exists {
			continue
		}
		invitesData = append(invitesData, &do.TMeetingParticipant{
			MRoomNumber: roomNumber,
			UserId:      userInfo.ID,
			UserName:    userInfo.Name,
			Role:        entity.ParticipantRoleMember,
			Status:      entity.ParticipantStatusUnhandled,
		})
	}
	if len(invitesData) == 0 {
		return
	}

	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = dao.TMeetingParticipant.Ctx(ctx).TX(tx).Insert(invitesData)
			liberr.ErrIsNil(ctx, err, "参会人员信息添加失败")
		})
		return err
	})

	return
}

// RemoveParticipant 将用户移出会议
// 操作权限：是否有权限移出用户
// 被移除的用户
func (m *Meeting) RemoveParticipant(ctx context.Context, roomNumber string, userID string) (err error) {
	// 权限校验
	info := sysService.Context().GetLoginUser(ctx)
	operatorID := info.UserID
	operatorRole, err := dao.TMeetingParticipant.GetRoleByRoomNumberAndUserID(ctx, roomNumber, operatorID)
	if err != nil {
		return
	}
	if !entity.IsAdmin(entity.MeetingParticipantRole(operatorRole)) &&
		!entity.IsModerator(entity.MeetingParticipantRole(operatorRole)) {
		return gerror.New("您没有权限移除参会人员，请联系会议管理员/主持人")
	}
	role, err := dao.TMeetingParticipant.GetRoleByRoomNumberAndUserID(ctx, roomNumber, userID)
	if err != nil {
		return
	}
	if entity.IsAdmin(entity.MeetingParticipantRole(role)) ||
		entity.IsModerator(entity.MeetingParticipantRole(role)) {
		return gerror.New("不能移除会议管理员/主持人")
	}

	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.TMeetingParticipant.Ctx(ctx).
			Where(dao.TMeetingParticipant.Columns().MRoomNumber, roomNumber).
			Where(dao.TMeetingParticipant.Columns().UserId, userID).
			Delete()
	})

	return
}

func generateRoomID(ctx context.Context) (roomID string) {
	for {
		rand.Seed(time.Now().UnixNano())
		roomID = fmt.Sprintf("%09d", rand.Intn(1000000000))
		num, err := dao.TMeeting.Ctx(ctx).Count(fmt.Sprintf("room_number = %s", roomID))
		if err == nil && num == 0 {
			break
		}
		log.Println("生成会议室ID失败，正在重试...")
		time.Sleep(time.Millisecond * 500)
	}

	return roomID
}

func (m *Meeting) CheckMeetingExists(ctx context.Context, roomNumber string) (exists bool, err error) {
	exists, err = dao.TMeeting.CheckExists(ctx, roomNumber)
	return
}

func (m *Meeting) CheckParticipantStatusValid(status int) (valid bool) {
	if entity.MeetingParticipantStatus(status) == entity.ParticipantStatusUnhandled ||
		entity.MeetingParticipantStatus(status) == entity.ParticipantStatusAccepted ||
		entity.MeetingParticipantStatus(status) == entity.ParticipantStatusRejected {
		return true
	}

	return false
}

func (m *Meeting) HandleUserAction(ctx context.Context, actionInfo *model.HandleUserAction) (err error) {
	// 权限校验
	info := sysService.Context().GetLoginUser(ctx)
	// log.Printf("%+v\n", info)
	operatorID := info.UserID
	if operatorID != actionInfo.UserID {
		return gerror.New("无权限操作此条数据")
	}

	var data g.Map = g.Map{}
	switch actionInfo.Action {
	case model.ActionInvite:
		data[dao.TMeetingParticipant.Columns().UpdateTime] = gtime.Now()
		data[dao.TMeetingParticipant.Columns().Status] = actionInfo.Status
	case model.ActionJoin:
		data[dao.TMeetingParticipant.Columns().JoinTime] = gtime.Now()
	case model.ActionExit:
		data[dao.TMeetingParticipant.Columns().ExitTime] = gtime.Now()
	default:
		return gerror.New("未知的用户行为")
	}

	_, err = dao.TMeetingParticipant.Ctx(ctx).
		Where(dao.TMeetingParticipant.Columns().MRoomNumber, actionInfo.RoomNumber).
		Where(dao.TMeetingParticipant.Columns().UserId, actionInfo.UserID).
		Update(data)

	return
}

func (m *Meeting) CheckMeetingStatusValid(status int) (valid bool) {
	if entity.MeetingStatus(status) == entity.MeetingStatusCreated ||
		entity.MeetingStatus(status) == entity.MeetingStatusStarted ||
		entity.MeetingStatus(status) == entity.MeetingStatusEnded ||
		entity.MeetingStatus(status) == entity.MeetingStatusCanceled {
		return true
	}

	return false
}
