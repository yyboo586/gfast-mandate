package controller

import (
	"context"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/tiger1103/gfast/v3/api/v1/meeting"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/model"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/service"
)

type meetingController struct {
}

var MeetingController = new(meetingController)

func (c *meetingController) Create(ctx context.Context, req *meeting.CreateReq) (res *meeting.CreateRes, err error) {
	res, err = service.Meeting().Create(ctx, req)
	return
}

func (c *meetingController) GetByRoomNumber(ctx context.Context, req *meeting.GetDetailsReq) (res *meeting.GetDetailsRes, err error) {
	res = new(meeting.GetDetailsRes)
	res, err = service.Meeting().GetByRoomNumber(ctx, req.RoomNumber)
	return
}

func (c *meetingController) GetHistory(ctx context.Context, req *meeting.ListHistoryReq) (res *meeting.ListRes, err error) {
	res = new(meeting.ListRes)
	res, err = service.Meeting().ListByScope(ctx, &req.ListReq, model.MeetingScopeHistory)
	return
}

func (c *meetingController) GetFuture(ctx context.Context, req *meeting.ListFutureReq) (res *meeting.ListRes, err error) {
	res = new(meeting.ListRes)
	res, err = service.Meeting().ListByScope(ctx, &req.ListReq, model.MeetingScopeFuture)
	return
}

func (c *meetingController) ListAll(ctx context.Context, req *meeting.ListAllReq) (res *meeting.ListRes, err error) {
	res = new(meeting.ListRes)
	res, err = service.Meeting().ListAll(ctx, req)
	return
}

// Edit 修改会议信息表
func (c *meetingController) EditBasicInfo(ctx context.Context, req *meeting.EditReq) (res *meeting.EditRes, err error) {
	err = service.Meeting().EditBasicInfo(ctx, req)
	return
}

func (c *meetingController) Delete(ctx context.Context, req *meeting.DeleteReq) (res *meeting.DeleteRes, err error) {
	res = new(meeting.DeleteRes)
	err = service.Meeting().Delete(ctx, req.RoomNumbers)
	return
}

func (c *meetingController) UpdateMeetingStatus(ctx context.Context, req *meeting.UpdateStatusReq) (res *meeting.UpdateStatusRes, err error) {
	res = new(meeting.UpdateStatusRes)
	valid := service.Meeting().CheckMeetingStatusValid(req.Status)
	if !valid {
		err = gerror.New("请求参数错误: Status参数值非法")
		return
	}

	err = service.Meeting().UpdateStatusByRoomNumber(ctx, req.RoomNumber, req.Status)

	return
}

func (c *meetingController) InviteParticipants(ctx context.Context, req *meeting.InviteParticipantsReq) (res *meeting.InviteParticipantsRes, err error) {
	res = new(meeting.InviteParticipantsRes)

	userInfos := make([]*model.UserInfo, 0)
	for _, v := range req.UserInfos {
		userInfos = append(userInfos, &model.UserInfo{
			UserID:   v.UserID,
			UserName: v.UserName,
		})
	}
	err = service.Meeting().InviteParticipants(ctx, req.RoomNumber, userInfos)

	return
}

func (c *meetingController) RemoveParticipants(ctx context.Context, req *meeting.RemoveParticipantsReq) (res *meeting.RemoveParticipantsRes, err error) {
	res = new(meeting.RemoveParticipantsRes)

	err = service.Meeting().RemoveParticipant(ctx, req.RoomNumber, req.UserID)

	return
}

// 处理会议邀请
func (c *meetingController) UpdateParticipantStatus(ctx context.Context, req *meeting.UpdateParticipantStatusReq) (res *meeting.UpdateParticipantStatusRes, err error) {
	res = new(meeting.UpdateParticipantStatusRes)
	valid := service.Meeting().CheckParticipantStatusValid(req.Status)
	if !valid {
		err = gerror.New("请求参数错误: Status参数值非法")
		return
	}

	actionInfo := &model.HandleUserAction{
		RoomNumber: req.RoomNumber,
		UserID:     req.UserID,
		Action:     model.ActionMeetingInvite,
		Status:     req.Status,
	}
	err = service.Meeting().HandleUserAction(ctx, actionInfo)

	return
}
func (c *meetingController) JoinMeeting(ctx context.Context, req *meeting.JoinReq) (res *meeting.JoinRes, err error) {
	res = new(meeting.JoinRes)

	actionInfo := &model.HandleUserAction{
		RoomNumber: req.RoomNumber,
		UserID:     req.UserID,
		Action:     model.ActionJoin,
	}
	err = service.Meeting().HandleUserAction(ctx, actionInfo)

	return
}
func (c *meetingController) ExitMeeting(ctx context.Context, req *meeting.ExitReq) (res *meeting.ExitRes, err error) {
	res = new(meeting.ExitRes)

	actionInfo := &model.HandleUserAction{
		RoomNumber: req.RoomNumber,
		UserID:     req.UserID,
		Action:     model.ActionExit,
	}
	err = service.Meeting().HandleUserAction(ctx, actionInfo)

	return
}
