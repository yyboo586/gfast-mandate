// ==========================================================================
// GFast自动生成controller操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/controller/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package controller

import (
	"context"

	"github.com/tiger1103/gfast/v3/api/v1/meetings"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/service"
	systemController "github.com/tiger1103/gfast/v3/internal/app/system/controller"
)

type sqMeetingsController struct {
	systemController.BaseController
}

var SqMeetings = new(sqMeetingsController)

func (c *sqMeetingsController) Login(ctx context.Context, req *meetings.LoginReq) (res *meetings.LoginRes, err error) {
	res = new(meetings.LoginRes)
	res.Token = "Bearer 12345678"
	return
}

// Add 添加会议信息表
func (c *sqMeetingsController) Add(ctx context.Context, req *meetings.SqMeetingsAddReq) (res *meetings.SqMeetingsAddRes, err error) {
	err = service.SqMeetings().Add(ctx, req)
	return
}

// Get 获取会议详细信息
func (c *sqMeetingsController) Get(ctx context.Context, req *meetings.SqMeetingsGetDetailsReq) (res *meetings.SqMeetingsGetDetailsRes, err error) {
	res = new(meetings.SqMeetingsGetDetailsRes)
	res, err = service.SqMeetings().GetByRoomNumber(ctx, req.RoomNumber)
	return
}

// Get 获取历史会议信息
func (c *sqMeetingsController) GetHistory(ctx context.Context, req *meetings.SqMeetingsGetHistoryReq) (res *meetings.SqMeetingsGetHistoryRes, err error) {
	res = new(meetings.SqMeetingsGetHistoryRes)
	res, err = service.SqMeetings().GetHistoryByUserID(ctx, req.UserID)
	return
}

// Get 获取历史会议信息
func (c *sqMeetingsController) GetFuture(ctx context.Context, req *meetings.SqMeetingsGetFutureReq) (res *meetings.SqMeetingsGetFutureRes, err error) {
	res = new(meetings.SqMeetingsGetFutureRes)
	res, err = service.SqMeetings().GetFutureByUserID(ctx, req.UserID)
	return
}

// Cancel 取消会议
func (c *sqMeetingsController) Cancel(ctx context.Context, req *meetings.SqMeetingsCancelReq) (res *meetings.SqMeetingsCancelRes, err error) {
	err = service.SqMeetings().CancelByRoomNumber(ctx, req.RoomNumber)
	return
}

// Edit 修改会议信息表
func (c *sqMeetingsController) Edit(ctx context.Context, req *meetings.SqMeetingsEditReq) (res *meetings.SqMeetingsEditRes, err error) {
	err = service.SqMeetings().Edit(ctx, req)
	return
}

// List 列表
func (c *sqMeetingsController) List(ctx context.Context, req *meetings.SqMeetingsSearchReq) (res *meetings.SqMeetingsSearchRes, err error) {
	res = new(meetings.SqMeetingsSearchRes)
	res.SqMeetingsSearchRes, err = service.SqMeetings().List(ctx, req.SqMeetingsSearchReq)
	return
}
