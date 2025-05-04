package router

import (
	"context"

	"github.com/gogf/gf/v2/net/ghttp"
	meetingsRouter "github.com/tiger1103/gfast/v3/internal/app/meetings/router"
)

func (router *Router) BindMeetingsModuleController(ctx context.Context, group *ghttp.RouterGroup) {
	meetingsRouter.R.BindController(ctx, group)
}
