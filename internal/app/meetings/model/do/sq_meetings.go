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

// SqMeetings is the golang structure for table sq_meetings.
type SqMeetings struct {
	gmeta.Meta  `orm:"table:sq_meetings, do:true"`
	Id          interface{} `orm:"id,primary" json:"id"`           // 主键ID
	RoomNumber  interface{} `orm:"room_number" json:"roomNumber"`  // 会议ID
	Topic       interface{} `orm:"topic" json:"topic"`             // 会议主题
	Mode        interface{} `orm:"mode" json:"mode"`               // 会议模式
	Distance    interface{} `orm:"distance" json:"distance"`       // 电子围栏半径
	Type        interface{} `orm:"type" json:"type"`               // 会议类型
	Status      interface{} `orm:"status" json:"status"`           // 会议状态
	Location    interface{} `orm:"location" json:"location"`       // 会议地点
	CreatorId   interface{} `orm:"creator_id" json:"creatorId"`    // 创建人名字
	Description interface{} `orm:"description" json:"description"` // 会议描述信息
	// RecordingEnabled interface{} `orm:"recording_enabled" json:"recordingEnabled"` // 是否开启会议录制
	CreateTime *gtime.Time `orm:"create_time" json:"createTime"` // 会议创建时间
	StartTime  *gtime.Time `orm:"start_time" json:"startTime"`   // 会议开始时间
	EndTime    *gtime.Time `orm:"end_time" json:"endTime"`       // 会议结束时间
}
