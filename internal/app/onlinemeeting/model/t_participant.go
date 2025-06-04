package model

import "github.com/gogf/gf/v2/os/gtime"

type MeetingParticipantStatus int

const (
	ParticipantStatusUnknown   MeetingParticipantStatus = iota // 未知
	ParticipantStatusUnhandled                                 // 未处理
	ParticipantStatusAccepted                                  // 已接受
	ParticipantStatusRejected                                  // 已拒绝
	ParticipantStatusKicked                                    // 被踢出
)

const (
	ParticipantStatusUnknownText   string = "未知"
	ParticipantStatusUnhandledText string = "未处理"
	ParticipantStatusAcceptedText  string = "已接受"
	ParticipantStatusRejectedText  string = "已拒绝"
	ParticipantStatusKickedText    string = "被踢出"
)

type MeetingParticipantRole uint

const (
	ParticipantRoleAdmin     MeetingParticipantRole = 1 << iota // 管理员
	ParticipantRoleModerator                                    // 主持人
	ParticipantRoleMember                                       // 普通成员
)

const (
	ParticipantRoleUnknownText   string = "未知角色"
	ParticipantRoleAdminText     string = "管理员"
	ParticipantRoleModeratorText string = "主持人"
	ParticipantRoleMemberText    string = "普通成员"
)

type UserAction int

const (
	_                   UserAction = iota
	ActionMeetingInvite            // 会议邀请处理（忽略/接受/拒绝）
	ActionJoin                     // 加入会议
	ActionExit                     // 退出会议
)

type UserInfo struct {
	UserID     string
	UserName   string
	Role       MeetingParticipantRole
	Status     MeetingParticipantStatus
	UpdateTime *gtime.Time
	JoinTime   *gtime.Time
	ExitTime   *gtime.Time
}

func GetParticipantStatusText(status MeetingParticipantStatus) string {
	switch status {
	case ParticipantStatusUnhandled:
		return ParticipantStatusUnhandledText
	case ParticipantStatusAccepted:
		return ParticipantStatusAcceptedText
	case ParticipantStatusRejected:
		return ParticipantStatusRejectedText
	case ParticipantStatusKicked:
		return ParticipantStatusKickedText
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

func GetParticipantRoleText(role MeetingParticipantRole) string {
	switch role {
	case ParticipantRoleMember:
		return ParticipantRoleMemberText
	case ParticipantRoleModerator:
		return ParticipantRoleModeratorText
	case ParticipantRoleAdmin:
		return ParticipantRoleAdminText
	default:
		return ParticipantRoleUnknownText
	}
}

func GetParticipantRolesText(role MeetingParticipantRole) (result []string) {
	if role&ParticipantRoleAdmin != 0 {
		result = append(result, string(ParticipantRoleAdminText))
	}
	if role&ParticipantRoleModerator != 0 {
		result = append(result, string(ParticipantRoleModeratorText))
	}
	if role&ParticipantRoleMember != 0 {
		result = append(result, string(ParticipantRoleMemberText))
	}
	return result
}

type HandleUserAction struct {
	RoomNumber string
	UserID     string
	Action     UserAction
	Status     int
}
