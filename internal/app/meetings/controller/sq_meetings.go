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
	systemService "github.com/tiger1103/gfast/v3/internal/app/system/service"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type sqMeetingsController struct {
	systemController.BaseController
}

var SqMeetings = new(sqMeetingsController)

// Create 添加会议信息表
func (c *sqMeetingsController) Create(ctx context.Context, req *meetings.CreateReq) (res *meetings.CreateRes, err error) {
	res, err = service.SqMeetings().Create(ctx, req)
	return
}

// Get 获取会议详细信息
func (c *sqMeetingsController) Get(ctx context.Context, req *meetings.GetDetailsReq) (res *meetings.GetDetailsRes, err error) {
	res = new(meetings.GetDetailsRes)
	res, err = service.SqMeetings().GetByRoomNumber(ctx, req.RoomNumber)
	return
}

func (c *sqMeetingsController) GetHistoryByUserID(ctx context.Context, req *meetings.ListHistoryReq) (res *meetings.ListRes, err error) {
	res = new(meetings.ListRes)
	res, err = service.SqMeetings().GetByScope(ctx, req.UserID, "history")
	return
}

// Get 获取历史会议信息
func (c *sqMeetingsController) GetFuture(ctx context.Context, req *meetings.ListFutureReq) (res *meetings.ListRes, err error) {
	res = new(meetings.ListRes)
	res, err = service.SqMeetings().GetByScope(ctx, req.UserID, "future")
	return
}

// ListAll 列表
func (c *sqMeetingsController) ListAll(ctx context.Context, req *meetings.ListAllReq) (res *meetings.ListRes, err error) {
	res = new(meetings.ListRes)
	res, err = service.SqMeetings().ListAll(ctx, req)
	return
}

// Edit 修改会议信息表
func (c *sqMeetingsController) Edit(ctx context.Context, req *meetings.EditReq) (res *meetings.EditRes, err error) {
	err = service.SqMeetings().Edit(ctx, req)
	return
}

// Cancel 取消会议
func (c *sqMeetingsController) Cancel(ctx context.Context, req *meetings.CancelReq) (res *meetings.CancelRes, err error) {
	err = service.SqMeetings().CancelByRoomNumber(ctx, req.RoomNumber)
	return
}

func (c *sqMeetingsController) RemoveParticipants(ctx context.Context, req *meetings.RemoveParticipantsReq) (res *meetings.RemoveParticipantsRes, err error) {
	err = service.SqMeetings().RemoveParticipants(ctx, req)
	return
}

func (c *sqMeetingsController) Login(ctx context.Context, req *meetings.LoginReq) (res *meetings.LoginRes, err error) {
	key := "sdssssssssssssssssssssssssssssssssssssssssssstom"
	data, err := systemService.GfToken().GenerateToken(ctx, key, req.UserID)
	liberr.ErrIsNil(ctx, err, "生成token失败")

	res = new(meetings.LoginRes)
	res.Token = data
	return
}
