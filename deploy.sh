#!/bin/bash

set -ex

# 1. 部署数据库环境
echo "部署数据库环境..."
mysql -uroot -p12345678 < resource/data/gfast-v32.sql
if [ $? -ne 0 ]; then
    echo "数据库部署失败..."
    exit 1
fi
echo "数据库部署成功..."