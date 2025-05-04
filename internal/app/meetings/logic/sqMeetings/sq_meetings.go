// ==========================================================================
// GFast自动生成logic操作代码。
// 生成日期：2025-05-04 14:25:02
// 生成路径: internal/app/meetings/logic/sq_meetings.go
// 生成人：yyboo
// desc:会议信息表
// company:云南奇讯科技有限公司
// ==========================================================================

package sqMeetings

import (
	"context"
	"fmt"
	"math/rand"
	"time"

	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/dao"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/model"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/model/do"
	"github.com/tiger1103/gfast/v3/internal/app/meetings/service"
	"github.com/tiger1103/gfast/v3/internal/app/system/consts"
	"github.com/tiger1103/gfast/v3/library/liberr"
)

type MeetingMode int

const (
	ModeUnknown      MeetingMode = iota // 未知模式
	ModeRoming                          // 漫游模式
	ModeMeetingRoom                     // 会议室模式
	ModeVirtualHuman                    // 虚拟人模式
)

type MeetingModeText string

const (
	ModeUnknownText      MeetingModeText = "未知模式"
	ModeRomingText       MeetingModeText = "漫游模式"
	ModeMeetingRoomText  MeetingModeText = "会议室模式"
	ModeVirtualHumanText MeetingModeText = "虚拟人模式"
)

type MeetingType int

const (
	TypeUnknown          MeetingType = iota
	TypeInstantMeeting               // 即时会议
	TypeScheduledMeeting             // 预约会议
)

type MeetingTypeText string

const (
	TypeUnknownText          MeetingTypeText = "未知类型"
	TypeInstantMeetingText   MeetingTypeText = "即时会议"
	TypeScheduledMeetingText MeetingTypeText = "预约会议"
)

type MeetingStatus int

const (
	StatusUnknown  MeetingStatus = iota
	StatusCreated                // 已创建
	StatusStarted                // 进行中
	StatusEnded                  // 已结束
	StatusCanceled               // 已取消
)

type MeetingStatusText string

const (
	StatusUnknownText  MeetingStatusText = "未知状态"
	StatusCreatedText  MeetingStatusText = "已创建"
	StatusStartedText  MeetingStatusText = "进行中"
	StatusEndedText    MeetingStatusText = "已结束"
	StatusCanceledText MeetingStatusText = "已取消"
)

func (s *sSqMeetings) GetStatus(statusText string) MeetingStatus {
	switch MeetingStatusText(statusText) {
	case StatusCreatedText:
		return StatusCreated
	case StatusStartedText:
		return StatusStarted
	case StatusEndedText:
		return StatusEnded
	case StatusCanceledText:
		return StatusCanceled
	default:
		return StatusUnknown
	}
}

func (s *sSqMeetings) GetStatusText(status int) MeetingStatusText {
	switch MeetingStatus(status) {
	case StatusCreated:
		return StatusCreatedText
	case StatusStarted:
		return StatusStartedText
	case StatusEnded:
		return StatusEndedText
	case StatusCanceled:
		return StatusCanceledText
	default:
		return StatusUnknownText
	}
}

func (s *sSqMeetings) GetType(typeText string) MeetingType {
	switch MeetingTypeText(typeText) {
	case TypeInstantMeetingText:
		return TypeInstantMeeting
	case TypeScheduledMeetingText:
		return TypeScheduledMeeting
	default:
		return TypeUnknown
	}
}

func (s *sSqMeetings) GetTypeText(meetingType int) MeetingTypeText {
	switch MeetingType(meetingType) {
	case TypeInstantMeeting:
		return TypeInstantMeetingText
	case TypeScheduledMeeting:
		return TypeScheduledMeetingText
	default:
		return TypeUnknownText
	}
}

func (s *sSqMeetings) GetMode(modeText string) MeetingMode {
	switch MeetingModeText(modeText) {
	case ModeRomingText:
		return ModeRoming
	case ModeMeetingRoomText:
		return ModeMeetingRoom
	case ModeVirtualHumanText:
		return ModeVirtualHuman
	default:
		return ModeUnknown
	}
}

func (s *sSqMeetings) GetModeText(mode int) MeetingModeText {
	switch MeetingMode(mode) {
	case ModeRoming:
		return ModeMeetingRoomText
	case ModeMeetingRoom:
		return ModeMeetingRoomText
	case ModeVirtualHuman:
		return ModeVirtualHumanText
	default:
		return ModeUnknownText
	}
}

func (s *sSqMeetings) GenerateRoomID() string {
	rand.Seed(time.Now().UnixNano())
	return fmt.Sprintf("%09d", rand.Intn(1000000000))
}

func init() {
	service.RegisterSqMeetings(New())
}

func New() service.ISqMeetings {
	return &sSqMeetings{}
}

type sSqMeetings struct {
}

func (s *sSqMeetings) Add(ctx context.Context, req *model.SqMeetings) (err error) {
	req.RoomNumber = s.GenerateRoomID()
	req.Status = string(StatusCreatedText)
	req.CreateTime = gtime.Now()

	if req.Mode == string(ModeRomingText) {
		if req.Distance < 0 {
			return gerror.New("电子围栏半径不能小于0")
		}
		if req.Distance == 0 {
			return gerror.New("漫游模式必须填写电子围栏半径")
		}
		if req.Distance > 100 {
			return gerror.New("电子围栏半径不能大于100")
		}
	}
	if req.StartTime.Before(gtime.Now()) {
		return gerror.New("会议开始时间必须大于当前时间")
	}
	if req.StartTime.After(gtime.Now().AddDate(0, 3, 0)) {
		return gerror.New("会议预约时间不能超过三个月")
	}

	meetingData := do.SqMeetings{
		RoomNumber:       req.RoomNumber,
		Topic:            req.Topic,
		Mode:             s.GetMode(req.Mode),
		Distance:         req.Distance,
		Type:             s.GetType(req.Type),
		Status:           s.GetStatus(req.Status),
		Location:         req.Location,
		CreatorName:      req.CreatorName,
		ModeratorName:    req.ModeratorName,
		Description:      req.Description,
		RecordingEnabled: req.RecordingEnabled,
		CreateTime:       req.CreateTime,
		StartTime:        req.StartTime,
		EndTime:          req.EndTime,
	}
	invitesData := make([]do.SqMeetingsParticipants, 0)
	for _, v := range req.InviteNumberNames {
		invitesData = append(invitesData, do.SqMeetingsParticipants{
			MID:      req.RoomNumber,
			UserName: v,
			Status:   0,
		})
	}

	err = g.DB().Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {
		err = g.Try(ctx, func(ctx context.Context) {
			tx.Model(dao.SqMeetings.Table()).Ctx(ctx).Insert(meetingData)
			liberr.ErrIsNil(ctx, err, "会议信息添加失败")
			_, err = tx.Model(dao.SqMeetingsParticipants.Table()).Ctx(ctx).Insert(invitesData)
			liberr.ErrIsNil(ctx, err, "参会人员信息添加失败")
		})
		return err
	})

	return
}

func (s *sSqMeetings) GetByRoomID(ctx context.Context, id int64) (res *model.SqMeetings, err error) {
	m := &model.SqMeetingsDB{}
	err = g.Try(ctx, func(ctx context.Context) {
		err = dao.SqMeetings.Ctx(ctx).WithAll().Where(dao.SqMeetings.Columns().RoomNumber, id).Scan(m)
		liberr.ErrIsNil(ctx, err, "获取信息失败")
	})

	return s.convertDataModel(m), err
}

func (s *sSqMeetings) Edit(ctx context.Context, req *model.SqMeetings) (err error) {
	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SqMeetings.Ctx(ctx).Where(dao.SqMeetings.Columns().RoomNumber, req.RoomNumber).Update(do.SqMeetings{
			Topic:            req.Topic,
			Mode:             s.GetMode(req.Mode),
			Distance:         req.Distance,
			Type:             s.GetType(req.Type),
			Status:           s.GetStatus(req.Status),
			Location:         req.Location,
			CreatorName:      req.CreatorName,
			ModeratorName:    req.ModeratorName,
			Description:      req.Description,
			RecordingEnabled: req.RecordingEnabled,
			CreateTime:       req.CreateTime,
			StartTime:        req.StartTime,
			EndTime:          req.EndTime,
		})
		liberr.ErrIsNil(ctx, err, "修改失败")
	})
	return
}

func (s *sSqMeetings) Delete(ctx context.Context, roomNumbers []string) (err error) {
	if len(roomNumbers) == 0 {
		return nil
	}

	err = g.Try(ctx, func(ctx context.Context) {
		_, err = dao.SqMeetings.Ctx(ctx).Delete(dao.SqMeetings.Columns().RoomNumber+" in (?)", roomNumbers)
		liberr.ErrIsNil(ctx, err, "删除失败")
	})
	return
}

func (s *sSqMeetings) List(ctx context.Context, req *model.SqMeetingsSearchReq) (listRes *model.SqMeetingsSearchRes, err error) {
	listRes = new(model.SqMeetingsSearchRes)
	err = g.Try(ctx, func(ctx context.Context) {
		m := dao.SqMeetings.Ctx(ctx).WithAll().As("t1")
		m = m.LeftJoin(dao.SqMeetingsParticipants.Table()+" as t2", "t1.room_number = t2.mid")
		m = m.Where("t2."+dao.SqMeetingsParticipants.Columns().UserName+"=?", req.UserName)

		listRes.Total, err = m.Count()
		liberr.ErrIsNil(ctx, err, "获取数据失败")
		if req.PageNum == 0 {
			req.PageNum = 1
		}
		listRes.CurrentPage = req.PageNum
		if req.PageSize == 0 {
			req.PageSize = consts.PageSize
		}
		order := "t1.create_time desc"
		if req.OrderBy != "" {
			order = req.OrderBy
		}
		var result []*model.SqMeetingsDB
		err = m.Page(req.PageNum, req.PageSize).Fields("t1.*").Order(order).Scan(&result)
		liberr.ErrIsNil(ctx, err, "获取数据失败")
		for _, v := range result {
			listRes.List = append(listRes.List, s.convertDataModel(v))
		}
	})
	return
}

func (s *sSqMeetings) convertDataModel(sqDB *model.SqMeetingsDB) *model.SqMeetings {
	return &model.SqMeetings{
		ID:               sqDB.ID,
		RoomNumber:       sqDB.RoomNumber,
		Topic:            sqDB.Topic,
		Mode:             string(s.GetModeText(sqDB.Mode)),
		Distance:         sqDB.Distance,
		Type:             string(s.GetTypeText(sqDB.Type)),
		Status:           string(s.GetStatusText(sqDB.Status)),
		Location:         sqDB.Location,
		CreatorName:      sqDB.CreatorName,
		ModeratorName:    sqDB.ModeratorName,
		Description:      sqDB.Description,
		RecordingEnabled: sqDB.RecordingEnabled,
		CreateTime:       sqDB.CreateTime,
		StartTime:        sqDB.StartTime,
		EndTime:          sqDB.EndTime,
	}
}
