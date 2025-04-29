package router

import (
	"context"

	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/controller"

	systemService "github.com/tiger1103/gfast/v3/internal/app/system/service"
)

var R = new(Router)

type Router struct{}

func (router *Router) BindController(ctx context.Context, group *ghttp.RouterGroup) {
	group.Group("/online_meeting/meetings", func(group *ghttp.RouterGroup) {
		group.Middleware(systemService.Middleware().Ctx)
		systemService.GfToken().Middleware(group)
		group.Middleware(systemService.Middleware().Auth)
		group.Bind(
			controller.MeetingController,
			controller.FileController,
		)
	})
}
