#!/bin/bash

echo "编译可执行文件...."
go build

echo "开始打包..."
cd ..
tar -czvf gfast.tar gfast-mandate 