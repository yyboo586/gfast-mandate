package main

import (
	_ "github.com/gogf/gf/contrib/drivers/mysql/v2"
	_ "github.com/gogf/gf/contrib/drivers/pgsql/v2"
	_ "github.com/gogf/gf/contrib/nosql/redis/v2"
	"github.com/gogf/gf/v2/os/gctx"
	_ "github.com/tiger1103/gfast/v3/internal/app/boot"
	_ "github.com/tiger1103/gfast/v3/internal/app/system/packed"
	"github.com/tiger1103/gfast/v3/internal/cmd"
	_ "github.com/tiger1103/gfast/v3/library/libValidate"
	_ "github.com/tiger1103/gfast/v3/task"
)

func main() {
	cmd.Main.Run(gctx.New())
}
