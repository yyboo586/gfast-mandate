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
	"github.com/gogf/gf/v2/util/gmeta"
)

// SqMeetings is the golang structure for table sq_meetings.
type SqMeetingsParticipants struct {
	gmeta.Meta `orm:"table:sq_meetings_participants"`
	Id         int64       `orm:"id,primary" json:"id"`          // 主键ID
	MID        string      `orm:"mid" json:"mid"`                // 会议ID
	UserName   string      `orm:"user_name" json:"userName"`     // 参会人名字
	Status     int         `orm:"status" json:"status"`          // 与会状态
	UpdateTime *gtime.Time `orm:"update_time" json:"updateTime"` // 会议创建时间
	JoinTime   *gtime.Time `orm:"join_time" json:"joinTime"`     // 会议开始时间
	ExitTime   *gtime.Time `orm:"exit_time" json:"exitTime"`     // 会议结束时间
}
