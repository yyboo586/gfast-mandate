// ==========================================================================
// GFast自动生成model操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/model/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package model

import (
	"github.com/gogf/gf/v2/os/gtime"
)

type SqMeetingsParticipants struct {
	ID         int64       `json:"-"`
	RoomNumber string      `json:"room_number"`
	UserID     string      `json:"user_id"`
	UserName   string      `json:"user_name"`
	Role       []string    `json:"role"`
	Status     string      `json:"status"`
	UpdateTime *gtime.Time `json:"update_time"`
	JoinTime   *gtime.Time `json:"join_time"`
	ExitTime   *gtime.Time `json:"exit_time"`
}

type SqMeetingsParticipantsDB struct {
	ID         int64       `orm:"id,primary"`
	RoomNumber string      `orm:"m_room_number"`
	UserID     string      `orm:"user_id"`
	UserName   string      `orm:"user_name"`
	Role       int         `orm:"role"`
	Status     int         `orm:"status"`
	UpdateTime *gtime.Time `orm:"update_time"`
	JoinTime   *gtime.Time `orm:"join_time"`
	ExitTime   *gtime.Time `orm:"exit_time"`
}
