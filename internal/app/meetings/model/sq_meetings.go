// ==========================================================================
// GFast自动生成model操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/model/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package model

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/v2/os/gtime"
	comModel "github.com/tiger1103/gfast/v3/internal/app/common/model"
)

type MeetingMode int

const (
	MeetingModeUnknown      MeetingMode = iota // 未知模式
	MeetingModeRoming                          // 漫游模式
	MeetingModeMeetingRoom                     // 会议室模式
	MeetingModeVirtualHuman                    // 虚拟人模式
)

const (
	MeetingModeUnknownText      string = "未知模式"
	MeetingModeRomingText       string = "漫游模式"
	MeetingModeMeetingRoomText  string = "会议室模式"
	MeetingModeVirtualHumanText string = "虚拟人模式"
)

type MeetingType int

const (
	MeetingTypeUnknown   MeetingType = iota
	MeetingTypeInstant               // 即时会议
	MeetingTypeScheduled             // 预约会议
)

const (
	MeetingTypeUnknownText   string = "未知类型"
	MeetingTypeInstantText   string = "即时会议"
	MeetingTypeScheduledText string = "预约会议"
)

type MeetingStatus int

const (
	MeetingStatusUnknown  MeetingStatus = iota
	MeetingStatusCreated                // 已创建
	MeetingStatusStarted                // 进行中
	MeetingStatusEnded                  // 已结束
	MeetingStatusCanceled               // 已取消
)

const (
	MeetingStatusUnknownText  string = "未知状态"
	MeetingStatusCreatedText  string = "已创建"
	MeetingStatusStartedText  string = "进行中"
	MeetingStatusEndedText    string = "已结束"
	MeetingStatusCanceledText string = "已取消"
)

type MeetingParticipantRole uint

const (
	ParticipantRoleModerator MeetingParticipantRole = 1 << iota // 主持人
	ParticipantRoleAdmin                                        // 管理员
	ParticipantRoleMember                                       // 观众
)

const (
	ParticipantRoleUnknownText   string = "未知角色"
	ParticipantRoleModeratorText string = "主持人"
	ParticipantRoleAdminText     string = "管理员"
	ParticipantRoleMemberText    string = "观众"
)

type ParticipantStatus int

const (
	ParticipantStatusUnknown   ParticipantStatus = iota // 未知
	ParticipantStatusUnhandled                          // 未处理
	ParticipantStatusAccepted                           // 已接受
	ParticipantStatusRejected                           // 已拒绝
)

const (
	ParticipantStatusUnknownText   string = "未知"
	ParticipantStatusUnhandledText string = "未处理"
	ParticipantStatusAcceptedText  string = "已接受"
	ParticipantStatusRejectedText  string = "已拒绝"
)

type SqMeetings struct {
	ID            int64
	RoomNumber    string
	Topic         string
	Mode          MeetingMode
	Distance      int
	Type          MeetingType
	Status        MeetingStatus
	Location      string
	Description   string
	CreatorID     string
	CreatorName   string
	ModeratorID   string
	ModeratorName string
	CreateTime    *gtime.Time
	StartTime     *gtime.Time
	EndTime       *gtime.Time
}

type SqMeetingsDB struct {
	ID               int64
	RoomNumber       string
	Topic            string
	Mode             int
	Distance         int
	Type             int
	Status           int
	Location         string
	CreatorId        string
	Description      string
	RecordingEnabled int
	CreateTime       *gtime.Time
	StartTime        *gtime.Time
	EndTime          *gtime.Time
	ParticipantsList []*SqMeetingsParticipantsDB
}

// SqMeetingsSearchReq 分页请求参数
type SqMeetingsSearchReq struct {
	comModel.PageReq
	UserName string `p:"userName" v:"required#用户名不能为空" dc:"用户名"`
}

// ListRes 列表返回结果
type ListRes struct {
	comModel.ListRes
	List []*SqMeetings `json:"list"`
}

func ConvertDataModel(sqDB *SqMeetingsDB) *SqMeetings {
	return &SqMeetings{
		ID:          sqDB.ID,
		RoomNumber:  sqDB.RoomNumber,
		Topic:       sqDB.Topic,
		Mode:        MeetingMode(sqDB.Mode),
		Distance:    sqDB.Distance,
		Type:        MeetingType(sqDB.Type),
		Status:      MeetingStatus(sqDB.Status),
		Location:    sqDB.Location,
		CreatorID:   sqDB.CreatorId,
		Description: sqDB.Description,
		CreateTime:  sqDB.CreateTime,
		StartTime:   sqDB.StartTime,
		EndTime:     sqDB.EndTime,
	}
}

func GetParticipantStatusText(status int) string {
	switch ParticipantStatus(status) {
	case ParticipantStatusUnhandled:
		return ParticipantStatusUnhandledText
	case ParticipantStatusAccepted:
		return ParticipantStatusAcceptedText
	case ParticipantStatusRejected:
		return ParticipantStatusRejectedText
	default:
		return ParticipantStatusUnknownText
	}
}
func GetParticipantRole(roleText string) MeetingParticipantRole {
	switch roleText {
	case ParticipantRoleModeratorText:
		return ParticipantRoleModerator
	case ParticipantRoleAdminText:
		return ParticipantRoleAdmin
	case ParticipantRoleMemberText:
		return ParticipantRoleMember
	default:
		return MeetingParticipantRole(0)
	}
}

func GetParticipantRoles(role int) (result []string) {
	r := MeetingParticipantRole(role)
	if r&ParticipantRoleModerator != 0 {
		result = append(result, string(ParticipantRoleModeratorText))
	}
	if r&ParticipantRoleAdmin != 0 {
		result = append(result, string(ParticipantRoleAdminText))
	}
	if r&ParticipantRoleMember != 0 {
		result = append(result, string(ParticipantRoleMemberText))
	}
	return result
}

func GetParticipantRoleText(role int) string {
	switch MeetingParticipantRole(role) {
	case ParticipantRoleModerator:
		return ParticipantRoleModeratorText
	case ParticipantRoleAdmin:
		return ParticipantRoleAdminText
	case ParticipantRoleMember:
		return ParticipantRoleMemberText
	default:
		return ParticipantRoleUnknownText
	}
}

func GetStatus(statusText string) MeetingStatus {
	switch statusText {
	case MeetingStatusCreatedText:
		return MeetingStatusCreated
	case MeetingStatusStartedText:
		return MeetingStatusStarted
	case MeetingStatusEndedText:
		return MeetingStatusEnded
	case MeetingStatusCanceledText:
		return MeetingStatusCanceled
	default:
		return MeetingStatusUnknown
	}
}

func GetStatusText(status MeetingStatus) string {
	switch status {
	case MeetingStatusCreated:
		return MeetingStatusCreatedText
	case MeetingStatusStarted:
		return MeetingStatusStartedText
	case MeetingStatusEnded:
		return MeetingStatusEndedText
	case MeetingStatusCanceled:
		return MeetingStatusCanceledText
	default:
		return MeetingStatusUnknownText
	}
}

func GetType(typeText string) MeetingType {
	switch typeText {
	case MeetingTypeInstantText:
		return MeetingTypeInstant
	case MeetingTypeScheduledText:
		return MeetingTypeScheduled
	default:
		return MeetingTypeUnknown
	}
}

func GetTypeText(meetingType MeetingType) string {
	switch MeetingType(meetingType) {
	case MeetingTypeInstant:
		return MeetingTypeInstantText
	case MeetingTypeScheduled:
		return MeetingTypeScheduledText
	default:
		return MeetingTypeUnknownText
	}
}

func GetMode(modeText string) MeetingMode {
	switch modeText {
	case MeetingModeRomingText:
		return MeetingModeRoming
	case MeetingModeMeetingRoomText:
		return MeetingModeMeetingRoom
	case MeetingModeVirtualHumanText:
		return MeetingModeVirtualHuman
	default:
		return MeetingModeUnknown
	}
}

func GetModeText(mode MeetingMode) string {
	switch mode {
	case MeetingModeRoming:
		return MeetingModeRomingText
	case MeetingModeMeetingRoom:
		return MeetingModeMeetingRoomText
	case MeetingModeVirtualHuman:
		return MeetingModeVirtualHumanText
	default:
		return MeetingModeUnknownText
	}
}

// ValidateMeetingInfo 校验会议信息
func ValidateMeetingInfo(data *SqMeetings) (err error) {
	// 会议模式，参数校验
	if data.Mode == MeetingModeUnknown {
		return gerror.New(string(GetModeText(data.Mode)))
	}
	if data.Mode == MeetingModeRoming {
		if data.Distance <= 0 {
			return gerror.New("电子围栏半径不能小于等于0")
		}
	} else {
		data.Distance = 0
	}

	// 会议时间，参数校验
	if data.StartTime.Before(gtime.Now()) {
		return gerror.New("会议开始时间必须大于当前时间")
	}
	if data.StartTime.After(gtime.Now().AddDate(0, 3, 0)) {
		return gerror.New("会议预约时间不能超过三个月")
	}

	return nil
}
