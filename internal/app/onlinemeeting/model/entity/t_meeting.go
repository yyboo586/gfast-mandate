package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

type MeetingDB struct {
	ID          int64
	RoomNumber  string
	Topic       string
	Mode        int
	Distance    int
	Type        int
	Status      int
	Location    string
	CreatorId   string
	Description string
	CreateTime  *gtime.Time
	StartTime   *gtime.Time
	EndTime     *gtime.Time
	Members     []*MeetingParticipantDB
}
