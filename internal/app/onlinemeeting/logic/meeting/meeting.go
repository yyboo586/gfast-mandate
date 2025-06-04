package meeting

import (
	"context"
	"errors"
	"fmt"
	"log"
	"math/rand"
	"strings"
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

func (m *Meeting) TrimSpace(v *meeting.CreateReq) {

}

func (m *Meeting) Create(ctx context.Context, req *meeting.CreateReq) (res *meeting.CreateRes, err error) {
	var roomID string
	if roomID, err = generateRoomID(ctx); err != nil {
		return
	}
	req.Topic = strings.TrimSpace(req.Topic)
	req.Mode = strings.TrimSpace(req.Mode)
	req.Location = strings.TrimSpace(req.Location)
	req.Type = strings.TrimSpace(req.Type)
	req.ModeratorID = strings.TrimSpace(req.ModeratorID)
	req.ModeratorName = strings.TrimSpace(req.ModeratorName)
	req.Description = strings.TrimSpace(req.Description)

	modelData := &model.Meeting{
		RoomNumber:  roomID,
		Topic:       req.Topic,
		Mode:        model.GetMode(req.Mode),
		Distance:    req.Distance,
		Type:        model.GetType(req.Type),
		Status:      model.MeetingStatusCreated,
		Location:    req.Location,
		Description: req.Description,
		CreatorInfo: &model.UserInfo{
			UserID:   req.CreatorID,
			UserName: req.CreatorName,
		},
		ModeratorInfo: &model.UserInfo{
			UserID:   req.ModeratorID,
			UserName: req.ModeratorName,
		},
		CreateTime: gtime.Now(),
		StartTime:  req.StartTime,
		EndTime:    req.EndTime,
	}
	if err = model.ValidateMeetingInfo(modelData); err != nil {
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
			Role:        model.ParticipantRoleAdmin | model.ParticipantRoleModerator | model.ParticipantRoleMember, // 主持人 + 管理员 + 成员
			Status:      model.ParticipantStatusUnhandled,
		})
		existsMap[modelData.CreatorInfo.UserID] = true
	} else { // 创建者和主持人不是同一人, 创建者默认为管理员
		memberData = append(memberData, &do.TMeetingParticipant{
			MRoomNumber: modelData.RoomNumber,
			UserId:      modelData.CreatorInfo.UserID,
			UserName:    modelData.CreatorInfo.UserName,
			Role:        model.ParticipantRoleAdmin | model.ParticipantRoleMember, // 管理员 + 成员
			Status:      model.ParticipantStatusUnhandled,
		})
		existsMap[modelData.CreatorInfo.UserID] = true
		memberData = append(memberData, &do.TMeetingParticipant{
			MRoomNumber: modelData.RoomNumber,
			UserId:      modelData.ModeratorInfo.UserID,
			UserName:    modelData.ModeratorInfo.UserName,
			Role:        model.ParticipantRoleModerator | model.ParticipantRoleMember, // 主持人 + 成员
			Status:      model.ParticipantStatusUnhandled,
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
			Role:        model.ParticipantRoleMember,
			Status:      model.ParticipantStatusUnhandled,
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
		Type:          model.GetMeetingTypeText(modelData.Type),
		Mode:          model.GetMeetingModeText(modelData.Mode),
		Distance:      modelData.Distance,
		CreatorName:   modelData.CreatorInfo.UserName,
		ModeratorName: modelData.ModeratorInfo.UserName,
		Description:   modelData.Description,
		StartTime:     modelData.StartTime,
		EndTime:       modelData.EndTime,
	}
	return
}

func (m *Meeting) GetByRoomNumber(ctx context.Context, roomNumber string) (res *meeting.GetDetailsRes, err error) {
	if err = m.AssertExistByRoomNumber(ctx, roomNumber); err != nil {
		return
	}

	var meetingInfoEntity *entity.MeetingDB
	if meetingInfoEntity, err = dao.TMeeting.GetByRoomNumber(ctx, roomNumber); err != nil {
		return
	}
	meetingInfo := model.ConvertDBMeetingToLogic(meetingInfoEntity)

	res = &meeting.GetDetailsRes{}
	res.RoomNumber = meetingInfo.RoomNumber
	res.Topic = meetingInfo.Topic
	res.Mode = model.GetMeetingModeText(meetingInfo.Mode)
	res.Distance = meetingInfo.Distance
	res.Type = model.GetMeetingTypeText(meetingInfo.Type)
	res.Status = model.GetMeetingStatusText(meetingInfo.Status)
	res.Location = meetingInfo.Location
	res.Description = meetingInfo.Description
	res.CreateTime = meetingInfo.CreateTime
	res.StartTime = meetingInfo.StartTime
	res.EndTime = meetingInfo.EndTime
	res.CreatorInfo = &meeting.UserInfo{
		UserID:     meetingInfo.CreatorInfo.UserID,
		UserName:   meetingInfo.CreatorInfo.UserName,
		Roles:      model.GetParticipantRolesText(meetingInfo.CreatorInfo.Role),
		Status:     model.GetParticipantStatusText(meetingInfo.CreatorInfo.Status),
		UpdateTime: meetingInfo.CreatorInfo.UpdateTime,
		JoinTime:   meetingInfo.CreatorInfo.JoinTime,
		ExitTime:   meetingInfo.CreatorInfo.ExitTime,
	}
	res.ModeratorInfo = &meeting.UserInfo{
		UserID:     meetingInfo.ModeratorInfo.UserID,
		UserName:   meetingInfo.ModeratorInfo.UserName,
		Roles:      model.GetParticipantRolesText(meetingInfo.ModeratorInfo.Role),
		Status:     model.GetParticipantStatusText(meetingInfo.ModeratorInfo.Status),
		UpdateTime: meetingInfo.ModeratorInfo.UpdateTime,
		JoinTime:   meetingInfo.ModeratorInfo.JoinTime,
		ExitTime:   meetingInfo.ModeratorInfo.ExitTime,
	}
	for _, v := range meetingInfo.Members {
		userInfo := &meeting.UserInfo{
			UserID:     v.UserID,
			UserName:   v.UserName,
			Roles:      model.GetParticipantRolesText(v.Role),
			Status:     model.GetParticipantStatusText(v.Status),
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

func (m *Meeting) ListByScope(ctx context.Context, req *meeting.ListReq, scope string) (res *meeting.ListRes, err error) {
	if scope != model.MeetingScopeHistory && scope != model.MeetingScopeFuture {
		err = gerror.New("参数scope错误")
		return
	}
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
	if scope == model.MeetingScopeHistory {
		// 获取最近三个月的会议
		sqlModel = sqlModel.WhereGT(dao.TMeeting.Columns().CreateTime, gtime.Now().AddDate(0, -3, 0)).
			Where(dao.TMeeting.Columns().Status, model.MeetingStatusCanceled).
			WhereOr(dao.TMeeting.Columns().Status, model.MeetingStatusEnded)
	} else if scope == model.MeetingScopeFuture {
		// 获取未结束、未开始的会议
		sqlModel = sqlModel.Where(dao.TMeeting.Columns().Status, model.MeetingStatusCreated).
			WhereOr(dao.TMeeting.Columns().Status, model.MeetingStatusStarted)
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
	if err = m.AssertExistByRoomNumber(ctx, req.RoomNumber); err != nil {
		return err
	}
	req.Topic = strings.TrimSpace(req.Topic)
	req.Type = strings.TrimSpace(req.Type)
	req.Mode = strings.TrimSpace(req.Mode)
	req.Location = strings.TrimSpace(req.Location)
	req.Description = strings.TrimSpace(req.Description)

	// 数据格式转换
	newData := &model.Meeting{
		RoomNumber:  req.RoomNumber,
		Topic:       req.Topic,
		StartTime:   req.StartTime,
		EndTime:     req.EndTime,
		Mode:        model.GetMode(req.Mode),
		Distance:    req.Distance,
		Location:    req.Location,
		Type:        model.GetType(req.Type),
		Description: req.Description,
	}
	if err = model.ValidateMeetingInfo(newData); err != nil {
		return
	}

	result, err := dao.TMeeting.GetByRoomNumber(ctx, req.RoomNumber)
	if err != nil {
		return
	}
	oldData := model.ConvertDBMeetingToLogic(result)
	if oldData.Status == model.MeetingStatusEnded || oldData.Status == model.MeetingStatusCanceled {
		return gerror.New("会议已结束/取消，无法修改")
	}
	// 如果既修改了开始时间，又修改了结束时间，会在ValidateMeetingInfo中校验
	// 只修改了会议开始时间
	if req.StartTime != nil && req.EndTime == nil {
		if oldData.EndTime.Before(req.StartTime) {
			return gerror.New("会议开始时间不能大于会议结束时间")
		}
	}
	// 只修改了会议结束时间
	if req.StartTime == nil && req.EndTime != nil {
		if req.EndTime.Before(oldData.StartTime) {
			return gerror.New("会议结束时间不能小于会议开始时间")
		}
	}

	// 封装会议信息
	updateData := do.TMeeting{}
	if newData.Topic != oldData.Topic {
		updateData.Topic = newData.Topic
	}
	if newData.Type != oldData.Type {
		updateData.Type = newData.Type
	}
	if newData.Mode != oldData.Mode {
		updateData.Mode = newData.Mode
	}
	if newData.Distance != oldData.Distance {
		updateData.Distance = newData.Distance
	}
	if newData.Location != oldData.Location {
		updateData.Location = newData.Location
	}
	if newData.Description != oldData.Description {
		updateData.Description = newData.Description
	}
	if newData.StartTime != oldData.StartTime {
		updateData.StartTime = newData.StartTime
	}
	if newData.EndTime != oldData.EndTime {
		updateData.EndTime = newData.EndTime
	}

	_, err = dao.TMeeting.Ctx(ctx).Where(dao.TMeeting.Columns().RoomNumber, req.RoomNumber).Update(updateData)
	if err != nil {
		return
	}

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
	// 为什么会有这个判断逻辑？？？
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
		return
	}
	for _, v := range result {
		roomIDs = append(roomIDs, v.Val().(string))
	}
	if len(roomIDs) == 0 {
		return
	}

	for _, roomID := range roomIDs {
		var mInfo *meeting.GetDetailsRes
		mInfo, err = m.GetByRoomNumber(ctx, roomID)
		if err != nil {
			return
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
	if err = m.AssertExistByRoomNumber(ctx, roomNumber); err != nil {
		return
	}

	curStatus, err := dao.TMeeting.GetStatusByRoomNumber(ctx, roomNumber)
	if err != nil {
		return
	}
	oldStatus := model.MeetingStatus(curStatus)
	newStatus := model.MeetingStatus(status)
	if oldStatus == newStatus {
		return
	}

	var data g.Map = g.Map{}
	data[dao.TMeeting.Columns().Status] = newStatus
	if oldStatus == model.MeetingStatusCreated {
		if newStatus == model.MeetingStatusStarted {
			data[dao.TMeeting.Columns().StartTime] = gtime.Now()
		} else if newStatus == model.MeetingStatusEnded || newStatus == model.MeetingStatusCanceled {
			data[dao.TMeeting.Columns().EndTime] = gtime.Now()
		}
	} else if oldStatus == model.MeetingStatusStarted {
		if newStatus == model.MeetingStatusCreated {
			return gerror.New("会议进行中，不能将会议修改为已创建")
		} else if newStatus == model.MeetingStatusCanceled {
			return gerror.New("会议进行中，不能取消会议")
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
	if err = m.AssertExistByRoomNumber(ctx, roomNumber); err != nil {
		return
	}
	var meetingInfoEntity *entity.MeetingDB
	if meetingInfoEntity, err = dao.TMeeting.GetByRoomNumber(ctx, roomNumber); err != nil {
		return err
	}
	meetingInfo := model.ConvertDBMeetingToLogic(meetingInfoEntity)
	operatorInfo := sysService.Context().GetLoginUser(ctx)

	if operatorInfo.UserID != meetingInfo.CreatorInfo.UserID && operatorInfo.UserID != meetingInfo.ModeratorInfo.UserID {
		return gerror.New("您没有权限邀请参会人员, 请联系会议创建人或主持人")
	}

	// 新邀请的参会人员信息去重
	mExists := g.MapStrBool{}
	newUserInfos := make([]*model.UserInfo, 0)
	for _, userInfo := range userInfos {
		if mExists[userInfo.UserName] {
			continue
		}
		mExists[userInfo.UserID] = true
		newUserInfos = append(newUserInfos, userInfo)
	}

	// 若用户已在会议邀请列表中，跳过；否则封装新的参会人员记录。
	invitesData := make([]*do.TMeetingParticipant, 0)
	for _, userInfo := range newUserInfos {
		exists, err := dao.TMeetingParticipant.CheckParticipantExists(ctx, roomNumber, userInfo.UserID)
		if err != nil {
			return err
		}
		if exists {
			continue
		}
		invitesData = append(invitesData, &do.TMeetingParticipant{
			MRoomNumber: roomNumber,
			UserId:      userInfo.UserID,
			UserName:    userInfo.UserName,
			Role:        model.ParticipantRoleMember,
			Status:      model.ParticipantStatusUnhandled,
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
	if err = m.AssertExistByRoomNumber(ctx, roomNumber); err != nil {
		return
	}
	var meetingInfoEntity *entity.MeetingDB
	if meetingInfoEntity, err = dao.TMeeting.GetByRoomNumber(ctx, roomNumber); err != nil {
		return err
	}
	meetingInfo := model.ConvertDBMeetingToLogic(meetingInfoEntity)
	operatorInfo := sysService.Context().GetLoginUser(ctx)

	if operatorInfo.UserID != meetingInfo.CreatorInfo.UserID && operatorInfo.UserID != meetingInfo.ModeratorInfo.UserID {
		return gerror.New("您没有权限邀请参会人员, 请联系会议创建人或主持人")
	}

	if userID == meetingInfo.CreatorInfo.UserID || userID == meetingInfo.ModeratorInfo.UserID {
		return gerror.New("不能移除会议管理员/主持人")
	}

	data := g.Map{
		"status": model.ParticipantStatusKicked,
	}
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.TMeetingParticipant.Ctx(ctx).
			Where(dao.TMeetingParticipant.Columns().MRoomNumber, roomNumber).
			Where(dao.TMeetingParticipant.Columns().UserId, userID).
			Update(data)
	})

	return
}

func generateRoomID(ctx context.Context) (roomID string, err error) {
	const maxRetries = 10
	rand.Seed(time.Now().UnixNano())
	for i := 0; i < maxRetries; i++ {
		select {
		case <-ctx.Done():
			return "", ctx.Err()
		default:
		}
		roomID = fmt.Sprintf("%09d", rand.Intn(1000000000))
		var exists bool
		exists, err = dao.TMeeting.CheckExistsByRoomNumber(ctx, roomID)
		if err != nil {
			return
		}
		if !exists {
			break
		}
		log.Printf("[DEBUG] 生成会议室ID失败: exists=%v, err=%v, 正在重试...\n", exists, err)
		time.Sleep(time.Millisecond * 500)
	}
	if roomID == "" {
		err = errors.New("生成会议室ID失败, 请稍候重试")
		log.Printf("[ERROR] %v\n", err)
		return
	}
	return
}

func (m *Meeting) CheckMeetingExists(ctx context.Context, roomNumber string) (exists bool, err error) {
	exists, err = dao.TMeeting.CheckExists(ctx, roomNumber)
	return
}

func (m *Meeting) CheckParticipantStatusValid(status int) (valid bool) {
	if model.MeetingParticipantStatus(status) == model.ParticipantStatusUnhandled ||
		model.MeetingParticipantStatus(status) == model.ParticipantStatusAccepted ||
		model.MeetingParticipantStatus(status) == model.ParticipantStatusRejected {
		return true
	}

	return false
}

func (m *Meeting) HandleUserAction(ctx context.Context, actionInfo *model.HandleUserAction) (err error) {
	operatorInfo := sysService.Context().GetLoginUser(ctx)
	if operatorInfo.UserID != actionInfo.UserID {
		err = gerror.New("无权限执行此操作,要修改的记录不属于当前登录的用户。请清理本地令牌缓存后重试。")
		return
	}

	if err = m.AssertExistByRoomNumber(ctx, actionInfo.RoomNumber); err != nil {
		return err
	}
	var meetingInfoEntity *entity.MeetingDB
	if meetingInfoEntity, err = dao.TMeeting.GetByRoomNumber(ctx, actionInfo.RoomNumber); err != nil {
		return err
	}
	meetingInfo := model.ConvertDBMeetingToLogic(meetingInfoEntity)
	if meetingInfo.Status == model.MeetingStatusEnded || meetingInfo.Status == model.MeetingStatusCanceled {
		err = gerror.New("会议已结束或已取消")
		return
	}
	if err = m.checkPermission(ctx, meetingInfo, operatorInfo.UserID); err != nil {
		return err
	}

	var data g.Map = g.Map{}
	switch actionInfo.Action {
	case model.ActionMeetingInvite:
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
		Where(dao.TMeetingParticipant.Columns().UserId, operatorInfo.UserID).
		Update(data)

	return
}

func (m *Meeting) CheckMeetingStatusValid(status int) (valid bool) {
	if model.MeetingStatus(status) == model.MeetingStatusCreated ||
		model.MeetingStatus(status) == model.MeetingStatusStarted ||
		model.MeetingStatus(status) == model.MeetingStatusEnded ||
		model.MeetingStatus(status) == model.MeetingStatusCanceled {
		return true
	}

	return false
}

func (m *Meeting) AssertExistByRoomNumber(ctx context.Context, roomNumber string) (err error) {
	var exists bool
	exists, err = dao.TMeeting.CheckExistsByRoomNumber(ctx, roomNumber)
	if err != nil {
		return err
	}
	if !exists {
		return gerror.New("该会议不存在")
	}
	return
}

func (m *Meeting) checkPermission(ctx context.Context, meetingInfo *model.Meeting, userID string) (err error) {
	if meetingInfo.CreatorInfo.UserID == userID {
		return
	}
	if meetingInfo.ModeratorInfo.UserID == userID {
		return
	}
	for _, member := range meetingInfo.Members {
		if member.UserID == userID {
			if member.Status == model.ParticipantStatusKicked {
				return gerror.New("您已被踢出会议")
			}
			return
		}
	}
	return gerror.New("您没有权限参与此会议")
}
