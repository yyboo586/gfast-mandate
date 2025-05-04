// ==========================================================================
// GFast自动生成router操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/router/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package router

import (
	"context"

	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/controller"
)

func (router *Router) BindSqMeetingsController(ctx context.Context, group *ghttp.RouterGroup) {
	group.Group("/sqMeetings", func(group *ghttp.RouterGroup) {
		group.Bind(
			controller.SqMeetings,
		)
	})
}
