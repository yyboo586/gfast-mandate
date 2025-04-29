package meeting

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/tiger1103/gfast/v3/api/v1/common"
)

type UserInfo struct {
	UserID     string `v:"required#参会人员ID不能为空"`
	UserName   string `v:"required#参会人员名字不能为空"`
	Roles      []string
	Status     string
	UpdateTime *gtime.Time
	JoinTime   *gtime.Time
	ExitTime   *gtime.Time
}

type CreateReq struct {
	g.Meta `path:"/create" tags:"会议管理" method:"post" summary:"创建会议"`
	common.Author
	Topic         string      `v:"required#会议主题不能为空" dc:"会议主题"`
	Mode          string      `v:"required#会议模式不能为空" dc:"会议模式(漫游模式/会议室模式/虚拟人模式)"`
	Distance      int         `dc:"电子围栏半径(当Mode为漫游模式时必填)"`
	Location      string      `v:"required#会议地点不能为空" dc:"会议地点"`
	Type          string      `v:"required#会议类型不能为空" dc:"会议类型(即时会议/预约会议)"`
	ModeratorID   string      `v:"required#会议主持人ID不能为空" dc:"主持人标识"`
	ModeratorName string      `v:"required#会议主持人名字不能为空" dc:"主持人名字"`
	CreatorID     string      `v:"required#会议创建人ID不能为空" dc:"创建人标识"`
	CreatorName   string      `v:"required#会议创建人名字不能为空" dc:"创建人名字"`
	Description   string      `dc:"会议描述信息"`
	StartTime     *gtime.Time `v:"required#会议开始时间不能为空" dc:"会议开始时间"`
	MemberInfos   []*UserInfo `v:"required#参会人员信息不能为空"  dc:"邀请参会人员信息集合"`
}

type CreateRes struct {
	g.Meta        `mime:"application/json"`
	RoomNumber    string
	Topic         string
	Type          string
	Mode          string
	Distance      int
	CreatorName   string
	ModeratorName string
	Description   string
	StartTime     *gtime.Time
}

type GetDetailsReq struct {
	g.Meta `path:"/get_details" tags:"会议管理" method:"get" summary:"获取会议详情"`
	common.Author
	RoomNumber string `v:"required#会议ID必须"`
}

type GetDetailsRes struct {
	RoomNumber    string
	Topic         string
	Mode          string
	Distance      int
	Type          string
	Status        string
	Location      string
	Description   string
	CreateTime    *gtime.Time
	StartTime     *gtime.Time
	EndTime       *gtime.Time
	CreatorInfo   *UserInfo
	ModeratorInfo *UserInfo
	MemberInfos   []*UserInfo
	Count         int
}

type ListReq struct {
	common.Author
	common.PageReq
}

type ListHistoryReq struct {
	g.Meta `path:"/get_history" tags:"会议管理" method:"get" summary:"我的会议记录"`
	ListReq
}

type ListFutureReq struct {
	g.Meta `path:"/get_future" tags:"会议管理" method:"get" summary:"我的会议列表"`
	ListReq
}

// ListReAllReq 分页获取所有会议记录
type ListAllReq struct {
	g.Meta `path:"/listall" tags:"会议管理" method:"get" summary:"获取所有会议记录"`
	common.Author
	common.PageReq
	RoomNumber string
}

type ListRes struct {
	g.Meta   `mime:"application/json"`
	Meetings []*GetDetailsRes
	*common.ListRes
}

type EditReq struct {
	g.Meta `path:"/edit" tags:"会议管理" method:"put" summary:"修改会议信息"`
	common.Author
	RoomNumber  string      `v:"required#会议ID不能为空" dc:"会议ID"`
	Topic       string      `dc:"会议主题"`
	Type        string      `dc:"会议类型(即时会议/预约会议)"`
	Mode        string      `dc:"会议模式(漫游模式/会议室模式/虚拟人模式)"`
	Distance    int         `dc:"电子围栏半径(当Mode为漫游模式时必填)"`
	Location    string      `dc:"会议地点"`
	Description string      `dc:"会议描述信息"`
	StartTime   *gtime.Time `dc:"会议开始时间"`
	EndTime     *gtime.Time `dc:"会议结束时间"`
}

type EditRes struct {
	common.EmptyRes
}

type DeleteReq struct {
	g.Meta      `path:"/delete" tags:"会议管理" method:"delete" summary:"删除会议"`
	RoomNumbers []string `v:"required#会议IDs必须"`
}

type DeleteRes struct {
	common.EmptyRes
}

type UpdateStatusReq struct {
	g.Meta `path:"/update_status" tags:"会议管理" method:"put" summary:"取消/结束会议"`
	common.Author
	RoomNumber string `v:"required#会议ID必须"` //通过会议ID获取
	Status     int    `v:"required#会议状态不能为空" dc:"会议状态(2:开始, 3:结束, 4:取消)"`
}

type UpdateStatusRes struct {
	common.EmptyRes
}

type InviteParticipantsReq struct {
	g.Meta `path:"/:roomNumber/participants" tags:"会议管理" method:"patch" summary:"添加参会人员"`
	common.Author
	RoomNumber string `p:"roomNumber" v:"required#会议ID必须"`
	UserInfos  []*UserInfo
}

type InviteParticipantsRes struct {
	common.EmptyRes
}

type RemoveParticipantsReq struct {
	g.Meta `path:"/:roomNumber/participants" tags:"会议管理" method:"delete" summary:"移除参会人员"`
	common.Author
	RoomNumber string `p:"roomNumber" v:"required#会议ID必须"`
	UserID     string `v:"required#移除人员的ID"`
}

type RemoveParticipantsRes struct {
	common.EmptyRes
}

type UpdateParticipantStatusReq struct {
	g.Meta     `path:"/:roomNumber/participants/:userId/status" tags:"会议管理" method:"put" summary:"用户响应会议预约"`
	RoomNumber string `p:"roomNumber" v:"required#会议ID必须"`
	UserID     string `p:"userId" v:"required#UserID必须"`
	Status     int    `v:"required|in:1,2,3" dc:"1:未处理,2:已接受,3:已拒绝"`
}

type UpdateParticipantStatusRes struct {
	common.EmptyRes
}

type JoinReq struct {
	g.Meta     `path:"/:roomNumber/participants/:userId/join" tags:"会议管理" method:"put" summary:"用户加入会议"`
	RoomNumber string `p:"roomNumber" v:"required#会议ID必须"`
	UserID     string `p:"userId" v:"required#UserID必须"`
}

type JoinRes struct {
	common.EmptyRes
}

type ExitReq struct {
	g.Meta     `path:"/:roomNumber/participants/:userId/exit" tags:"会议管理" method:"put" summary:"用户退出会议"`
	RoomNumber string `p:"roomNumber" v:"required#会议ID必须"`
	UserID     string `p:"userId" v:"required#UserID必须"`
}

type ExitRes struct {
	common.EmptyRes
}
