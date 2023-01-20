package controller

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/tiger1103/gfast/v3/api/v1/system"
	"github.com/tiger1103/gfast/v3/internal/app/common/consts"
	"github.com/tiger1103/gfast/v3/internal/app/common/service"
)

var Upload = new(uploadController)

type uploadController struct{}

// 上传单图
func (c *uploadController) SingleImg(ctx context.Context, req *system.UploadSingleImgReq) (res *system.UploadSingleRes, err error) {
	file := req.File
	v, _ := g.Cfg().Get(ctx, "upload.default")
	response, err := service.Upload().UploadFile(ctx, file, consts.CheckFileTypeImg, v.Int())
	if err != nil {
		return
	}
	res = &system.UploadSingleRes{
		UploadResponse: response,
	}
	// 上传第三方
	return
}

// 上传多图
func (c *uploadController) MultipleImg(ctx context.Context, req *system.UploadMultipleImgReq) (res *system.UploadMultipleRes, err error) {
	files := req.File
	v, _ := g.Cfg().Get(ctx, "upload.default")
	mf, err := service.Upload().UploadFiles(ctx, files, consts.CheckFileTypeImg, v.Int())
	if err != nil {
		return
	}
	res = &mf
	return
}

// 上传单文件
func (c *uploadController) SingleFile(ctx context.Context, req *system.UploadSingleFileReq) (res *system.UploadSingleRes, err error) {
	file := req.File
	v, _ := g.Cfg().Get(ctx, "upload.default")
	response, err := service.Upload().UploadFile(ctx, file, consts.CheckFileTypeFile, v.Int())
	if err != nil {
		return
	}
	res = &system.UploadSingleRes{
		UploadResponse: response,
	}
	return
}

// 上传多文件
func (c *uploadController) MultipleFile(ctx context.Context, req *system.UploadMultipleFileReq) (res *system.UploadMultipleRes, err error) {
	files := req.File
	v, _ := g.Cfg().Get(ctx, "upload.default")
	mf, err := service.Upload().UploadFiles(ctx, files, consts.CheckFileTypeFile, v.Int())
	if err != nil {
		return
	}
	res = &mf
	return
}
