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

// SqMeetingsAddReq 添加操作请求参数
type SqMeetingsAddReq struct {
	g.Meta `path:"/add" tags:"会议信息表" method:"post" summary:"创建一个会议"`
	commonApi.Author
	*model.SqMeetings
}

// SqMeetingsAddRes 添加操作返回结果
type SqMeetingsAddRes struct {
	commonApi.EmptyRes
}

// SqMeetingsGetReq 获取一条数据请求
type SqMeetingsGetReq struct {
	g.Meta `path:"/get" tags:"会议信息表" method:"get" summary:"获取会议信息"`
	commonApi.Author
	RoomNumber int64 `p:"roomNumber" v:"required#会议ID必须"` //通过会议ID获取
}

// SqMeetingsGetRes 获取一条数据结果
type SqMeetingsGetRes struct {
	g.Meta `mime:"application/json"`
	*model.SqMeetings
}

// SqMeetingsEditReq 修改操作请求参数
type SqMeetingsEditReq struct {
	g.Meta `path:"/edit" tags:"会议信息表" method:"put" summary:"修改会议信息"`
	commonApi.Author
	*model.SqMeetings
}

// SqMeetingsEditRes 修改操作返回结果
type SqMeetingsEditRes struct {
	commonApi.EmptyRes
}

// SqMeetingsDeleteReq 删除数据请求
type SqMeetingsDeleteReq struct {
	g.Meta `path:"/delete" tags:"会议信息表" method:"delete" summary:"删除一个会议"`
	commonApi.Author
	RoomNumbers []string `p:"room_numbers" v:"required#会议ID必须"` //通过会议ID删除
}

// SqMeetingsDeleteRes 删除数据返回
type SqMeetingsDeleteRes struct {
	commonApi.EmptyRes
}

// SqMeetingsSearchReq 分页请求参数
type SqMeetingsSearchReq struct {
	g.Meta `path:"/list" tags:"会议信息表" method:"get" summary:"获取会议信息表（最近三个月）"`
	commonApi.Author
	*model.SqMeetingsSearchReq
}

// SqMeetingsSearchRes 列表返回结果
type SqMeetingsSearchRes struct {
	g.Meta `mime:"application/json"`
	commonModel.ListRes
	*model.SqMeetingsSearchRes
}
