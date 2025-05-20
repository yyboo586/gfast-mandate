package meeting

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gtime"
	"github.com/tiger1103/gfast/v3/api/v1/common"
)

type FileUploadReq struct {
	g.Meta `path:"/file_upload" method:"post" mime:"multipart/form-data" tags:"会议管理" summary:"上传文件" `
	common.Author
	File         *ghttp.UploadFile `type:"file" v:"required" dc:"File to upload"`
	RoomNumber   string            `v:"required#会议ID必须" dc:"会议ID"`
	UploaderID   string            `v:"required#上传者ID必须" dc:"上传者ID"`
	UploaderName string            `v:"required#上传者名称必须" dc:"上传者名称"`
}

type FileUploadRes struct {
	ID string
}

type FileDownloadReq struct {
	g.Meta `path:"/file_download" method:"get" tags:"会议管理" summary:"下载文件" `
	common.Author
	ID int64 `v:"required#文件ID必须" dc:"文件ID"`
}

type FileDownloadRes struct {
	FilePath string
}

type FileDeleteReq struct {
	g.Meta `path:"/file_delete" method:"delete" tags:"会议管理" summary:"删除文件"`
	common.Author
	ID int64 `p:"id" v:"required#文件ID必须" dc:"文件ID"`
	// DeletorID   string `v:"required#删除者ID必须" dc:"删除者ID"`
	// DeletorName string `v:"required#删除者名称必须" dc:"删除者名称"`
}

type FileDeleteRes struct {
	common.EmptyRes
}

type FileListReq struct {
	g.Meta `path:"/file_list" tags:"会议管理" method:"get" summary:"获取单场会议的所有文件"`
	common.Author
	common.PageReq
	RoomNumber string `v:"required#会议ID必须" dc:"会议ID"`
}

type FileEntity struct {
	ID           string
	FileName     string
	FileSize     uint32
	UploaderID   string
	UploaderName string
	UploadTime   *gtime.Time
}

type FileListRes struct {
	List []*FileEntity
	common.ListRes
}
