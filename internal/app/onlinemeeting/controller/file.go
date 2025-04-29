package controller

import (
	"context"

	"github.com/gogf/gf/v2/errors/gerror"
	"github.com/tiger1103/gfast/v3/api/v1/meeting"
	"github.com/tiger1103/gfast/v3/internal/app/onlinemeeting/service"
)

type fileController struct{}

var FileController = new(fileController)

// Upload 文件上传接口
func (c *fileController) Upload(ctx context.Context, req *meeting.FileUploadReq) (res *meeting.FileUploadRes, err error) {
	exists, err := service.Meeting().CheckMeetingExists(ctx, req.RoomNumber)
	if err != nil {
		return nil, err
	}
	if !exists {
		return nil, gerror.New("会议不存在，无法上传文件")
	}

	res, err = service.File().Upload(ctx, req)

	return
}

func (c *fileController) Delete(ctx context.Context, req *meeting.FileDeleteReq) (res *meeting.FileDeleteRes, err error) {
	res = new(meeting.FileDeleteRes)
	err = service.File().Delete(ctx, req.ID, req.DeletorID, req.DeletorName)
	return
}

func (c *fileController) Download(ctx context.Context, req *meeting.FileDownloadReq) (res *meeting.FileDownloadRes, err error) {
	res, err = service.File().Download(ctx, req.ID)
	return
}

func (c *fileController) List(ctx context.Context, req *meeting.FileListReq) (res *meeting.FileListRes, err error) {
	res, err = service.File().ListByRoom(ctx, req)
	return
}
