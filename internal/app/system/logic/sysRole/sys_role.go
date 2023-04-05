/*
* @desc:角色管理
* @company:云南奇讯科技有限公司
* @Author: yixiaohu<yxh669@qq.com>
* @Date:   2022/9/26 15:54
 */

package sysRole

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/util/gconv"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	commonService "github.com/tiger1103/gfast/v3/internal/app/common/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/internal/app/system/dao"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/system/model/entity"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

func init() {
	service.RegisterSysRole(New())
}

func New() *sSysRole {
	return &sSysRole{}
}

type sSysRole struct {
}

func (s *sSysRole) GetRoleListSearch(ctx context.Context, req *system.RoleListReq) (res *system.RoleListRes, err error) {
	res = new(system.RoleListRes)
	err = g.Try(ctx, func(ctx context.Context) {
		model := dao.SysRole.Ctx(ctx)
		if req.RoleName != "" {
			model = model.Where("a.name like ?", "%"+req.RoleName+"%")
		}
		if req.Status != "" {
			model = model.Where("a.status", gconv.Int(req.Status))
		}
		model = model.As("a")
		res.Total, err = model.Count()
		liberr.ErrIsNil(ctx, err, "获取角色数据失败")
		if req.PageNum == 0 {
			req.PageNum = 1
		}
		res.CurrentPage = req.PageNum
		if req.PageSize == 0 {
			req.PageSize = consts.PageSize
		}
		model = model.LeftJoin("casbin_rule", "b", "b.v1 = a.id  AND SUBSTR( b.v0, 1, 2 ) = 'u_' ")
		model = model.Group("a.id")
		err = model.Page(res.CurrentPage, req.PageSize).Order("id asc").Fields("a.*, count(b.v0) user_cnt").Scan(&res.List)
		liberr.ErrIsNil(ctx, err, "获取数据失败")
	})
	return
}

// GetRoleList 获取角色列表
func (s *sSysRole) GetRoleList(ctx context.Context) (list []*entity.SysRole, err error) {
	cache := commonService.Cache()
	//从缓存获取
	iList := cache.GetOrSetFuncLock(ctx, consts.CacheSysRole, s.getRoleListFromDb, 0, consts.CacheSysAuthTag)
	if iList != nil {
		err = gconv.Struct(iList, &list)
	}
	return
}

// 从数据库获取所有角色
func (s *sSysRole) getRoleListFromDb(ctx context.Context) (value interface{}, err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		var v []*entity.SysRole
		//从数据库获取
		err = dao.SysRole.Ctx(ctx).
			Order(dao.SysRole.Columns().ListOrder + " asc," + dao.SysRole.Columns().Id + " asc").
			Scan(&v)
		liberr.ErrIsNil(ctx, err, "获取角色数据失败")
		value = v
	})
	return
}

// AddRoleRule 添加角色权限
func (s *sSysRole) AddRoleRule(ctx context.Context, ruleIds []uint, roleId int64) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		enforcer, e := commonService.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		ruleIdsStr := gconv.Strings(ruleIds)
		for _, v := range ruleIdsStr {
			_, err = enforcer.AddPolicy(gconv.String(roleId), v, "All")
			liberr.ErrIsNil(ctx, err)
		}
	})
	return
}

// DelRoleRule 删除角色权限
func (s *sSysRole) DelRoleRule(ctx context.Context, roleId int64) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		enforcer, e := commonService.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		_, err = enforcer.RemoveFilteredPolicy(0, gconv.String(roleId))
		liberr.ErrIsNil(ctx, e)
	})
	return
}

func (s *sSysRole) AddRole(ctx context.Context, req *system.RoleAddReq) (err error) {
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			roleId, e := dao.SysRole.Ctx(ctx).TX(tx).InsertAndGetId(req)
			liberr.ErrIsNil(ctx, e, "添加角色失败")
			//添加角色权限
			e = s.AddRoleRule(ctx, req.MenuIds, roleId)
			liberr.ErrIsNil(ctx, e)
			//清除缓存
			commonService.Cache().Remove(ctx, consts.CacheSysRole)
		})
		return err
	})
	return
}

func (s *sSysRole) Get(ctx context.Context, id uint) (res *entity.SysRole, err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		err = dao.SysRole.Ctx(ctx).WherePri(id).Scan(&res)
		liberr.ErrIsNil(ctx, err, "获取角色信息失败")
	})
	return
}

// GetFilteredNamedPolicy 获取角色关联的菜单规则
func (s *sSysRole) GetFilteredNamedPolicy(ctx context.Context, id uint) (gpSlice []int, err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		enforcer, e := commonService.CasbinEnforcer(ctx)
		liberr.ErrIsNil(ctx, e)
		gp := enforcer.GetFilteredNamedPolicy("p", 0, gconv.String(id))
		gpSlice = make([]int, len(gp))
		for k, v := range gp {
			gpSlice[k] = gconv.Int(v[1])
		}
	})
	return
}

// EditRole 修改角色
func (s *sSysRole) EditRole(ctx context.Context, req *system.RoleEditReq) (err error) {
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, e := dao.SysRole.Ctx(ctx).TX(tx).WherePri(req.Id).Data(&do.SysRole{
				Status:    req.Status,
				ListOrder: req.ListOrder,
				Name:      req.Name,
				Remark:    req.Remark,
			}).Update()
			liberr.ErrIsNil(ctx, e, "修改角色失败")
			//删除角色权限
			e = s.DelRoleRule(ctx, req.Id)
			liberr.ErrIsNil(ctx, e)
			//添加角色权限
			e = s.AddRoleRule(ctx, req.MenuIds, req.Id)
			liberr.ErrIsNil(ctx, e)
			//清除缓存
			commonService.Cache().Remove(ctx, consts.CacheSysRole)
		})
		return err
	})
	return
}

// DeleteByIds 删除角色
func (s *sSysRole) DeleteByIds(ctx context.Context, ids []int64) (err error) {
	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			_, err = dao.SysRole.Ctx(ctx).TX(tx).Where(dao.SysRole.Columns().Id+" in(?)", ids).Delete()
			liberr.ErrIsNil(ctx, err, "删除角色失败")
			//删除角色权限
			for _, v := range ids {
				err = s.DelRoleRule(ctx, v)
				liberr.ErrIsNil(ctx, err)
			}
			//清除缓存
			commonService.Cache().Remove(ctx, consts.CacheSysRole)
		})
		return err
	})
	return
}

func (s *sSysRole) RoleDeptTreeSelect(ctx context.Context, roleId int64) (res *system.RoleDeptTreeSelectRes, err error) {
	res = new(system.RoleDeptTreeSelectRes)
	err = g.Try(ctx, func(ctx context.Context) {
		list, err := service.SysDept().GetList(ctx, &system.DeptSearchReq{
			Status: "1",
		})
		liberr.ErrIsNil(ctx, err)
		//获取关联的角色数据权限
		checkedKeys, err := s.GetRoleDepts(ctx, roleId)
		liberr.ErrIsNil(ctx, err)

		dList := service.SysDept().GetListTree(0, list)
		res.Depts = dList
		res.CheckedKeys = checkedKeys
	})
	return
}

func (s *sSysRole) GetRoleDepts(ctx context.Context, roleId int64) ([]int64, error) {
	var entities []*entity.SysRoleDept
	err := dao.SysRoleDept.Ctx(ctx).Where("role_id", roleId).Scan(&entities)
	if err != nil {
		return nil, err
	}
	result := make([]int64, 0)
	for _, v := range entities {
		result = append(result, v.DeptId)
	}
	return result, nil
}

// RoleDataScope 设置角色数据权限
func (s *sSysRole) RoleDataScope(ctx context.Context, req *system.DataScopeReq) error {
	err := g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err := g.Try(ctx, func(ctx context.Context) {
			_, err := tx.Model(dao.SysRole.Table()).Where("id", req.RoleId).Data(g.Map{"data_scope": req.DataScope}).Update()
			liberr.ErrIsNil(ctx, err, "设置失败")
			if req.DataScope == 2 {
				_, err = tx.Model(dao.SysRoleDept.Table()).Where("role_id", req.RoleId).Delete()
				liberr.ErrIsNil(ctx, err, "设置失败")
				data := g.List{}
				for _, deptId := range req.DeptIds {
					data = append(data, g.Map{"role_id": req.RoleId, "dept_id": deptId})
				}
				_, err = tx.Model(dao.SysRoleDept.Table()).Data(data).Insert()
				liberr.ErrIsNil(ctx, err, "设置失败")
			}
			//清除缓存
			commonService.Cache().Remove(ctx, consts.CacheSysRole)
		})
		return err
	})
	return err
}
