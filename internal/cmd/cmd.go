package cmd

import (
	"context"
	"fmt"

	"github.com/gogf/gf/v2/encoding/gbase64"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/net/goai"
	"github.com/gogf/gf/v2/os/gcmd"
	"github.com/gogf/gf/v2/os/glog"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/tiger1103/gfast/v3/internal/consts"
	"github.com/tiger1103/gfast/v3/internal/mounter"
	"github.com/tiger1103/gfast/v3/internal/router"
)

var (
	Main = gcmd.Command{
		Name:  "main",
		Usage: "main",
		Brief: "start http server",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			g.Log().SetFlags(glog.F_ASYNC | glog.F_TIME_DATE | glog.F_TIME_TIME | glog.F_FILE_LONG)
			g.Log().Info(ctx, gbase64.MustDecodeString(consts.Logo), "Version:", consts.Version)
			s := g.Server()
			//调用注册已挂载相关组件
			mounter.DoMount(ctx, s)
			// // 启用目录浏览功能
			// s.SetIndexFolder(true)

			// // 获取静态文件根目录
			// basePath := gfile.RealPath("/home/www/file/static")
			// if !gfile.Exists(basePath) {
			// 	g.Log().Fatalf(ctx, "静态文件目录不存在: %s", basePath)
			// }
			// g.Log().Infof(ctx, "静态文件根目录: %s", basePath)

			// // 设置服务器根目录
			// s.SetServerRoot(basePath)

			// // 优化静态文件服务配置
			// s.Group("/static", func(group *ghttp.RouterGroup) {
			// 	group.Middleware(commonService.Middleware().MiddlewareCORS)
			// 	group.Middleware(ghttp.MiddlewareHandlerResponse)
			// 	// 使用ServeFile处理静态文件请求
			// 	group.ALL("/*", func(r *ghttp.Request) {
			// 		filePath := gfile.Join(basePath, r.URL.Path[len("/static"):])
			// 		if gfile.Exists(filePath) && !gfile.IsDir(filePath) {
			// 			r.Response.ServeFile(filePath)
			// 		} else {
			// 			r.Response.WriteStatus(404)
			// 			r.Response.WriteString("File not found")
			// 		}
			// 	})
			// })

			s.Group("/", func(group *ghttp.RouterGroup) {
				router.R.BindController(ctx, group)
			})

			s.SetClientMaxBodySize(500 * 1024 * 1024)
			//重新配置swaggerUI静态页面--start--,若要使用原版gf字段swaggerUI请删除或注释此段
			swaggerPath := g.Cfg().MustGet(ctx, "server.swaggerPath").String()
			if swaggerPath != "" {
				s.BindHookHandler(swaggerPath+"/*", ghttp.HookBeforeServe, func(r *ghttp.Request) {
					content := gstr.ReplaceByMap(consts.SwaggerUITemplate, map[string]string{
						`{SwaggerUIDocUrl}`:             g.Cfg().MustGet(ctx, "server.openapiPath").String(),
						`{SwaggerUIDocNamePlaceHolder}`: gstr.TrimRight(fmt.Sprintf(`//%s`, r.Host)),
					})
					r.Response.Write(content)
					r.ExitAll()
				})
			}
			//重新配置swaggerUI静态页面--end--
			enhanceOpenAPIDoc(s)
			s.Run()
			return nil
		},
	}
)

func enhanceOpenAPIDoc(s *ghttp.Server) {
	openapi := s.GetOpenApi()
	openapi.Config.CommonResponse = ghttp.DefaultHandlerResponse{}
	openapi.Config.CommonResponseDataField = `Data`

	// API description.
	openapi.Info = goai.Info{
		Title:       consts.OpenAPITitle,
		Description: consts.OpenAPIDescription,
		Contact: &goai.Contact{
			Name: consts.OpenAPIContactName,
			URL:  consts.OpenAPIContactUrl,
		},
	}
}
