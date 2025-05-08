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
)

type ISqMeetings interface {
	Create(ctx context.Context, req *meetings.CreateReq) (res *meetings.CreateRes, err error)
	GetByRoomNumber(ctx context.Context, roomNumber string) (res *meetings.GetDetailsRes, err error)
	GetByScope(ctx context.Context, userID, scope string) (res *meetings.ListRes, err error)
	ListAll(ctx context.Context, req *meetings.ListAllReq) (res *meetings.ListRes, err error)
	Edit(ctx context.Context, req *meetings.EditReq) (err error)
	CancelByRoomNumber(ctx context.Context, roomNumber string) (err error)
	RemoveParticipants(ctx context.Context, req *meetings.RemoveParticipantsReq) (err error)
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
