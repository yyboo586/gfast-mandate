// ==========================================================================
// GFast自动生成dao操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/dao/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package dao

import (
	"github.com/tiger1103/gfast/v3/internal/app/meetings/dao/internal"
)

// sqMeetingsDao is the manager for logic model data accessing and custom defined data operations functions management.
// You can define custom methods on it to extend its functionality as you wish.
type sqMeetingsParticipantsDao struct {
	*internal.SqMeetingsParticipantsDao
}

var (
	// SqMeetings is globally public accessible object for table tools_gen_table operations.
	SqMeetingsParticipants = sqMeetingsParticipantsDao{
		internal.NewSqMeetingsParticipantsDao(),
	}
)

// Fill with you ideas below.
