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

// SqMeetingsDao is the manager for logic model data accessing and custom defined data operations functions management.
type SqMeetingsDao struct {
	table   string            // Table is the underlying table name of the DAO.
	group   string            // Group is the database configuration group name of current DAO.
	columns SqMeetingsColumns // Columns is the short type for Columns, which contains all the column names of Table for convenient usage.
}

// SqMeetingsColumns defines and stores column names for table sq_meetings.
type SqMeetingsColumns struct {
	Id               string // 主键ID
	RoomNumber       string // 会议ID
	Topic            string // 会议主题
	Mode             string // 会议模式
	Distance         string // 电子围栏半径
	Type             string // 会议类型
	Status           string // 会议状态
	Location         string // 会议地点
	CreatorID        string // 创建人标识
	Description      string // 会议描述信息
	RecordingEnabled string // 是否开启会议录制
	CreateTime       string // 会议创建时间
	StartTime        string // 会议开始时间
	EndTime          string // 会议结束时间
}

var sqMeetingsColumns = SqMeetingsColumns{
	Id:               "id",
	RoomNumber:       "room_number",
	Topic:            "topic",
	Mode:             "mode",
	Distance:         "distance",
	Type:             "type",
	Status:           "status",
	Location:         "location",
	CreatorID:        "creator_id",
	Description:      "description",
	RecordingEnabled: "recording_enabled",
	CreateTime:       "create_time",
	StartTime:        "start_time",
	EndTime:          "end_time",
}

// NewSqMeetingsDao creates and returns a new DAO object for table data access.
func NewSqMeetingsDao() *SqMeetingsDao {
	return &SqMeetingsDao{
		group:   "default",
		table:   "sq_meetings",
		columns: sqMeetingsColumns,
	}
}

// DB retrieves and returns the underlying raw database management object of current DAO.
func (dao *SqMeetingsDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of current dao.
func (dao *SqMeetingsDao) Table() string {
	return dao.table
}

// Columns returns all column names of current dao.
func (dao *SqMeetingsDao) Columns() SqMeetingsColumns {
	return dao.columns
}

// Group returns the configuration group name of database of current dao.
func (dao *SqMeetingsDao) Group() string {
	return dao.group
}

// Ctx creates and returns the Model for current DAO, It automatically sets the context for current operation.
func (dao *SqMeetingsDao) Ctx(ctx context.Context) *gdb.Model {
	return dao.DB().Model(dao.table).Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rollbacks the transaction and returns the error from function f if it returns non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note that, you should not Commit or Rollback the transaction in function f
// as it is automatically handled by this function.
func (dao *SqMeetingsDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
