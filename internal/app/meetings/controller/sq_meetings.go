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

// Add 添加会议信息表
func (c *sqMeetingsController) Add(ctx context.Context, req *meetings.SqMeetingsAddReq) (res *meetings.SqMeetingsAddRes, err error) {
	err = service.SqMeetings().Add(ctx, req.SqMeetings)
	return
}

// Get 获取会议信息表
func (c *sqMeetingsController) Get(ctx context.Context, req *meetings.SqMeetingsGetReq) (res *meetings.SqMeetingsGetRes, err error) {
	res = new(meetings.SqMeetingsGetRes)
	res.SqMeetings, err = service.SqMeetings().GetByRoomID(ctx, req.RoomNumber)
	return
}

// Edit 修改会议信息表
func (c *sqMeetingsController) Edit(ctx context.Context, req *meetings.SqMeetingsEditReq) (res *meetings.SqMeetingsEditRes, err error) {
	err = service.SqMeetings().Edit(ctx, req.SqMeetings)
	return
}

// Delete 删除会议信息表
func (c *sqMeetingsController) Delete(ctx context.Context, req *meetings.SqMeetingsDeleteReq) (res *meetings.SqMeetingsDeleteRes, err error) {
	err = service.SqMeetings().Delete(ctx, req.RoomNumbers)
	return
}

// List 列表
func (c *sqMeetingsController) List(ctx context.Context, req *meetings.SqMeetingsSearchReq) (res *meetings.SqMeetingsSearchRes, err error) {
	res = new(meetings.SqMeetingsSearchRes)
	res.SqMeetingsSearchRes, err = service.SqMeetings().List(ctx, req.SqMeetingsSearchReq)
	return
}
