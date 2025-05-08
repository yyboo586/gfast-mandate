// ==========================================================================
// GFast自动生成model entity操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/model/entity/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// SqMeetings is the golang structure for table sq_meetings.
type SqMeetings struct {
	// gmeta.Meta       `orm:"table:sq_meetings"`
	Id               int64  `orm:"id,primary" json:"id"` // 主键ID
	RoomNumber       string // 会议ID
	Topic            string `orm:"topic" json:"topic"` // 会议主题
	Mode             int    `orm:"mode" json:"mode"`   // 会议模式
	Distance         int
	Type             int
	Status           int
	Location         string
	CreatorId        string
	Description      string
	RecordingEnabled int
	CreateTime       *gtime.Time
	StartTime        *gtime.Time
	EndTime          *gtime.Time
}
