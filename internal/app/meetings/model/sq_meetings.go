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
	"github.com/gogf/gf/v2/util/gmeta"
	comModel "github.com/tiger1103/gfast/v3/internal/app/common/model"
)

// SqMeetings is the golang structure for table sq_meetings.
type SqMeetings struct {
	gmeta.Meta        `orm:"table:sq_meetings"`
	ID                int64       `p:"id" dc:"主键ID"`
	RoomNumber        string      `p:"roomNumber"  dc:"会议ID"`
	Topic             string      `p:"topic" v:"required#会议主题不能为空" dc:"会议主题"`
	Mode              string      `p:"mode" v:"required#会议模式不能为空" dc:"会议模式(1:漫游模式, 2:会议室模式, 3:虚拟人模式)"`
	Distance          int         `p:"distance"  dc:"电子围栏半径(当Mode为漫游模式时必填)"`
	Type              string      `p:"type" v:"required#会议类型不能为空" dc:"会议类型(1:即时会议, 2:预约会议)"`
	Status            string      `p:"status"  dc:"会议状态(1:待开始, 2:进行中, 3:已结束, 4:已取消)"`
	Location          string      `p:"location" v:"required#会议地点不能为空" dc:"会议地点"`
	CreatorName       string      `p:"creatorName" v:"required#创建人名字不能为空" dc:"创建人名字"`
	ModeratorName     string      `p:"moderatorName" v:"required#主持人名字不能为空" dc:"主持人名字"`
	Description       string      `p:"description"  dc:"会议描述信息"`
	RecordingEnabled  int         `p:"recordingEnabled"  dc:"是否自动开启会议录制(0:否, 1:是)"`
	InviteNumberNames []string    `p:"inviteNumberNames" v:"required#参会人员不能为空"  dc:"邀请参会人员信息"`
	CreateTime        *gtime.Time `p:"createTime"  dc:"会议创建时间"`
	StartTime         *gtime.Time `p:"startTime" v:"required#会议开始时间不能为空" dc:"会议开始时间"`
	EndTime           *gtime.Time `p:"endTime"  dc:"会议结束时间"`
}

// SqMeetings is the golang structure for table sq_meetings.
type SqMeetingsDB struct {
	gmeta.Meta       `orm:"table:sq_meetings"`
	ID               int64       `p:"id" dc:"主键ID"`
	RoomNumber       string      `p:"roomNumber"  dc:"会议ID"`
	Topic            string      `p:"topic" v:"required#会议主题不能为空" dc:"会议主题"`
	Mode             int         `p:"mode" v:"required#会议模式不能为空" dc:"会议模式(1:漫游模式, 2:会议室模式, 3:虚拟人模式)"`
	Distance         int         `p:"distance"  dc:"电子围栏半径(当Mode为漫游模式时必填)"`
	Type             int         `p:"type" v:"required#会议类型不能为空" dc:"会议类型(1:即时会议, 2:预约会议)"`
	Status           int         `p:"status"  dc:"会议状态(1:待开始, 2:进行中, 3:已结束, 4:已取消)"`
	Location         string      `p:"location" v:"required#会议地点不能为空" dc:"会议地点"`
	CreatorName      string      `p:"creatorName" v:"required#创建人名字不能为空" dc:"创建人名字"`
	ModeratorName    string      `p:"moderatorName" v:"required#主持人名字不能为空" dc:"主持人名字"`
	Description      string      `p:"description"  dc:"会议描述信息"`
	RecordingEnabled int         `p:"recordingEnabled"  dc:"是否自动开启会议录制(0:否, 1:是)"`
	CreateTime       *gtime.Time `p:"createTime"  dc:"会议创建时间"`
	StartTime        *gtime.Time `p:"startTime" v:"required#会议开始时间不能为空" dc:"会议开始时间"`
	EndTime          *gtime.Time `p:"endTime"  dc:"会议结束时间"`
}

// SqMeetingsSearchReq 分页请求参数
type SqMeetingsSearchReq struct {
	comModel.PageReq
	UserName string `p:"userName" v:"required#用户名不能为空" dc:"用户名"`
}

// SqMeetingsSearchRes 列表返回结果
type SqMeetingsSearchRes struct {
	comModel.ListRes
	List []*SqMeetings `json:"list"`
}
