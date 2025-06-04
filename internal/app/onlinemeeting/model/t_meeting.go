package model

import (
	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/model/entity"
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
	MeetingStatusCreatedText  string = "待开始"
	MeetingStatusStartedText  string = "进行中"
	MeetingStatusEndedText    string = "已结束"
	MeetingStatusCanceledText string = "已取消"
)

const (
	MeetingScopeHistory = "history"
	MeetingScopeFuture  = "future"
)

// func GetStatus(statusText string) MeetingStatus {
// 	switch statusText {
// 	case MeetingStatusCreatedText:
// 		return MeetingStatusCreated
// 	case MeetingStatusStartedText:
// 		return MeetingStatusStarted
// 	case MeetingStatusEndedText:
// 		return MeetingStatusEnded
// 	case MeetingStatusCanceledText:
// 		return MeetingStatusCanceled
// 	default:
// 		return MeetingStatusUnknown
// 	}
// }

func GetMeetingStatusText(status MeetingStatus) string {
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

func GetMeetingTypeText(meetingType MeetingType) string {
	switch meetingType {
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

func GetMeetingModeText(mode MeetingMode) string {
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

type Meeting struct {
	ID            int64
	RoomNumber    string
	Topic         string
	Mode          MeetingMode
	Distance      int
	Type          MeetingType
	Status        MeetingStatus
	Location      string
	Description   string
	CreatorInfo   *UserInfo
	ModeratorInfo *UserInfo
	CreateTime    *gtime.Time
	StartTime     *gtime.Time
	EndTime       *gtime.Time
	Members       []*UserInfo
}

// 判断当前用户是否为管理员
func IsAdmin(role MeetingParticipantRole) bool {
	return role&ParticipantRoleAdmin != 0
}

// 判断当前用户是否为主持人
func IsModerator(role MeetingParticipantRole) bool {
	return role&ParticipantRoleModerator != 0
}

func IsMember(role MeetingParticipantRole) bool {
	return role&ParticipantRoleMember != 0
}

func ConvertDBMeetingToLogic(sqDB *entity.MeetingDB) *Meeting {
	res := &Meeting{
		ID:          sqDB.ID,
		RoomNumber:  sqDB.RoomNumber,
		Topic:       sqDB.Topic,
		Mode:        MeetingMode(sqDB.Mode),
		Distance:    sqDB.Distance,
		Type:        MeetingType(sqDB.Type),
		Status:      MeetingStatus(sqDB.Status),
		Location:    sqDB.Location,
		Description: sqDB.Description,
		CreateTime:  sqDB.CreateTime,
		StartTime:   sqDB.StartTime,
		EndTime:     sqDB.EndTime,
	}
	for _, v := range sqDB.Members {
		userInfo := &UserInfo{
			UserID:     v.UserID,
			UserName:   v.UserName,
			Role:       MeetingParticipantRole(v.Role),
			Status:     MeetingParticipantStatus(v.Status),
			UpdateTime: v.UpdateTime,
			JoinTime:   v.JoinTime,
			ExitTime:   v.ExitTime,
		}
		if IsAdmin(MeetingParticipantRole(v.Role)) {
			res.CreatorInfo = userInfo
		}
		if IsModerator(MeetingParticipantRole(v.Role)) {
			res.ModeratorInfo = userInfo
		}
		if !IsAdmin(MeetingParticipantRole(v.Role)) && !IsModerator(MeetingParticipantRole(v.Role)) && IsMember(MeetingParticipantRole(v.Role)) {
			res.Members = append(res.Members, userInfo)
		}
	}
	return res
}

// ValidateMeetingInfo 校验会议信息
func ValidateMeetingInfo(data *Meeting) (err error) {
	// 会议模式，参数校验
	if data.Mode == MeetingModeUnknown {
		return gerror.Wrap(gerror.New("会议模式错误: "), string(GetMeetingModeText(data.Mode)))
	}
	if data.Mode == MeetingModeRoming {
		if data.Distance <= 0 {
			return gerror.New("漫游模式下，电子围栏半径不能小于等于0")
		}
	} else {
		data.Distance = 0
	}

	// 会议时间，参数校验
	if data.StartTime != nil && data.StartTime.Before(gtime.Now()) {
		return gerror.New("会议开始时间必须大于当前时间")
	}
	if data.StartTime != nil && data.StartTime.After(gtime.Now().AddDate(0, 3, 0)) {
		return gerror.New("会议预约时间不能超过三个月")
	}
	if data.EndTime != nil && data.StartTime != nil && data.EndTime.Before(data.StartTime) {
		return gerror.New("会议结束时间必须大于会议开始时间")
	}

	return nil
}
