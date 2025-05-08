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

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/tiger1103/gfast/v3/api/v1/meetings"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/dao"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/model"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/service"
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

func (s *sSqMeetings) Create(ctx context.Context, req *meetings.CreateReq) (res *meetings.CreateRes, err error) {
	// 数据格式转换
	modelData := &model.SqMeetings{
		RoomNumber:    s.GetRoomID(ctx),
		Topic:         req.Topic,
		Mode:          model.GetMode(req.Mode),
		Distance:      req.Distance,
		Type:          model.GetType(req.Type),
		Status:        model.MeetingStatusCreated,
		Location:      req.Location,
		Description:   req.Description,
		CreatorID:     req.CreatorID,
		CreatorName:   req.CreatorName,
		ModeratorID:   req.ModeratorID,
		ModeratorName: req.ModeratorName,
		CreateTime:    gtime.Now(),
		StartTime:     req.StartTime,
	}
	err = model.ValidateMeetingInfo(modelData)
	liberr.ErrIsNil(ctx, err, "会议信息校验失败")
	// 封装会议信息
	meetingData := do.SqMeetings{
		RoomNumber:  modelData.RoomNumber,
		Topic:       modelData.Topic,
		Mode:        modelData.Mode,
		Distance:    modelData.Distance,
		Type:        modelData.Type,
		Status:      modelData.Status,
		Location:    modelData.Location,
		CreatorId:   modelData.CreatorID,
		Description: modelData.Description,
		CreateTime:  modelData.CreateTime,
		StartTime:   modelData.StartTime,
		EndTime:     modelData.EndTime,
	}
	// 封装参会人员信息
	invitesData := make([]*do.SqMeetingsParticipants, 0)
	if modelData.CreatorID == modelData.ModeratorID { // 创建者和主持人是同一人
		invitesData = append(invitesData, &do.SqMeetingsParticipants{
			RoomNumber: modelData.RoomNumber,
			UserId:     modelData.CreatorID,
			UserName:   modelData.CreatorName,
			Role:       model.ParticipantRoleModerator | model.ParticipantRoleAdmin,
			Status:     model.ParticipantStatusUnhandled,
		})
	} else { // 创建者和主持人不是同一人, 创建者默认为管理员
		invitesData = append(invitesData, &do.SqMeetingsParticipants{
			RoomNumber: modelData.RoomNumber,
			UserId:     modelData.CreatorID,
			UserName:   modelData.CreatorName,
			Role:       model.ParticipantRoleAdmin,
			Status:     model.ParticipantStatusUnhandled,
		})
		invitesData = append(invitesData, &do.SqMeetingsParticipants{
			RoomNumber: modelData.RoomNumber,
			UserId:     modelData.ModeratorID,
			UserName:   modelData.ModeratorName,
			Role:       model.ParticipantRoleModerator, // 主持人
			Status:     model.ParticipantStatusUnhandled,
		})
	}
	for _, v := range req.MemberInfos {
		invitesData = append(invitesData, &do.SqMeetingsParticipants{
			RoomNumber: modelData.RoomNumber,
			UserId:     v.UserID,
			UserName:   v.UserName,
			Role:       model.ParticipantRoleMember,
			Status:     model.ParticipantStatusUnhandled,
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

	res = &meetings.CreateRes{
		RoomNumber:    modelData.RoomNumber,
		Topic:         modelData.Topic,
		CreatorName:   modelData.CreatorName,
		Type:          model.GetTypeText(modelData.Type),
		Mode:          model.GetModeText(modelData.Mode),
		StartTime:     modelData.StartTime,
		ModeratorName: modelData.ModeratorName,
		Description:   modelData.Description,
	}

	return
}

func (s *sSqMeetings) GetByRoomNumber(ctx context.Context, roomNumber string) (res *meetings.GetDetailsRes, err error) {
	m := model.SqMeetingsDB{}
	result := make([]*model.SqMeetingsParticipantsDB, 0)
	err = g.Try(ctx, func(ctx context.Context) {
		err = dao.SqMeetings.Ctx(ctx).WithAll().
			FieldsEx(dao.SqMeetings.Columns().Id).
			Where(dao.SqMeetings.Columns().RoomNumber, roomNumber).Scan(&m)
		liberr.ErrIsNil(ctx, err, "获取会议信息失败")

		err = dao.SqMeetingsParticipants.Ctx(ctx).WithAll().
			FieldsEx(dao.SqMeetingsParticipants.Columns().ID).
			FieldsEx(dao.SqMeetingsParticipants.Columns().RoomNumber).
			Where(dao.SqMeetingsParticipants.Columns().RoomNumber, roomNumber).Scan(&result)
		liberr.ErrIsNil(ctx, err, "获取参会人员信息失败")
	})

	res = &meetings.GetDetailsRes{}
	modelData := model.ConvertDataModel(&m)
	res.RoomNumber = modelData.RoomNumber
	res.Topic = modelData.Topic
	res.Mode = model.GetModeText(modelData.Mode)
	res.Distance = modelData.Distance
	res.Type = model.GetTypeText(modelData.Type)
	res.Status = model.GetStatusText(modelData.Status)
	res.Location = modelData.Location
	res.Description = modelData.Description
	res.CreateTime = modelData.CreateTime
	res.StartTime = modelData.StartTime
	res.EndTime = modelData.EndTime
	for _, v := range result {
		// 获取管理员信息
		if model.MeetingParticipantRole(v.Role)&model.ParticipantRoleAdmin != 0 {
			res.CreatorInfo = &meetings.UserInfo{
				UserID:     v.UserID,
				UserName:   v.UserName,
				Roles:      model.GetParticipantRoles(v.Role),
				Status:     string(model.GetParticipantStatusText(v.Status)),
				UpdateTime: v.UpdateTime,
				JoinTime:   v.JoinTime,
				ExitTime:   v.ExitTime,
			}
		}
		// 获取主持人信息
		if model.MeetingParticipantRole(v.Role)&model.ParticipantRoleModerator != 0 {
			res.ModeratorInfo = &meetings.UserInfo{
				UserID:     v.UserID,
				UserName:   v.UserName,
				Roles:      model.GetParticipantRoles(v.Role),
				Status:     string(model.GetParticipantStatusText(v.Status)),
				UpdateTime: v.UpdateTime,
				JoinTime:   v.JoinTime,
				ExitTime:   v.ExitTime,
			}
			continue
		}
		// 获取成员信息
		res.MemberInfos = append(res.MemberInfos, &meetings.UserInfo{
			UserID:     v.UserID,
			UserName:   v.UserName,
			Roles:      model.GetParticipantRoles(v.Role),
			Status:     string(model.GetParticipantStatusText(v.Status)),
			UpdateTime: v.UpdateTime,
			JoinTime:   v.JoinTime,
			ExitTime:   v.ExitTime,
		})
	}
	if res.CreatorInfo.UserID == res.ModeratorInfo.UserID {
		res.Count = len(res.MemberInfos) + 1
	} else {
		res.Count = len(res.MemberInfos) + 2
	}

	return
}

func (s *sSqMeetings) GetByScope(ctx context.Context, userID, scope string) (res *meetings.ListRes, err error) {
	roomIDs := make([]string, 0)
	err = g.Try(ctx, func(ctx context.Context) {
		result, err := dao.SqMeetingsParticipants.Ctx(ctx).
			Fields(dao.SqMeetingsParticipants.Columns().RoomNumber).
			Where(dao.SqMeetingsParticipants.Columns().UserID, userID).
			Array()
		liberr.ErrIsNil(ctx, err, "获取会议室IDs失败")
		for _, v := range result {
			roomIDs = append(roomIDs, v.Val().(string))
		}
	})
	if len(roomIDs) == 0 {
		return
	}
	// log.Println("获取到用户加入的会议ID：", roomIDs)
	mInfos := make([]*meetings.GetDetailsRes, 0)
	for _, v := range roomIDs {
		mInfo, err := s.GetByRoomNumber(ctx, v)
		liberr.ErrIsNil(ctx, err, "获取会议室信息失败")
		switch scope {
		case "history":
			if mInfo.Status == string(model.MeetingStatusEndedText) {
				mInfos = append(mInfos, mInfo)
			}
		case "future":
			if mInfo.Status != string(model.MeetingStatusEndedText) {
				mInfos = append(mInfos, mInfo)
			}
		case "all":
			mInfos = append(mInfos, mInfo)
		}
	}

	res = &meetings.ListRes{
		Meetings: mInfos,
	}

	return
}

func (s *sSqMeetings) Edit(ctx context.Context, req *meetings.EditReq) (err error) {
	// 数据格式转换
	modelData := &model.SqMeetings{
		RoomNumber:    req.RoomNumber,
		Topic:         req.Topic,
		StartTime:     req.StartTime,
		Mode:          model.GetMode(req.Mode),
		Distance:      req.Distance,
		Location:      req.Location,
		Type:          model.GetType(req.Type),
		ModeratorID:   req.ModeratorID,
		ModeratorName: req.ModeratorName,
		Description:   req.Description,
	}
	err = model.ValidateMeetingInfo(modelData)
	liberr.ErrIsNil(ctx, err, "会议信息校验失败")

	oldData, err := s.GetByRoomNumber(ctx, req.RoomNumber)
	liberr.ErrIsNil(ctx, err, "获取会议信息失败")

	if oldData.Status == string(model.MeetingStatusEndedText) || oldData.Status == string(model.MeetingStatusCanceledText) {
		return gerror.New("会议已结束/取消，无法修改")
	}

	// 封装会议信息
	updateData := do.SqMeetings{}
	if modelData.Topic != oldData.Topic {
		updateData.Topic = modelData.Topic
	}
	if modelData.StartTime != oldData.StartTime {
		updateData.StartTime = modelData.StartTime
	}
	if modelData.Mode != model.GetMode(oldData.Mode) {
		updateData.Mode = modelData.Mode
	}
	if modelData.Distance != oldData.Distance {
		updateData.Distance = modelData.Distance
	}
	if modelData.Type != model.GetType(oldData.Type) {
		updateData.Type = modelData.Type
	}
	if modelData.Location != oldData.Location {
		updateData.Location = modelData.Location
	}
	if modelData.Description != oldData.Description {
		updateData.Description = modelData.Description
	}
	// 封装参会人员信息
	insertData := make([]*do.SqMeetingsParticipants, 0)
	deleteData := make([]string, 0)
	var updateData2 map[string]interface{}
	if modelData.ModeratorID != oldData.ModeratorInfo.UserID {
		if modelData.ModeratorID == oldData.CreatorInfo.UserID {
			updateData2 = map[string]interface{}{
				dao.SqMeetingsParticipants.Columns().Role: model.ParticipantRoleModerator | model.ParticipantRoleAdmin,
			}
		} else {
			insertData = append(insertData, &do.SqMeetingsParticipants{
				RoomNumber: req.RoomNumber,
				UserId:     modelData.ModeratorID,
				UserName:   modelData.ModeratorName,
				Role:       model.ParticipantRoleModerator,
				Status:     model.ParticipantStatusUnhandled,
			})
		}
		deleteData = append(deleteData, oldData.ModeratorInfo.UserID)
	}
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
	for k, v := range m {
		insertData = append(insertData, &do.SqMeetingsParticipants{
			RoomNumber: req.RoomNumber,
			UserId:     k,
			UserName:   v,
			Role:       model.ParticipantRoleMember,
			Status:     model.ParticipantStatusUnhandled,
		})
	}

	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = dao.SqMeetings.Ctx(ctx).TX(tx).
				Where(dao.SqMeetings.Columns().RoomNumber, req.RoomNumber).
				Update(updateData)
			liberr.ErrIsNil(ctx, err, "会议信息修改失败")
			if len(deleteData) > 0 {
				_, err = dao.SqMeetingsParticipants.Ctx(ctx).TX(tx).
					Where(dao.SqMeetingsParticipants.Columns().RoomNumber, req.RoomNumber).
					WhereIn(dao.SqMeetingsParticipants.Columns().UserID, deleteData).
					Delete()
				liberr.ErrIsNil(ctx, err, "删除参会人员失败")
			}
			if len(insertData) > 0 {
				_, err = dao.SqMeetingsParticipants.Ctx(ctx).TX(tx).
					Insert(insertData)
				liberr.ErrIsNil(ctx, err, "添加参会人员失败")
			}
			if len(updateData2) > 0 {
				_, err = dao.SqMeetingsParticipants.Ctx(ctx).TX(tx).
					Where(dao.SqMeetingsParticipants.Columns().UserID, req.ModeratorID).
					Update(updateData2)
				liberr.ErrIsNil(ctx, err, "修改管理员信息失败")
			}
		})
		return err
	})

	return
}

func (s *sSqMeetings) ListAll(ctx context.Context, req *meetings.ListAllReq) (res *meetings.ListRes, err error) {
	res = &meetings.ListRes{}
	roomIDs := make([]string, 0)
	result, err := dao.SqMeetings.Ctx(ctx).
		Fields(dao.SqMeetings.Columns().RoomNumber).Array()
	liberr.ErrIsNil(ctx, err, "获取会议室IDs失败")
	for _, v := range result {
		roomIDs = append(roomIDs, v.Val().(string))
	}
	log.Println(roomIDs)
	if len(roomIDs) == 0 {
		return
	}
	for _, roomID := range roomIDs {
		mInfo, err := s.GetByRoomNumber(ctx, roomID)
		liberr.ErrIsNil(ctx, err, "获取会议详细信息失败")
		res.Meetings = append(res.Meetings, mInfo)
	}

	return
}

func (s *sSqMeetings) CancelByRoomNumber(ctx context.Context, roomNumber string) (err error) {
	var data g.Map = g.Map{}
	data[dao.SqMeetings.Columns().Status] = model.MeetingStatusCanceled
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SqMeetings.Ctx(ctx).Where(dao.SqMeetings.Columns().RoomNumber, roomNumber).Update(data)
		liberr.ErrIsNil(ctx, err, "取消会议失败")
	})

	return
}

func (s *sSqMeetings) RemoveParticipants(ctx context.Context, req *meetings.RemoveParticipantsReq) (err error) {
	if len(req.UserIDs) == 0 {
		return
	}

	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SqMeetingsParticipants.Ctx(ctx).
			Where(dao.SqMeetingsParticipants.Columns().RoomNumber, req.RoomNumber).
			WhereIn(dao.SqMeetingsParticipants.Columns().UserID, req.UserIDs).
			Delete()
	})

	return
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
