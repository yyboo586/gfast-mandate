// ==========================================================================
// GFast自动生成api操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: api/v1/meetings/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表相关参数
// company:云南奇讯科技有限公司
// ==========================================================================

package meetings

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	commonApi "github.com/tiger1103/gfast/v3/api/v1/common"
	comModel "github.com/tiger1103/gfast/v3/internal/app/common/model"
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
	commonApi.Author
	Topic         string      `v:"required#会议主题不能为空" dc:"会议主题"`
	StartTime     *gtime.Time `v:"required#会议开始时间不能为空" dc:"会议开始时间"`
	Mode          string      `v:"required#会议模式不能为空" dc:"会议模式(1:漫游模式, 2:会议室模式, 3:虚拟人模式)"`
	Distance      int         `dc:"电子围栏半径(当Mode为漫游模式时必填)"`
	Location      string      `v:"required#会议地点不能为空" dc:"会议地点"`
	Type          string      `v:"required#会议类型不能为空" dc:"会议类型(1:即时会议, 2:预约会议)"`
	ModeratorID   string      `v:"required#会议主持人ID不能为空" dc:"主持人标识"`
	ModeratorName string      `v:"required#会议主持人名字不能为空" dc:"主持人名称"`
	Description   string      `dc:"会议描述信息"`
	CreatorID     string      `v:"required#会议创建人ID不能为空" dc:"创建人标识"`
	CreatorName   string      `v:"required#会议创建人名字不能为空" dc:"创建人名称"`
	MemberInfos   []*UserInfo `v:"required#参会人员信息不能为空"  dc:"邀请参会人员信息集合"`
}

type CreateRes struct {
	g.Meta        `mime:"application/json"`
	RoomNumber    string
	Topic         string
	CreatorName   string
	Type          string
	Mode          string
	StartTime     *gtime.Time
	ModeratorName string
	Description   string
}

type GetDetailsReq struct {
	g.Meta `path:"/get_details" tags:"会议管理" method:"get" summary:"获取会议详情"`
	commonApi.Author
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

type ListHistoryReq struct {
	g.Meta `path:"/get_history" tags:"会议管理" method:"get" summary:"会议记录"`
	commonApi.Author
	UserID string `v:"required#UserID必须"` //通过UserID获取
}

type ListFutureReq struct {
	g.Meta `path:"/get_future" tags:"会议管理" method:"get" summary:"我的会议"`
	commonApi.Author
	UserID string `p:"userID" v:"required#UserID必须"` //通过UserID获取
}

// ListReAllReq 分页获取所有会议记录
type ListAllReq struct {
	g.Meta `path:"/list" tags:"会议管理" method:"get" summary:"获取所有会议记录"`
	commonApi.Author
	comModel.PageReq
}

type ListRes struct {
	g.Meta   `mime:"application/json"`
	Meetings []*GetDetailsRes
}

type EditReq struct {
	g.Meta `path:"/edit" tags:"会议管理" method:"put" summary:"修改会议信息"`
	commonApi.Author
	RoomNumber    string      `v:"required#会议ID不能为空"`
	Topic         string      `v:"required#会议主题不能为空" dc:"会议主题"`
	StartTime     *gtime.Time `v:"required#会议开始时间不能为空" dc:"会议开始时间"`
	Mode          string      `v:"required#会议模式不能为空" dc:"会议模式(1:漫游模式, 2:会议室模式, 3:虚拟人模式)"`
	Distance      int         `dc:"电子围栏半径(当Mode为漫游模式时必填)"`
	Location      string      `v:"required#会议地点不能为空" dc:"会议地点"`
	Type          string      `v:"required#会议类型不能为空" dc:"会议类型(1:即时会议, 2:预约会议)"`
	ModeratorID   string      `v:"required#会议主持人ID不能为空" dc:"主持人标识"`
	ModeratorName string      `v:"required#会议主持人名字不能为空" dc:"主持人名称"`
	Description   string      `dc:"会议描述信息"`
	MemberInfos   []*UserInfo `v:"required#参会人员信息不能为空"  dc:"邀请参会人员信息集合"`
}

type EditRes struct {
	commonApi.EmptyRes
}

type CancelReq struct {
	g.Meta `path:"/cancel" tags:"会议管理" method:"put" summary:"取消会议"`
	commonApi.Author
	RoomNumber string `p:"roomNumber" v:"required#会议ID必须"` //通过会议ID获取
}

type CancelRes struct {
	commonApi.EmptyRes
}

type RemoveParticipantsReq struct {
	g.Meta `path:"/remove_participants" tags:"会议管理" method:"put" summary:"移除参会人员"`
	commonApi.Author
	RoomNumber string `v:"required#会议ID必须"` //通过会议ID获取
	UserIDs    []string
}

type RemoveParticipantsRes struct {
	commonApi.EmptyRes
}

type LoginReq struct {
	g.Meta `path:"/login" tags:"会议管理" method:"post" summary:"登录"`
	UserID string `v:"required#用户ID必须"`
}

type LoginRes struct {
	g.Meta `mime:"application/json"`
	Token  string `json:"token"`
}
