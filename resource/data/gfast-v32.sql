/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : gfast-v32

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 06/02/2023 09:14:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for big_file
-- ----------------------------
DROP TABLE IF EXISTS `big_file`;
CREATE TABLE `big_file`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件名称',
  `size` int(11) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件相对路径',
  `full_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件绝对路径',
  `mime_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件类型',
  `source` tinyint(3) NOT NULL DEFAULT 0 COMMENT '文件来源  0 - 本地，1 - 腾讯云 2 - 七牛云',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'md5',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of big_file
-- ----------------------------
INSERT INTO `big_file` VALUES (10, '1.jpg', 14699, 'big_file/4c91375006d4ae881e941a6948337685.jpg', '', 'image/jpeg', 0, '', '4c91375006d4ae881e941a6948337685', 0, 0, '2022-06-15 16:39:31', '2022-06-15 16:39:31', NULL);
INSERT INTO `big_file` VALUES (11, 'yellowicon-cc20.png', 9307, 'big_file/b55ee4f352e34bf7b07481e6da792bbc.png', '', 'image/png', 0, '', 'b55ee4f352e34bf7b07481e6da792bbc', 0, 0, '2022-06-15 16:39:39', '2022-06-15 16:39:39', NULL);
INSERT INTO `big_file` VALUES (12, '测试文档.doc', 10752, 'big_file/b55a440fcdd29779d7e49ec372fcc003.doc', '', 'application/msword', 0, '', 'b55a440fcdd29779d7e49ec372fcc003', 0, 0, '2022-06-15 16:39:39', '2022-06-15 16:39:39', NULL);
INSERT INTO `big_file` VALUES (13, '大文件测试.doc', 114704896, 'big_file/834978ef56f207dd6711b56ccde67a3f.doc', '', 'application/msword', 0, '', '834978ef56f207dd6711b56ccde67a3f', 0, 0, '2022-06-15 16:39:41', '2022-06-15 16:39:41', NULL);
INSERT INTO `big_file` VALUES (14, '1.jpg', 14699, 'big_file/4c91375006d4ae881e941a6948337685.jpg', '', 'image/jpeg', 0, '', '4c91375006d4ae881e941a6948337685', 0, 0, '2022-06-15 16:53:14', '2022-06-15 16:53:14', NULL);
INSERT INTO `big_file` VALUES (15, '03b0d39583f48206768a7534e55bcpng.png', 15926, 'big_file/08803b0d39583f48206768a7534e55bc.png', '', 'image/png', 0, '', '08803b0d39583f48206768a7534e55bc', 0, 0, '2022-06-15 16:53:14', '2022-06-15 16:53:14', NULL);
INSERT INTO `big_file` VALUES (16, '15681693.jfif', 22352, 'big_file/daba796b1f231e7a588fcabf71bc3f60.jfif', '', 'image/jpeg', 0, '', 'daba796b1f231e7a588fcabf71bc3f60', 0, 0, '2022-06-15 16:53:15', '2022-06-15 16:53:15', '2022-06-15 17:35:52');
INSERT INTO `big_file` VALUES (17, '9.jpg', 489114, 'big_file/e9dac83f6cf1b67a4313ba2e5b3105ee.jpg', '', 'image/jpeg', 0, '', 'e9dac83f6cf1b67a4313ba2e5b3105ee', 0, 0, '2022-06-15 16:53:15', '2022-06-15 16:53:15', '2022-06-15 17:36:07');
INSERT INTO `big_file` VALUES (18, '6535bcfb26e4c79b48ddde44f4b6fjpeg.jpeg', 94425, 'big_file/2116535bcfb26e4c79b48ddde44f4b6f.jpeg', '', 'image/jpeg', 0, '', '2116535bcfb26e4c79b48ddde44f4b6f', 0, 0, '2022-06-15 16:53:15', '2022-06-15 16:53:15', '2022-06-15 17:54:04');
INSERT INTO `big_file` VALUES (19, 'default_member_bg.jpg', 64744, 'big_file/1890c96c72abfce088e00f6977e41cce.jpg', '', 'image/jpeg', 0, '', '1890c96c72abfce088e00f6977e41cce', 0, 0, '2022-06-15 16:53:15', '2022-06-15 16:53:15', '2022-06-15 17:54:04');
INSERT INTO `big_file` VALUES (20, 'asdasd', 225922, 'big_file/606d1ca36a2fd8f22567b894e222b5f9.png', '', 'image/png', 0, 'xxxxx', '606d1ca36a2fd8f22567b894e222b5f9', 0, 0, '2022-06-15 16:53:15', '2022-06-16 10:07:54', NULL);
INSERT INTO `big_file` VALUES (21, 'banner.jpg', 273554, 'big_file/13c8164ffeef82f9967eedc3fb4ca4c2.jpg', '', 'image/jpeg', 0, '', '13c8164ffeef82f9967eedc3fb4ca4c2', 0, 0, '2022-06-15 16:53:15', '2022-06-15 16:53:15', NULL);
INSERT INTO `big_file` VALUES (22, 'lanrentuku.com.url', 183, 'big_file/e594b1d1c4ef10654c4bc83ae4a612c0.url', '', '', 0, '', 'e594b1d1c4ef10654c4bc83ae4a612c0', 0, 0, '2022-06-15 16:53:15', '2022-06-15 16:53:15', NULL);
INSERT INTO `big_file` VALUES (23, '6535bcfb26e4c79b48ddde44f4b6fjpeg - 副本.jpeg', 94425, 'big_file/2116535bcfb26e4c79b48ddde44f4b6f.jpeg', '', 'image/jpeg', 0, '', '2116535bcfb26e4c79b48ddde44f4b6f', 0, 0, '2022-06-16 10:11:25', '2022-06-16 10:11:25', NULL);
INSERT INTO `big_file` VALUES (24, '6535bcfb26e4c79b48ddde44f4b6fjpeg.jpeg', 94425, 'big_file/2116535bcfb26e4c79b48ddde44f4b6f.jpeg', '', 'image/jpeg', 0, '', '2116535bcfb26e4c79b48ddde44f4b6f', 0, 0, '2022-06-16 10:11:25', '2022-06-16 10:11:25', NULL);
INSERT INTO `big_file` VALUES (25, '大文件测试.doc', 114704896, 'big_file/834978ef56f207dd6711b56ccde67a3f.doc', '', 'application/msword', 0, '', '834978ef56f207dd6711b56ccde67a3f', 0, 0, '2022-06-16 10:12:31', '2022-06-16 10:12:31', NULL);
INSERT INTO `big_file` VALUES (26, '大文件测试 - 副本.doc', 114704896, 'big_file/834978ef56f207dd6711b56ccde67a3f.doc', '', 'application/msword', 0, '', '834978ef56f207dd6711b56ccde67a3f', 0, 0, '2022-06-16 10:12:31', '2022-06-16 10:12:31', NULL);
INSERT INTO `big_file` VALUES (27, '大文件测试.doc', 114704896, 'big_file/834978ef56f207dd6711b56ccde67a3f.doc', '', 'application/msword', 0, '', '834978ef56f207dd6711b56ccde67a3f', 0, 0, '2022-06-16 10:14:05', '2022-06-16 10:14:05', NULL);
INSERT INTO `big_file` VALUES (28, '大文件测试 - 副本.doc', 114704896, 'big_file/834978ef56f207dd6711b56ccde67a3f.doc', '', 'application/msword', 0, '', '834978ef56f207dd6711b56ccde67a3f', 0, 0, '2022-06-16 10:14:11', '2022-06-16 10:14:11', NULL);
INSERT INTO `big_file` VALUES (29, '5a30f58e4bcea.mp4', 1610085, 'big_file/95954f7e187e17655e81c8a3fbea2714.mp4', '', 'video/mp4', 0, '', '95954f7e187e17655e81c8a3fbea2714', 0, 0, '2022-09-05 14:53:48', '2022-09-05 14:53:48', NULL);
INSERT INTO `big_file` VALUES (30, 'blog完整版.zip', 844647, 'big_file/e2431d90c87d5159b4c154578d9c1181.zip', '', 'application/x-zip-compressed', 0, '', 'e2431d90c87d5159b4c154578d9c1181', 0, 0, '2022-09-20 09:56:54', '2022-09-20 09:56:54', '2022-09-20 14:45:42');
INSERT INTO `big_file` VALUES (31, 'blog完整版.zip', 844647, 'big_file/e2431d90c87d5159b4c154578d9c1181.zip', '', 'application/x-zip-compressed', 0, '', 'e2431d90c87d5159b4c154578d9c1181', 0, 0, '2022-09-20 10:04:52', '2022-09-20 10:04:52', '2022-09-20 14:45:39');
INSERT INTO `big_file` VALUES (32, 'blog完整版.zip', 844647, 'big_file/e2431d90c87d5159b4c154578d9c1181.zip', '', 'application/x-zip-compressed', 0, '', 'e2431d90c87d5159b4c154578d9c1181', 0, 0, '2022-09-20 10:05:22', '2022-09-20 10:05:22', '2022-09-20 14:45:37');
INSERT INTO `big_file` VALUES (33, 'jdk-17_windows-x64_bin.zip', 180154345, 'big_file/9af0c44f20e0d4e35df3c05843360b5d.zip', '', 'application/x-zip-compressed', 0, '', '9af0c44f20e0d4e35df3c05843360b5d', 0, 0, '2022-09-20 10:18:33', '2022-09-20 10:18:33', '2022-09-20 14:45:34');
INSERT INTO `big_file` VALUES (34, 'jdk-17_windows-x64_bin.zip', 180154345, 'big_file/9af0c44f20e0d4e35df3c05843360b5d.zip', '', 'application/x-zip-compressed', 0, '', '9af0c44f20e0d4e35df3c05843360b5d', 0, 0, '2022-09-20 14:44:27', '2022-09-20 14:44:27', '2022-09-20 14:45:32');
INSERT INTO `big_file` VALUES (35, '软件著作权申请资料.zip', 44262766, 'big_file/1f68856b8d93ada93785bf2136c7f64d.zip', '', 'application/x-zip-compressed', 0, '', '1f68856b8d93ada93785bf2136c7f64d', 0, 0, '2022-10-26 08:37:27', '2022-10-26 08:37:27', NULL);
INSERT INTO `big_file` VALUES (36, '软件著作权申请资料.zip', 44262766, 'big_file/1f68856b8d93ada93785bf2136c7f64d.zip', '', 'application/x-zip-compressed', 0, '', '1f68856b8d93ada93785bf2136c7f64d', 0, 0, '2022-10-26 08:37:45', '2022-10-26 08:37:45', NULL);
INSERT INTO `big_file` VALUES (37, '吸毒人员风险管控后台ui源码.zip', 126472376, 'big_file/ceb83e922fcb093809ae27aa16f358a2.zip', '', 'application/x-zip-compressed', 0, '', 'ceb83e922fcb093809ae27aa16f358a2', 0, 0, '2022-10-26 08:39:19', '2022-10-26 08:39:19', '2022-12-20 11:46:18');
INSERT INTO `big_file` VALUES (38, '吸毒人员风险管控后端源码.zip', 62820547, 'big_file/96576caf22dbeb2988776a31b96164ef.zip', '', 'application/x-zip-compressed', 0, '', '96576caf22dbeb2988776a31b96164ef', 0, 0, '2022-10-26 08:41:57', '2022-10-26 08:41:57', '2022-12-20 11:46:21');

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `ptype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v0` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v3` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v4` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v5` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES ('p', '1', '27', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '28', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '29', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '30', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '1', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '2', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '3', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '4', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '11', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '10', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '12', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '13', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '14', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '15', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '19', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '20', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '21', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '22', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '23', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '24', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '25', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '26', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_3', '1', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_3', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '31', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '32', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '34', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('g', 'u_31', '2', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '35', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '36', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '1', '37', 'All', '', '', '');
INSERT INTO `casbin_rule` VALUES ('p', '2', '33', 'All', '', '', '');

-- ----------------------------
-- Table structure for demo_gen
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen`;
CREATE TABLE `demo_gen`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `demo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `demo_age` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '年龄',
  `classes` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班级',
  `demo_born` datetime NULL DEFAULT NULL COMMENT '出生年月',
  `demo_gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人',
  `demo_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `demo_cate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类',
  `demo_thumb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '头像',
  `demo_photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '相册',
  `demo_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人描述',
  `demo_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '相关附件',
  `classes_two` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班级二',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成测试表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of demo_gen
-- ----------------------------
INSERT INTO `demo_gen` VALUES (4, '张三', 50, '4', '2022-12-20 11:23:36', 1, '2021-08-21 12:07:19', '2022-12-20 11:23:38', NULL, 31, 31, 1, '0,1', 'upload_file/2022-11-11/co9copop81co0gysbz.jpg', '[{\"name\":\"74595d93db72bc45e5f5161ca35f5995.jpg\",\"url\":\"upload_file/2022-12-20/cp6bmkqcyfpc30zh52.jpg\",\"fileType\":\"image/jpeg\",\"size\":62462},{\"name\":\"a222.jpg\",\"url\":\"upload_file/2022-12-20/cp6bmkqcnncsyckbae.jpg\",\"fileType\":\"image/jpeg\",\"size\":25947},{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-20/cp6bmkqcnncsx40dak.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889}]', '<p style=\"text-indent: 2em;\">快乐就好可厉害了夸奖哈啥是利空打击阿松大快乐就好可厉害了夸奖哈啥是利空打击阿松大快乐就好可厉害了夸奖哈啥是利空打击阿松大快乐就好可厉害了夸奖哈啥是利空打击阿松大快乐就好可厉害了夸奖哈啥是利空打击阿松大快乐就好可厉害了夸奖哈啥是利空打击阿松大</p><p><img src=\"http://localhost:8808/upload_file/2022-12-20/cp6bmsehgh207ehhry.jpg\" style=\"width: 400px; height: 229px;\" width=\"400\" height=\"229\" border=\"0\" vspace=\"0\"/></p><p><img src=\"http://localhost:8808/upload_file/2022-12-20/cp6bmserxxy0cg4u72.jpg\" style=\"width: 400px; height: 250px;\" width=\"400\" height=\"250\" border=\"0\" vspace=\"0\"/></p><p><br/></p>', '[{\"name\":\"1.xlsx\",\"url\":\"http://localhost:8808//pub_upload/2021-08-21/cdow7mg24tu4f5yuid.xlsx\",\"fileType\":\"\",\"size\":0},{\"name\":\"楚雄市数据楚雄应用统计表.xls\",\"url\":\"http://localhost:8808//pub_upload/2021-08-21/cdow7rjjzk0wtpk74t.xls\",\"fileType\":\"\",\"size\":0}]', '5');
INSERT INTO `demo_gen` VALUES (5, '里斯', 0, '5', '2022-12-06 03:03:04', 2, '2022-12-14 16:19:21', '2022-12-20 11:24:13', NULL, 31, 31, 0, '0', 'upload_file/2022-12-20/cp6bni4ojf30sroz55.jpg', '[{\"name\":\"a222.jpg\",\"url\":\"upload_file/2022-12-20/cp6bnmhefzswddxrys.jpg\",\"fileType\":\"image/jpeg\",\"size\":25947},{\"name\":\"a111.jpg\",\"url\":\"upload_file/2022-12-20/cp6bnmhefzswthixpp.jpg\",\"fileType\":\"image/jpeg\",\"size\":104079}]', '<p>客户机阿斯利康到家啦可是建档立卡</p>', '[{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-20/cp69z5ryzgews7ovj7.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889},{\"name\":\"a222.jpg\",\"url\":\"upload_file/2022-12-20/cp6amc8ulju033lhyp.jpg\",\"fileType\":\"image/jpeg\",\"size\":25947},{\"name\":\"a333.jpg\",\"url\":\"upload_file/2022-12-20/cp6amc8ulju0j9yq3d.jpg\",\"fileType\":\"image/jpeg\",\"size\":18381}]', '4');
INSERT INTO `demo_gen` VALUES (6, '王五', 56, '4', '2022-12-05 15:05:02', 1, '2022-12-15 08:56:00', '2022-12-20 11:24:45', NULL, 31, 31, 1, '1', 'upload_file/2022-12-20/cp6bnyl49axcbedg2y.jpg', '[{\"name\":\"2.jpg\",\"url\":\"upload_file/2022-12-20/cp6bo15yvl9gvzlkok.jpg\",\"fileType\":\"image/jpeg\",\"size\":18618},{\"name\":\"t01b3a5a18109dea24a.jpg\",\"url\":\"upload_file/2022-12-20/cp6bo15yvl9gffm2ar.jpg\",\"fileType\":\"image/jpeg\",\"size\":36537}]', '<p>个人描述信息</p>', '[]', '5');
INSERT INTO `demo_gen` VALUES (7, '赵四', 53, '4', '2022-12-15 10:12:24', 1, '2022-12-15 10:13:53', '2022-12-20 11:25:05', NULL, 31, 31, 1, '1', 'upload_file/2022-12-20/cp6bo5wte6mo0ahvhl.jpg', '[{\"name\":\"t01698c1bc3af22a34b.jpg\",\"url\":\"upload_file/2022-12-20/cp6boael3pk4yhzjlm.jpg\",\"fileType\":\"image/jpeg\",\"size\":21834},{\"name\":\"1.jpg\",\"url\":\"upload_file/2022-12-20/cp6boaelehg0h6gvub.jpg\",\"fileType\":\"image/jpeg\",\"size\":13610}]', '<p>富文本内容</p>', '[]', '5');
INSERT INTO `demo_gen` VALUES (8, '刘涛', 18, '4', '2022-12-15 10:47:23', 1, '2022-12-15 10:49:47', '2022-12-20 11:26:15', NULL, 31, 31, 1, '0', 'upload_file/2022-12-20/cp6boein2zq4uuywuh.jpg', '[{\"name\":\"t01b97b4bd97190d33a.jpg\",\"url\":\"upload_file/2022-12-20/cp6boiffcarkavs1tp.jpg\",\"fileType\":\"image/jpeg\",\"size\":9859}]', '<p>富文本</p><p><br/></p><video id=\"tmpVideo0\" class=\"edui-video-video\" controls=\"\" preload=\"none\" width=\"532\" height=\"318\" src=\"http://localhost:8808/upload_file/2022-12-20/cp6boza7n3ykyp0vdr.mp4\" data-setup=\"{}\" style=\"width: 532px; height: 318px;\"><source src=\"http://localhost:8808/upload_file/2022-12-20/cp6boza7n3ykyp0vdr.mp4\" type=\"video/mp4\"/></video><p><br/></p><p><br/></p><p><br/></p>', '[{\"name\":\"74595d93db72bc45e5f5161ca35f5995.jpg\",\"url\":\"upload_file/2022-12-15/cp21ptkim0ow0z3iys.jpg\",\"fileType\":\"\",\"size\":0},{\"name\":\"a333.jpg\",\"url\":\"upload_file/2022-12-15/cp21qys54nxwgxzjxg.jpg\",\"fileType\":\"\",\"size\":0}]', '5');
INSERT INTO `demo_gen` VALUES (9, '刘涛', 18, '4', '2022-12-15 10:47:23', 1, '2022-12-15 10:52:38', '2022-12-15 10:52:38', '2022-12-20 10:02:37', 31, 0, 1, '', 'upload_file/2022-12-15/cp21qt8kek30kh1fej.jpg', '[{\"name\":\"65d3d7ad866394bf86309af1bbba11a3.jpeg\",\"url\":\"http://localhost:8808/upload_file/2022-12-15/cp21plv1zpawhwy53b.jpeg\",\"path\":\"upload_file/2022-12-15/cp21plv1zpawhwy53b.jpeg\"},{\"name\":\"a333.jpg\",\"url\":\"http://localhost:8808/upload_file/2022-12-15/cp21quzjof9wg9cm28.jpg\",\"path\":\"upload_file/2022-12-15/cp21quzjof9wg9cm28.jpg\"}]', '<p>富文本内容</p>', '[{\"name\":\"74595d93db72bc45e5f5161ca35f5995.jpg\",\"url\":\"http://localhost:8808/upload_file/2022-12-15/cp21ptkim0ow0z3iys.jpg\",\"path\":\"upload_file/2022-12-15/cp21ptkim0ow0z3iys.jpg\"},{\"name\":\"a333.jpg\",\"url\":\"http://localhost:8808/upload_file/2022-12-15/cp21qys54nxwgxzjxg.jpg\",\"path\":\"upload_file/2022-12-15/cp21qys54nxwgxzjxg.jpg\"}]', '5');
INSERT INTO `demo_gen` VALUES (10, '刘淼', 25, '4', '2022-12-15 11:03:17', 1, '2022-12-15 11:06:29', '2022-12-15 11:06:29', '2022-12-20 10:02:28', 31, 0, 1, '', 'upload_file/2022-12-15/cp222yx2yjhshflfgx.jpeg', '[{\"name\":\"00300281425_2fbbb18b.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyjdhcwwgowa.jpg\",\"fileType\":\"image/jpeg\",\"size\":87448},{\"name\":\"a111.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejsbp173g.jpg\",\"fileType\":\"image/jpeg\",\"size\":104079},{\"name\":\"a222.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejse0u2xs.jpg\",\"fileType\":\"image/jpeg\",\"size\":25947}]', '<p>流量卡圣诞节拉克丝的拉克斯基的</p>', '[{\"name\":\"5b0fac3e20268.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzc58mucz.jpg\",\"fileType\":\"image/jpeg\",\"size\":137811},{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzch4dgpt.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889},{\"name\":\"5b5589ebf0af8.png\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzcaun4c4.png\",\"fileType\":\"image/png\",\"size\":105997}]', '5');
INSERT INTO `demo_gen` VALUES (11, '刘淼', 25, '4', '2022-12-15 11:03:17', 1, '2022-12-15 11:33:49', '2022-12-15 16:42:28', '2022-12-20 10:02:28', 31, 31, 1, '1', 'upload_file/2022-12-15/cp222yx2yjhshflfgx.jpeg', '[{\"name\":\"00300281425_2fbbb18b.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyjdhcwwgowa.jpg\",\"fileType\":\"image/jpeg\",\"size\":87448},{\"name\":\"a111.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejsbp173g.jpg\",\"fileType\":\"image/jpeg\",\"size\":104079},{\"name\":\"t01b97b4bd97190d33a.jpg\",\"url\":\"upload_file/2022-12-15/cp29adtc1nyklqvr9a.jpg\",\"fileType\":\"image/jpeg\",\"size\":9859},{\"name\":\"t01b69a50d3f1ec115b.jpg\",\"url\":\"upload_file/2022-12-15/cp29af4z2178lzkdd3.jpg\",\"fileType\":\"image/jpeg\",\"size\":19040}]', '<p>aaaaaaaaaaaaaaaaaaaaaaa</p>', '[{\"name\":\"5b0fac3e20268.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzc58mucz.jpg\",\"fileType\":\"image/jpeg\",\"size\":137811},{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzch4dgpt.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889},{\"name\":\"5b5589ebf0af8.png\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzcaun4c4.png\",\"fileType\":\"image/png\",\"size\":105997}]', '5');
INSERT INTO `demo_gen` VALUES (12, '刘淼', 25, '4', '2022-12-15 11:03:17', 1, '2022-12-15 16:56:16', '2022-12-15 16:56:16', '2022-12-20 10:02:21', 31, 0, 1, '1', 'upload_file/2022-12-15/cp222yx2yjhshflfgx.jpeg', '[{\"name\":\"00300281425_2fbbb18b.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyjdhcwwgowa.jpg\",\"fileType\":\"image/jpeg\",\"size\":87448},{\"name\":\"a111.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejsbp173g.jpg\",\"fileType\":\"image/jpeg\",\"size\":104079},{\"name\":\"a222.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejse0u2xs.jpg\",\"fileType\":\"image/jpeg\",\"size\":25947}]', '<p>流量卡圣诞节拉克丝的拉克斯基的</p>', '[{\"name\":\"5b0fac3e20268.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzc58mucz.jpg\",\"fileType\":\"image/jpeg\",\"size\":137811},{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzch4dgpt.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889},{\"name\":\"5b5589ebf0af8.png\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzcaun4c4.png\",\"fileType\":\"image/png\",\"size\":105997}]', '5');
INSERT INTO `demo_gen` VALUES (13, '刘淼', 25, '4', '2022-12-15 11:03:17', 1, '2022-12-15 16:56:17', '2022-12-18 14:16:56', '2022-12-20 10:02:15', 31, 31, 1, '1,0', 'upload_file/2022-12-15/cp222yx2yjhshflfgx.jpeg', '[{\"name\":\"00300281425_2fbbb18b.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyjdhcwwgowa.jpg\",\"fileType\":\"image/jpeg\",\"size\":87448},{\"name\":\"a111.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejsbp173g.jpg\",\"fileType\":\"image/jpeg\",\"size\":104079},{\"name\":\"t01b97b4bd97190d33a.jpg\",\"url\":\"upload_file/2022-12-15/cp2a2juhxyq0ehrr0s.jpg\",\"fileType\":\"image/jpeg\",\"size\":9859}]', '<p>流量卡圣诞节拉克丝的拉克54656斯基的</p><p><img src=\"http://localhost:8808/upload_file/2022-12-16/cp2vz25diy08kqgzav.jpg\" alt=\"5b5fd982ce018.jpg\"/></p><p><video id=\"tmpVideo0\" class=\"edui-video-video\" controls=\"\" preload=\"none\" width=\"558\" height=\"297\" src=\"http://localhost:8808/upload_file/2022-12-16/cp3614o8pbc4h2rfas.mp4\" data-setup=\"{}\" style=\"width: 558px; height: 297px;\"><source src=\"http://localhost:8808/upload_file/2022-12-16/cp3614o8pbc4h2rfas.mp4\" type=\"video/mp4\"/></video><br/></p>', '[{\"name\":\"5b0fac3e20268.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzc58mucz.jpg\",\"fileType\":\"image/jpeg\",\"size\":137811},{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzch4dgpt.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889},{\"name\":\"2.jpg\",\"url\":\"upload_file/2022-12-15/cp2ajn91urfchlqi1e.jpg\",\"fileType\":\"image/jpeg\",\"size\":18618}]', '5');
INSERT INTO `demo_gen` VALUES (14, '刘淼', 25, '4', '2022-12-15 11:03:17', 1, '2022-12-15 16:56:18', '2022-12-15 16:56:18', '2022-12-20 10:02:07', 31, 0, 1, '1', 'upload_file/2022-12-15/cp222yx2yjhshflfgx.jpeg', '[{\"name\":\"00300281425_2fbbb18b.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyjdhcwwgowa.jpg\",\"fileType\":\"image/jpeg\",\"size\":87448},{\"name\":\"a111.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejsbp173g.jpg\",\"fileType\":\"image/jpeg\",\"size\":104079},{\"name\":\"a222.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejse0u2xs.jpg\",\"fileType\":\"image/jpeg\",\"size\":25947}]', '<p>流量卡圣诞节拉克丝的拉克斯基的</p>', '[{\"name\":\"5b0fac3e20268.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzc58mucz.jpg\",\"fileType\":\"image/jpeg\",\"size\":137811},{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzch4dgpt.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889},{\"name\":\"5b5589ebf0af8.png\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzcaun4c4.png\",\"fileType\":\"image/png\",\"size\":105997}]', '5');
INSERT INTO `demo_gen` VALUES (15, '刘淼', 25, '4', '2022-12-15 11:03:17', 1, '2022-12-15 16:56:19', '2022-12-15 16:56:19', '2022-12-20 10:02:07', 31, 0, 1, '1', 'upload_file/2022-12-15/cp222yx2yjhshflfgx.jpeg', '[{\"name\":\"00300281425_2fbbb18b.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyjdhcwwgowa.jpg\",\"fileType\":\"image/jpeg\",\"size\":87448},{\"name\":\"a111.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejsbp173g.jpg\",\"fileType\":\"image/jpeg\",\"size\":104079},{\"name\":\"a222.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejse0u2xs.jpg\",\"fileType\":\"image/jpeg\",\"size\":25947}]', '<p>流量卡圣诞节拉克丝的拉克斯基的</p>', '[{\"name\":\"5b0fac3e20268.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzc58mucz.jpg\",\"fileType\":\"image/jpeg\",\"size\":137811},{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzch4dgpt.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889},{\"name\":\"5b5589ebf0af8.png\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzcaun4c4.png\",\"fileType\":\"image/png\",\"size\":105997}]', '5');
INSERT INTO `demo_gen` VALUES (16, '刘淼', 25, '4', '2022-12-15 11:03:17', 1, '2022-12-15 16:56:19', '2022-12-15 16:56:19', '2022-12-20 10:02:07', 31, 0, 1, '1', 'upload_file/2022-12-15/cp222yx2yjhshflfgx.jpeg', '[{\"name\":\"00300281425_2fbbb18b.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyjdhcwwgowa.jpg\",\"fileType\":\"image/jpeg\",\"size\":87448},{\"name\":\"a111.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejsbp173g.jpg\",\"fileType\":\"image/jpeg\",\"size\":104079},{\"name\":\"a222.jpg\",\"url\":\"upload_file/2022-12-15/cp2230vyuejse0u2xs.jpg\",\"fileType\":\"image/jpeg\",\"size\":25947}]', '<p>流量卡圣诞节拉克丝的拉克斯基的</p>', '[{\"name\":\"5b0fac3e20268.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzc58mucz.jpg\",\"fileType\":\"image/jpeg\",\"size\":137811},{\"name\":\"5b5fd982ce018.jpg\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzch4dgpt.jpg\",\"fileType\":\"image/jpeg\",\"size\":84889},{\"name\":\"5b5589ebf0af8.png\",\"url\":\"upload_file/2022-12-15/cp2237cm8pzcaun4c4.png\",\"fileType\":\"image/png\",\"size\":105997}]', '5');
INSERT INTO `demo_gen` VALUES (17, '大头', 26, '4', '2023-01-06 00:00:00', 1, '2023-01-06 18:06:50', '2023-01-06 18:06:50', NULL, 31, 0, 1, '0', 'upload_file/2023-01-06/cpl0u24gle003jcdpj.jpg', '[{\"name\":\"74595d93db72bc45e5f5161ca35f5995.jpg\",\"url\":\"upload_file/2023-01-06/cpl0u37j3ag4bdc0bi.jpg\",\"fileType\":\"image/jpeg\",\"size\":62462}]', '<p>啊实打实的</p>', '[]', '5');

-- ----------------------------
-- Table structure for demo_gen_class
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen_class`;
CREATE TABLE `demo_gen_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `class_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成关联测试表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of demo_gen_class
-- ----------------------------
INSERT INTO `demo_gen_class` VALUES (4, '分类一');
INSERT INTO `demo_gen_class` VALUES (5, '分类二');

-- ----------------------------
-- Table structure for demo_gen_other
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen_other`;
CREATE TABLE `demo_gen_other`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '单图',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '多图',
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '单文件',
  `files` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '多文件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '特殊字段测试' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of demo_gen_other
-- ----------------------------
INSERT INTO `demo_gen_other` VALUES (9, '<p>khash喀什打开就是的埃里克森</p>\n\n<p>的拉卡市的案例咯技术的</p>\n\n<p><img alt=\"\" src=\"http://localhost:8200/pub_upload/2021-08-12/cdhcvg0ow40ofpcy2k.jpg\" style=\"height:286px; width:757px\" /></p>\n', 'pub_upload/2021-08-12/cdhcvhxq38u8xbjcfd.jpg', '[{\"name\":\"5b5fd982ce018.jpg\",\"status\":\"success\",\"uid\":1628753354094,\"url\":\"pub_upload/2021-08-12/cdhcvjhlcdvcolnz7t.jpg\"},{\"name\":\"111.jpg\",\"status\":\"success\",\"uid\":1628753354095,\"url\":\"pub_upload/2021-08-12/cdhcvlav6u3oiwnybe.jpg\"}]', '[{\"name\":\"5b0fac3e20268.jpg\",\"status\":\"success\",\"uid\":1628753358537,\"url\":\"pub_upload/2021-08-12/cdhcvncc4gikxrqnh1.jpg\"}]', '[{\"name\":\"5b0fac3e20268.jpg\",\"status\":\"success\",\"uid\":1628753365149,\"url\":\"pub_upload/2021-08-12/cdhcvow3zq4g9zdqze.jpg\"},{\"name\":\"5b5fd982ce018.jpg\",\"status\":\"success\",\"uid\":1628753365150,\"url\":\"pub_upload/2021-08-12/cdhcvqdnyl9opkyu9p.jpg\"}]', 'asdasdasd');

-- ----------------------------
-- Table structure for demo_gen_tree
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen_tree`;
CREATE TABLE `demo_gen_tree`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级ID',
  `demo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `demo_age` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '年龄',
  `classes` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班级',
  `demo_born` datetime NULL DEFAULT NULL COMMENT '出生年月',
  `demo_gender` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改日期',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人',
  `demo_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `demo_cate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成树形结构测试表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of demo_gen_tree
-- ----------------------------
INSERT INTO `demo_gen_tree` VALUES (1, 0, '张三', 20, '4', '2021-08-23 00:00:00', 1, '2021-08-04 11:54:21', '2022-12-20 11:33:01', NULL, 31, 31, 1, '0');
INSERT INTO `demo_gen_tree` VALUES (2, 1, '李四', 28, '5', '2021-08-24 00:00:00', 1, '2021-08-04 11:54:38', '2022-12-20 11:33:05', NULL, 31, 31, 0, '0');
INSERT INTO `demo_gen_tree` VALUES (3, 0, '王五', 63, '5', '2021-08-17 00:00:00', 1, '2021-08-04 11:54:56', '2022-12-20 11:33:18', NULL, 31, 31, 1, '0');
INSERT INTO `demo_gen_tree` VALUES (4, 3, '小小', 65, '4', '2021-08-24 00:00:00', 1, '2021-08-04 15:51:55', '2022-12-20 11:33:21', NULL, 31, 31, 0, '0');
INSERT INTO `demo_gen_tree` VALUES (5, 3, '麻花', 23, '5', NULL, 2, '2021-08-04 15:52:13', '2022-12-20 11:33:26', NULL, 31, 31, 1, '0');
INSERT INTO `demo_gen_tree` VALUES (6, 2, 'xxx', 232, '4', '2021-08-21 00:00:00', 123, '2021-08-21 12:11:53', '2022-12-20 11:33:14', NULL, 31, 31, 1, '123123');

-- ----------------------------
-- Table structure for sys_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_rule`;
CREATE TABLE `sys_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `is_hide` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示状态',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_link` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型ID',
  `is_iframe` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否内嵌iframe',
  `is_cached` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否缓存',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由重定向地址',
  `is_affix` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否固定',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单节点表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_auth_rule
-- ----------------------------
INSERT INTO `sys_auth_rule` VALUES (1, 0, 'api/v1/system/auth', '权限管理', 'ele-Stamp', '', '', 0, 30, 0, '/system/auth', 'layout/routerView/parent', 0, '', 0, 0, 1, '0', 0, '', '2022-03-24 15:03:37', '2022-04-14 16:29:19');
INSERT INTO `sys_auth_rule` VALUES (2, 1, 'api/v1/system/auth/menuList', '菜单管理', 'ele-Calendar', '', '', 1, 0, 0, '/system/auth/menuList', 'system/menu/index', 0, '', 0, 0, 1, '', 0, '', '2022-03-24 17:24:13', '2022-03-29 10:54:49');
INSERT INTO `sys_auth_rule` VALUES (3, 2, 'api/v1/system/menu/add', '添加菜单', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-03-29 16:48:43', '2022-03-29 17:05:19');
INSERT INTO `sys_auth_rule` VALUES (4, 2, 'api/v1/system/menu/update', '修改菜单', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-03-29 17:04:25', '2022-03-29 18:11:36');
INSERT INTO `sys_auth_rule` VALUES (10, 1, 'api/v1/system/role/list', '角色管理', 'iconfont icon-juxingkaobei', '', '', 1, 0, 0, '/system/auth/roleList', 'system/role/index', 0, '', 0, 0, 1, '', 0, '', '2022-03-29 18:15:03', '2022-03-30 10:25:34');
INSERT INTO `sys_auth_rule` VALUES (11, 2, 'api/v1/system/menu/delete', '删除菜单', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:49:10', '2022-04-06 14:49:17');
INSERT INTO `sys_auth_rule` VALUES (12, 10, 'api/v1/system/role/add', '添加角色', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:49:46', '2022-04-06 14:49:46');
INSERT INTO `sys_auth_rule` VALUES (13, 10, '/api/v1/system/role/edit', '修改角色', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:50:08', '2022-04-06 14:50:08');
INSERT INTO `sys_auth_rule` VALUES (14, 10, '/api/v1/system/role/delete', '删除角色', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:50:22', '2022-04-06 14:50:22');
INSERT INTO `sys_auth_rule` VALUES (15, 1, 'api/v1/system/dept/list', '部门管理', 'iconfont icon-siweidaotu', '', '', 1, 0, 0, '/system/auth/deptList', 'system/dept/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-06 14:52:23', '2022-04-07 22:59:20');
INSERT INTO `sys_auth_rule` VALUES (16, 17, 'aliyun', '阿里云-iframe', 'iconfont icon-diannao1', '', '', 1, 0, 0, '/demo/outLink/aliyun', 'layout/routerView/iframes', 1, '', 0, 1, 1, '', 0, 'https://www.aliyun.com/daily-act/ecs/activity_selection?spm=5176.8789780.J_3965641470.5.568845b58KHj51', '2022-04-06 17:26:29', '2022-04-07 15:27:17');
INSERT INTO `sys_auth_rule` VALUES (17, 0, 'outLink', '外链测试', 'iconfont icon-zhongduancanshu', '', '', 0, 20, 0, '/demo/outLink', 'layout/routerView/parent', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 15:20:51', '2022-04-14 16:29:07');
INSERT INTO `sys_auth_rule` VALUES (18, 17, 'tenyun', '腾讯云-外链', 'iconfont icon-shouye_dongtaihui', '', '', 1, 0, 0, '/demo/outLink/tenyun', 'layout/routerView/link', 1, '', 0, 0, 1, '', 0, 'https://cloud.tencent.com/act/new?cps_key=20b1c3842f74986b2894e2c5fcde7ea2&fromSource=gwzcw.3775555.3775555.3775555&utm_id=gwzcw.3775555.3775555.3775555&utm_medium=cpc', '2022-04-07 15:23:52', '2022-04-07 15:27:25');
INSERT INTO `sys_auth_rule` VALUES (19, 15, 'api/v1/system/dept/add', '添加部门', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 22:56:39', '2022-04-07 22:56:39');
INSERT INTO `sys_auth_rule` VALUES (20, 15, 'api/v1/system/dept/edit', '修改部门', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 22:57:00', '2022-04-07 22:57:00');
INSERT INTO `sys_auth_rule` VALUES (21, 15, 'api/v1/system/dept/delete', '删除部门', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 22:57:30', '2022-04-07 22:57:30');
INSERT INTO `sys_auth_rule` VALUES (22, 1, 'api/v1/system/post/list', '岗位管理', 'iconfont icon-neiqianshujuchucun', '', '', 1, 0, 0, '/system/auth/postList', 'system/post/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-07 22:58:46', '2022-04-09 14:26:15');
INSERT INTO `sys_auth_rule` VALUES (23, 22, 'api/v1/system/post/add', '添加岗位', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-09 14:14:49', '2022-04-09 14:14:49');
INSERT INTO `sys_auth_rule` VALUES (24, 22, 'api/v1/system/post/edit', '修改岗位', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-09 14:15:25', '2022-04-09 14:15:25');
INSERT INTO `sys_auth_rule` VALUES (25, 22, 'api/v1/system/post/delete', '删除岗位', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2022-04-09 14:15:47', '2022-04-09 14:15:47');
INSERT INTO `sys_auth_rule` VALUES (26, 1, 'api/v1/system/user/list', '用户管理', 'ele-User', '', '', 1, 0, 0, '/system/auth/user/list', 'system/user/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-09 14:19:10', '2022-04-09 14:19:58');
INSERT INTO `sys_auth_rule` VALUES (27, 0, 'api/v1/system/dict', '系统配置', 'iconfont icon-shuxingtu', '', '', 0, 40, 0, '/system/dict', 'layout/routerView/parent', 0, '', 0, 0, 1, '654', 0, '', '2022-04-14 16:28:51', '2022-04-18 14:40:56');
INSERT INTO `sys_auth_rule` VALUES (28, 27, 'api/v1/system/dict/type/list', '字典管理', 'iconfont icon-crew_feature', '', '', 1, 0, 0, '/system/dict/type/list', 'system/dict/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-14 16:32:10', '2022-04-16 17:02:50');
INSERT INTO `sys_auth_rule` VALUES (29, 27, 'api/v1/system/dict/dataList', '字典数据管理', 'iconfont icon-putong', '', '', 1, 0, 1, '/system/dict/data/list/:dictType', 'system/dict/dataList', 0, '', 0, 0, 1, '', 0, '', '2022-04-18 12:04:17', '2022-04-18 14:58:43');
INSERT INTO `sys_auth_rule` VALUES (30, 27, 'api/v1/system/config/list', '参数管理', 'ele-Cherry', '', '', 1, 0, 0, '/system/config/list', 'system/config/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-18 21:05:20', '2022-04-18 21:13:19');
INSERT INTO `sys_auth_rule` VALUES (31, 0, 'api/v1/system/monitor', '系统监控', 'iconfont icon-xuanzeqi', '', '', 0, 30, 0, '/system/monitor', 'layout/routerView/parent', 0, '', 0, 0, 1, '', 0, '', '2022-04-19 10:40:19', '2022-04-19 10:44:38');
INSERT INTO `sys_auth_rule` VALUES (32, 31, 'api/v1/system/monitor/server', '服务监控', 'iconfont icon-shuju', '', '', 1, 0, 0, '/system/monitor/server', 'system/monitor/server/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-19 10:43:32', '2022-04-19 10:44:47');
INSERT INTO `sys_auth_rule` VALUES (33, 35, 'api/swagger', 'api文档', 'iconfont icon--chaifenlie', '', '', 1, 0, 0, '/system/swagger', 'layout/routerView/iframes', 1, '', 0, 1, 1, '', 0, 'http://localhost:8808/swagger', '2022-04-21 09:23:43', '2022-11-29 17:10:35');
INSERT INTO `sys_auth_rule` VALUES (34, 31, 'api/v1/system/loginLog/list', '登录日志', 'ele-Finished', '', '', 1, 0, 0, '/system/monitor/loginLog', 'system/monitor/loginLog/index', 0, '', 0, 0, 1, '', 0, '', '2022-04-28 09:59:47', '2022-04-28 09:59:47');
INSERT INTO `sys_auth_rule` VALUES (35, 0, 'api/v1/system/tools', '系统工具', 'iconfont icon-zujian', '', '', 0, 25, 0, '/system/tools', 'layout/routerView/parent', 0, '', 0, 0, 1, '', 0, '', '2022-10-26 09:29:08', '2022-10-26 10:11:25');
INSERT INTO `sys_auth_rule` VALUES (36, 35, 'api/v1/system/tools/gen/tableList', '代码生成', 'iconfont icon-step', '', '', 1, 0, 0, '/system/tools/gen', 'system/tools/gen/index', 0, '', 0, 0, 1, '', 0, '', '2022-10-26 09:31:08', '2022-10-31 10:17:23');
INSERT INTO `sys_auth_rule` VALUES (37, 36, 'api/v1/system/tools/gen/columnList', '代码生成配置', 'ele-Edit', '', '', 1, 0, 1, '/system/tools/gen/edit', 'system/tools/gen/component/edit', 0, '', 0, 0, 1, '', 0, '', '2022-10-31 10:11:12', '2022-10-31 10:19:19');
INSERT INTO `sys_auth_rule` VALUES (38, 31, 'api/v1/system/operLog/list', '操作日志', 'iconfont icon-bolangnengshiyanchang', '', '', 1, 0, 0, '/system/monitor/operLog', 'system/monitor/operLog/index', 0, '', 0, 0, 1, '', 0, '', '2022-12-23 16:19:05', '2022-12-23 16:21:50');
INSERT INTO `sys_auth_rule` VALUES (39, 31, 'api/v1/system/online/list', '在线用户', 'iconfont icon-skin', '', '', 1, 0, 0, '/system/monitor/userOnlie', 'system/monitor/userOnline/index', 0, '', 0, 0, 1, '', 0, '', '2023-01-11 15:48:06', '2023-01-11 17:02:39');
INSERT INTO `sys_auth_rule` VALUES (53, 35, 'api/v1/system/sysJob/list', '定时任务', 'fa fa-superpowers', '', '', 1, 0, 0, '/system/sysJob/list', 'system/sysJob/list/index', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, '2023-01-12 17:51:27');
INSERT INTO `sys_auth_rule` VALUES (54, 53, 'api/v1/system/sysJob/get', '定时任务查询', '', '', '定时任务查询', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (55, 53, 'api/v1/system/sysJob/add', '定时任务添加', '', '', '定时任务添加', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (56, 53, 'api/v1/system/sysJob/edit', '定时任务修改', '', '', '定时任务修改', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (57, 53, 'api/v1/system/sysJob/delete', '定时任务删除', '', '', '定时任务删除', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (58, 53, 'api/v1/system/sysJob/run', '执行一次', '', '', '', 2, 0, 0, '', '', 0, '', 0, 0, 1, '', 0, '', '2023-01-12 18:20:13', '2023-01-12 18:20:13');
INSERT INTO `sys_auth_rule` VALUES (89, 0, 'api/v1/demo/demoGenClass', '分类信息管理', 'iconfont icon-fuwenbenkuang', '', '分类信息管理', 0, 0, 0, '/demo/demoGenClass', 'layout/routerView/parent', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (90, 89, 'api/v1/demo/demoGenClass/list', '分类信息列表', 'ele-Fold', '', '分类信息列表', 1, 0, 0, '/demo/demoGenClass/list', 'demo/demoGenClass/list/index', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (91, 90, 'api/v1/demo/demoGenClass/get', '分类信息查询', '', '', '分类信息查询', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (92, 90, 'api/v1/demo/demoGenClass/add', '分类信息添加', '', '', '分类信息添加', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (93, 90, 'api/v1/demo/demoGenClass/edit', '分类信息修改', '', '', '分类信息修改', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (94, 90, 'api/v1/demo/demoGenClass/delete', '分类信息删除', '', '', '分类信息删除', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (107, 0, 'api/v1/demo/demoGen', '代码生成测试管理', 'iconfont icon-fuwenbenkuang', '', '代码生成测试管理', 0, 0, 0, '/demo/demoGen', 'layout/routerView/parent', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (108, 107, 'api/v1/demo/demoGen/list', '代码生成测试列表', 'ele-Fold', '', '代码生成测试列表', 1, 0, 0, '/demo/demoGen/list', 'demo/demoGen/list/index', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (109, 108, 'api/v1/demo/demoGen/get', '代码生成测试查询', '', '', '代码生成测试查询', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (110, 108, 'api/v1/demo/demoGen/add', '代码生成测试添加', '', '', '代码生成测试添加', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (111, 108, 'api/v1/demo/demoGen/edit', '代码生成测试修改', '', '', '代码生成测试修改', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);
INSERT INTO `sys_auth_rule` VALUES (112, 108, 'api/v1/demo/demoGen/delete', '代码生成测试删除', '', '', '代码生成测试删除', 2, 0, 0, '', '', 0, 'sys_admin', 0, 0, 1, '', 0, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) NULL DEFAULT 0 COMMENT '系统内置（Y是 N否）',
  `create_by` int(64) UNSIGNED NULL DEFAULT 0 COMMENT '创建者',
  `update_by` int(64) UNSIGNED NULL DEFAULT 0 COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `uni_config_key`(`config_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '文件上传-文件大小', 'sys.uploadFile.fileSize', '50M', 1, 31, 31, '文件上传大小限制', NULL, '2021-07-06 14:57:35');
INSERT INTO `sys_config` VALUES (2, '文件上传-文件类型', 'sys.uploadFile.fileType', 'doc,docx,zip,xls,xlsx,rar,jpg,jpeg,gif,npm,png,mp4', 1, 31, 31, '文件上传后缀类型限制', NULL, '2022-12-16 09:52:45');
INSERT INTO `sys_config` VALUES (3, '图片上传-图片类型', 'sys.uploadFile.imageType', 'jpg,jpeg,gif,npm,png', 1, 31, 0, '图片上传后缀类型限制', NULL, NULL);
INSERT INTO `sys_config` VALUES (4, '图片上传-图片大小', 'sys.uploadFile.imageSize', '50M', 1, 31, 31, '图片上传大小限制', NULL, NULL);
INSERT INTO `sys_config` VALUES (11, '静态资源', 'static.resource', '/', 1, 2, 0, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '奇讯科技', 0, NULL, '15888888888', 'ry@qq.com', 1, 0, 31, '2021-07-13 15:56:52', '2021-07-13 15:57:05', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, NULL, '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, NULL, '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, NULL, '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, NULL, '15888888888', 'ry@qq.com', 1, 0, 31, '2021-07-13 15:56:52', '2021-11-04 09:16:38', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, NULL, '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, NULL, '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, NULL, '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, NULL, '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, NULL, '15888888888', 'ry@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '', '大数据', 1, '', '18888888888', 'liou@qq.com', 0, 0, 31, '2021-07-13 15:56:52', '2022-09-16 16:46:57', NULL);
INSERT INTO `sys_dept` VALUES (201, 100, '', '开发', 1, NULL, '18888888888', 'li@qq.com', 0, 31, NULL, '2021-07-13 15:56:52', '2022-04-07 22:35:21', NULL);
INSERT INTO `sys_dept` VALUES (202, 108, '', '外勤', 1, NULL, '18888888888', 'aa@qq.com', 1, 0, NULL, '2021-07-13 15:56:52', '2021-07-13 15:56:52', NULL);
INSERT INTO `sys_dept` VALUES (203, 108, '', '行政', 0, '', '18888888888', 'aa@qq.com', 1, 0, 31, '2021-07-13 15:56:52', '2022-09-16 16:46:47', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认（1是 0否）',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `create_by` bigint(64) UNSIGNED NULL DEFAULT 0 COMMENT '创建者',
  `update_by` bigint(64) UNSIGNED NULL DEFAULT 0 COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 0, '男', '1', 'sys_user_sex', '', '', 0, 1, 31, 2, '备注信息', '2022-04-18 16:46:22', NULL);
INSERT INTO `sys_dict_data` VALUES (2, 0, '女', '2', 'sys_user_sex', '', '', 0, 1, 31, 31, '备注信息', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (3, 0, '保密', '0', 'sys_user_sex', '', '', 1, 1, 31, 31, '备注信息', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (24, 0, '频道页', '1', 'cms_category_type', '', '', 0, 1, 31, 31, '作为频道页，不可作为栏目发布文章，可添加下级分类', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES (25, 0, '发布栏目', '2', 'cms_category_type', '', '', 0, 1, 31, 31, '作为发布栏目，可添加文章', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES (26, 0, '跳转栏目', '3', 'cms_category_type', '', '', 0, 1, 31, 31, '不直接发布内容，用于跳转页面', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES (27, 0, '单页栏目', '4', 'cms_category_type', '', '', 0, 1, 31, 31, '单页面模式，分类直接显示为文章', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_data` VALUES (28, 0, '正常', '0', 'sys_job_status', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (29, 0, '暂停', '1', 'sys_job_status', '', 'default', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (30, 0, '默认', 'DEFAULT', 'sys_job_group', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '系统', 'SYSTEM', 'sys_job_group', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 0, '成功', '1', 'admin_login_status', '', 'default', 0, 1, 31, 31, '', NULL, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_data` VALUES (33, 0, '失败', '0', 'admin_login_status', '', 'default', 0, 1, 31, 0, '', NULL, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_data` VALUES (34, 0, '成功', '1', 'sys_oper_log_status', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 0, '失败', '0', 'sys_oper_log_status', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 0, '重复执行', '1', 'sys_job_policy', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 0, '执行一次', '2', 'sys_job_policy', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 0, '显示', '0', 'sys_show_hide', NULL, 'default', 1, 1, 31, 0, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 0, '隐藏', '1', 'sys_show_hide', NULL, 'default', 0, 1, 31, 0, NULL, NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 0, '正常', '1', 'sys_normal_disable', '', 'default', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 0, '停用', '0', 'sys_normal_disable', '', 'default', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 0, '是', '1', 'sys_yes_no', '', '', 1, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (50, 0, '否', '0', 'sys_yes_no', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (51, 0, '已发布', '1', 'cms_article_pub_type', '', '', 1, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (54, 0, '未发布', '0', 'cms_article_pub_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (55, 0, '置顶', '1', 'cms_article_attr', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (56, 0, '推荐', '2', 'cms_article_attr', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (57, 0, '普通文章', '0', 'cms_article_type', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (58, 0, '跳转链接', '1', 'cms_article_type', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (59, 0, 'cms模型', '6', 'cms_cate_models', '', '', 0, 1, 1, 1, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (61, 0, '政府工作目标', '1', 'gov_cate_models', '', '', 0, 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (62, 0, '系统后台', 'sys_admin', 'menu_module_type', '', '', 1, 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (63, 0, '政务工作', 'gov_work', 'menu_module_type', '', '', 0, 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (64, 0, '幻灯', '3', 'cms_article_attr', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (65, 0, '[work]测试业务表', 'wf_news', 'flow_type', '', '', 0, 1, 2, 2, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (66, 0, '回退修改', '-1', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (67, 0, '保存中', '0', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (68, 0, '流程中', '1', 'flow_status', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (69, 0, '审批通过', '2', 'flow_status', '', '', 0, 1, 31, 2, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (70, 2, '发布栏目', '2', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (71, 3, '跳转栏目', '3', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (72, 4, '单页栏目', '4', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (73, 2, '置顶', '1', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (74, 3, '幻灯', '2', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (75, 4, '推荐', '3', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (76, 1, '一般', '0', 'sys_log_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (77, 1, '频道页', '1', 'sys_blog_sign', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (78, 0, '普通', '0', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES (79, 0, '加急', '1', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES (80, 0, '紧急', '2', 'flow_level', '', '', 0, 1, 31, 0, '', NULL, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_data` VALUES (81, 0, '特急', '3', 'flow_level', '', '', 0, 1, 31, 31, '', NULL, '2021-07-20 08:55:25');
INSERT INTO `sys_dict_data` VALUES (82, 0, '频道页', '1', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (83, 0, '发布栏目', '2', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (84, 0, '跳转栏目', '3', 'sys_blog_type', '', '', 0, 1, 31, 31, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (85, 0, '单页栏目', '4', 'sys_blog_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (87, 0, '[cms]文章表', 'cms_news', 'flow_type', '', '', 0, 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (91, 0, '测试一下', '666', 'cms_article_type', '', '', 0, 1, 31, 0, '', '2021-08-03 17:04:12', '2021-08-03 17:04:12');
INSERT INTO `sys_dict_data` VALUES (92, 0, '缓存测试222', '33333', 'cms_article_type', '', '', 0, 1, 31, 31, '', '2021-08-03 17:16:45', '2021-08-03 17:19:41');
INSERT INTO `sys_dict_data` VALUES (93, 0, '缓存测试222', '11111', 'cms_article_type', '', '', 0, 1, 31, 31, '', '2021-08-03 17:26:14', '2021-08-03 17:26:26');
INSERT INTO `sys_dict_data` VALUES (94, 0, '1折', '10', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 11:59:38', '2021-08-14 11:59:38');
INSERT INTO `sys_dict_data` VALUES (95, 0, '5折', '50', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 11:59:49', '2021-08-14 11:59:49');
INSERT INTO `sys_dict_data` VALUES (96, 0, '8折', '80', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 12:00:00', '2021-08-14 12:00:00');
INSERT INTO `sys_dict_data` VALUES (97, 0, '9折', '90', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 12:00:07', '2021-08-14 12:00:07');
INSERT INTO `sys_dict_data` VALUES (98, 0, '无折扣', '100', 'plugin_store_discount', '', '', 0, 1, 31, 0, '', '2021-08-14 12:00:16', '2021-08-14 12:00:16');
INSERT INTO `sys_dict_data` VALUES (99, 0, '不显示', 'none', 'cms_nav_position', '', '', 1, 1, 22, 0, '', '2021-08-31 15:37:35', '2021-08-31 15:37:35');
INSERT INTO `sys_dict_data` VALUES (100, 0, '顶部导航', 'top', 'cms_nav_position', '', '', 0, 1, 22, 0, '', '2021-08-31 15:37:57', '2021-08-31 15:37:57');
INSERT INTO `sys_dict_data` VALUES (101, 0, '底部导航', 'bottom', 'cms_nav_position', '', '', 0, 1, 22, 0, '', '2021-08-31 15:38:08', '2021-08-31 15:38:08');
INSERT INTO `sys_dict_data` VALUES (102, 0, '读取', 'GET', 'sys_oper_log_type', '', '', 0, 1, 31, 31, '', '2022-12-21 11:59:10', '2022-12-23 19:03:02');
INSERT INTO `sys_dict_data` VALUES (103, 0, '新增', 'POST', 'sys_oper_log_type', '', '', 0, 1, 31, 31, '', '2022-12-21 11:59:22', '2022-12-23 19:03:10');
INSERT INTO `sys_dict_data` VALUES (104, 0, '修改', 'PUT', 'sys_oper_log_type', '', '', 0, 1, 31, 31, '', '2022-12-21 11:59:32', '2022-12-23 19:03:19');
INSERT INTO `sys_dict_data` VALUES (105, 0, '删除', 'DELETE', 'sys_oper_log_type', '', '', 0, 1, 31, 31, '', '2022-12-21 11:59:44', '2022-12-23 19:03:27');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `create_by` int(64) UNSIGNED NULL DEFAULT 0 COMMENT '创建者',
  `update_by` int(64) UNSIGNED NULL DEFAULT 0 COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', 1, 31, 1, '用于选择用户性别', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (2, '分类类型', 'cms_category_type', 1, 31, 3, '文章分类类型', NULL, '2021-07-21 10:54:22');
INSERT INTO `sys_dict_type` VALUES (3, '任务状态', 'sys_job_status', 1, 31, 31, '任务状态列表', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (13, '任务分组', 'sys_job_group', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (14, '管理员登录状态', 'admin_login_status', 1, 31, 31, '', NULL, '2022-09-16 15:26:01');
INSERT INTO `sys_dict_type` VALUES (15, '操作日志状态', 'sys_oper_log_status', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (16, '任务策略', 'sys_job_policy', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (17, '菜单状态', 'sys_show_hide', 1, 31, 0, '菜单状态', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (18, '系统开关', 'sys_normal_disable', 1, 31, 31, '系统开关', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (24, '系统内置', 'sys_yes_no', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (25, '文章发布状态', 'cms_article_pub_type', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (26, '文章附加状态', 'cms_article_attr', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (27, '文章类型', 'cms_article_type', 1, 31, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (28, '文章栏目模型分类', 'cms_cate_models', 1, 1, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (29, '政务工作模型分类', 'gov_cate_models', 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (30, '菜单模块类型', 'menu_module_type', 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (31, '工作流程类型', 'flow_type', 1, 2, 0, '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (32, '工作流程审批状态', 'flow_status', 1, 31, 0, '工作流程审批状态', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (33, '博客分类类型', 'sys_blog_type', 1, 31, 31, '博客分类中的标志', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (34, '博客日志标志', 'sys_log_sign', 1, 31, 0, '博客日志管理中的标志数据字典', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (35, '工作流紧急状态', 'flow_level', 1, 31, 31, '', NULL, '2021-07-20 08:55:20');
INSERT INTO `sys_dict_type` VALUES (48, '插件商城折扣', 'plugin_store_discount', 1, 31, 0, '', '2021-08-14 11:59:26', '2021-08-14 11:59:26');
INSERT INTO `sys_dict_type` VALUES (49, 'CMS栏目导航位置', 'cms_nav_position', 1, 22, 0, '', '2021-08-31 15:37:04', '2021-08-31 15:37:04');
INSERT INTO `sys_dict_type` VALUES (50, '操作日志类型', 'sys_oper_log_type', 1, 31, 0, '', '2022-12-21 11:55:02', '2022-12-21 11:55:02');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(4) NULL DEFAULT 1 COMMENT '计划执行策略（1多次执行 2执行一次）',
  `concurrent` tinyint(4) NULL DEFAULT 1 COMMENT '是否并发执行（0允许 1禁止）',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态（0正常 1暂停）',
  `created_by` bigint(64) UNSIGNED NULL DEFAULT 0 COMMENT '创建者',
  `updated_by` bigint(64) UNSIGNED NULL DEFAULT 0 COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE INDEX `invoke_target`(`invoke_target`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '测试任务1', '', 'DEFAULT', 'test1', '* * * * * ?', 1, 0, 1, 1, 31, '', '2021-07-16 16:01:59', '2021-07-16 16:01:59');
INSERT INTO `sys_job` VALUES (2, '测试任务2', 'hello|gfast', 'DEFAULT', 'test2', '* * * * * ?', 1, 0, 1, 1, 31, '备注', '2021-07-16 17:15:09', '2021-07-16 17:15:09');
INSERT INTO `sys_job` VALUES (8, '在线用户定时更新', '', 'DEFAULT', 'checkUserOnline', '5 */10 * * * ?', 1, 0, 0, 2, 1, '', '2021-07-19 08:57:24', '2021-07-19 08:57:24');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `target_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '方法名',
  `created_at` datetime NULL DEFAULT NULL COMMENT '执行日期',
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行结果',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 551 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '', 0, '/api/v1/system/operLog/clear', 'DELETE', 1, 'demo', '财务部门', '/api/v1/system/operLog/clear', '::1', '内网IP', '{}', '', '2023-02-06 09:13:47');
INSERT INTO `sys_oper_log` VALUES (2, '操作日志', 0, '/api/v1/system/operLog/list', 'GET', 1, 'demo', '财务部门', '/api/v1/system/operLog/list?pageNum=1&pageSize=10', '::1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '', '2023-02-06 09:13:47');
INSERT INTO `sys_oper_log` VALUES (3, '代码生成', 0, '/api/v1/system/tools/gen/tableList', 'GET', 1, 'demo', '财务部门', '/api/v1/system/tools/gen/tableList?tableName=&tableComment=&pageNum=1&pageSize=10', '::1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\",\"tableComment\":\"\",\"tableName\":\"\"}', '', '2023-02-06 09:13:57');
INSERT INTO `sys_oper_log` VALUES (4, '', 0, '/api/v1/system/dict/data/getDictData', 'GET', 1, 'demo', '财务部门', '/api/v1/system/dict/data/getDictData?dictType=sys_job_status&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_status\"}', '', '2023-02-06 09:13:58');
INSERT INTO `sys_oper_log` VALUES (5, '', 0, '/api/v1/system/dict/data/getDictData', 'GET', 1, 'demo', '财务部门', '/api/v1/system/dict/data/getDictData?dictType=sys_job_policy&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_policy\"}', '', '2023-02-06 09:13:58');
INSERT INTO `sys_oper_log` VALUES (6, '', 0, '/api/v1/system/dict/data/getDictData', 'GET', 1, 'demo', '财务部门', '/api/v1/system/dict/data/getDictData?dictType=sys_job_group&defaultValue=', '::1', '内网IP', '{\"defaultValue\":\"\",\"dictType\":\"sys_job_group\"}', '', '2023-02-06 09:13:58');
INSERT INTO `sys_oper_log` VALUES (7, '定时任务', 0, '/api/v1/system/sysJob/list', 'GET', 1, 'demo', '财务部门', '/api/v1/system/sysJob/list?pageNum=1&pageSize=10', '::1', '内网IP', '{\"pageNum\":\"1\",\"pageSize\":\"10\"}', '', '2023-02-06 09:13:58');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '修改人',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, 1, '', 0, 0, '2021-07-11 11:32:58', NULL, NULL);
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, 1, '', 0, 0, '2021-07-12 11:01:26', NULL, NULL);
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, 1, '', 0, 31, '2021-07-12 11:01:30', '2022-09-16 16:48:18', NULL);
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, 0, '普通员工', 0, 31, '2021-07-12 11:01:33', '2022-04-08 15:32:23', NULL);
INSERT INTO `sys_post` VALUES (5, 'it', 'IT部', 5, 1, '信息部', 31, 31, '2021-07-12 11:09:42', '2022-04-09 12:59:12', NULL);
INSERT INTO `sys_post` VALUES (6, '1111', '1111', 0, 1, '11111', 31, 0, '2022-04-08 15:32:44', '2022-04-08 15:32:44', '2022-04-08 15:51:24');
INSERT INTO `sys_post` VALUES (7, '222', '2222', 0, 1, '22222', 31, 0, '2022-04-08 15:32:55', '2022-04-08 15:32:55', '2022-04-08 15:51:24');
INSERT INTO `sys_post` VALUES (8, '33333', '3333', 0, 0, '33333', 31, 0, '2022-04-08 15:33:01', '2022-04-08 15:33:01', '2022-04-08 15:51:40');
INSERT INTO `sys_post` VALUES (9, '222', '111', 0, 1, '2313213', 31, 0, '2022-04-08 15:52:53', '2022-04-08 15:52:53', '2022-04-08 15:52:56');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态;0:禁用;1:正常',
  `list_order` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint(3) UNSIGNED NOT NULL DEFAULT 3 COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 1, 0, '超级管理员', '备注', 2, '2022-04-01 11:38:39', '2023-01-16 20:55:51');
INSERT INTO `sys_role` VALUES (2, 1, 0, '普通管理员', '备注', 5, '2022-04-01 11:38:39', '2023-01-16 20:58:24');
INSERT INTO `sys_role` VALUES (3, 1, 0, '站点管理员', '站点管理人员', 3, '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES (4, 1, 0, '初级管理员', '初级管理员', 3, '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES (5, 1, 0, '高级管理员', '高级管理员', 2, '2022-04-01 11:38:39', '2022-04-01 11:38:39');
INSERT INTO `sys_role` VALUES (8, 1, 0, '区级管理员', '', 2, '2022-04-01 11:38:39', '2022-04-06 09:53:40');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (1, 101);
INSERT INTO `sys_role_dept` VALUES (1, 103);
INSERT INTO `sys_role_dept` VALUES (1, 104);
INSERT INTO `sys_role_dept` VALUES (1, 105);
INSERT INTO `sys_role_dept` VALUES (1, 106);
INSERT INTO `sys_role_dept` VALUES (1, 107);
INSERT INTO `sys_role_dept` VALUES (5, 103);
INSERT INTO `sys_role_dept` VALUES (5, 104);
INSERT INTO `sys_role_dept` VALUES (5, 105);
INSERT INTO `sys_role_dept` VALUES (8, 105);
INSERT INTO `sys_role_dept` VALUES (8, 106);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT 0 COMMENT '生日',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密盐',
  `user_status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '部门id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_login`(`user_name`, `deleted_at`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`, `deleted_at`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '13578342363', '超级管理员', 0, 'c567ae329f9929b518759d3bea13f492', 'f9aZTAa8yz', 1, 'yxh669@qq.com', 1, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-07-19/ccwpeuqz1i2s769hua.jpeg', 101, '', 1, 'asdasfdsaf大发放打发士大夫发按时', '描述信息', '::1', '2022-10-26 03:01:52', '2021-06-22 17:58:00', '2022-11-03 15:44:38', NULL);
INSERT INTO `sys_user` VALUES (2, 'yixiaohu', '13699885599', '奈斯', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'yxh@qq.com', 1, 'upload_file/2022-11-04/co3e5ljknns8jhlp8s.jpg', 102, '备注', 1, '', '', '::1', '2022-11-04 09:54:56', '2021-06-22 17:58:00', '2022-11-04 17:54:56', NULL);
INSERT INTO `sys_user` VALUES (3, 'zs', '16399669855', '张三', 0, '41e3778c20338f4d7d6cc886fd3b2a52', 'redoHIj524', 1, 'zs@qq.com', 0, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-08-02/cd8nif79egjg9kbkgk.jpeg', 101, '', 1, '', '', '::1', '2022-04-28 10:01:47', '2021-06-22 17:58:00', '2022-04-28 10:01:47', NULL);
INSERT INTO `sys_user` VALUES (4, 'qlgl', '13758596696', '测试c', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'qlgl@qq.com', 0, '', 102, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-11-03 15:44:20', NULL);
INSERT INTO `sys_user` VALUES (5, 'test', '13845696696', '测试2', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123@qq.com', 0, '', 101, '', 0, '', '', '::1', '2022-03-30 10:50:39', '2021-06-22 17:58:00', '2022-11-03 15:44:10', NULL);
INSERT INTO `sys_user` VALUES (6, '18999998889', '13755866654', '刘大大', 0, '5df78d20315a5af61f45d20f72c184fc', 'lC6OoXDCbM', 1, '1223@qq.com', 0, '', 103, '', 1, '', '', '[::1]', '2022-02-25 14:29:22', '2021-06-22 17:58:00', '2022-11-03 17:05:07', NULL);
INSERT INTO `sys_user` VALUES (7, 'zmm', '13788566696', '张明明', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '11123@qq.com', 0, '', 104, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:55:42', NULL);
INSERT INTO `sys_user` VALUES (8, 'lxx', '13756566696', '李小小', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123333@qq.com', 0, '', 101, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:55:45', NULL);
INSERT INTO `sys_user` VALUES (10, 'xmm', '13588999969', '小秘密', 0, '2de2a8df703bfc634cfda2cb2f6a59be', 'Frz7LJY7SE', 1, '696@qq.com', 0, '', 101, '', 1, '', '', '[::1]', '2021-07-22 17:08:53', '2021-06-22 17:58:00', '2022-04-12 17:55:50', NULL);
INSERT INTO `sys_user` VALUES (14, 'cd_19', '13699888899', '看金利科技', 0, '1169d5fe4119fd4277a95f02d7036171', '7paigEoedh', 1, '', 0, '', 102, '', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2022-04-12 18:13:22', NULL);
INSERT INTO `sys_user` VALUES (15, 'lmm', '13587754545', '刘敏敏', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'a@coc.com', 0, '', 201, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:56:23', NULL);
INSERT INTO `sys_user` VALUES (16, 'ldn', '13899658874', '李大牛', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'a@ll.con', 0, '', 102, '', 1, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2022-04-12 17:56:27', NULL);
INSERT INTO `sys_user` VALUES (20, 'dbc', '13877555566', '大百词', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (22, 'yxfmlbb', '15969423326', '大数据部门测试', 0, '66f89b40ee4a10aabaf70c15756429ea', 'mvd2OtUe8f', 1, 'yxh6691@qq.com', 0, 'https://yxh-1301841944.cos.ap-chongqing.myqcloud.com/gfast/2021-09-29/cem20k3fdciosy7nwo.jpeg', 200, '', 1, '2222233', '1222', '[::1]', '2021-10-28 11:36:07', '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (23, 'wangming', '13699888855', '王明', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (24, 'zhk', '13699885591', '综合科', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '192.168.0.146', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (28, 'demo3', '18699888855', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '123132@qq.com', 0, '', 109, '', 1, '', '', '192.168.0.229', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (31, 'demo', '15334455789', '李四', 0, '6dd68eea81e0fca319add0bd58c3fdf6', '46PvWe1Sl7', 1, '123@qq.com', 2, 'upload_file/2022-11-11/co9copop81co0gysbz.jpg', 109, '3', 1, '云南省曲靖市22223', '生活变的再糟糕，也不妨碍我变得更好', '::1', '2023-02-06 08:56:18', '2021-06-22 17:58:00', '2022-11-11 17:25:27', NULL);
INSERT INTO `sys_user` VALUES (32, 'demo100', '18699888859', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '[::1]', '2021-11-24 18:01:21', '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (33, 'demo110', '18699888853', '测试账号1', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '', 0, '', 0, '', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (34, 'yxfmlbb2', '15969423327', '研发部门测试', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '1111@qqq.com', 1, '', 103, '', 0, '', '', '127.0.0.1', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (35, 'wk666', '18888888888', 'wk', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '396861557@qq.com', 1, '', 100, '', 1, '', '', '[::1]', '2021-12-09 14:52:37', '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (36, 'zxd', '13699885565', '张晓东', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, 'zxk@qq.com', 1, '', 201, '666', 1, '', '', '', NULL, '2021-06-22 17:58:00', '2021-06-22 17:58:00', NULL);
INSERT INTO `sys_user` VALUES (37, 'yxfmlbb3', '13513513511', '张三', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '111@qq.com', 0, '', 204, '', 1, '', '', '[::1]', '2021-07-26 14:49:25', '2021-06-22 17:58:00', '2021-07-26 14:49:18', NULL);
INSERT INTO `sys_user` VALUES (38, 'test_user', '18888888880', 'test', 0, '542a6e44dbac171f260fc4a032cd5522', 'dlqVVBTADg', 1, '11@qq.com', 1, '', 200, '111', 0, '', '', '', NULL, '2021-06-22 17:58:00', '2021-07-12 22:05:29', NULL);
INSERT INTO `sys_user` VALUES (39, 'asan', '18687460555', '阿三', 0, '2354837137115700e2adf870ac113dcf', 'drdDvbtYZW', 1, '456654@qq.com', 1, '', 201, '666666', 1, '', '', '', NULL, '2021-07-12 17:21:43', '2021-07-12 21:13:31', '2021-07-12 22:00:44');
INSERT INTO `sys_user` VALUES (40, 'asi', '13655888888', '啊四', 0, 'fbb755b35d48759dad47bb1540249fd1', '9dfUstcxrz', 1, '5464@qq.com', 1, '', 201, 'adsaasd', 1, '', '', '', NULL, '2021-07-12 17:46:27', '2021-07-12 21:29:41', '2021-07-12 22:00:44');
INSERT INTO `sys_user` VALUES (41, 'awu', '13578556546', '阿五', 0, '3b36a96afa0dfd66aa915e0816e0e9f6', '9gHRa9ho4U', 0, '132321@qq.com', 1, '', 201, 'asdasdasd', 1, '', '', '', NULL, '2021-07-12 17:54:31', '2021-07-12 21:46:34', '2021-07-12 21:59:56');
INSERT INTO `sys_user` VALUES (42, 'demo01', '13699888556', '测试01222', 0, '048dc94116558fb40920f3553ecd5fe8', 'KiVrfzKJQx', 1, '456@qq.com', 2, '', 109, '测试用户', 1, '', '', '', NULL, '2022-04-12 16:15:23', '2022-04-12 17:54:49', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `ip` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户在线状态表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES (59, 'c8693b269879a0277e35665d77553665', '7ZUSfVIf2HyYjcv86SKPPs29v003ECPEScsdYsYYqO1xEIcOpHEu9FS4ZmjQsf1GCmQAky2EuUzyGJF53YyQWhYgG6yhl9QAyS7qAIWCcLkF41pe5PBx6naY3c5zVNJ8lPk/9zVolW/G6MTF44N/iA==', '2023-02-06 08:56:18', 'demo', '::1', 'Chrome', 'Windows 10');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 2);
INSERT INTO `sys_user_post` VALUES (1, 3);
INSERT INTO `sys_user_post` VALUES (2, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (3, 2);
INSERT INTO `sys_user_post` VALUES (4, 1);
INSERT INTO `sys_user_post` VALUES (5, 2);
INSERT INTO `sys_user_post` VALUES (10, 1);
INSERT INTO `sys_user_post` VALUES (10, 2);
INSERT INTO `sys_user_post` VALUES (10, 3);
INSERT INTO `sys_user_post` VALUES (10, 4);
INSERT INTO `sys_user_post` VALUES (10, 5);
INSERT INTO `sys_user_post` VALUES (14, 1);
INSERT INTO `sys_user_post` VALUES (15, 4);
INSERT INTO `sys_user_post` VALUES (16, 2);
INSERT INTO `sys_user_post` VALUES (22, 1);
INSERT INTO `sys_user_post` VALUES (22, 2);
INSERT INTO `sys_user_post` VALUES (31, 2);
INSERT INTO `sys_user_post` VALUES (34, 1);
INSERT INTO `sys_user_post` VALUES (35, 2);
INSERT INTO `sys_user_post` VALUES (35, 3);
INSERT INTO `sys_user_post` VALUES (36, 1);
INSERT INTO `sys_user_post` VALUES (37, 3);
INSERT INTO `sys_user_post` VALUES (38, 2);
INSERT INTO `sys_user_post` VALUES (38, 3);
INSERT INTO `sys_user_post` VALUES (42, 2);
INSERT INTO `sys_user_post` VALUES (42, 3);

-- ----------------------------
-- Table structure for tools_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `tools_gen_table`;
CREATE TABLE `tools_gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `overwrite` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否覆盖原有文件',
  `sort_column` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序字段名',
  `sort_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'asc' COMMENT '排序方式 (asc顺序 desc倒序)',
  `show_detail` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否有查看详情功能',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tools_gen_table
-- ----------------------------
INSERT INTO `tools_gen_table` VALUES (91, 'demo_gen', '代码生成测试表', 'DemoGen', 'crud', 'internal/app/demo', 'demo', 'demo_gen', '代码生成测试', 'gfast', '', '2022-11-01 17:27:43', '2023-02-03 11:27:03', '', b'1', 'id', 'asc', b'1');
INSERT INTO `tools_gen_table` VALUES (92, 'demo_gen_class', '代码生成关联测试表', 'DemoGenClass', 'crud', 'internal/app/demo', 'demo', 'demo_gen_class', '分类信息', 'gfast', '', '2022-11-03 06:36:57', '2022-12-15 15:17:45', '分类', b'1', 'id', 'asc', b'1');
INSERT INTO `tools_gen_table` VALUES (93, 'demo_gen_tree', '代码生成树形结构测试表', 'DemoGenTree', 'tree', 'internal/app/demo', 'demo', 'demo_gen_tree', '代码生成树形结构测试', 'gfast', '{\"treeCode\":\"id\",\"treeName\":\"demoName\",\"treeParentCode\":\"parentId\"}', '2022-11-29 15:11:34', '2022-12-20 11:29:00', '', b'1', 'id', 'asc', b'1');

-- ----------------------------
-- Table structure for tools_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `tools_gen_table_column`;
CREATE TABLE `tools_gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `go_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Go类型',
  `ts_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TS类型',
  `go_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Go字段名',
  `html_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'html字段名',
  `is_pk` bit(1) NULL DEFAULT b'0' COMMENT '是否主键（1是）',
  `is_increment` bit(1) NULL DEFAULT b'0' COMMENT '是否自增（1是）',
  `is_required` bit(1) NULL DEFAULT b'0' COMMENT '是否必填（1是）',
  `is_insert` bit(1) NULL DEFAULT b'0' COMMENT '是否为插入字段（1是）',
  `is_edit` bit(1) NULL DEFAULT b'0' COMMENT '是否编辑字段（1是）',
  `is_list` bit(1) NULL DEFAULT b'1' COMMENT '是否列表字段（1是）',
  `is_detail` bit(1) NULL DEFAULT b'1' COMMENT '是否详情字段',
  `is_query` bit(1) NULL DEFAULT b'0' COMMENT '是否查询字段（1是）',
  `sort_order_edit` int(11) NULL DEFAULT 999 COMMENT '插入编辑显示顺序',
  `sort_order_list` int(11) NULL DEFAULT 999 COMMENT '列表显示顺序',
  `sort_order_detail` int(11) NULL DEFAULT 999 COMMENT '详情显示顺序',
  `sort_order_query` int(11) NULL DEFAULT 999 COMMENT '查询显示顺序',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `link_table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表名',
  `link_table_class` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表类名',
  `link_table_module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表模块名',
  `link_table_business_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表业务名',
  `link_table_package` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表包名',
  `link_label_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表键名',
  `link_label_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表字段值',
  `col_span` int(11) NULL DEFAULT 12 COMMENT '详情页占列数',
  `row_span` int(11) NULL DEFAULT 1 COMMENT '详情页占行数',
  `is_row_start` bit(1) NULL DEFAULT b'0' COMMENT '详情页为行首',
  `min_width` int(11) NULL DEFAULT 100 COMMENT '表格最小宽度',
  `is_fixed` bit(1) NULL DEFAULT b'0' COMMENT '是否表格列左固定',
  `is_overflow_tooltip` bit(1) NULL DEFAULT b'0' COMMENT '是否过长自动隐藏',
  `is_cascade` bit(1) NULL DEFAULT b'0' COMMENT '是否级联查询',
  `parent_column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级字段名',
  `cascade_column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '级联查询字段',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 978 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tools_gen_table_column
-- ----------------------------
INSERT INTO `tools_gen_table_column` VALUES (944, 91, 'id', 'ID', 'int(11) unsigned', 'uint', 'number', 'Id', 'id', b'1', b'1', b'1', b'0', b'0', b'1', b'1', b'0', 1, 1, 1, 1, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (945, 91, 'demo_name', '姓名', 'varchar(20)', 'string', 'string', 'DemoName', 'demoName', b'0', b'0', b'1', b'1', b'1', b'1', b'1', b'1', 2, 2, 2, 2, 'LIKE', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (946, 91, 'demo_age', '年龄', 'int(10) unsigned', 'uint', 'number', 'DemoAge', 'demoAge', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 3, 3, 3, 3, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (947, 91, 'classes', '班级', 'varchar(30)', 'string', 'string', 'Classes', 'classes', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 4, 4, 4, 4, 'EQ', 'select', '', 'demo_gen_class', 'DemoGenClass', 'demo', 'demo_gen_class', 'internal/app/demo', 'id', 'class_name', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (948, 91, 'demo_born', '出生年月', 'datetime', 'Time', 'string', 'DemoBorn', 'demoBorn', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 5, 5, 5, 5, 'EQ', 'datetime', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (949, 91, 'demo_gender', '性别', 'tinyint(3) unsigned', 'uint', 'number', 'DemoGender', 'demoGender', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 6, 6, 6, 6, 'EQ', 'radio', 'sys_user_sex', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (950, 91, 'created_at', '创建日期', 'datetime', 'Time', 'string', 'CreatedAt', 'createdAt', b'0', b'0', b'0', b'0', b'0', b'1', b'1', b'1', 7, 7, 7, 7, 'EQ', 'datetime', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (951, 91, 'updated_at', '修改日期', 'datetime', 'Time', 'string', 'UpdatedAt', 'updatedAt', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 8, 8, 8, 8, 'EQ', 'datetime', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (952, 91, 'deleted_at', '删除日期', 'datetime', 'Time', 'string', 'DeletedAt', 'deletedAt', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 9, 9, 9, 9, 'EQ', 'datetime', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (953, 91, 'created_by', '创建人', 'bigint(20) unsigned', 'uint64', 'number', 'CreatedBy', 'createdBy', b'0', b'0', b'0', b'0', b'0', b'1', b'1', b'0', 10, 10, 10, 10, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (954, 91, 'updated_by', '修改人', 'bigint(20) unsigned', 'uint64', 'number', 'UpdatedBy', 'updatedBy', b'0', b'0', b'0', b'0', b'0', b'0', b'1', b'0', 11, 11, 11, 11, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (955, 91, 'demo_status', '状态', 'tinyint(4)', 'int', 'number', 'DemoStatus', 'demoStatus', b'0', b'0', b'1', b'1', b'1', b'1', b'1', b'1', 12, 12, 12, 12, 'EQ', 'radio', 'sys_normal_disable', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (956, 91, 'demo_cate', '分类', 'varchar(30)', 'string', 'string', 'DemoCate', 'demoCate', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 13, 13, 13, 13, 'EQ', 'checkbox', 'sys_oper_log_status', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (957, 91, 'demo_thumb', '头像', 'text', 'string', 'string', 'DemoThumb', 'demoThumb', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 14, 14, 14, 14, 'EQ', 'imagefile', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (958, 91, 'demo_photo', '相册', 'text', 'string', 'string', 'DemoPhoto', 'demoPhoto', b'0', b'0', b'0', b'1', b'1', b'0', b'1', b'0', 15, 15, 15, 15, 'EQ', 'images', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (959, 91, 'demo_info', '个人描述', 'text', 'string', 'string', 'DemoInfo', 'demoInfo', b'0', b'0', b'0', b'1', b'1', b'0', b'1', b'0', 16, 16, 16, 16, 'EQ', 'richtext', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (960, 91, 'demo_file', '相关附件', 'text', 'string', 'string', 'DemoFile', 'demoFile', b'0', b'0', b'0', b'1', b'1', b'0', b'1', b'0', 17, 17, 17, 17, 'EQ', 'files', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (961, 92, 'id', '分类id', 'int(10) unsigned', 'uint', 'number', 'Id', 'id', b'1', b'1', b'1', b'0', b'0', b'1', b'1', b'0', 1, 1, 1, 1, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (962, 92, 'class_name', '分类名', 'varchar(30)', 'string', 'string', 'ClassName', 'className', b'0', b'0', b'1', b'1', b'1', b'1', b'1', b'1', 2, 2, 2, 2, 'LIKE', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (963, 93, 'id', '', 'int(11) unsigned', 'uint', 'number', 'Id', 'id', b'1', b'1', b'1', b'0', b'0', b'1', b'0', b'0', 1, 1, 1, 1, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (964, 93, 'parent_id', '父级ID', 'int(10) unsigned', 'uint', 'number', 'ParentId', 'parentId', b'0', b'0', b'0', b'1', b'1', b'0', b'1', b'0', 2, 2, 2, 2, 'EQ', 'select', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (965, 93, 'demo_name', '姓名', 'varchar(20)', 'string', 'string', 'DemoName', 'demoName', b'0', b'0', b'1', b'1', b'1', b'1', b'1', b'1', 3, 3, 3, 3, 'LIKE', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (966, 93, 'demo_age', '年龄', 'int(10) unsigned', 'uint', 'number', 'DemoAge', 'demoAge', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 4, 4, 4, 4, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (967, 93, 'classes', '班级', 'varchar(30)', 'string', 'string', 'Classes', 'classes', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 5, 5, 5, 5, 'EQ', 'select', '', 'demo_gen_class', 'DemoGenClass', 'demo', 'demo_gen_class', 'internal/app/demo', 'id', 'class_name', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (968, 93, 'demo_born', '出生年月', 'datetime', 'Time', 'string', 'DemoBorn', 'demoBorn', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 6, 6, 6, 6, 'EQ', 'date', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (969, 93, 'demo_gender', '性别', 'tinyint(3) unsigned', 'uint', 'number', 'DemoGender', 'demoGender', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 7, 7, 7, 7, 'EQ', 'radio', 'sys_user_sex', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (970, 93, 'created_at', '创建日期', 'datetime', 'Time', 'string', 'CreatedAt', 'createdAt', b'0', b'0', b'0', b'0', b'0', b'1', b'1', b'0', 8, 8, 8, 8, 'EQ', 'datetime', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (971, 93, 'updated_at', '修改日期', 'datetime', 'Time', 'string', 'UpdatedAt', 'updatedAt', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 9, 9, 9, 9, 'EQ', 'datetime', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (972, 93, 'deleted_at', '删除日期', 'datetime', 'Time', 'string', 'DeletedAt', 'deletedAt', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 10, 10, 10, 10, 'EQ', 'datetime', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (973, 93, 'created_by', '创建人', 'bigint(20) unsigned', 'uint64', 'number', 'CreatedBy', 'createdBy', b'0', b'0', b'0', b'0', b'0', b'1', b'1', b'0', 11, 11, 11, 11, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (974, 93, 'updated_by', '修改人', 'bigint(20) unsigned', 'uint64', 'number', 'UpdatedBy', 'updatedBy', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', 12, 12, 12, 12, 'EQ', 'input', '', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (975, 93, 'demo_status', '状态', 'tinyint(4)', 'int', 'number', 'DemoStatus', 'demoStatus', b'0', b'0', b'1', b'1', b'1', b'1', b'1', b'1', 13, 13, 13, 13, 'EQ', 'radio', 'sys_normal_disable', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (976, 93, 'demo_cate', '分类', 'varchar(30)', 'string', 'string', 'DemoCate', 'demoCate', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'0', 14, 14, 14, 14, 'EQ', 'select', 'sys_oper_log_status', '', '', '', '', '', '', '', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');
INSERT INTO `tools_gen_table_column` VALUES (977, 91, 'classes_two', '班级2', 'varchar(30)', 'string', 'string', 'ClassesTwo', 'classesTwo', b'0', b'0', b'0', b'1', b'1', b'1', b'1', b'1', 4, 4, 4, 4, 'EQ', 'select', '', 'demo_gen_class', 'DemoGenClass', 'demo', 'demo_gen_class', 'internal/app/demo', 'id', 'class_name', 12, 1, b'0', 100, b'0', b'0', b'0', '', '');

SET FOREIGN_KEY_CHECKS = 1;
