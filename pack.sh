#!/bin/bash

echo "编译可执行文件...."
go build

echo "开始打包..."
# tar -czvf gfast.tar gfast-mandate 
cd .. && zip -r gfast.zip gfast-mandate