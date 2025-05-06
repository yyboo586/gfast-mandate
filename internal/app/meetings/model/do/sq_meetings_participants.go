// ==========================================================================
// GFast自动生成model entity操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/model/entity/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package do

import (
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/util/gmeta"
)

// SqMeetingsParticipants is the golang structure for table sq_meetings_participants.
type SqMeetingsParticipants struct {
	gmeta.Meta `orm:"table:sq_meetings_participants, do:true"`
	Id         interface{} `orm:"id,primary" json:"id"`            // 主键ID
	RoomNumber interface{} `orm:"m_room_number" json:"roomNumber"` // 会议ID
	UserId     interface{} `orm:"user_id" json:"userId"`           // 参会人标识
	UserName   interface{} `orm:"user_name" json:"userName"`       // 参会人名称
	Role       interface{} `orm:"role" json:"role"`                // 参会人角色
	Status     interface{} `orm:"status" json:"status"`            // 邀请状态
	UpdateTime *gtime.Time `orm:"update_time" json:"updateTime"`   // 更新时间
	JoinTime   *gtime.Time `orm:"join_time" json:"joinTime"`       // 会议开始时间
	ExitTime   *gtime.Time `orm:"exit_time" json:"exitTime"`       // 会议结束时间
}
