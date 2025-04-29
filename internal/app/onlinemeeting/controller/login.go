package controller

import (
	"context"

	"github.com/tiger1103/gfast/v3/api/v1/meeting"
	sysModel "github.com/tiger1103/gfast/v3/internal/app/system/model"
	"github.com/tiger1103/gfast/v3/internal/app/system/service"
)

func (c *meetingController) Login(ctx context.Context, req *meeting.LoginReq) (res *meeting.LoginRes, err error) {
	key := "sdssssssssssssssssssssssssssssssssssssssssssstom"
	userInfo := &sysModel.LoginUserRes{
		UserID:   req.UserID,
		UserName: req.UserName,
	}
	data, err := service.GfToken().GenerateToken(ctx, key, userInfo)
	if err != nil {
		return
	}

	res = new(meeting.LoginRes)
	res.Token = data
	return
}
