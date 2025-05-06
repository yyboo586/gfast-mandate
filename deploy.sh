#!/bin/bash

set -ex

docker run -itd --name mysql80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=12345678 mysql:latest
docker run -d --name redis -p 6379:6379 redis:latest

# 1. 部署数据库环境
echo "部署数据库环境..."
mysql -uroot -p12345678 < resource/data/gfast-v32.sql
if [ $? -ne 0 ]; then
    echo "数据库部署失败..."
    exit 1
fi
echo "数据库部署成功..."

go build -o ./bin/meetings

# select t1.room_number, t1.topic, t1.status, t1.creator_id, t2.user_id, t2.user_name, t2.role, t2.status from sq_meetings as t1 left join sq_meetings_participants t2 on t1.room_number = t2.m_room_number;