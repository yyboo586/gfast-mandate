// ==========================================================================
// GFast自动生成service操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/service/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package service

import (
	"context"

	"github.com/tiger1103/gfast/v3/internal/app/meetings/model"
)

type ISqMeetings interface {
	Add(ctx context.Context, req *model.SqMeetings) (err error)
	GetByRoomID(ctx context.Context, roomNumber int64) (res *model.SqMeetings, err error)
	Edit(ctx context.Context, req *model.SqMeetings) (err error)
	Delete(ctx context.Context, roomNumbers []string) (err error)
	List(ctx context.Context, req *model.SqMeetingsSearchReq) (res *model.SqMeetingsSearchRes, err error)
}

var localSqMeetings ISqMeetings

func SqMeetings() ISqMeetings {
	if localSqMeetings == nil {
		panic("implement not found for interface ISqMeetings, forgot register?")
	}
	return localSqMeetings
}

func RegisterSqMeetings(i ISqMeetings) {
	localSqMeetings = i
}
