// ==========================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// ToolsGenTableDao is the data access object for table tools_gen_table.
type ToolsGenTableDao struct {
	table   string               // table is the underlying table name of the DAO.
	group   string               // group is the database configuration group name of current DAO.
	columns ToolsGenTableColumns // columns contains all the column names of Table for convenient usage.
}

// ToolsGenTableColumns defines and stores column names for table tools_gen_table.
type ToolsGenTableColumns struct {
	TableId        string // 编号
	TableName      string // 表名称
	TableComment   string // 表描述
	ClassName      string // 实体类名称
	TplCategory    string // 使用的模板（crud单表操作 tree树表操作）
	PackageName    string // 生成包路径
	ModuleName     string // 生成模块名
	BusinessName   string // 生成业务名
	FunctionName   string // 生成功能名
	FunctionAuthor string // 生成功能作者
	Options        string // 其它生成选项
	CreateTime     string // 创建时间
	UpdateTime     string // 更新时间
	Remark         string // 备注
	Overwrite      string // 是否覆盖原有文件
	SortColumn     string // 排序字段名
	SortType       string // 排序方式 (asc顺序 desc倒序)
	ShowDetail     string // 是否有查看详情功能
	ExcelPort      string // 是否有导出excel功能
	ExcelImp       string // 是否有导入excel功能
	UseSnowId      string //主键是否使用雪花ID
	UseVirtual     string // 树表是否使用虚拟表
	OverwriteInfo  string // 覆盖文件信息
	MenuPid        string // 父级菜单ID
}

// toolsGenTableColumns holds the columns for table tools_gen_table.
var toolsGenTableColumns = ToolsGenTableColumns{
	TableId:        "table_id",
	TableName:      "table_name",
	TableComment:   "table_comment",
	ClassName:      "class_name",
	TplCategory:    "tpl_category",
	PackageName:    "package_name",
	ModuleName:     "module_name",
	BusinessName:   "business_name",
	FunctionName:   "function_name",
	FunctionAuthor: "function_author",
	Options:        "options",
	CreateTime:     "create_time",
	UpdateTime:     "update_time",
	Remark:         "remark",
	Overwrite:      "overwrite",
	SortColumn:     "sort_column",
	SortType:       "sort_type",
	ShowDetail:     "show_detail",
	ExcelPort:      "excel_port",
	ExcelImp:       "excel_imp",
	UseSnowId:      "use_snow_id",
	UseVirtual:     "use_virtual",
	OverwriteInfo:  "overwrite_info",
	MenuPid:        "menu_pid",
}

// NewToolsGenTableDao creates and returns a new DAO object for table data access.
func NewToolsGenTableDao() *ToolsGenTableDao {
	return &ToolsGenTableDao{
		group:   "default",
		table:   "tools_gen_table",
		columns: toolsGenTableColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *ToolsGenTableDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *ToolsGenTableDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *ToolsGenTableDao) Columns() ToolsGenTableColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *ToolsGenTableDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *ToolsGenTableDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *ToolsGenTableDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
