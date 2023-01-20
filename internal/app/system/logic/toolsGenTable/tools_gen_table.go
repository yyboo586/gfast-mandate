/*
* @desc:代码生成表数据处理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/10/26 17:00
 */

package toolsGenTable

import (
	"bufio"
	"context"
	"database/sql"
	"fmt"
	"github.com/gogf/gf/v2/container/gmap"
	"github.com/gogf/gf/v2/container/gset"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gfile"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/gogf/gf/v2/os/gview"
	"github.com/gogf/gf/v2/text/gregex"
	"github.com/gogf/gf/v2/text/gstr"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/dao"
	"github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
	"github.com/tiger1103/gfast/v3/library/liberr"
	"io"
	"os"
	"reflect"
	"sort"
	"strings"
)

func init() {
	service.RegisterToolsGenTable(New())
}

func New() *sToolsGenTable {
	return new(sToolsGenTable)
}

type sToolsGenTable struct{}

// List 代码生成页面数据列表
func (s *sToolsGenTable) List(ctx context.Context, req *system.ToolsGenTableSearchReq) (res *system.ToolsGenTableSearchRes, err error) {
	res = new(system.ToolsGenTableSearchRes)
	m := dao.ToolsGenTable.Ctx(ctx)
	if req != nil {
		if req.TableName != "" {
			m = m.Where(dao.ToolsGenTable.Columns().TableName+" like ?", "%"+req.TableName+"%")
		}
		if req.TableComment != "" {
			m = m.Where(dao.ToolsGenTable.Columns().TableComment+"like ?", "%"+req.TableComment+"%")
		}
		if len(req.DateRange) > 0 {
			m = m.Where(dao.ToolsGenTable.Columns().CreateTime+" >=? AND "+dao.ToolsGenTable.Columns().CreateTime+" <=?", req.DateRange[0], req.DateRange[1])
		}
		err = g.Try(ctx, func(ctx context.Context) {
			res.Total, err = m.Count()
			liberr.ErrIsNil(ctx, err, "获取总行数失败")
			if req.PageNum == 0 {
				req.PageNum = 1
			}
			if req.PageSize == 0 {
				req.PageSize = consts.PageSize
			}
			err = m.Page(req.PageNum, req.PageSize).Order(dao.ToolsGenTable.Columns().TableId + " asc").Scan(&res.List)
			liberr.ErrIsNil(ctx, err, "获取数据失败")
		})
	}
	return
}

// SelectDbTableList 查询据库表
func (s *sToolsGenTable) SelectDbTableList(ctx context.Context, req *system.ToolsGenTableImportSearchReq) (res *system.ToolsGenTableSearchRes, err error) {
	res = new(system.ToolsGenTableSearchRes)
	db := g.DB()
	err = g.Try(ctx, func(ctx context.Context) {
		if s.getDbDriver() != "mysql" {
			liberr.ErrIsNil(ctx, gerror.New("代码生成暂时只支持mysql数据库"))
		}
		sql := " from information_schema.tables where table_schema = (select database())" +
			" and table_name NOT LIKE 'qrtz_%' AND table_name NOT LIKE 'gen_%' and table_name NOT IN (select table_name from " + dao.ToolsGenTable.Table() + ") "
		if req != nil {
			if req.TableName != "" {
				sql += gdb.FormatSqlWithArgs(" and lower(table_name) like lower(?)", []interface{}{"%" + req.TableName + "%"})
			}

			if req.TableComment != "" {
				sql += gdb.FormatSqlWithArgs(" and lower(table_comment) like lower(?)", []interface{}{"%" + req.TableComment + "%"})
			}
			if len(req.DateRange) > 0 {
				sql += gdb.FormatSqlWithArgs(" and date_format(create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", []interface{}{req.DateRange[0]})
				sql += gdb.FormatSqlWithArgs(" and date_format(create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", []interface{}{req.DateRange[1]})
			}
		}
		countSql := "select count(1) " + sql
		res.Total, err = db.GetCount(ctx, countSql)
		liberr.ErrIsNil(ctx, err, "读取总表数失败")
		sql = "table_name, table_comment, create_time, update_time " + sql
		if req.PageNum == 0 {
			req.PageNum = 1
		}
		if req.PageSize == 0 {
			req.PageSize = consts.PageSize
		}
		page := (req.PageNum - 1) * req.PageSize
		sql += " order by create_time desc,table_name asc limit  " + gconv.String(page) + "," + gconv.String(req.PageSize)
		err = db.GetScan(ctx, &res.List, "select "+sql)
		liberr.ErrIsNil(ctx, err, "读取数据失败")
	})
	return
}

// SelectDbTableListByNames 查询数据库中对应的表数据
func (s *sToolsGenTable) SelectDbTableListByNames(ctx context.Context, tableNames []string) ([]*entity.ToolsGenTable, error) {
	err := g.Try(ctx, func(ctx context.Context) {
		if s.getDbDriver() != "mysql" {
			liberr.ErrIsNil(ctx, gerror.New("代码生成只支持mysql数据库"))
		}
	})
	db := g.DB()
	sql := "select * from information_schema.tables where table_name NOT LIKE 'qrtz_%' and table_name NOT LIKE 'gen_%' " +
		" and table_schema = (select database()) "
	if len(tableNames) > 0 {
		in := gstr.TrimRight(gstr.Repeat("?,", len(tableNames)), ",")
		sql += " and " + gdb.FormatSqlWithArgs("table_name in ("+in+")", gconv.SliceAny(tableNames))
	}
	var result []*entity.ToolsGenTable
	err = db.GetScan(ctx, &result, sql)
	liberr.ErrIsNil(ctx, err, "获取表格信息失败")
	return result, err
}

// ImportGenTable 导入表结构
func (s *sToolsGenTable) ImportGenTable(ctx context.Context, tableList []*entity.ToolsGenTable) error {
	if tableList != nil {
		err := g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
			for _, table := range tableList {
				tableName := table.TableName
				// 保存列信息
				genTableColumns, err := service.ToolsGenTableColumn().SelectDbTableColumnsByName(ctx, tableName)
				if err != nil || len(genTableColumns) <= 0 {
					_ = tx.Rollback()
					return gerror.New("获取列数据失败")
				}
				err = s.InitTable(ctx, table, genTableColumns)
				if err != nil {
					_ = tx.Rollback()
					return err
				}
				result, err1 := tx.Model(dao.ToolsGenTable.Table()).Insert(table)
				if err1 != nil {
					_ = tx.Rollback()
					return err1
				}
				tmpId, err2 := result.LastInsertId()

				if err2 != nil || tmpId <= 0 {
					_ = tx.Rollback()
					return gerror.New("保存数据失败")
				}

				table.TableId = tmpId
				for _, column := range genTableColumns {
					service.ToolsGenTableColumn().InitColumnField(column, table)
					_, err3 := tx.Model(dao.ToolsGenTableColumn.Table()).Insert(column)
					if err3 != nil {
						_ = tx.Rollback()
						return gerror.New("保存列数据失败")
					}
				}
			}
			return nil
		})
		return err
	} else {
		return gerror.New("参数错误")
	}
}

// InitTable 初始化表信息
func (s *sToolsGenTable) InitTable(ctx context.Context, table *entity.ToolsGenTable, columns []*entity.ToolsGenTableColumn) error {
	table.ClassName = s.ConvertClassName(ctx, table.TableName)
	table.PackageName = g.Cfg().MustGet(ctx, "gen.packageName").String()
	table.ModuleName = g.Cfg().MustGet(ctx, "gen.moduleName").String()
	table.BusinessName = s.GetBusinessName(ctx, table.TableName)
	table.FunctionName = strings.ReplaceAll(table.TableComment, "表", "")
	table.FunctionAuthor = g.Cfg().MustGet(ctx, "gen.author").String()
	table.TplCategory = "crud"
	pkColumn, err := s.getPkColumn(columns)
	if err != nil {
		return err
	}
	table.Overwrite = false
	table.SortColumn = pkColumn.ColumnName
	table.SortType = "asc"
	table.ShowDetail = false
	table.CreateTime = gtime.Now()
	table.UpdateTime = table.CreateTime
	return nil
}

// ConvertClassName 表名转换成类名
func (s *sToolsGenTable) ConvertClassName(ctx context.Context, tableName string) string {
	return gstr.CaseCamel(s.removeTablePrefix(ctx, tableName))
}

// GetBusinessName 获取业务名
func (s *sToolsGenTable) GetBusinessName(ctx context.Context, tableName string) string {
	return s.removeTablePrefix(ctx, tableName)
}

// 找到主键 column
func (s *sToolsGenTable) getPkColumn(columns []*entity.ToolsGenTableColumn) (*entity.ToolsGenTableColumn, error) {
	for _, column := range columns {
		if column.IsPk {
			return column, nil
		}
	}
	return nil, gerror.New("无法找到主键")
}

// 删除表前缀
func (s *sToolsGenTable) removeTablePrefix(ctx context.Context, tableName string) string {
	autoRemovePre := g.Cfg().MustGet(ctx, "gen.autoRemovePre").Bool()
	tablePrefix := g.Cfg().MustGet(ctx, "gen.tablePrefix").String()
	if autoRemovePre && tablePrefix != "" {
		searchList := strings.Split(tablePrefix, ",")
		for _, str := range searchList {
			if strings.HasPrefix(tableName, str) {
				tableName = strings.Replace(tableName, str, "", 1) //注意，只替换一次
			}
		}
	}
	return tableName
}

// 获取数据库驱动类型
func (s *sToolsGenTable) getDbDriver() string {
	config := g.DB().GetConfig()
	return gstr.ToLower(config.Type)
}

// DeleteTable 删除表信息
func (s *sToolsGenTable) DeleteTable(ctx context.Context, req *system.ToolsGenTableDeleteReq) error {
	err := g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err := g.Try(ctx, func(ctx context.Context) {
			_, err := tx.Model(dao.ToolsGenTable.Table()).Where(dao.ToolsGenTable.Columns().TableId+" in(?)", req.Ids).Delete()
			liberr.ErrIsNil(ctx, err, "删除表格数据失败")
			_, err = tx.Model(dao.ToolsGenTableColumn.Table()).Where(dao.ToolsGenTableColumn.Columns().TableId+" in(?)", req.Ids).Delete()
			liberr.ErrIsNil(ctx, err, "删除表格字段数据失败")
		})
		return err
	})
	return err
}

// ColumnList 表格字段列表数据
func (s *sToolsGenTable) ColumnList(ctx context.Context, req *system.ToolsGenTableEditReq) (res *system.ToolsGenTableEditRes, err error) {
	res = new(system.ToolsGenTableEditRes)
	err = g.Try(ctx, func(ctx context.Context) {
		var (
			tableInfo *entity.ToolsGenTable
		)
		res.List, err = service.ToolsGenTableColumn().SelectGenTableColumnListByTableId(ctx, req.TableId)
		liberr.ErrIsNil(ctx, err)
		tableInfo, err = s.GetTableInfoByTableId(ctx, req.TableId)
		liberr.ErrIsNil(ctx, err)
		if tableInfo == nil {
			liberr.ErrIsNil(ctx, gerror.New("表数据不存在"))
		}
		res.Info = &model.ToolsGenTableEditData{
			ToolsGenTable: tableInfo,
		}
		//如果是树表则设置树表配置
		if tableInfo != nil && tableInfo.TplCategory == "tree" {
			options := gjson.New(tableInfo.Options)
			res.Info.TreeCode = options.Get("treeCode")
			res.Info.TreeParentCode = options.Get("treeParentCode")
			res.Info.TreeName = options.Get("treeName")
		}
	})
	return
}

// GetTableInfoByTableId 获取表格数据
func (s *sToolsGenTable) GetTableInfoByTableId(ctx context.Context, tableId int64) (data *entity.ToolsGenTable, err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		err = dao.ToolsGenTable.Ctx(ctx).WherePri(tableId).Scan(&data)
		liberr.ErrIsNil(ctx, err, "获取表格信息出错")
	})
	return
}

// GetRelationTable 获取关联表数据
func (s *sToolsGenTable) GetRelationTable(ctx context.Context) (res []*model.ToolsGenTableColumnsData, err error) {
	var tableColumnsAll []*entity.ToolsGenTableColumn
	err = g.Try(ctx, func(ctx context.Context) {
		//获取表数据
		err = dao.ToolsGenTable.Ctx(ctx).Order(dao.ToolsGenTable.Columns().TableId + " ASC ").Scan(&res)
		liberr.ErrIsNil(ctx, err, "获取表数据失败")
		//获取表字段数据
		tableColumnsAll, err = service.ToolsGenTableColumn().GetAllTableColumns(ctx)
		liberr.ErrIsNil(ctx, err)
		for k, v := range res {
			for _, cv := range tableColumnsAll {
				if cv.TableId == v.TableId {
					res[k].Columns = append(res[k].Columns, cv)
				}
			}
		}
	})
	return
}

// SaveEdit 更新表及字段生成信息
func (s *sToolsGenTable) SaveEdit(ctx context.Context, req *system.ToolsGenTableColumnsEditReq) (err error) {
	if req == nil {
		err = gerror.New("参数错误")
		return
	}
	var table *entity.ToolsGenTable
	err = dao.ToolsGenTable.Ctx(ctx).Where("table_id=?", req.TableId).Scan(&table)
	if err != nil || table == nil {
		err = gerror.New("数据不存在")
		return
	}
	if req.TableName != "" {
		table.TableName = req.TableName
	}
	if req.TableComment != "" {
		table.TableComment = req.TableComment
	}
	if req.BusinessName != "" {
		table.BusinessName = req.BusinessName
	}
	if req.ClassName != "" {
		table.ClassName = req.ClassName
	}
	if req.FunctionAuthor != "" {
		table.FunctionAuthor = req.FunctionAuthor
	}
	if req.FunctionName != "" {
		table.FunctionName = req.FunctionName
	}
	if req.ModuleName != "" {
		table.ModuleName = req.ModuleName
	}
	if req.PackageName != "" {
		table.PackageName = req.PackageName
	}
	if req.Remark != "" {
		table.Remark = req.Remark
	}
	if req.Overwrite != "" {
		table.Overwrite = gconv.Bool(req.Overwrite)
	}
	if req.SortColumn != "" {
		table.SortColumn = req.SortColumn
	}
	if req.SortType != "" {
		table.SortType = req.SortType
	}
	if req.ShowDetail != "" {
		table.ShowDetail = gconv.Bool(req.ShowDetail)
	}
	if req.TplCategory != "" {
		table.TplCategory = req.TplCategory
	}
	if req.Params != "" {
		table.Options = req.Params
	}
	table.UpdateTime = gtime.Now()
	var options g.Map
	if req.TplCategory == "tree" {
		//树表设置options
		options = g.Map{
			"treeCode":       req.TreeCode,
			"treeParentCode": req.TreeParentCode,
			"treeName":       req.TreeName,
		}
		table.Options = gconv.String(options)
	} else {
		table.Options = ""
	}

	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) (err error) {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = tx.Model(dao.ToolsGenTable.Table()).Save(table)
			liberr.ErrIsNil(ctx, err, "保存表数据失败")
			//保存列数据
			if req.Columns != nil {
				for _, column := range req.Columns {
					if column.ColumnId > 0 {
						var dbColumn *entity.ToolsGenTableColumn
						err = dao.ToolsGenTableColumn.Ctx(ctx).Where("column_id=?", column.ColumnId).Scan(&dbColumn)
						liberr.ErrIsNil(ctx, err, "列数据信息不存在")
						if dbColumn != nil {
							dbColumn.ColumnComment = column.ColumnComment
							dbColumn.GoType = column.GoType
							dbColumn.HtmlType = column.HtmlType
							dbColumn.HtmlField = column.HtmlField
							dbColumn.QueryType = column.QueryType
							dbColumn.GoField = column.GoField
							dbColumn.DictType = column.DictType
							dbColumn.IsInsert = column.IsInsert
							dbColumn.IsEdit = column.IsEdit
							dbColumn.IsList = column.IsList
							dbColumn.IsDetail = column.IsDetail
							dbColumn.IsQuery = column.IsQuery
							dbColumn.SortOrderEdit = column.SortOrderEdit
							dbColumn.SortOrderList = column.SortOrderList
							dbColumn.SortOrderDetail = column.SortOrderDetail
							dbColumn.SortOrderQuery = column.SortOrderQuery
							dbColumn.IsRequired = column.IsRequired
							dbColumn.ColSpan = column.ColSpan
							dbColumn.RowSpan = column.RowSpan
							dbColumn.IsRowStart = column.IsRowStart
							dbColumn.MinWidth = column.MinWidth
							dbColumn.IsFixed = column.IsFixed
							dbColumn.IsOverflowTooltip = column.IsOverflowTooltip
							dbColumn.IsCascade = column.IsCascade
							dbColumn.ParentColumnName = column.ParentColumnName
							dbColumn.CascadeColumnName = column.CascadeColumnName
							if tc, e := options["treeParentCode"]; options != nil && e && tc != "" && tc == dbColumn.HtmlField {
								dbColumn.IsQuery = false
								dbColumn.IsList = false
								dbColumn.HtmlType = "select"
							}
							//获取字段关联表信息
							if column.LinkLabelName != "" {
								dbColumn.LinkTableName = column.LinkTableName
								dbColumn.LinkLabelId = column.LinkLabelId
								dbColumn.LinkLabelName = column.LinkLabelName
								var linkTable *entity.ToolsGenTable
								err = dao.ToolsGenTable.Ctx(ctx).Where("table_name =?", column.LinkTableName).Scan(&linkTable)
								liberr.ErrIsNil(ctx, err, "获取关联表数据失败")
								dbColumn.LinkTableClass = linkTable.ClassName
								dbColumn.LinkTableModuleName = linkTable.ModuleName
								dbColumn.LinkTableBusinessName = linkTable.BusinessName
								dbColumn.LinkTablePackage = linkTable.PackageName
							} else {
								dbColumn.LinkTableName = ""
								dbColumn.LinkTableClass = ""
								dbColumn.LinkTableModuleName = ""
								dbColumn.LinkTableBusinessName = ""
								dbColumn.LinkTablePackage = ""
								dbColumn.LinkLabelId = ""
								dbColumn.LinkLabelName = ""
							}
							_, err = tx.Model(dao.ToolsGenTableColumn.Table()).Save(dbColumn)
							liberr.ErrIsNil(ctx, err, "保存列:"+dbColumn.ColumnName+"，数据失败")
						}
					}
				}
			}
		})
		return
	})
	return
}

// GenData 获取生成数据
func (s *sToolsGenTable) GenData(ctx context.Context, tableId int64) (data g.MapStrStr, extendData *model.ToolsGenTableEx, err error) {
	extendData, err = s.SelectRecordById(ctx, tableId)
	if err != nil {
		return
	}
	if extendData == nil {
		err = gerror.New("表格数据不存在")
		return
	}
	service.ToolsGenTableColumn().SetPkColumn(extendData, extendData.Columns)
	view := gview.New()
	view.SetConfigWithMap(g.Map{
		"Paths":      g.Cfg().MustGet(ctx, "gen.templatePath").String(),
		"Delimiters": []string{"{{", "}}"},
	})
	view.BindFuncMap(g.Map{
		"UcFirst": func(str string) string {
			return gstr.UcFirst(str)
		},
		"Sum": func(a, b int) int {
			return a + b
		},
		"CaseCamelLower": gstr.CaseCamelLower, //首字母小写驼峰
		"CaseCamel":      gstr.CaseCamel,      //首字母大写驼峰
		"HasSuffix":      gstr.HasSuffix,      //是否存在后缀
		"ContainsI":      gstr.ContainsI,      //是否包含子字符串
		"VueTag": func(t string) string {
			return t
		},
		"inArray": func(arr []interface{}, val interface{}) bool {
			for _, v := range arr {
				if reflect.DeepEqual(v, val) {
					return true
				}
			}
			return false
		},
		"append": func(arr []interface{}, val ...interface{}) []interface{} {
			arr = append(arr, val...)
			return arr
		},
		"newArray": func() []interface{} {
			return []interface{}{}
		},
	})

	//树形菜单选项
	tplData := g.Map{
		"table":      extendData,
		"goModName":  g.Cfg().MustGet(ctx, "gen.goModName").String(),
		"apiVersion": g.Cfg().MustGet(ctx, "gen.apiName").String(),
	}
	apiKey := "api"
	apiValue := ""
	var tmpApi string
	if tmpApi, err = view.Parse(ctx, "go/api.template", tplData); err == nil {
		apiValue = tmpApi
		apiValue, err = s.trimBreak(apiValue)
	} else {
		return
	}
	daoKey := "dao"
	daoValue := ""
	var tmpDao string
	if tmpDao, err = view.Parse(ctx, "go/dao.template", tplData); err == nil {
		daoValue = tmpDao
		daoValue, err = s.trimBreak(daoValue)
	} else {
		return
	}
	daoInternalKey := "dao_internal"
	daoInternalValue := ""
	var tmpInternalDao string
	if tmpInternalDao, err = view.Parse(ctx, "go/dao_internal.template", tplData); err == nil {
		daoInternalValue = tmpInternalDao
		daoInternalValue, err = s.trimBreak(daoInternalValue)
	} else {
		return
	}
	modelKey := "model"
	modelValue := ""
	var tmpModel string
	if tmpModel, err = view.Parse(ctx, "go/model.template", tplData); err == nil {
		modelValue = tmpModel
		modelValue, err = s.trimBreak(modelValue)
	} else {
		return
	}
	modelEntityKey := "model_entity"
	modelEntityValue := ""
	var tmpModelEntity string
	if tmpModelEntity, err = view.Parse(ctx, "go/model_entity.template", tplData); err == nil {
		modelEntityValue = tmpModelEntity
		modelEntityValue, err = s.trimBreak(modelEntityValue)
	} else {
		return
	}
	modelDoKey := "model_do"
	modelDoValue := ""
	var tmpModelDo string
	if tmpModelDo, err = view.Parse(ctx, "go/model_do.template", tplData); err == nil {
		modelDoValue = tmpModelDo
		modelDoValue, err = s.trimBreak(modelDoValue)
	} else {
		return
	}
	controllerKey := "controller"
	controllerValue := ""
	var tmpController string
	if tmpController, err = view.Parse(ctx, "go/controller.template", tplData); err == nil {
		controllerValue = tmpController
		controllerValue, err = s.trimBreak(controllerValue)
	} else {
		return
	}

	serviceKey := "service"
	serviceValue := ""
	var tmpService string
	if tmpService, err = view.Parse(ctx, "go/service.template", tplData); err == nil {
		serviceValue = tmpService
		serviceValue, err = s.trimBreak(serviceValue)
	} else {
		return
	}

	logicKey := "logic"
	logicValue := ""
	var tmpLogic string
	if tmpLogic, err = view.Parse(ctx, "go/logic.template", tplData); err == nil {
		logicValue = tmpLogic
		logicValue, err = s.trimBreak(logicValue)
	} else {
		return
	}

	routerKey := "router"
	routerValue := ""
	var tmpRouter string
	if tmpRouter, err = view.Parse(ctx, "go/router.template", tplData); err == nil {
		routerValue = tmpRouter
		routerValue, err = s.trimBreak(routerValue)
	} else {
		return
	}

	routerFuncKey := "router_func"
	routerFuncValue := ""
	var tmpRouterFunc string
	if tmpRouterFunc, err = view.Parse(ctx, "go/router_func.template", tplData); err == nil {
		routerFuncValue = tmpRouterFunc
		routerFuncValue, err = s.trimBreak(routerFuncValue)
	} else {
		return
	}

	sqlKey := "sql"
	sqlValue := ""
	var tmpSql string
	if tmpSql, err = view.Parse(ctx, "sql/sql.template", tplData); err == nil {
		sqlValue = tmpSql
		sqlValue, err = s.trimBreak(sqlValue)
	} else {
		return
	}

	tsApiKey := "tsApi"
	tsApiValue := ""
	var tmpTsApi string
	if tmpTsApi, err = view.Parse(ctx, "ts/api.template", tplData); err == nil {
		tsApiValue = tmpTsApi
		tsApiValue, err = s.trimBreak(tsApiValue)
	} else {
		return
	}

	tsModelKey := "tsModel"
	tsModelValue := ""
	var tmpTsModel string
	if tmpTsModel, err = view.Parse(ctx, "ts/model.template", tplData); err == nil {
		tsModelValue = tmpTsModel
		tsModelValue, err = s.trimBreak(tsModelValue)
	} else {
		return
	}

	vueKey := "vue"
	vueValue := ""
	var tmpVue string
	tmpFile := "vue/list-vue.template"
	if extendData.TplCategory == "tree" {
		//树表
		tmpFile = "vue/tree-vue.template"
	}
	if tmpVue, err = view.Parse(ctx, tmpFile, tplData); err == nil {
		vueValue = tmpVue
		vueValue, err = s.trimBreak(vueValue)
	} else {
		return
	}

	vueEditKey := "vueEdit"
	vueEditValue := ""
	var tmpVueEditModel string
	if tmpVueEditModel, err = view.Parse(ctx, "vue/edit-vue.template", tplData); err == nil {
		vueEditValue = tmpVueEditModel
		vueEditValue, err = s.trimBreak(vueEditValue)
	} else {
		return
	}

	vueDetailKey := "vueDetail"
	vueDetailValue := ""
	var tmpVueDetailModel string
	if tmpVueDetailModel, err = view.Parse(ctx, "vue/detail-vue.template", tplData); err == nil {
		vueDetailValue = tmpVueDetailModel
		vueDetailValue, err = s.trimBreak(vueDetailValue)
	} else {
		return
	}

	data = g.MapStrStr{
		apiKey:         apiValue,
		daoKey:         daoValue,
		daoInternalKey: daoInternalValue,
		modelKey:       modelValue,
		modelEntityKey: modelEntityValue,
		modelDoKey:     modelDoValue,
		controllerKey:  controllerValue,
		serviceKey:     serviceValue,
		logicKey:       logicValue,
		routerKey:      routerValue,
		routerFuncKey:  routerFuncValue,
		sqlKey:         sqlValue,
		tsApiKey:       tsApiValue,
		tsModelKey:     tsModelValue,
		vueKey:         vueValue,
		vueEditKey:     vueEditValue,
		vueDetailKey:   vueDetailValue,
	}
	return
}

func (s *sToolsGenTable) SelectRecordById(ctx context.Context, tableId int64) (tableEx *model.ToolsGenTableEx, err error) {
	var table *entity.ToolsGenTable
	table, err = s.GetTableInfoByTableId(ctx, tableId)
	if err != nil {
		return
	}
	m := gconv.Map(table)
	gconv.Struct(m, &tableEx)
	if tableEx.TplCategory == "tree" {
		opt := gjson.New(tableEx.Options)
		tableEx.TreeParentCode = opt.Get("treeParentCode").String()
		tableEx.TreeCode = opt.Get("treeCode").String()
		tableEx.TreeName = opt.Get("treeName").String()
	}
	//表字段数据
	var columns []*entity.ToolsGenTableColumn
	columns, err = service.ToolsGenTableColumn().SelectGenTableColumnListByTableId(ctx, tableId)
	if err != nil {
		return
	}
	for _, column := range columns {
		if column.GoType == "Time" {
			tableEx.HasTimeColumn = true
			continue
		}
	}

	allColumnExs := make([]*model.ToolsGenTableColumnEx, len(columns))

	var (
		editColumns   []*model.ToolsGenTableColumnEx
		listColumns   []*model.ToolsGenTableColumnEx
		detailColumns []*model.ToolsGenTableColumnEx
		queryColumns  []*model.ToolsGenTableColumnEx
	)

	columnMap := make(map[string]*model.ToolsGenTableColumnEx, len(columns))
	for i, column := range columns {
		columnName := column.ColumnName
		columnEx := &model.ToolsGenTableColumnEx{}
		m1 := gconv.Map(column)
		err = gconv.Struct(m1, columnEx)
		columnMap[columnName] = columnEx
		allColumnExs[i] = columnEx
		tableEx.IsPkInsertable = tableEx.IsPkInsertable || column.IsPk && !column.IsIncrement
		tableEx.IsPkListable = tableEx.IsPkListable || column.IsPk && column.IsList
		if column.IsEdit && !service.ToolsGenTableColumn().IsNotEdit(columnName) && !column.IsPk {
			editColumns = append(editColumns, columnEx)
			columnEx.IsEdit = true
		} else {
			columnEx.IsEdit = false
		}
		if column.IsList && !service.ToolsGenTableColumn().IsNotList(columnName) {
			listColumns = append(listColumns, columnEx)
			columnEx.IsList = true
		} else {
			columnEx.IsList = false
		}
		if column.IsDetail && !service.ToolsGenTableColumn().IsNotDetail(columnName) {
			detailColumns = append(detailColumns, columnEx)
			columnEx.IsDetail = true
		} else {
			columnEx.IsDetail = false
		}
		if column.IsQuery && !service.ToolsGenTableColumn().IsNotQuery(columnName) {
			queryColumns = append(queryColumns, columnEx)
			columnEx.IsQuery = true
		} else {
			columnEx.IsQuery = false
		}
		// validation 规则 和 conversion 方法
		integerValidationRule := "integer"
		floatValidationRule := "float"
		dateValidationRule := "date"
		datetimeValidationRule := "datetime"
		if column.QueryType == "BETWEEN" {
			integerValidationRule += "-array"
			floatValidationRule += "-array"
			dateValidationRule += "-array"
			datetimeValidationRule += "-array"
		}
		if column.IsPk {
			//主键不处理
			continue
		}
		switch column.GoType {
		case "byte":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + integerValidationRule + "|max-length:1#" + column.ColumnComment + "需为整数"
			columnEx.FieldConversion = "gconv.Uint64"
			tableEx.HasConversion = true
			break
		case "int":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + integerValidationRule + "#" + column.ColumnComment + "需为整数"
			columnEx.FieldConversion = "gconv.Int"
			tableEx.HasConversion = true
			break
		case "int64":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + integerValidationRule + "#" + column.ColumnComment + "需为整数"
			columnEx.FieldConversion = "gconv.Int64"
			tableEx.HasConversion = true
			break
		case "uint":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + integerValidationRule + "#" + column.ColumnComment + "需为整数"
			columnEx.FieldConversion = "gconv.Uint"
			tableEx.HasConversion = true
			break
		case "uint64":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + integerValidationRule + "#" + column.ColumnComment + "需为整数"
			columnEx.FieldConversion = "gconv.Uint64"
			tableEx.HasConversion = true
			break
		case "float":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + floatValidationRule + "#" + column.ColumnComment + "需为浮点数"
			columnEx.FieldConversion = "gconv.Float"
			tableEx.HasConversion = true
			break
		case "float64":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + floatValidationRule + "#" + column.ColumnComment + "需为浮点数"
			columnEx.FieldConversion = "gconv.Float64"
			tableEx.HasConversion = true
			break
		case "bool":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@boolean#" + column.ColumnComment + "需为true/false"
			columnEx.FieldConversion = "gconv.Bool"
			tableEx.HasConversion = true
			break
		case "date":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + dateValidationRule + "#" + column.ColumnComment + "需为YYYY-MM-DD格式"
			columnEx.FieldConversion = "gconv.Time"
			tableEx.HasConversion = true
			break
		case "Time":
			columnEx.FieldValidation = gstr.CaseCamelLower(columnName) + "@" + datetimeValidationRule + "#" + column.ColumnComment + "需为YYYY-MM-DD hh:mm:ss格式"
			columnEx.FieldConversion = "gconv.Time"
			tableEx.HasConversion = true
			break
		}
	}

	sort.Slice(editColumns, func(i, j int) bool {
		return editColumns[i].SortOrderEdit < editColumns[j].SortOrderEdit
	})
	sort.Slice(listColumns, func(i, j int) bool {
		return listColumns[i].SortOrderList < listColumns[j].SortOrderList
	})
	sort.Slice(detailColumns, func(i, j int) bool {
		return detailColumns[i].SortOrderDetail < detailColumns[j].SortOrderDetail
	})
	sort.Slice(queryColumns, func(i, j int) bool {
		return queryColumns[i].SortOrderQuery < queryColumns[j].SortOrderQuery
	})

	tableEx.Columns = allColumnExs
	tableEx.EditColumns = editColumns
	tableEx.DetailColumns = detailColumns
	tableEx.ListColumns = listColumns
	tableEx.QueryColumns = queryColumns

	_, hasCreatedBy := columnMap["created_by"]
	tableEx.HasCreatedBy = hasCreatedBy
	_, hasUpdateBy := columnMap["updated_by"]
	tableEx.HasUpdatedBy = hasUpdateBy

	for _, column := range allColumnExs {
		if column.IsCascade {
			parentColumnName := column.ParentColumnName
			if g.IsEmpty(parentColumnName) {
				err = gerror.New("级联查询字段\"" + column.ColumnName + "\"并未设置parentColumnName")
				return nil, err
			}
			parent := columnMap[parentColumnName]
			if g.IsEmpty(parent) {
				err = gerror.New("级联查询字段\"" + column.ColumnName + "\"的parentColumnName\"" + parentColumnName + "\"不存在于表中")
				return nil, err
			}
			column.ParentColumnName = parentColumnName
			column.CascadeParent = parent
			parent.IsCascadeParent = true
			parent.CascadeChildrenColumns = gset.NewStrSet()
		}
	}
	for _, column := range allColumnExs {
		if column.IsCascade {
			child := column
			for {
				parentColumnName := child.ParentColumnName
				if g.IsEmpty(parentColumnName) {
					break
				}
				parent := columnMap[parentColumnName]
				parent.CascadeChildrenColumns.Add(column.ColumnName)
				child = parent
			}
		}
	}

	// 提取关联表信息
	var linkedTableMap = gmap.New()
	for _, column := range allColumnExs {
		if len(column.LinkTableName) == 0 {
			continue
		}
		linkedTableName := column.LinkTableName
		// 关联表信息
		linkedTableInfo, err1 := s.getLinkedTableInfo(ctx, linkedTableName)
		if err1 != nil {
			err = err1
			return
		}
		linkedTable := linkedTableMap.GetOrSet(linkedTableName, interface{}(linkedTableInfo)).(*model.ToolsGenTableLinked)

		allColumnMap, err2 := service.ToolsGenTableColumn().SelectDbTableColumnMapByName(ctx, linkedTableName)
		if err2 != nil {
			err = err2
			return
		}
		// 关联字段
		linkedTableIdColumn, foundId := allColumnMap[column.LinkLabelId]
		if !foundId {
			err = gerror.New("无法找到关联表的列" + column.LinkLabelId)
			return
		}
		linkedTableValueColumn, foundValue := allColumnMap[column.LinkLabelName]
		if !foundValue {
			err = gerror.New("无法找到关联表的列" + column.LinkLabelId)
			return
		}
		service.ToolsGenTableColumn().InitColumnField(linkedTableIdColumn, table)
		service.ToolsGenTableColumn().InitColumnField(linkedTableValueColumn, table)
		if linkedTableIdColumn.GoType == "Time" || linkedTableValueColumn.GoType == "Time" {
			tableEx.HasTimeColumn = true
		}
		linkedTable.RefColumns.GetOrSet(linkedTableIdColumn.ColumnName, linkedTableIdColumn)
		linkedTable.RefColumns.GetOrSet(linkedTableValueColumn.ColumnName, &linkedTableValueColumn)
	}

	tableEx.LinkedTables = make([]*model.ToolsGenTableLinked, linkedTableMap.Size())
	for i, v := range linkedTableMap.Values() {
		tableEx.LinkedTables[i] = v.(*model.ToolsGenTableLinked)
	}
	return
}

// GenCode 代码生成操作
func (s *sToolsGenTable) GenCode(ctx context.Context, ids []int) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		//获取当前运行时目录
		curDir, err := os.Getwd()
		liberr.ErrIsNil(ctx, err, "获取本地路径失败")
		frontDir := g.Cfg().MustGet(ctx, "gen.frontDir").String()
		if !gfile.IsDir(frontDir) {
			panic("项目前端路径不存在，请检查是否已在配置文件中配置！")
		}
		apiName := g.Cfg().MustGet(ctx, "gen.apiName").String()
		goModName := g.Cfg().MustGet(ctx, "gen.goModName").String()
		for _, id := range ids {
			var genData g.MapStrStr
			var extendData *model.ToolsGenTableEx
			genData, extendData, err = s.GenData(ctx, gconv.Int64(id))
			liberr.ErrIsNil(ctx, err)
			packageName := extendData.PackageName
			pluginName := ""
			if gstr.ContainsI(extendData.PackageName, "plugins") {
				pluginName = "plugins/"
			}
			businessName := gstr.CaseCamelLower(extendData.BusinessName)
			for key, code := range genData {
				switch key {
				case "api":
					path := strings.Join([]string{curDir, "/", apiName, "/", pluginName, extendData.ModuleName, "/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "controller":
					path := strings.Join([]string{curDir, "/", packageName, "/controller/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "dao":
					path := strings.Join([]string{curDir, "/", packageName, "/dao/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "dao_internal":
					path := strings.Join([]string{curDir, "/", packageName, "/dao/internal/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "logic":
					path := strings.Join([]string{curDir, "/", packageName, "/logic/", businessName, "/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "model":
					path := strings.Join([]string{curDir, "/", packageName, "/model/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "model_do":
					path := strings.Join([]string{curDir, "/", packageName, "/model/do/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "model_entity":
					path := strings.Join([]string{curDir, "/", packageName, "/model/entity/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "router":
					if !gstr.ContainsI(packageName, "system") { // system 模块不生成router文件
						path := strings.Join([]string{curDir, "/", packageName, "/router/router", ".go"}, "")
						err = s.createFile(path, code, extendData.Overwrite)
						liberr.ErrIsNil(ctx, err)
					}
				case "router_func":
					path := strings.Join([]string{curDir, "/", packageName, "/router/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "service":
					path := strings.Join([]string{curDir, "/", packageName, "/service/", extendData.TableName, ".go"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "sql":
					path := strings.Join([]string{curDir, "/resource/data/gen_sql/", extendData.ModuleName, "/", extendData.TableName, ".sql"}, "")
					hasSql := gfile.Exists(path)
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
					if !hasSql || extendData.Overwrite {
						//第一次生成则向数据库写入菜单数据
						err = s.writeDb(ctx, path)
						liberr.ErrIsNil(ctx, err)
						//清除菜单缓存
						commonService.Cache().Remove(ctx, consts.CacheSysAuthMenu)
					}
				case "tsApi":
					path := strings.Join([]string{frontDir, "/src/api/" + pluginName, extendData.ModuleName, "/", businessName, ".ts"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "tsModel":
					path := strings.Join([]string{frontDir, "/src/views/" + pluginName, extendData.ModuleName, "/", businessName + "/list/component/model", ".ts"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "vue":
					path := strings.Join([]string{frontDir, "/src/views/" + pluginName, extendData.ModuleName, "/", businessName, "/list/index.vue"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "vueDetail":
					path := strings.Join([]string{frontDir, "/src/views/" + pluginName, extendData.ModuleName, "/", businessName + "/list/component/detail", ".vue"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				case "vueEdit":
					path := strings.Join([]string{frontDir, "/src/views/" + pluginName, extendData.ModuleName, "/", businessName + "/list/component/edit", ".vue"}, "")
					err = s.createFile(path, code, extendData.Overwrite)
					liberr.ErrIsNil(ctx, err)
				}
			}
			//生成对应模块的logic
			err = s.genModuleLogic(curDir, goModName, extendData.PackageName)
			liberr.ErrIsNil(ctx, err)
		}
	})
	return
}

// 写入菜单数据
func (s *sToolsGenTable) writeDb(ctx context.Context, path string) (err error) {
	isAnnotation := false
	var fi *os.File
	fi, err = os.Open(path)
	if err != nil {
		return
	}
	defer fi.Close()
	br := bufio.NewReader(fi)
	var sqlStr []string
	now := gtime.Now()
	var res sql.Result
	var id int64
	var tx gdb.TX
	tx, err = g.DB().Ctx(ctx).Begin(ctx)
	if err != nil {
		return
	}
	for {
		bytes, e := br.ReadBytes('\n')
		if e == io.EOF {
			break
		}
		str := gstr.Trim(string(bytes))

		if str == "" {
			continue
		}

		if strings.Contains(str, "/*") {
			isAnnotation = true
		}

		if isAnnotation {
			if strings.Contains(str, "*/") {
				isAnnotation = false
			}
			continue
		}

		if str == "" || strings.HasPrefix(str, "--") || strings.HasPrefix(str, "#") {
			continue
		}
		if strings.HasSuffix(str, ";") {
			if gstr.ContainsI(str, "select") {
				if gstr.ContainsI(str, "@now") {
					continue
				}
				if gstr.ContainsI(str, "@parentId") {
					id, err = res.LastInsertId()
				}
			}
			sqlStr = append(sqlStr, str)
			sql := strings.Join(sqlStr, "")
			gstr.ReplaceByArray(sql, []string{"@parentId", gconv.String(id), "@now", now.Format("Y-m-d H:i:s")})
			//插入业务
			res, err = tx.Exec(sql)
			if err != nil {
				tx.Rollback()
				return
			}
			sqlStr = nil
		} else {
			sqlStr = []string{str}
		}
	}
	tx.Commit()
	return
}

// createFile 创建文件
func (s *sToolsGenTable) createFile(fileName, data string, cover bool) (err error) {
	if !gfile.Exists(fileName) || cover {
		var f *os.File
		f, err = gfile.Create(fileName)
		if err == nil {
			f.WriteString(data)
		}
		f.Close()
	}
	return
}

func (s *sToolsGenTable) getLinkedTableInfo(ctx context.Context, tableName string) (linkedTable *model.ToolsGenTableLinked, err error) {
	var table *entity.ToolsGenTable
	err = g.Try(ctx, func(ctx context.Context) {
		err = dao.ToolsGenTable.Ctx(ctx).Where(dao.ToolsGenTable.Columns().TableName, tableName).Scan(&table)
		liberr.ErrIsNil(ctx, err, "获取关联表格"+tableName+"信息出错")
		m := gconv.Map(table)
		err = gconv.Struct(m, &linkedTable)
		liberr.ErrIsNil(ctx, err)
		linkedTable.RefColumns = gmap.NewListMap()
	})
	return
}

// 剔除多余的换行
func (s *sToolsGenTable) trimBreak(str string) (rStr string, err error) {
	var b []byte
	if b, err = gregex.Replace("(([\\s\t]*)\r?\n){2,}", []byte("$2\n"), []byte(str)); err != nil {
		return
	}
	if b, err = gregex.Replace("(([\\s\t]*)/{4}\r?\n)", []byte("$2\n\n"), b); err == nil {
		rStr = gconv.String(b)
	}
	return
}

// GenModuleRouter 生成模块路由
func (s *sToolsGenTable) genModuleLogic(curDir, goModName, packageName string) (err error) {
	var (
		packages []string
		code     string
	)
	//logic路径
	path := strings.Join([]string{curDir, "/", packageName, "/logic"}, "")
	//获取该路径下所有需要加载的包
	packages, err = gfile.ScanDirFunc(path, "*", false, func(p string) string {
		if gfile.IsDir(p) {
			return p
		}
		return ""
	})
	if err != nil {
		return
	}
	for _, v := range packages {
		v = gstr.Replace(v, "\\", "/")
		v = gstr.SubStr(v, gstr.PosR(v, "/"))
		code += strings.Join([]string{"import _ ", `"`, goModName, "/", packageName, "/logic", v, `"`, "\n"}, "")
	}
	code = fmt.Sprintf(`package logic%s%s`, "\n\n", code)
	err = s.createFile(path+"/logic.go", code, true)
	return
}
