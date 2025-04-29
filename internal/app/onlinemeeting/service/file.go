package service

import (
	"context"

	"github.com/tiger1103/gfast/v3/api/v1/meeting"
)

type IFile interface {
	Upload(ctx context.Context, req *meeting.FileUploadReq) (res *meeting.FileUploadRes, err error)
	ListByRoom(ctx context.Context, req *meeting.FileListReq) (res *meeting.FileListRes, err error)
	Delete(ctx context.Context, id int64, deletorID, deletorName string) (err error)
	Download(ctx context.Context, id int64) (res *meeting.FileDownloadRes, err error)
}

var localFile IFile

func File() IFile {
	if localFile == nil {
		panic("implement not found for interface ISqmeeting, forgot register?")
	}
	return localFile
}

func RegisterFile(i IFile) {
	localFile = i
}
