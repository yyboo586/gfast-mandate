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

	"github.com/tiger1103/gfast/v3/api/v1/meetings"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/model"
)

type ISqMeetings interface {
	Add(ctx context.Context, req *meetings.SqMeetingsAddReq) (err error)
	GetByRoomNumber(ctx context.Context, roomNumber string) (res *meetings.SqMeetingsGetDetailsRes, err error)
	GetHistoryByUserID(ctx context.Context, userID string) (res *meetings.SqMeetingsGetHistoryRes, err error)
	GetFutureByUserID(ctx context.Context, userID string) (res *meetings.SqMeetingsGetFutureRes, err error)
	CancelByRoomNumber(ctx context.Context, roomNumber string) (err error)
	Edit(ctx context.Context, req *meetings.SqMeetingsEditReq) (err error)
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
