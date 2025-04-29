-- MySQL dump 10.13  Distrib 9.3.0, for Linux (x86_64)
--
-- Host: localhost    Database: OnlineMeeting
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE OnlineMeeting DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;
USE OnlineMeeting;

--
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casbin_rule` (
  `ptype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v0` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v3` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v4` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v5` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
INSERT INTO `casbin_rule` VALUES ('g','u_1','1','','','',''),('g','u_43','1','','','',''),('p','1','27','All','','',''),('p','1','28','All','','',''),('p','1','29','All','','',''),('p','1','30','All','','',''),('p','1','1','All','','',''),('p','1','2','All','','',''),('p','1','3','All','','',''),('p','1','4','All','','',''),('p','1','11','All','','',''),('p','1','10','All','','',''),('p','1','12','All','','',''),('p','1','13','All','','',''),('p','1','14','All','','',''),('p','1','15','All','','',''),('p','1','19','All','','',''),('p','1','20','All','','',''),('p','1','21','All','','',''),('p','1','22','All','','',''),('p','1','23','All','','',''),('p','1','24','All','','',''),('p','1','25','All','','',''),('p','1','26','All','','',''),('p','1','31','All','','',''),('p','1','32','All','','',''),('p','1','34','All','','',''),('p','1','38','All','','',''),('p','1','39','All','','',''),('p','1','35','All','','',''),('p','1','33','All','','',''),('p','1','36','All','','',''),('p','1','37','All','','',''),('p','1','53','All','','',''),('p','1','54','All','','',''),('p','1','55','All','','',''),('p','1','56','All','','',''),('p','1','57','All','','',''),('p','1','58','All','','',''),('p','1','17','All','','',''),('p','1','16','All','','',''),('p','1','18','All','','',''),('p','9','27','All','','',''),('p','9','28','All','','',''),('p','9','29','All','','',''),('p','9','30','All','','',''),('p','9','1','All','','',''),('p','9','2','All','','',''),('p','9','3','All','','',''),('p','9','4','All','','',''),('p','9','11','All','','',''),('p','9','10','All','','',''),('p','9','12','All','','',''),('p','9','13','All','','',''),('p','9','14','All','','',''),('p','9','15','All','','',''),('p','9','19','All','','',''),('p','9','20','All','','',''),('p','9','21','All','','',''),('p','9','22','All','','',''),('p','9','23','All','','',''),('p','9','24','All','','',''),('p','9','25','All','','',''),('p','9','26','All','','',''),('g','u_5','2','','','',''),('g','u_31','2','','','',''),('g','u_6','2','','','',''),('g','u_16','2','','','',''),('g','u_3','2','','','',''),('p','2','1','All','','',''),('p','2','2','All','','',''),('p','2','3','All','','',''),('p','2','4','All','','',''),('p','2','11','All','','',''),('p','2','10','All','','',''),('p','2','12','All','','',''),('p','2','13','All','','',''),('p','2','14','All','','',''),('p','2','114','All','','',''),('p','2','115','All','','',''),('p','2','15','All','','',''),('p','2','19','All','','',''),('p','2','20','All','','',''),('p','2','21','All','','',''),('p','2','22','All','','',''),('p','2','23','All','','',''),('p','2','24','All','','',''),('p','2','25','All','','',''),('p','2','26','All','','',''),('p','2','116','All','','',''),('p','2','117','All','','',''),('p','2','118','All','','',''),('p','2','119','All','','',''),('p','2','31','All','','',''),('p','2','32','All','','',''),('p','2','34','All','','',''),('p','2','33','All','','',''),('g','u_10','2','','','','');
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_auth_rule`
--

DROP TABLE IF EXISTS `sys_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_auth_rule` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int NOT NULL DEFAULT '0' COMMENT '权重',
  `is_hide` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '显示状态',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_link` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `is_iframe` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否内嵌iframe',
  `is_cached` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否缓存',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由重定向地址',
  `is_affix` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否固定',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='菜单节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_auth_rule`
--

LOCK TABLES `sys_auth_rule` WRITE;
/*!40000 ALTER TABLE `sys_auth_rule` DISABLE KEYS */;
INSERT INTO `sys_auth_rule` VALUES 
(1,0,'api/v1/system/auth','权限管理','ele-Stamp','','',0,30,0,'/system/auth','layout/routerView/parent',0,'',0,0,1,'0',0,'','2022-03-24 15:03:37','2022-04-14 16:29:19'),
(2,1,'api/v1/system/auth/menuList','菜单管理','ele-Calendar','','',1,0,0,'/system/auth/menuList','system/menu/index',0,'',0,0,1,'',0,'','2022-03-24 17:24:13','2022-03-29 10:54:49'),
(3,2,'api/v1/system/menu/add','添加菜单','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2022-03-29 16:48:43','2022-03-29 17:05:19'),
(4,2,'api/v1/system/menu/update','修改菜单','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2022-03-29 17:04:25','2022-03-29 18:11:36'),
(10,1,'api/v1/system/role/list','角色管理','iconfont icon-juxingkaobei','','',1,0,0,'/system/auth/roleList','system/role/index',0,'',0,0,1,'',0,'','2022-03-29 18:15:03','2022-03-30 10:25:34'),
(11,2,'api/v1/system/menu/delete','删除菜单','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2022-04-06 14:49:10','2022-04-06 14:49:17'),
(12,10,'api/v1/system/role/add','添加角色','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2022-04-06 14:49:46','2022-04-06 14:49:46'),
(13,10,'/api/v1/system/role/edit','修改角色','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2022-04-06 14:50:08','2022-04-06 14:50:08'),
(14,10,'/api/v1/system/role/delete','删除角色','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2022-04-06 14:50:22','2022-04-06 14:50:22'),
(15,1,'api/v1/system/dept/list','部门管理','iconfont icon-siweidaotu','','',1,0,0,'/system/auth/deptList','system/dept/index',0,'',0,0,1,'',0,'','2022-04-06 14:52:23','2022-04-07 22:59:20'),
(26,1,'api/v1/system/user/list','用户管理','ele-User','','',1,0,0,'/system/auth/user/list','system/user/index',0,'',0,0,1,'',0,'','2022-04-09 14:19:10','2022-04-09 14:19:58'),
-- (27,0,'api/v1/system/dict','系统配置','iconfont icon-shuxingtu','','',0,40,0,'/system/dict','layout/routerView/parent',0,'',0,0,1,'654',0,'','2022-04-14 16:28:51','2022-04-18 14:40:56'),
-- (28,27,'api/v1/system/dict/type/list','字典管理','iconfont icon-crew_feature','','',1,0,0,'/system/dict/type/list','system/dict/index',0,'',0,0,1,'',0,'','2022-04-14 16:32:10','2022-04-16 17:02:50'),
-- (29,27,'api/v1/system/dict/dataList','字典数据管理','iconfont icon-putong','','',1,0,1,'/system/dict/data/list/:dictType','system/dict/dataList',0,'',0,0,1,'',0,'','2022-04-18 12:04:17','2022-04-18 14:58:43'),
-- (30,27,'api/v1/system/config/list','参数管理','ele-Cherry','','',1,0,0,'/system/config/list','system/config/index',0,'',0,0,1,'',0,'','2022-04-18 21:05:20','2022-04-18 21:13:19'),
(31,0,'api/v1/system/monitor','系统监控','iconfont icon-xuanzeqi','','',0,30,0,'/system/monitor','layout/routerView/parent',0,'',0,0,1,'',0,'','2022-04-19 10:40:19','2022-04-19 10:44:38'),
(32,31,'api/v1/system/monitor/server','服务监控','iconfont icon-shuju','','',1,0,0,'/system/monitor/server','system/monitor/server/index',0,'',0,0,1,'',0,'','2022-04-19 10:43:32','2022-04-19 10:44:47'),
-- (33,35,'api/swagger','API文档','iconfont icon--chaifenlie','','',1,0,0,'/system/swagger','layout/routerView/iframes',1,'',0,1,1,'',0,'http://localhost:8808/swagger','2022-04-21 09:23:43','2022-11-29 17:10:35'),
(34,31,'api/v1/system/loginLog/list','登录日志','ele-Finished','','',1,0,0,'/system/monitor/loginLog','system/monitor/loginLog/index',0,'',0,0,1,'',0,'','2022-04-28 09:59:47','2022-04-28 09:59:47'),
-- (35,0,'api/v1/system/tools','系统工具','iconfont icon-zujian','','',0,25,0,'/system/tools','layout/routerView/parent',0,'',0,0,1,'',0,'','2022-10-26 09:29:08','2022-10-26 10:11:25'),
(38,31,'api/v1/system/operLog/list','操作日志','iconfont icon-bolangnengshiyanchang','','',1,0,0,'/system/monitor/operLog','system/monitor/operLog/index',0,'',0,0,1,'',0,'','2022-12-23 16:19:05','2022-12-23 16:21:50'),
(39,31,'api/v1/system/online/list','在线用户','iconfont icon-skin','','',1,0,0,'/system/monitor/userOnlie','system/monitor/userOnline/index',0,'',0,0,1,'',0,'','2023-01-11 15:48:06','2023-01-11 17:02:39'),
-- (53,35,'api/v1/system/sysJob/list','定时任务','fa fa-superpowers','','',1,0,0,'/system/sysJob/list','system/sysJob/list/index',0,'sys_admin',0,0,1,'',0,'',NULL,'2023-01-12 17:51:27'),
(54,53,'api/v1/system/sysJob/get','定时任务查询','','','定时任务查询',2,0,0,'','',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),(55,53,'api/v1/system/sysJob/add','定时任务添加','','','定时任务添加',2,0,0,'','',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),
(56,53,'api/v1/system/sysJob/edit','定时任务修改','','','定时任务修改',2,0,0,'','',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),(57,53,'api/v1/system/sysJob/delete','定时任务删除','','','定时任务删除',2,0,0,'','',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),
(58,53,'api/v1/system/sysJob/run','执行一次','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2023-01-12 18:20:13','2023-01-12 18:20:13'),(114,10,'api/v1/system/role/dataScope','授权数据权限','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2024-04-11 11:18:23','2024-04-11 11:19:17'),
(115,10,'api/v1/system/role/setRoleUser','授权用户权限','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2024-04-11 11:18:59','2024-04-11 11:18:59'),
(116,26,'api/v1/system/user/add','新增用户','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2024-04-11 11:16:14','2024-04-11 11:16:14'),
(117,26,'api/v1/system/user/edit','修改用户','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2024-04-11 11:16:45','2024-04-11 11:19:25'),
(118,26,'api/v1/system/user/getEdit','用户信息','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2024-04-11 11:17:21','2024-04-11 11:19:30'),
(119,26,'api/v1/system/user/delete','删除用户','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2024-04-11 11:17:39','2024-04-11 11:19:34'),
(141,26,'api/v1/system/user/all','管理所有','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2024-09-13 16:57:13','2024-09-13 16:57:13'),
(142,15,'api/v1/system/dept/all','管理所有','','','',2,0,0,'','',0,'',0,0,1,'',0,'','2024-09-13 16:57:49','2024-09-13 16:57:49'),
(152,0,'api/v1/system/tMeeting','会议管理','iconfont icon-fuwenbenkuang','','会议管理',0,0,0,'/system/tMeeting','layout/routerView/parent',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),
(153,152,'api/v1/system/tMeeting/list','会议列表','ele-Fold','','会议列表',1,0,0,'/system/tMeeting/list','system/tMeeting/list/index',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),
(154,153,'api/v1/system/tMeeting/get','查询会议','','','查询会议',2,0,0,'','',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),
(155,153,'api/v1/system/tMeeting/add','创建会议','','','创建会议',2,0,0,'','',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),
(156,153,'api/v1/system/tMeeting/edit','修改会议','','','修改会议',2,0,0,'','',0,'sys_admin',0,0,1,'',0,'',NULL,NULL),
(157,153,'api/v1/system/tMeeting/delete','删除会议','','','删除会议',2,0,0,'','',0,'sys_admin',0,0,1,'',0,'',NULL,NULL);
/*!40000 ALTER TABLE `sys_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) DEFAULT '0' COMMENT '系统内置（Y是 N否）',
  `create_by` int unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE KEY `uni_config_key` (`config_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'文件上传-文件大小','sys.uploadFile.fileSize','50M',1,31,31,'文件上传大小限制',NULL,'2021-07-06 14:57:35'),(2,'文件上传-文件类型','sys.uploadFile.fileType','doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png,mp4',1,31,31,'文件上传后缀类型限制',NULL,'2022-12-16 09:52:45'),(3,'图片上传-图片类型','sys.uploadFile.imageType','jpg,jpeg,gif,npm,png',1,31,0,'图片上传后缀类型限制',NULL,NULL),(4,'图片上传-图片大小','sys.uploadFile.imageSize','50M',1,31,31,'图片上传大小限制',NULL,NULL),(11,'静态资源','static.resource','/',1,2,0,'',NULL,NULL);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` tinyint unsigned DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint unsigned DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint DEFAULT NULL COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认（1是 0否）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（1正常 0停用）',
  `create_by` bigint unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` bigint unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,0,'男','1','sys_user_sex','','',0,1,31,2,'备注信息','2022-04-18 16:46:22','2023-08-21 15:07:21'),(2,0,'女','2','sys_user_sex','','',0,1,31,31,'备注信息',NULL,'2023-08-21 15:07:21'),(3,0,'保密','0','sys_user_sex','','',1,1,31,31,'备注信息',NULL,'2023-08-21 15:10:28'),(24,0,'频道页','1','cms_category_type','','',0,1,31,31,'作为频道页，不可作为栏目发布文章，可添加下级分类',NULL,'2021-07-21 10:54:22'),(25,0,'发布栏目','2','cms_category_type','','',0,1,31,31,'作为发布栏目，可添加文章',NULL,'2021-07-21 10:54:22'),(26,0,'跳转栏目','3','cms_category_type','','',0,1,31,31,'不直接发布内容，用于跳转页面',NULL,'2021-07-21 10:54:22'),(27,0,'单页栏目','4','cms_category_type','','',0,1,31,31,'单页面模式，分类直接显示为文章',NULL,'2021-07-21 10:54:22'),(28,0,'正常','0','sys_job_status','','default',1,1,31,0,'',NULL,NULL),(29,0,'暂停','1','sys_job_status','','default',0,1,31,31,'',NULL,NULL),(30,0,'默认','DEFAULT','sys_job_group','','default',1,1,31,0,'',NULL,NULL),(31,0,'系统','SYSTEM','sys_job_group','','default',0,1,31,0,'',NULL,NULL),(32,0,'成功','1','admin_login_status','','default',0,1,31,31,'',NULL,'2022-09-16 15:26:01'),(33,0,'失败','0','admin_login_status','','default',0,1,31,0,'',NULL,'2022-09-16 15:26:01'),(34,0,'成功','1','sys_oper_log_status','','default',0,1,31,0,'',NULL,NULL),(35,0,'失败','0','sys_oper_log_status','','default',0,1,31,0,'',NULL,NULL),(36,0,'重复执行','1','sys_job_policy','','default',1,1,31,0,'',NULL,NULL),(37,0,'执行一次','2','sys_job_policy','','default',1,1,31,0,'',NULL,NULL),(38,0,'显示','0','sys_show_hide',NULL,'default',1,1,31,0,NULL,NULL,NULL),(39,0,'隐藏','1','sys_show_hide',NULL,'default',0,1,31,0,NULL,NULL,NULL),(40,0,'正常','1','sys_normal_disable','','default',1,1,31,0,'',NULL,NULL),(41,0,'停用','0','sys_normal_disable','','default',0,1,31,0,'',NULL,NULL),(49,0,'是','1','sys_yes_no','','',1,1,31,0,'',NULL,NULL),(50,0,'否','0','sys_yes_no','','',0,1,31,0,'',NULL,NULL),(51,0,'已发布','1','cms_article_pub_type','','',1,1,31,31,'',NULL,NULL),(54,0,'未发布','0','cms_article_pub_type','','',0,1,31,0,'',NULL,NULL),(55,0,'置顶','1','cms_article_attr','','',0,1,31,0,'',NULL,NULL),(56,0,'推荐','2','cms_article_attr','','',0,1,31,0,'',NULL,NULL),(57,0,'普通文章','0','cms_article_type','','',0,1,31,31,'',NULL,NULL),(58,0,'跳转链接','1','cms_article_type','','',0,1,31,31,'',NULL,NULL),(59,0,'cms模型','6','cms_cate_models','','',0,1,1,1,'',NULL,NULL),(61,0,'政府工作目标','1','gov_cate_models','','',0,1,2,0,'',NULL,NULL),(62,0,'系统后台','sys_admin','menu_module_type','','',1,1,2,0,'',NULL,NULL),(63,0,'政务工作','gov_work','menu_module_type','','',0,1,2,0,'',NULL,NULL),(64,0,'幻灯','3','cms_article_attr','','',0,1,31,0,'',NULL,NULL),(65,0,'[work]测试业务表','wf_news','flow_type','','',0,1,2,2,'',NULL,NULL),(66,0,'回退修改','-1','flow_status','','',0,1,31,0,'',NULL,NULL),(67,0,'保存中','0','flow_status','','',0,1,31,0,'',NULL,NULL),(68,0,'流程中','1','flow_status','','',0,1,31,0,'',NULL,NULL),(69,0,'审批通过','2','flow_status','','',0,1,31,2,'',NULL,NULL),(70,2,'发布栏目','2','sys_blog_sign','','',0,1,31,31,'',NULL,NULL),(71,3,'跳转栏目','3','sys_blog_sign','','',0,1,31,31,'',NULL,NULL),(72,4,'单页栏目','4','sys_blog_sign','','',0,1,31,31,'',NULL,NULL),(73,2,'置顶','1','sys_log_sign','','',0,1,31,31,'',NULL,NULL),(74,3,'幻灯','2','sys_log_sign','','',0,1,31,31,'',NULL,NULL),(75,4,'推荐','3','sys_log_sign','','',0,1,31,31,'',NULL,NULL),(76,1,'一般','0','sys_log_sign','','',0,1,31,31,'',NULL,NULL),(77,1,'频道页','1','sys_blog_sign','','',0,1,31,31,'',NULL,NULL),(78,0,'普通','0','flow_level','','',0,1,31,0,'',NULL,'2021-07-20 08:55:20'),(79,0,'加急','1','flow_level','','',0,1,31,0,'',NULL,'2021-07-20 08:55:20'),(80,0,'紧急','2','flow_level','','',0,1,31,0,'',NULL,'2021-07-20 08:55:20'),(81,0,'特急','3','flow_level','','',0,1,31,31,'',NULL,'2021-07-20 08:55:25'),(82,0,'频道页','1','sys_blog_type','','',0,1,31,0,'',NULL,NULL),(83,0,'发布栏目','2','sys_blog_type','','',0,1,31,0,'',NULL,NULL),(84,0,'跳转栏目','3','sys_blog_type','','',0,1,31,31,'',NULL,NULL),(85,0,'单页栏目','4','sys_blog_type','','',0,1,31,0,'',NULL,NULL),(87,0,'[cms]文章表','cms_news','flow_type','','',0,1,31,0,'',NULL,NULL),(91,0,'测试一下','666','cms_article_type','','',0,1,31,0,'','2021-08-03 17:04:12','2021-08-03 17:04:12'),(92,0,'缓存测试222','33333','cms_article_type','','',0,1,31,31,'','2021-08-03 17:16:45','2021-08-03 17:19:41'),(93,0,'缓存测试222','11111','cms_article_type','','',0,1,31,31,'','2021-08-03 17:26:14','2021-08-03 17:26:26'),(94,0,'1折','10','plugin_store_discount','','',0,1,31,0,'','2021-08-14 11:59:38','2021-08-14 11:59:38'),(95,0,'5折','50','plugin_store_discount','','',0,1,31,0,'','2021-08-14 11:59:49','2021-08-14 11:59:49'),(96,0,'8折','80','plugin_store_discount','','',0,1,31,0,'','2021-08-14 12:00:00','2021-08-14 12:00:00'),(97,0,'9折','90','plugin_store_discount','','',0,1,31,0,'','2021-08-14 12:00:07','2021-08-14 12:00:07'),(98,0,'无折扣','100','plugin_store_discount','','',0,1,31,0,'','2021-08-14 12:00:16','2021-08-14 12:00:16'),(99,0,'不显示','none','cms_nav_position','','',1,1,22,0,'','2021-08-31 15:37:35','2021-08-31 15:37:35'),(100,0,'顶部导航','top','cms_nav_position','','',0,1,22,0,'','2021-08-31 15:37:57','2021-08-31 15:37:57'),(101,0,'底部导航','bottom','cms_nav_position','','',0,1,22,0,'','2021-08-31 15:38:08','2021-08-31 15:38:08'),(102,0,'读取','GET','sys_oper_log_type','','',0,1,31,31,'','2022-12-21 11:59:10','2022-12-23 19:03:02'),(103,0,'新增','POST','sys_oper_log_type','','',0,1,31,31,'','2022-12-21 11:59:22','2022-12-23 19:03:10'),(104,0,'修改','PUT','sys_oper_log_type','','',0,1,31,31,'','2022-12-21 11:59:32','2022-12-23 19:03:19'),(105,0,'删除','DELETE','sys_oper_log_type','','',0,1,31,31,'','2022-12-21 11:59:44','2022-12-23 19:03:27'),(106,0,'无标签','0','notice_tag','','',0,1,31,31,'','2023-12-28 15:48:45','2023-12-28 15:52:14'),(107,0,'提醒','1','notice_tag','','',0,1,31,31,'','2023-12-28 15:48:54','2023-12-28 15:52:24'),(108,0,'一般','2','notice_tag','','',0,1,31,0,'','2023-12-28 15:52:35','2023-12-28 15:52:35'),(109,0,'次要','3','notice_tag','','',0,1,31,0,'','2023-12-28 15:52:44','2023-12-28 15:52:44'),(110,0,'重要','4','notice_tag','','',0,1,31,0,'','2023-12-28 15:52:53','2023-12-28 15:52:53'),(111,0,'紧急','5','notice_tag','','',0,1,31,0,'','2023-12-28 15:53:01','2023-12-28 15:53:01'),(112,0,'本地上传','0','sys_upload_drive','','',0,1,31,0,'','2024-10-23 14:37:27','2024-10-23 14:37:27'),(113,0,'腾讯云','1','sys_upload_drive','','',0,1,31,31,'','2024-10-23 14:37:38','2024-10-23 14:38:05'),(114,0,'七牛云','2','sys_upload_drive','','',0,1,31,31,'','2024-10-23 14:37:52','2024-10-23 14:38:43'),(115,0,'阿里云','3','sys_upload_drive','','',0,1,31,31,'','2024-10-23 14:38:11','2024-10-23 14:38:49'),(116,0,'图片','image','sys_upload_file_type','','',0,1,31,0,'','2024-10-23 14:54:18','2024-10-23 14:54:18'),(117,0,'文档','doc','sys_upload_file_type','','',0,1,31,0,'','2024-10-23 14:54:32','2024-10-23 14:54:32'),(118,0,'音频','audio','sys_upload_file_type','','',0,1,31,0,'','2024-10-23 14:54:55','2024-10-23 14:54:55'),(119,0,'视频','video','sys_upload_file_type','','',0,1,31,0,'','2024-10-23 14:55:09','2024-10-23 14:55:09'),(120,0,'压缩包','zip','sys_upload_file_type','','',0,1,31,0,'','2024-10-23 14:55:22','2024-10-23 14:55:22'),(121,0,'其它','other','sys_upload_file_type','','',0,1,31,0,'','2024-10-23 14:55:40','2024-10-23 14:55:40');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` tinyint unsigned DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` int unsigned DEFAULT '0' COMMENT '创建者',
  `update_by` int unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex',1,31,31,'用于选择用户性别',NULL,'2023-08-21 15:07:21'),(2,'分类类型','cms_category_type',1,31,3,'文章分类类型',NULL,'2021-07-21 10:54:22'),(3,'任务状态','sys_job_status',1,31,31,'任务状态列表',NULL,NULL),(13,'任务分组','sys_job_group',1,31,0,'',NULL,NULL),(14,'管理员登录状态','admin_login_status',1,31,31,'',NULL,'2022-09-16 15:26:01'),(15,'操作日志状态','sys_oper_log_status',1,31,0,'',NULL,NULL),(16,'任务策略','sys_job_policy',1,31,0,'',NULL,NULL),(17,'菜单状态','sys_show_hide',1,31,0,'菜单状态',NULL,NULL),(18,'系统开关','sys_normal_disable',1,31,31,'系统开关',NULL,NULL),(24,'系统内置','sys_yes_no',1,31,0,'',NULL,NULL),(25,'文章发布状态','cms_article_pub_type',1,31,0,'',NULL,NULL),(26,'文章附加状态','cms_article_attr',1,31,0,'',NULL,NULL),(27,'文章类型','cms_article_type',1,31,0,'',NULL,NULL),(28,'文章栏目模型分类','cms_cate_models',1,1,0,'',NULL,NULL),(29,'政务工作模型分类','gov_cate_models',1,2,0,'',NULL,NULL),(30,'菜单模块类型','menu_module_type',1,2,0,'',NULL,NULL),(31,'工作流程类型','flow_type',1,2,0,'',NULL,NULL),(32,'工作流程审批状态','flow_status',1,31,0,'工作流程审批状态',NULL,NULL),(33,'博客分类类型','sys_blog_type',1,31,31,'博客分类中的标志',NULL,NULL),(34,'博客日志标志','sys_log_sign',1,31,0,'博客日志管理中的标志数据字典',NULL,NULL),(35,'工作流紧急状态','flow_level',1,31,31,'',NULL,'2021-07-20 08:55:20'),(48,'插件商城折扣','plugin_store_discount',1,31,0,'','2021-08-14 11:59:26','2021-08-14 11:59:26'),(49,'CMS栏目导航位置','cms_nav_position',1,22,0,'','2021-08-31 15:37:04','2021-08-31 15:37:04'),(50,'操作日志类型','sys_oper_log_type',1,31,0,'','2022-12-21 11:55:02','2022-12-21 11:55:02'),(51,'系统公告标签','notice_tag',1,31,0,'','2023-12-28 15:48:03','2023-12-28 15:48:03'),(52,'附件上传驱动','sys_upload_drive',1,31,31,'','2024-10-23 14:36:17','2024-10-23 14:36:30'),(53,'上传文件类型','sys_upload_file_type',1,31,0,'','2024-10-23 14:53:50','2024-10-23 14:53:50');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint DEFAULT '1' COMMENT '计划执行策略（1多次执行 2执行一次）',
  `concurrent` tinyint DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` tinyint DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `created_by` bigint unsigned DEFAULT '0' COMMENT '创建者',
  `updated_by` bigint unsigned DEFAULT '0' COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE KEY `invoke_target` (`invoke_target`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (8,'在线用户定时更新','','DEFAULT','checkUserOnline','5 */10 * * * ?',1,0,0,2,1,'','2021-07-19 08:57:24','2021-07-19 08:57:24');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `target_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '方法名',
  `created_at` datetime DEFAULT NULL COMMENT '执行日期',
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行结果',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
INSERT INTO `sys_job_log` VALUES (335,'checkUserOnline','2025-05-14 13:00:06','在线用户定时更新，执行成功'),(336,'checkUserOnline','2025-05-14 13:10:06','在线用户定时更新，执行成功');
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_log`
--

DROP TABLE IF EXISTS `sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_login_log` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` tinyint DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_log`
--

LOCK TABLES `sys_login_log` WRITE;
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
INSERT INTO `sys_login_log` VALUES (8,'demo','::1','内网IP','Chrome','Windows 10',1,'登录成功','2025-05-14 12:56:30','系统后台');
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标题',
  `type` bigint NOT NULL COMMENT '类型',
  `tag` int DEFAULT NULL COMMENT '标签',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '内容',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_by` bigint DEFAULT NULL COMMENT '发送人',
  `updated_by` bigint DEFAULT '0' COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `receiver` json DEFAULT NULL COMMENT '接收者（私信）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='通知公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'测试001',1,2,'<p>666666666</p>','',0,1,31,31,'2024-01-02 17:46:59','2024-05-06 17:46:42',NULL,NULL),(2,'测试私信',2,3,'<p>888888888888</p>','',0,1,31,31,'2024-01-02 17:47:36','2024-03-18 09:04:48',NULL,'[2, 3, 31]');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_read`
--

DROP TABLE IF EXISTS `sys_notice_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice_read` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_id` bigint NOT NULL COMMENT '信息id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `clicks` int DEFAULT NULL COMMENT '点击次数',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `created_at` datetime DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `notice_id` (`notice_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='已读记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_read`
--

LOCK TABLES `sys_notice_read` WRITE;
/*!40000 ALTER TABLE `sys_notice_read` DISABLE KEYS */;
INSERT INTO `sys_notice_read` VALUES (1,1,31,0,'2024-01-02 17:47:05','2024-01-02 17:47:05');
/*!40000 ALTER TABLE `sys_notice_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (133,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:56:37'),(134,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:56:37'),(135,'',0,'/api/v1/system/tools/gen/dataList','GET',1,'demo','','/api/v1/system/tools/gen/dataList?pageNum=1&pageSize=10&tableName=&tableComment=','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:56:38'),(136,'',0,'/api/v1/system/tools/gen/dataList','GET',1,'demo','','/api/v1/system/tools/gen/dataList?pageNum=1&pageSize=10&tableName=&tableComment=','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:56:38'),(137,'',0,'/api/v1/system/tools/gen/dataList','GET',1,'demo','','/api/v1/system/tools/gen/dataList?pageNum=1&pageSize=10&tableName=&tableComment=','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:57:41'),(138,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:59:15'),(139,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:59:15'),(140,'',0,'/api/v1/system/tools/gen/dataList','GET',1,'demo','','/api/v1/system/tools/gen/dataList?pageNum=1&pageSize=10&tableName=&tableComment=','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:59:16'),(141,'',0,'/api/v1/system/tools/gen/dataList','GET',1,'demo','','/api/v1/system/tools/gen/dataList?pageNum=1&pageSize=10&tableName=&tableComment=','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:59:16'),(142,'',0,'/api/v1/system/tools/gen/importTableSave','POST',1,'demo','','/api/v1/system/tools/gen/importTableSave','::1','内网IP','{\"tables\":[\"t_meeting\"]}',NULL,'2025-05-14 12:59:20'),(143,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:59:20'),(144,'',0,'/api/v1/system/dict/type/optionSelect','GET',1,'demo','','/api/v1/system/dict/type/optionSelect','::1','内网IP','{}',NULL,'2025-05-14 12:59:23'),(145,'代码生成配置',0,'/api/v1/system/tools/gen/columnList','GET',1,'demo','','/api/v1/system/tools/gen/columnList?tableId=99','::1','内网IP','{\"tableId\":\"99\"}',NULL,'2025-05-14 12:59:23'),(146,'',0,'/api/v1/system/menu/getParams','GET',1,'demo','','/api/v1/system/menu/getParams','::1','内网IP','{}',NULL,'2025-05-14 12:59:23'),(147,'',0,'/api/v1/system/tools/gen/editSave','POST',1,'demo','','/api/v1/system/tools/gen/editSave','::1','内网IP','{\"businessName\":\"t_meeting\",\"className\":\"TMeeting\",\"columns\":[{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"ID\",\"columnId\":1043,\"columnName\":\"id\",\"columnType\":\"bigint\",\"dictType\":\"\",\"goField\":\"Id\",\"goType\":\"int64\",\"htmlField\":\"id\",\"htmlType\":\"input\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":false,\"isFixed\":false,\"isIncrement\":true,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":true,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":1,\"sortOrderEdit\":1,\"sortOrderList\":1,\"sortOrderQuery\":1,\"tableId\":99,\"tsType\":\"number\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"ID\",\"columnId\":1044,\"columnName\":\"room_number\",\"columnType\":\"char(9)\",\"dictType\":\"\",\"goField\":\"RoomNumber\",\"goType\":\"string\",\"htmlField\":\"roomNumber\",\"htmlType\":\"input\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":2,\"sortOrderEdit\":2,\"sortOrderList\":2,\"sortOrderQuery\":2,\"tableId\":99,\"tsType\":\"string\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1045,\"columnName\":\"topic\",\"columnType\":\"varchar(128)\",\"dictType\":\"\",\"goField\":\"Topic\",\"goType\":\"string\",\"htmlField\":\"topic\",\"htmlType\":\"input\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":3,\"sortOrderEdit\":3,\"sortOrderList\":3,\"sortOrderQuery\":3,\"tableId\":99,\"tsType\":\"string\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1046,\"columnName\":\"mode\",\"columnType\":\"tinyint(1)\",\"dictType\":\"\",\"goField\":\"Mode\",\"goType\":\"int\",\"htmlField\":\"mode\",\"htmlType\":\"input\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":4,\"sortOrderEdit\":4,\"sortOrderList\":4,\"sortOrderQuery\":4,\"tableId\":99,\"tsType\":\"number\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1047,\"columnName\":\"distance\",\"columnType\":\"int\",\"dictType\":\"\",\"goField\":\"Distance\",\"goType\":\"int\",\"htmlField\":\"distance\",\"htmlType\":\"input\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":5,\"sortOrderEdit\":5,\"sortOrderList\":5,\"sortOrderQuery\":5,\"tableId\":99,\"tsType\":\"number\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1048,\"columnName\":\"type\",\"columnType\":\"tinyint(1)\",\"dictType\":\"\",\"goField\":\"Type\",\"goType\":\"int\",\"htmlField\":\"type\",\"htmlType\":\"select\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":6,\"sortOrderEdit\":6,\"sortOrderList\":6,\"sortOrderQuery\":6,\"tableId\":99,\"tsType\":\"number\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1049,\"columnName\":\"status\",\"columnType\":\"tinyint(1)\",\"dictType\":\"\",\"goField\":\"Status\",\"goType\":\"int\",\"htmlField\":\"status\",\"htmlType\":\"radio\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":7,\"sortOrderEdit\":7,\"sortOrderList\":7,\"sortOrderQuery\":7,\"tableId\":99,\"tsType\":\"number\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1050,\"columnName\":\"location\",\"columnType\":\"varchar(128)\",\"dictType\":\"\",\"goField\":\"Location\",\"goType\":\"string\",\"htmlField\":\"location\",\"htmlType\":\"input\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":8,\"sortOrderEdit\":8,\"sortOrderList\":8,\"sortOrderQuery\":8,\"tableId\":99,\"tsType\":\"string\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"ID\",\"columnId\":1051,\"columnName\":\"creator_id\",\"columnType\":\"varchar(128)\",\"dictType\":\"\",\"goField\":\"CreatorId\",\"goType\":\"string\",\"htmlField\":\"creatorId\",\"htmlType\":\"input\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":9,\"sortOrderEdit\":9,\"sortOrderList\":9,\"sortOrderQuery\":9,\"tableId\":99,\"tsType\":\"string\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1052,\"columnName\":\"description\",\"columnType\":\"varchar(128)\",\"dictType\":\"\",\"goField\":\"Description\",\"goType\":\"string\",\"htmlField\":\"description\",\"htmlType\":\"input\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":10,\"sortOrderEdit\":10,\"sortOrderList\":10,\"sortOrderQuery\":10,\"tableId\":99,\"tsType\":\"string\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1053,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"CreateTime\",\"goType\":\"Time\",\"htmlField\":\"createTime\",\"htmlType\":\"datetime\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":11,\"sortOrderEdit\":11,\"sortOrderList\":11,\"sortOrderQuery\":11,\"tableId\":99,\"tsType\":\"string\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1054,\"columnName\":\"start_time\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"StartTime\",\"goType\":\"Time\",\"htmlField\":\"startTime\",\"htmlType\":\"datetime\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":true,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":12,\"sortOrderEdit\":12,\"sortOrderList\":12,\"sortOrderQuery\":12,\"tableId\":99,\"tsType\":\"string\"},{\"cascadeColumnName\":\"\",\"colSpan\":1,\"columnComment\":\"\",\"columnId\":1055,\"columnName\":\"end_time\",\"columnType\":\"datetime\",\"dictType\":\"\",\"goField\":\"EndTime\",\"goType\":\"Time\",\"htmlField\":\"endTime\",\"htmlType\":\"datetime\",\"isCascade\":false,\"isDetail\":true,\"isEdit\":true,\"isFixed\":false,\"isIncrement\":false,\"isList\":true,\"isOverflowTooltip\":false,\"isPk\":false,\"isQuery\":true,\"isRequired\":false,\"isRowStart\":false,\"linkLabelId\":\"\",\"linkLabelName\":\"\",\"linkTableBusinessName\":\"\",\"linkTableClass\":\"\",\"linkTableModuleName\":\"\",\"linkTableName\":\"\",\"linkTablePackage\":\"\",\"minWidth\":150,\"parentColumnName\":\"\",\"queryType\":\"EQ\",\"rowSpan\":1,\"sortOrderDetail\":13,\"sortOrderEdit\":13,\"sortOrderList\":13,\"sortOrderQuery\":13,\"tableId\":99,\"tsType\":\"string\"}],\"createTime\":\"2025-05-14 12:59:18\",\"excelImp\":false,\"excelPort\":false,\"functionAuthor\":\"gfast\",\"functionName\":\"会议管理\",\"menuPid\":0,\"moduleName\":\"system\",\"options\":\"\",\"overwrite\":true,\"overwriteInfo\":[{\"key\":\"api\",\"value\":true},{\"key\":\"controller\",\"value\":true},{\"key\":\"dao\",\"value\":true},{\"key\":\"dao_internal\",\"value\":true},{\"key\":\"logic\",\"value\":true},{\"key\":\"model\",\"value\":true},{\"key\":\"model_do\",\"value\":true},{\"key\":\"model_entity\",\"value\":true},{\"key\":\"router\",\"value\":true},{\"key\":\"router_func\",\"value\":true},{\"key\":\"service\",\"value\":true},{\"key\":\"sql\",\"value\":true},{\"key\":\"tsApi\",\"value\":true},{\"key\":\"tsModel\",\"value\":true},{\"key\":\"vue\",\"value\":true},{\"key\":\"vueDetail\",\"value\":true},{\"key\":\"vueEdit\",\"value\":true}],\"packageName\":\"internal/app/system\",\"remark\":\"\",\"showDetail\":false,\"sortColumn\":\"id\",\"sortType\":\"asc\",\"tableComment\":\"会议管理\",\"tableId\":99,\"tableName\":\"t_meeting\",\"tplCategory\":\"crud\",\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"updateTime\":\"2025-05-14 12:59:18\",\"useSnowId\":false,\"useVirtual\":false}',NULL,'2025-05-14 12:59:51'),(148,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:59:51'),(149,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:59:52'),(150,'',0,'/api/v1/system/tools/gen/batchGenCode','POST',1,'demo','','/api/v1/system/tools/gen/batchGenCode','::1','内网IP','{\"ids\":[99]}',NULL,'2025-05-14 12:59:55'),(151,'',0,'/api/v1/system/user/getUserMenus','GET',1,'demo','','/api/v1/system/user/getUserMenus','::1','内网IP','{}',NULL,'2025-05-14 12:59:55'),(152,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 12:59:56'),(153,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 13:00:57'),(154,'代码生成',0,'/api/v1/system/tools/gen/tableList','GET',1,'demo','','/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10','::1','内网IP','{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}',NULL,'2025-05-14 13:00:57');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_by` bigint unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `updated_by` bigint unsigned NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `list_order` int unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint unsigned NOT NULL DEFAULT '3' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `created_by` bigint unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `effectiveTime` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '角色有效日期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,0,1,0,'超级管理员','备注',2,'2022-04-01 11:38:39','2023-09-28 10:27:55',0,NULL),(2,1,1,0,'普通管理员','备注',5,'2022-04-01 11:38:39','2024-09-14 09:10:55',0,'{\"effectiveType\":0,\"weekDay\":[1,2,3,4,5],\"dayRange\":[\"2024-04-12 08:00:00\",\"2024-04-12 18:00:00\"],\"dateRange\":null}'),(3,0,1,0,'站点管理员','站点管理人员',3,'2022-04-01 11:38:39','2022-04-01 11:38:39',0,NULL),(4,5,1,0,'初级管理员','初级管理员',3,'2022-04-01 11:38:39','2024-03-18 10:16:15',0,'{\"effectiveType\":0,\"weekDay\":null,\"dayRange\":null,\"dateRange\":null}'),(5,0,1,0,'高级管理员','高级管理员',2,'2022-04-01 11:38:39','2022-04-01 11:38:39',0,NULL),(8,0,1,0,'区级管理员','',2,'2022-04-01 11:38:39','2022-04-06 09:53:40',0,NULL),(9,0,1,0,'测试','',3,'2023-04-22 12:39:13','2023-09-28 15:48:56',3,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (1,101),(1,103),(1,104),(1,105),(1,106),(1,107),(5,103),(5,104),(5,105),(8,105),(8,106);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_scope`
--

DROP TABLE IF EXISTS `sys_role_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_scope` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT 'api接口id',
  `data_scope` int NOT NULL COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `dept_ids` json DEFAULT NULL COMMENT '扩展数据',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `role_id` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色数据权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_scope`
--

LOCK TABLES `sys_role_scope` WRITE;
/*!40000 ALTER TABLE `sys_role_scope` DISABLE KEYS */;
INSERT INTO `sys_role_scope` VALUES (80,2,59,5,'[]'),(81,2,60,5,'[]'),(82,2,61,5,'[101, 103, 104, 105, 106, 107]'),(83,2,62,5,'[]'),(84,2,63,5,'[]'),(85,2,64,5,'[]'),(86,2,65,5,'[]'),(87,2,120,1,'[]'),(88,2,121,1,'[]'),(89,2,122,1,'[]'),(90,2,123,1,'[]'),(91,2,124,1,'[]'),(92,2,125,1,'[]'),(93,2,26,4,'[]'),(94,2,116,4,'[]'),(95,2,117,4,'[]'),(96,2,118,4,'[]'),(97,2,119,4,'[]'),(98,2,141,4,'[]');
/*!40000 ALTER TABLE `sys_role_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int NOT NULL DEFAULT '0' COMMENT '生日',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密盐',
  `user_status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint NOT NULL DEFAULT '1' COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信open id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_login` (`user_name`,`deleted_at`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`,`deleted_at`) USING BTREE,
  KEY `user_nickname` (`user_nickname`) USING BTREE,
  KEY `open_id` (`open_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','13578342363','超级管理员',0,'c567ae329f9929b518759d3bea13f492','f9aZTAa8yz',1,'yxh669@qq.com',1,'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-07-19/ccwpeuqz1i2s769hua.jpeg',101,'',1,'asdasfdsaf大发放打发士大夫发按时','描述信息','::1','2023-10-31 11:22:06','2021-06-22 17:58:00','2023-04-22 14:39:18',NULL,''),(31,'demo','15334455789','李四',0,'6dd68eea81e0fca319add0bd58c3fdf6','46PvWe1Sl7',1,'123@qq.com',2,'upload_file/2024-07-29/d31lsrb6o3rgmrdiih.jpg',109,'3',1,'云南省曲靖市22223','生活变的再糟糕，也不妨碍我变得更好','::1','2025-05-14 12:56:30','2021-06-22 17:58:00','2024-07-29 08:41:22',NULL,'');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_online` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` datetime DEFAULT NULL COMMENT '登录时间',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `ip` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_token` (`token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户在线状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` VALUES (5,'6a62691e9807b00e6c7bf8e4a626522f','7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO1GapHja8lTNwhoXp+Kr+1KKmZQN0lkemIY/oEzCaA19nlKc0/3Szhk5yV3n9n/YMnnPKBCX7QP7SDPmX/Ne5f0kzQQQq5lCUrTcdfJ+jZk6Q==','2025-05-14 12:56:30','demo','::1','Chrome','Windows 10');
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,2),(1,3),(2,1),(2,2),(3,2),(4,1),(5,2),(10,1),(10,2),(10,3),(10,4),(10,5),(15,4),(16,2),(22,1),(22,2),(31,2),(34,1),(35,2),(35,3),(36,1),(37,3),(38,2),(38,3),(42,2),(42,3);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_file`
--

DROP TABLE IF EXISTS `t_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_file` (
  `id` bigint NOT NULL COMMENT 'ID',
  `m_room_number` char(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IDt_meeting.room_number',
  `file_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `save_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int unsigned NOT NULL COMMENT ' (: )',
  `file_type` int NOT NULL,
  `storage_path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT ' ( UUID  Key)',
  `uploader_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID',
  `uploader_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_time` datetime NOT NULL,
  `deletor_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ID',
  `deletor_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT ': 1-, 2-',
  PRIMARY KEY (`id`),
  KEY `idx_m_room_number` (`m_room_number`),
  CONSTRAINT `t_file_ibfk_1` FOREIGN KEY (`m_room_number`) REFERENCES `t_meeting` (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_file`
--

LOCK TABLES `t_file` WRITE;
/*!40000 ALTER TABLE `t_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_meeting`
--

DROP TABLE IF EXISTS `t_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_meeting` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `room_number` char(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID',
  `topic` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `distance` int NOT NULL,
  `type` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `location` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID',
  `description` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_room_number` (`room_number`),
  KEY `idx_topic` (`topic`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_meeting`
--

LOCK TABLES `t_meeting` WRITE;
/*!40000 ALTER TABLE `t_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_meeting_participant`
--

DROP TABLE IF EXISTS `t_meeting_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_meeting_participant` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `m_room_number` char(9) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID, t_meetingroom_number',
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID',
  `user_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int unsigned NOT NULL COMMENT ', 1:, 2:, 3:',
  `status` tinyint(1) NOT NULL COMMENT ', 1:, 2:, 3:',
  `update_time` datetime DEFAULT NULL COMMENT '/',
  `join_time` datetime DEFAULT NULL,
  `exit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_room_number_user_id` (`m_room_number`,`user_id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `t_meeting_participant_ibfk_1` FOREIGN KEY (`m_room_number`) REFERENCES `t_meeting` (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_meeting_participant`
--

LOCK TABLES `t_meeting_participant` WRITE;
/*!40000 ALTER TABLE `t_meeting_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_meeting_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools_gen_table`
--

DROP TABLE IF EXISTS `tools_gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tools_gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `options` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '其它生成选项',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '备注',
  `overwrite` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否覆盖原有文件',
  `sort_column` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '排序字段名',
  `sort_type` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'asc' COMMENT '排序方式 (asc顺序 desc倒序)',
  `show_detail` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否有查看详情功能',
  `excel_port` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否有导出excel功能',
  `use_snow_id` bit(1) NOT NULL DEFAULT b'0' COMMENT '主键是否雪花ID',
  `use_virtual` bit(1) NOT NULL DEFAULT b'0' COMMENT '树表是否使用虚拟表',
  `excel_imp` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否导入excel',
  `overwrite_info` json DEFAULT NULL COMMENT '生成覆盖的文件',
  `menu_pid` int unsigned NOT NULL DEFAULT '0' COMMENT '父级菜单ID',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools_gen_table`
--

LOCK TABLES `tools_gen_table` WRITE;
/*!40000 ALTER TABLE `tools_gen_table` DISABLE KEYS */;
INSERT INTO `tools_gen_table` VALUES (99,'t_meeting','会议管理','TMeeting','crud','internal/app/system','system','t_meeting','会议管理','gfast','','2025-05-14 12:59:18','2025-05-14 12:59:48','',_binary '','id','asc',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0','[{\"key\": \"api\", \"value\": true}, {\"key\": \"controller\", \"value\": true}, {\"key\": \"dao\", \"value\": true}, {\"key\": \"dao_internal\", \"value\": true}, {\"key\": \"logic\", \"value\": true}, {\"key\": \"model\", \"value\": true}, {\"key\": \"model_do\", \"value\": true}, {\"key\": \"model_entity\", \"value\": true}, {\"key\": \"router\", \"value\": true}, {\"key\": \"router_func\", \"value\": true}, {\"key\": \"service\", \"value\": true}, {\"key\": \"sql\", \"value\": true}, {\"key\": \"tsApi\", \"value\": true}, {\"key\": \"tsModel\", \"value\": true}, {\"key\": \"vue\", \"value\": true}, {\"key\": \"vueDetail\", \"value\": true}, {\"key\": \"vueEdit\", \"value\": true}]',0);
/*!40000 ALTER TABLE `tools_gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tools_gen_table_column`
--

DROP TABLE IF EXISTS `tools_gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tools_gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `go_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Go类型',
  `ts_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'TS类型',
  `go_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Go字段名',
  `html_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'html字段名',
  `is_pk` bit(1) DEFAULT b'0' COMMENT '是否主键（1是）',
  `is_increment` bit(1) DEFAULT b'0' COMMENT '是否自增（1是）',
  `is_required` bit(1) DEFAULT b'0' COMMENT '是否必填（1是）',
  `is_edit` bit(1) DEFAULT b'0' COMMENT '是否编辑字段（1是）',
  `is_list` bit(1) DEFAULT b'1' COMMENT '是否列表字段（1是）',
  `is_detail` bit(1) DEFAULT b'1' COMMENT '是否详情字段',
  `is_query` bit(1) DEFAULT b'0' COMMENT '是否查询字段（1是）',
  `sort_order_edit` int DEFAULT '999' COMMENT '插入编辑显示顺序',
  `sort_order_list` int DEFAULT '999' COMMENT '列表显示顺序',
  `sort_order_detail` int DEFAULT '999' COMMENT '详情显示顺序',
  `sort_order_query` int DEFAULT '999' COMMENT '查询显示顺序',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `link_table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表名',
  `link_table_class` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表类名',
  `link_table_module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表模块名',
  `link_table_business_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表业务名',
  `link_table_package` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表包名',
  `link_label_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表键名',
  `link_label_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表字段值',
  `col_span` int DEFAULT '12' COMMENT '详情页占列数',
  `row_span` int DEFAULT '1' COMMENT '详情页占行数',
  `is_row_start` bit(1) DEFAULT b'0' COMMENT '详情页为行首',
  `min_width` int DEFAULT '100' COMMENT '表格最小宽度',
  `is_fixed` bit(1) DEFAULT b'0' COMMENT '是否表格列左固定',
  `is_overflow_tooltip` bit(1) DEFAULT b'0' COMMENT '是否过长自动隐藏',
  `is_cascade` bit(1) DEFAULT b'0' COMMENT '是否级联查询',
  `parent_column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级字段名',
  `cascade_column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '级联查询字段',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1056 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tools_gen_table_column`
--

LOCK TABLES `tools_gen_table_column` WRITE;
/*!40000 ALTER TABLE `tools_gen_table_column` DISABLE KEYS */;
INSERT INTO `tools_gen_table_column` VALUES (1043,99,'id','ID','bigint','int64','number','Id','id',_binary '',_binary '',_binary '',_binary '\0',_binary '',_binary '',_binary '',1,1,1,1,'EQ','input','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1044,99,'room_number','ID','char(9)','string','string','RoomNumber','roomNumber',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',2,2,2,2,'EQ','input','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1045,99,'topic','','varchar(128)','string','string','Topic','topic',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',3,3,3,3,'EQ','input','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1046,99,'mode','','tinyint(1)','int','number','Mode','mode',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',4,4,4,4,'EQ','input','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1047,99,'distance','','int','int','number','Distance','distance',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',5,5,5,5,'EQ','input','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1048,99,'type','','tinyint(1)','int','number','Type','type',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',6,6,6,6,'EQ','select','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1049,99,'status','','tinyint(1)','int','number','Status','status',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',7,7,7,7,'EQ','radio','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1050,99,'location','','varchar(128)','string','string','Location','location',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',8,8,8,8,'EQ','input','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1051,99,'creator_id','ID','varchar(128)','string','string','CreatorId','creatorId',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',9,9,9,9,'EQ','input','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1052,99,'description','','varchar(128)','string','string','Description','description',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',10,10,10,10,'EQ','input','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1053,99,'create_time','','datetime','Time','string','CreateTime','createTime',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',11,11,11,11,'EQ','datetime','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1054,99,'start_time','','datetime','Time','string','StartTime','startTime',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',_binary '',12,12,12,12,'EQ','datetime','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','',''),(1055,99,'end_time','','datetime','Time','string','EndTime','endTime',_binary '\0',_binary '\0',_binary '\0',_binary '',_binary '',_binary '',_binary '',13,13,13,13,'EQ','datetime','','','','','','','','',1,1,_binary '\0',150,_binary '\0',_binary '\0',_binary '\0','','');
/*!40000 ALTER TABLE `tools_gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-14  5:11:06
