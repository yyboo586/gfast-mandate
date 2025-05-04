USE `gfast-v32mandate`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `sq_meetings`;
CREATE TABLE `sq_meetings` (
    `id` bigint(20) AUTO_INCREMENT NOT NULL COMMENT '主键ID',
    `room_number` varchar(9) NOT NULL COMMENT '会议ID', -- 暂定生成9位随机数
    `topic` varchar(30) NOT NULL COMMENT '会议主题', -- 限制30个字符以内
    `mode` tinyint(1) NOT NULL COMMENT '会议模式', -- 1:漫游模式, 2:会议室模式, 3:虚拟人模式
    `distance` int COMMENT '电子围栏半径', -- 漫游模式下，多少米以内的用户自动加入会议
    `type` tinyint(1) NOT NULL COMMENT '会议类型', -- 1:即时会议, 2:预约会议
    `status` tinyint(1) NOT NULL COMMENT '会议状态', -- 1:待开始, 2:进行中, 3:已结束, 4:已取消
    `location` varchar(255) NOT NULL COMMENT '会议地点', -- 后台设置地点
    `creator_name` varchar(20) NOT NULL COMMENT '创建人名字',
    `moderator_name` varchar(20) NOT NULL COMMENT '主持人名字', -- 通过创建人选择
    `description` varchar(100) NOT NULL COMMENT '会议描述信息', -- 限制100个字符以内
    `recording_enabled` tinyint DEFAULT 0 COMMENT '是否开启会议录制',
    `create_time` datetime NOT NULL DEFAULT NOW() COMMENT '会议创建时间',
    `start_time` datetime NOT NULL COMMENT '会议开始时间', -- 预约会议最长3个月
    `end_time` datetime COMMENT '会议结束时间', -- 根据实际结束时间设置
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_room_number` (`room_number`),
    KEY `idx_topic` (`topic`)
) COMMENT='会议信息表';

DROP TABLE IF EXISTS `sq_meetings_participants`;
CREATE TABLE `sq_meetings_participants` (
    `id` bigint(20) AUTO_INCREMENT NOT NULL COMMENT '主键ID',
    `mid` varchar(9) NOT NULL COMMENT '会议ID, 关联sx_meetings表room_number字段',
    `user_name` varchar(255) NOT NULL COMMENT '被邀请的用户名字',
    -- `role` tinyint(1) NOT NULL COMMENT '角色, 1:主持人, 2:观众',
    -- `device_type` tinyint(1) NOT NULL COMMENT '设备类型, 1:PC, 2:移动端',
    -- `invite_method` tinyint(1) NOT NULL COMMENT '邀请方式, 1:邮件邀请, 2:短信邀请, 3:手机号邀请',
    `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '邀请状态, 0:待处理, 1:已接受, 2:已拒绝',
    `update_time` datetime COMMENT '更新时间',
    `join_time` datetime COMMENT '加入时间',
    `exit_time` datetime COMMENT '退出时间',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`mid`) REFERENCES `sq_meetings`(`room_number`) ON DELETE CASCADE,
    UNIQUE KEY `idx_mid_user_id` (`mid`, `user_name`),
    KEY `idx_user_name` (`user_name`)
)COMMENT='会议参与者表';

-- DROP TABLE IF EXISTS `sq_meetings_recordings`;
-- CREATE TABLE `sq_meeting_recordings` (
--     `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
--     `mid` BIGINT NOT NULL,
--     `file_path` VARCHAR(255) NOT NULL,
--     `start_time` DATETIME NOT NULL,
--     `end_time` DATETIME NOT NULL,
--     `file_size` INT COMMENT '文件大小(MB)',
--     FOREIGN KEY (`mid`) REFERENCES `sq_meetings`(`id`)
-- );

SET FOREIGN_KEY_CHECKS = 1;
