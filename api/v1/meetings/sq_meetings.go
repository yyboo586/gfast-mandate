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
	commonApi "github.com/tiger1103/gfast/v3/api/v1/common"
	commonModel "github.com/tiger1103/gfast/v3/internal/app/common/model"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/model"
)

type UserInfo struct {
	UserID   string `p:"userId" v:"required#参会人员ID不能为空" json:"user_id"`
	UserName string `p:"userName" v:"required#参会人员名字不能为空" json:"user_name"`
}

// SqMeetingsAddReq 添加操作请求参数
type SqMeetingsAddReq struct {
	g.Meta `path:"/create" tags:"会议管理" method:"post" summary:"创建一个会议"`
	commonApi.Author
	*model.SqMeetings
	ModeratorId   string      `p:"moderatorId" v:"required#主持人不能为空" dc:"主持人标识"`
	ModeratorName string      `p:"moderatorName" v:"required#主持人不能为空" dc:"主持人名称"`
	MemberInfos   []*UserInfo `p:"memberInfos" v:"required#参会人员信息不能为空"  dc:"邀请参会人员信息集合"`
}

// SqMeetingsAddRes 添加操作返回结果
type SqMeetingsAddRes struct {
	commonApi.EmptyRes
}

// SqMeetingsGetDetailsReq 获取一条数据请求
type SqMeetingsGetDetailsReq struct {
	g.Meta `path:"/get_details" tags:"会议管理" method:"get" summary:"获取会议详细信息"`
	commonApi.Author
	RoomNumber string `p:"roomNumber" v:"required#会议ID必须"` //通过会议ID获取
}

// SqMeetingsGetDetailsRes 获取一条数据结果
type SqMeetingsGetDetailsRes struct {
	g.Meta `mime:"application/json"`
	*model.SqMeetings
	ModeratorId   string                          `p:"moderatorId" v:"required#主持人不能为空" dc:"主持人标识"`
	ModeratorName string                          `p:"moderatorName" v:"required#主持人不能为空" dc:"主持人名称"`
	MemberInfos   []*model.SqMeetingsParticipants `json:"member_infos"`
}

// SqMeetingsCancelReq 取消会议
type SqMeetingsCancelReq struct {
	g.Meta `path:"/cancel" tags:"会议管理" method:"put" summary:"取消会议"`
	commonApi.Author
	RoomNumber string `p:"roomNumber" v:"required#会议ID必须"` //通过会议ID获取
}

// SqMeetingsCancelRes 取消操作返回结果
type SqMeetingsCancelRes struct {
	commonApi.EmptyRes
}

// SqMeetingsGetDetailsReq 获取历史会议信息
type SqMeetingsGetHistoryReq struct {
	g.Meta `path:"/get_history" tags:"会议管理" method:"get" summary:"获取历史会议信息"`
	commonApi.Author
	UserID string `p:"userID" v:"required#UserID必须"` //通过UserID获取
}

// SqMeetingsGetHistoryRes 获取历史会议信息
type SqMeetingsGetHistoryRes struct {
	g.Meta `mime:"application/json"`
	List   []*SqMeetingDetails
}

// SqMeetingsGetDetailsReq 获取历史会议信息
type SqMeetingsGetFutureReq struct {
	g.Meta `path:"/get_future" tags:"会议管理" method:"get" summary:"获取历史会议信息"`
	commonApi.Author
	UserID string `p:"userID" v:"required#UserID必须"` //通过UserID获取
}

// SqMeetingsGetHistoryRes 获取历史会议信息
type SqMeetingsGetFutureRes struct {
	g.Meta `mime:"application/json"`
	List   []*SqMeetingDetails
}

// SqMeetingsEditReq 修改操作请求参数
type SqMeetingsEditReq struct {
	g.Meta `path:"/edit" tags:"会议管理" method:"put" summary:"修改会议信息"`
	commonApi.Author
	*model.SqMeetings
	ModeratorId   string      `p:"moderatorId" v:"required#主持人不能为空" dc:"主持人标识"`
	ModeratorName string      `p:"moderatorName" v:"required#主持人不能为空" dc:"主持人名称"`
	MemberInfos   []*UserInfo `p:"memberInfos" v:"required#参会人员信息不能为空"  dc:"邀请参会人员信息集合"`
}

// SqMeetingsEditRes 修改操作返回结果
type SqMeetingsEditRes struct {
	commonApi.EmptyRes
}

// SqMeetingsSearchReq 分页请求参数
type SqMeetingsSearchReq struct {
	g.Meta `path:"/list" tags:"会议管理" method:"get" summary:"获取会议信息表（最近三个月）"`
	commonApi.Author
	*model.SqMeetingsSearchReq
}

// SqMeetingsSearchRes 列表返回结果
type SqMeetingsSearchRes struct {
	g.Meta `mime:"application/json"`
	commonModel.ListRes
	*model.SqMeetingsSearchRes
}

// SqMeetingDetails 单场会议的详细信息
type SqMeetingDetails struct {
	*model.SqMeetings
	ModeratorId   string                          `p:"moderatorId" v:"required#主持人不能为空" dc:"主持人标识"`
	ModeratorName string                          `p:"moderatorName" v:"required#主持人不能为空" dc:"主持人名称"`
	MemberInfos   []*model.SqMeetingsParticipants `json:"member_infos"`
}

type LoginReq struct {
	g.Meta `path:"/login" tags:"会议管理" method:"get" summary:"登录接口"`
	UserID string `p:"userId" v:"required#用户ID不能为空" dc:"用户ID"`
}

type LoginRes struct {
	g.Meta `mime:"application/json"`
	Token  string `json:"token"`
}
