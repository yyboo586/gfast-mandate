// ==========================================================================
// GFast自动生成dao internal操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/dao/internal/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// SqMeetingsParticipantsDao is the manager for logic model data accessing and custom defined data operations functions management.
type SqMeetingsParticipantsDao struct {
	table   string                        // Table is the underlying table name of the DAO.
	group   string                        // Group is the database configuration group name of current DAO.
	columns SqMeetingsParticipantsColumns // Columns is the short type for Columns, which contains all the column names of Table for convenient usage.
}

// SqMeetingsColumns defines and stores column names for table sq_meetings.
type SqMeetingsParticipantsColumns struct {
	ID         string // 主键ID
	RoomNumber string // 会议ID
	UserID     string // 会议参与人标识
	UserName   string // 参会人名称
	Role       string // 参会角色
	Status     string // 参会状态
	UpdateTime string // 接受会议的时间
	JoinTime   string // 加入会议的时间
	ExitTime   string // 离开会议的时间
}

var sqMeetingsParticipantsColumns = SqMeetingsParticipantsColumns{
	ID:         "id",
	RoomNumber: "m_room_number",
	UserID:     "user_id",
	UserName:   "user_name",
	Role:       "role",
	Status:     "status",
	UpdateTime: "update_time",
	JoinTime:   "join_time",
	ExitTime:   "exit_time",
}

// NewSqMeetingsDao creates and returns a new DAO object for table data access.
func NewSqMeetingsParticipantsDao() *SqMeetingsParticipantsDao {
	return &SqMeetingsParticipantsDao{
		group:   "default",
		table:   "sq_meetings_participants",
		columns: sqMeetingsParticipantsColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *SqMeetingsParticipantsDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *SqMeetingsParticipantsDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *SqMeetingsParticipantsDao) Columns() SqMeetingsParticipantsColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *SqMeetingsParticipantsDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *SqMeetingsParticipantsDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *SqMeetingsParticipantsDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
