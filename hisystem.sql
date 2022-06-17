/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : hisystem

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2021-06-22 19:37:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for his_announcement
-- ----------------------------
DROP TABLE IF EXISTS `his_announcement`;
CREATE TABLE `his_announcement` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `contents` text NOT NULL,
  `create_datetime` varchar(64) NOT NULL,
  `ann_status` int(10) NOT NULL DEFAULT '0',
  `ann_date` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_announcement
-- ----------------------------
INSERT INTO `his_announcement` VALUES ('402880e86a1fb6e1016a1fc02da00000', '医院', '  医院（Hospital）一词是来自于拉丁文原意为“客人”，因为一开始设立\n时，是供人避难，还备有休息间，使来者舒适，有招待意图。后来，才\n逐渐成为满足人类医疗需求，提供医疗服务的专业机构，收容和治疗病\n人的服务场所。', '2019-04-15 14:47:29', '1', '2020-04-10');
INSERT INTO `his_announcement` VALUES ('402880e86a24ccfc016a24d2934c0003', 'hello', '  医院（Hospital）一词是来自于拉丁文原意为“客人”，因为一开始设立\n时，是供人避难，还备有休息间，使来者舒适，有招待意图。后来，才\n逐渐成为满足人类医疗需求，提供医疗服务的专业机构，收容和治疗病\n人的服务场所。', '2019-04-16 14:25:41', '1', '2019-05-16');
INSERT INTO `his_announcement` VALUES ('402880e86a251778016a2530a2ca0004', 'test', '1、当你在\n2、地方\n3、各个地方晃过上帝很过分\n4、大V收拾\n5、电焊工和规范化的\n6、给第三方还不停的\n人的服务场所。', '2019-04-16 16:08:25', '1', '2019-05-16');
INSERT INTO `his_announcement` VALUES ('4028b881716223510171622773830001', 'hisystem', 'hisystem', '2020-04-10 11:34:44', '1', '2021-05-10');

-- ----------------------------
-- Table structure for his_department
-- ----------------------------
DROP TABLE IF EXISTS `his_department`;
CREATE TABLE `his_department` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `code` tinyint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_code` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`code`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_department
-- ----------------------------
INSERT INTO `his_department` VALUES ('4028b881710a252501710a28ffd50000', '2020-03-24 09:29:51', '门诊大楼二楼D区', '1', '呼吸内科', 'HXNK-MZDLELDQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b308fac0000', '2020-03-24 14:17:43', '门诊大楼二楼D区', '2', '消化内科', 'XHNK-MZDLELDQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b30d0900001', '2020-03-24 14:18:00', '门诊大楼二楼D区', '3', '泌尿内科', 'MNNK-MZDLELDQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b318bbb0002', '2020-03-24 14:18:48', '门诊大楼二楼D区', '4', '心内科', 'XNK-MZDLELDQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b3218c00003', '2020-03-24 14:19:24', '门诊大楼二楼D区', '5', '神经内科', 'SJNK-MZDLELDQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b3250a40004', '2020-03-24 14:19:39', '门诊大楼二楼A区', '6', '小儿科', 'XEK-MZDLELAQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b3271370005', '2020-03-24 14:19:47', '门诊大楼二楼A区', '7', '感染科', 'GRK-MZDLELAQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b32aae60006', '2020-03-24 14:20:02', '门诊大楼二楼B区', '8', '肝胆外科', 'GDWK-MZDLELBQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b32dad20007', '2020-03-24 14:20:14', '门诊大楼二楼B区', '9', '泌尿外科', 'MNWK-MZDLELBQ', '0');
INSERT INTO `his_department` VALUES ('4028b881710b2cba01710b332fbf0008', '2020-03-24 14:20:36', '门诊大楼二楼C区', '10', '急诊科', 'JZK-MZDLELCQ', '1');
INSERT INTO `his_department` VALUES ('4028b8817121a5ac017121a8054d0000', '2020-03-28 22:59:51', '门诊大楼二楼E区', '12', '体检', 'TJ-MZDLELEQ', '0');

-- ----------------------------
-- Table structure for his_drug
-- ----------------------------
DROP TABLE IF EXISTS `his_drug`;
CREATE TABLE `his_drug` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `drug_type` varchar(50) NOT NULL,
  `efficacy_classification` varchar(50) NOT NULL,
  `limit_status` int(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `num` double NOT NULL,
  `price` double(50,0) NOT NULL,
  `specification` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `wholesale_price` double(50,0) NOT NULL,
  `storage_quantity` int(11) NOT NULL,
  `production_date` varchar(50) NOT NULL,
  `quality_date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_drug
-- ----------------------------
INSERT INTO `his_drug` VALUES ('402880ed6aac6930016aac8b115b0003', '2019-05-12 22:55:56', '片剂', '解热镇痛', '0', '西南药业股份有限公司', '布洛芬缓释片', '1557672956250', '12', '0.3g*20', '盒', '11', '42', '2015-06-13', '2020-09-18');
INSERT INTO `his_drug` VALUES ('402880ed6aac6930016aac8cf9340004', '2019-05-12 22:58:01', '胶囊剂', '解热镇痛', '0', '四川蜀中制药有限公司', '复方氨酚烷胺', '1557673081139', '4', '0.3g*10', '板', '4', '30', '2013-06-13', '2019-09-18');
INSERT INTO `his_drug` VALUES ('402880ed6aac6930016aac8f23c50005', '2019-05-12 23:00:23', '片剂', '镇痛', '0', '成都市潜江制药有限公司', '罗痛定片', '1557673223108', '5', '30mg*20', '瓶', '4', '77', '2015-06-11', '2021-09-16');
INSERT INTO `his_drug` VALUES ('4028b8816b0244fd016b02f8d60e0005', '2019-05-29 17:43:10', '薄膜衣片', '抗病毒药', '0', '葛兰素史克（苏州）有限公司', '拉米夫定', '1559122990587', '200', '100mg*14', '盒', '180', '112', '2019-03-05', '2019-06-07');

-- ----------------------------
-- Table structure for his_drug_type
-- ----------------------------
DROP TABLE IF EXISTS `his_drug_type`;
CREATE TABLE `his_drug_type` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `drug_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_drug_type
-- ----------------------------
INSERT INTO `his_drug_type` VALUES ('40283181795646470179564b7f6c0006', '2021-05-10 20:40:58', '口服');
INSERT INTO `his_drug_type` VALUES ('4028b8816aff159b016aff19715c0000', '2019-05-28 23:40:18', '胶囊剂');
INSERT INTO `his_drug_type` VALUES ('4028b8816b0244fd016b02b68ecd0001', '2019-05-29 16:30:46', '注射剂');
INSERT INTO `his_drug_type` VALUES ('4028b8816b0244fd016b02f378820003', '2019-05-29 17:37:18', '片剂');
INSERT INTO `his_drug_type` VALUES ('4028b8816b0244fd016b02f64d1a0004', '2019-05-29 17:40:24', '薄膜衣片');
INSERT INTO `his_drug_type` VALUES ('4028b881706154e20170615697ab0000', '2020-02-20 14:43:49', '');

-- ----------------------------
-- Table structure for his_efficacy_classification
-- ----------------------------
DROP TABLE IF EXISTS `his_efficacy_classification`;
CREATE TABLE `his_efficacy_classification` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `efficacy_classification` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_efficacy_classification
-- ----------------------------
INSERT INTO `his_efficacy_classification` VALUES ('4028b8816aff159b016aff1a23a20001', '2019-05-28 23:41:04', '风热感冒');
INSERT INTO `his_efficacy_classification` VALUES ('4028b8816b0244fd016b02d101990002', '2019-05-29 16:59:40', '抗病毒药');
INSERT INTO `his_efficacy_classification` VALUES ('4028b8816b26fa19016b2721befb0000', '2019-06-05 18:14:11', '解热镇痛');
INSERT INTO `his_efficacy_classification` VALUES ('4028b881716223510171622806740002', '2020-04-10 11:35:22', 'hah');

-- ----------------------------
-- Table structure for his_idcard
-- ----------------------------
DROP TABLE IF EXISTS `his_idcard`;
CREATE TABLE `his_idcard` (
  `card_id` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nationality` varchar(4) NOT NULL,
  `sex` varchar(4) NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_idcard
-- ----------------------------
INSERT INTO `his_idcard` VALUES ('1A5CA981', '四川省成都市双流区天府大道', '1995-04-13', '510727199504130125', '慕容清', '汉', '男');
INSERT INTO `his_idcard` VALUES ('1A60EDE1', '四川省成都市郫县红光镇', '1993-02-07', '510727199806045201', '张花花', '汉', '女');
INSERT INTO `his_idcard` VALUES ('AA9C887D', '四川省成都市武侯区', '1995-09-04', '510727199509040311', '李明', '羌', '男');

-- ----------------------------
-- Table structure for his_login_infor
-- ----------------------------
DROP TABLE IF EXISTS `his_login_infor`;
CREATE TABLE `his_login_infor` (
  `id` varchar(255) NOT NULL,
  `login_ip` varchar(64) DEFAULT NULL,
  `login_broswer` varchar(64) DEFAULT NULL,
  `login_address` varchar(20) DEFAULT NULL,
  `user_id` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `create_datetime` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2rtlewjw7yapj82150k1enrhg` (`user_id`),
  CONSTRAINT `FK2rtlewjw7yapj82150k1enrhg` FOREIGN KEY (`user_id`) REFERENCES `his_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_login_infor
-- ----------------------------
INSERT INTO `his_login_infor` VALUES ('40283181795589290179558c40690000', '113.236.172.41', 'Chrome', '辽宁省锦州市 联通', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2021-05-10 19:02:56');
INSERT INTO `his_login_infor` VALUES ('40283181795589290179559653820001', '113.236.172.41', 'Chrome', '辽宁省锦州市 联通', '402880ea6a7df7d6016a7e5806bf0006', 'm_doctor_2@shospital.com', '2021-05-10 19:02:16');
INSERT INTO `his_login_infor` VALUES ('4028318179558929017955978dd50002', '113.236.172.41', 'Chrome', '辽宁省锦州市 联通', '402880e86a24ccfc016a24cd6b240000', 'register@shospital.com', '2021-05-10 17:58:17');
INSERT INTO `his_login_infor` VALUES ('402831817955ed1e0179560070e10002', '39.144.57.179', 'Chrome', ' 中国移动', '402880e86a24ccfc016a24e8e12a000b', 'register_2@shospital.com', '2021-05-10 19:28:36');
INSERT INTO `his_login_infor` VALUES ('402831817955ed1e017956016b530003', '39.144.57.179', 'Chrome', ' 中国移动', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2021-05-10 19:35:48');
INSERT INTO `his_login_infor` VALUES ('402831817955ed1e017956051c020004', '39.144.57.179', 'Chrome', ' 中国移动', '402880ea6a7df7d6016a7e5806bf0006', 'm_doctor_2@shospital.com', '2021-05-10 19:35:19');
INSERT INTO `his_login_infor` VALUES ('402831817955ed1e01795606780d0005', '39.144.57.179', 'Chrome', ' 中国移动', '402880e86a24ccfc016a24cd6b240000', 'register@shospital.com', '2021-05-10 19:33:26');
INSERT INTO `his_login_infor` VALUES ('40283181795626f20179562783270000', '113.236.172.126', 'Chrome', '辽宁省锦州市 联通', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2021-05-10 20:58:17');
INSERT INTO `his_login_infor` VALUES ('40283181795626f2017956298a0e0004', '113.236.172.126', 'Chrome', '辽宁省锦州市 联通', '402880ea6a7df7d6016a7e5ce3810008', 'm_doctor_3@shospital.com', '2021-05-10 20:27:36');
INSERT INTO `his_login_infor` VALUES ('40283181795626f20179562d6a290006', '113.236.172.126', 'Chrome', '辽宁省锦州市 联通', '402881ea6abf196a016abf40b8400005', 'm_tollCollector_1@shospital.com', '2021-05-10 20:33:27');
INSERT INTO `his_login_infor` VALUES ('40283181795626f201795630a2a8000b', '113.236.172.126', 'Chrome', '辽宁省锦州市 联通', '402880ea6a7df7d6016a7e5806bf0006', 'm_doctor_2@shospital.com', '2021-05-10 20:56:59');
INSERT INTO `his_login_infor` VALUES ('402880e56a11b879016a11bdd1ea0000', '171.216.69.212', 'Chrome', '四川省成都市', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2019-04-12 21:30:13');
INSERT INTO `his_login_infor` VALUES ('402880e56a163990016a163c4cc80000', '171.216.69.212', 'Edge', '四川省成都市', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2019-04-13 18:26:50');
INSERT INTO `his_login_infor` VALUES ('4028818b790e7a5a01790e7c82350000', '42.203.45.220', 'Firefox', '辽宁省鞍山市 电信', '402880e86a24ccfc016a24cd6b240000', 'register@shospital.com', '2021-04-26 22:58:06');
INSERT INTO `his_login_infor` VALUES ('4028818b790e7a5a01790e8246c80001', '42.203.45.220', 'Firefox', '辽宁省鞍山市 电信', '402880ea6a7df7d6016a7e5806bf0006', 'm_doctor_2@shospital.com', '2021-04-26 22:08:09');
INSERT INTO `his_login_infor` VALUES ('4028818b790e7a5a01790e8545230002', '42.203.45.220', 'Firefox', '辽宁省鞍山市 电信', '402880e86a24ccfc016a24e8e12a000b', 'register_2@shospital.com', '2021-04-26 22:21:10');
INSERT INTO `his_login_infor` VALUES ('4028818b790e7a5a01790e85854f0003', '42.203.45.220', 'Firefox', '辽宁省鞍山市 电信', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2021-04-26 23:01:02');
INSERT INTO `his_login_infor` VALUES ('402881ea6a0fa5c7016a0fb0aa820000', '117.173.217.156', 'Chrome', '四川省成都市', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2019-04-12 11:56:35');
INSERT INTO `his_login_infor` VALUES ('4028b88170de6c810170de6cef630000', '171.217.62.126', 'Chrome', '四川省成都市 电信', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2020-03-15 21:45:57');
INSERT INTO `his_login_infor` VALUES ('4028b881710b6fb501710b71fdff0002', '182.138.101.27', 'Chrome', '四川省成都市 电信', '8ad8a0ec6a0a7e7b016a0a7ed6e50000', 'm_doctor@shospital.com', '2020-04-10 16:41:29');
INSERT INTO `his_login_infor` VALUES ('4028b881710b968e01710b97f9d60000', '182.138.101.27', 'Chrome', '四川省成都市 电信', '402880e86a24ccfc016a24cd6b240000', 'register@shospital.com', '2020-04-10 18:06:33');
INSERT INTO `his_login_infor` VALUES ('4028b881710b968e01710b991aa80003', '182.138.101.27', 'Chrome', '四川省成都市 电信', '402880ea6a7df7d6016a7e5806bf0006', 'm_doctor_2@shospital.com', '2020-04-10 18:06:59');
INSERT INTO `his_login_infor` VALUES ('4028b8817121baab017121bb36ff0000', '171.216.68.81', 'Chrome', '四川省成都市 电信', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2020-03-29 12:23:54');
INSERT INTO `his_login_infor` VALUES ('4028b8817126b3bb017126b438a00000', '171.216.68.81', 'Chrome', '四川省成都市 电信', '8ad8a0ec6a0a7e7b016a0a7ed6e50000', 'm_doctor@shospital.com', '2020-03-29 22:31:17');
INSERT INTO `his_login_infor` VALUES ('4028b881714ef3fc01714efe100a0002', '110.184.204.15', 'Chrome', '四川省成都市 电信', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2020-04-06 21:12:20');
INSERT INTO `his_login_infor` VALUES ('4028b88171587f1801715893a2e20001', '182.138.101.27', 'Chrome', '四川省成都市 电信', '402881ea6aca4965016aca6a54d0000a', 'm_technologyDoc_1@shospital.com', '2020-04-10 16:59:48');
INSERT INTO `his_login_infor` VALUES ('4028b8817158bb0b017158bc801f0000', '182.138.101.27', 'Chrome', '四川省成都市 电信', '402881ea6abf196a016abf40b8400005', 'm_tollCollector_1@shospital.com', '2020-04-10 18:04:21');
INSERT INTO `his_login_infor` VALUES ('4028b88171634d0d01716353e5120003', '182.138.101.27', 'Edge', '四川省成都市 电信', '402880ea6a7df7d6016a7e5806bf0006', 'm_doctor_2@shospital.com', '2020-04-10 17:31:24');
INSERT INTO `his_login_infor` VALUES ('4028b8817163835e0171638cc3440001', '182.138.101.27', 'Chrome', '四川省成都市 电信', '402881ea6abf196a016abf2fbb5e0003', 'm_druggist_1@shospital.com', '2020-04-10 18:05:01');
INSERT INTO `his_login_infor` VALUES ('4028b8817163835e0171638ecfcb0004', '182.138.101.27', 'Chrome', '四川省成都市 电信', '402880ea6a7df7d6016a7e5ce3810008', 'm_doctor_3@shospital.com', '2020-04-10 18:07:15');
INSERT INTO `his_login_infor` VALUES ('8ad8a0ec6a06851e016a06921bc70004', '182.138.101.27', 'Chrome', '四川省成都市', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2020-04-10 15:21:39');
INSERT INTO `his_login_infor` VALUES ('8ad8a0ec6a0a74fd016a0a76156a0000', '182.138.101.27', 'Edge', '四川省成都市', '8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '2020-04-10 16:51:20');

-- ----------------------------
-- Table structure for his_medical_examination
-- ----------------------------
DROP TABLE IF EXISTS `his_medical_examination`;
CREATE TABLE `his_medical_examination` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `blood_pressure` varchar(10) DEFAULT NULL,
  `body_temperature` varchar(10) DEFAULT NULL,
  `heart_rate` varchar(10) DEFAULT NULL,
  `pulse` varchar(10) DEFAULT NULL,
  `examination_cost` double(10,0) DEFAULT NULL,
  `prescription_num` varchar(64) DEFAULT NULL,
  `register_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe6cr3wdtcq4en8tpwb038qopm` (`register_id`),
  CONSTRAINT `FKe6cr3wdtcq4en8tpwb038qopm` FOREIGN KEY (`register_id`) REFERENCES `his_register` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_medical_examination
-- ----------------------------
INSERT INTO `his_medical_examination` VALUES ('4028b88171634d0d0171635356110002', '2020-04-10 17:02:18', '120', '36', '70', '60', '10', 'O1586504278999', '4028b88171633e6b0171633fd4400000');

-- ----------------------------
-- Table structure for his_medical_record
-- ----------------------------
DROP TABLE IF EXISTS `his_medical_record`;
CREATE TABLE `his_medical_record` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `condition_description` varchar(255) DEFAULT NULL,
  `diagnosis_result` varchar(255) DEFAULT NULL,
  `drug_cost` double(50,0) DEFAULT NULL,
  `medical_order` varchar(255) DEFAULT NULL,
  `prescription` text,
  `prescription_num` varchar(255) NOT NULL,
  `register_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj7lqjwchyktjc2pno6e7f60k8` (`register_id`),
  CONSTRAINT `FKj7lqjwchyktjc2pno6e7f60k8` FOREIGN KEY (`register_id`) REFERENCES `his_register` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_medical_record
-- ----------------------------
INSERT INTO `his_medical_record` VALUES ('40283181795589290179559a9f3d0006', '2021-05-10 17:27:47', '1', '11', '0', '1', '<ol>\n\n                                        </ol>', 'O1620638829927', '40283181795589290179559912170004');
INSERT INTO `his_medical_record` VALUES ('402831817955aeb7017955b429fb0004', '2021-05-10 17:55:41', '1', '11', '0', '111', '<ol>\n\n                                        </ol>', 'O1620640512325', '402831817955aeb7017955b36ef60002');
INSERT INTO `his_medical_record` VALUES ('402831817955ed1e0179560ce6280006', '2021-05-10 19:32:36', '3434', '34343', '4', '3434', '<ol>\n\n                                        <li>复方氨酚烷胺<span style=\"margin-left:100px\">0.3g*10*1板</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">外用</sapn><sapn style=\"margin-left:60px\">每日两次</sapn></div></ol>', 'O1620646347808', '402831817955ed1e017955f0d7380000');
INSERT INTO `his_medical_record` VALUES ('40283181795626f20179562a3c210005', '2021-05-10 20:04:39', '无', '健康', '12', '无', '<ol>\n\n                                        <li>布洛芬缓释片<span style=\"margin-left:100px\">0.3g*20*1盒</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div></ol>', 'O1620648239147', '40283181795626f20179562944c30002');
INSERT INTO `his_medical_record` VALUES ('40283181795626f201795630eb42000c', '2021-05-10 20:11:57', 'wu', '1', '12', '1', '<ol>\n\n                                        <li>布洛芬缓释片<span style=\"margin-left:100px\">0.3g*20*1盒</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div></ol>', 'O1620648703285', '40283181795626f20179563069010009');
INSERT INTO `his_medical_record` VALUES ('40283181795626f201795638d7420010', '2021-05-10 20:20:36', 'wu', 'wu', '12', 'wu', '<ol>\n\n                                        <li>布洛芬缓释片<span style=\"margin-left:100px\">0.3g*20*1盒</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div></ol>', 'O1620649214911', '40283181795626f2017956382b9e000e');
INSERT INTO `his_medical_record` VALUES ('40283181795626f2017956409e9f0014', '2021-05-10 20:29:06', '1', '1', '12', '1', '<ol>\n\n                                        <li>布洛芬缓释片<span style=\"margin-left:100px\">0.3g*20*1盒</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div></ol>', 'O1620649739292', '40283181795626f20179563ed4ea0012');
INSERT INTO `his_medical_record` VALUES ('40283181795626f2017956446b5d0017', '2021-05-10 20:33:15', '1', '1', '12', '1', '<ol>\n\n                                        <li>布洛芬缓释片<span style=\"margin-left:100px\">0.3g*20*1盒</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div></ol>', 'O1620649948480', '40283181795626f20179564373e40015');
INSERT INTO `his_medical_record` VALUES ('4028318179564647017956499e6e0004', '2021-05-10 20:38:55', '1', '1', '17', '1', '<ol>\n\n                                        <li>复方氨酚烷胺<span style=\"margin-left:100px\">0.3g*10*1板</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div><li>复方氨酚烷胺<span style=\"margin-left:100px\">0.3g*10*1板</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div><li>复方氨酚烷胺<span style=\"margin-left:100px\">0.3g*10*1板</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div><li>罗痛定片<span style=\"margin-left:100px\">30mg*20*1瓶</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div></ol>', 'O1620650305394', '402831817956464701795648d9280002');
INSERT INTO `his_medical_record` VALUES ('40283181795650000179565aedb90003', '2021-05-10 20:57:50', '无', '无', '8', '无', '<ol>\n\n                                        <li>复方氨酚烷胺<span style=\"margin-left:100px\">0.3g*10*1板</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div><li>复方氨酚烷胺<span style=\"margin-left:100px\">0.3g*10*1板</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>1</sapn><sapn style=\"margin-left:40px\">外用</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div></ol>', 'O1620651432233', '402831817956500001795659c1d60001');
INSERT INTO `his_medical_record` VALUES ('4028b8817162ff0801716306946a0002', '2020-04-10 15:38:27', '哈哈', '哈哈', '12', '哈哈', '<ol>\n\n                                        <li>布洛芬缓释片<span style=\"margin-left:100px\">0.3g*20*1盒</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>0.5</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日一次</sapn></div></ol>', 'O1586504278999', '4028b8817162ff08017163049c9d0000');
INSERT INTO `his_medical_record` VALUES ('4028b8817163835e0171638f4d6b0005', '2020-04-10 18:07:47', '啦啦啦', '啦啦啦', '4', '啦啦啦', '<ol>\n\n                                        <li>复方氨酚烷胺<span style=\"margin-left:100px\">0.3g*10*1板</span></li><div style=\"margin: 10px 0 10px 5px;\">用法：<sapn>0.3g</sapn><sapn style=\"margin-left:40px\">口服</sapn><sapn style=\"margin-left:60px\">每日两次</sapn></div></ol>', 'O1586513242956', '4028b8817163835e0171638e5ce00002');

-- ----------------------------
-- Table structure for his_outpatient_queue
-- ----------------------------
DROP TABLE IF EXISTS `his_outpatient_queue`;
CREATE TABLE `his_outpatient_queue` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `outpatient_queue_status` int(11) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `register_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8crcyewdiqishredqwx9w1cnw` (`user_id`),
  KEY `FKanyqf7asaslfiu8qa9trhsq7f` (`patient_id`),
  KEY `his_outpatient_queue_index` (`register_id`,`patient_id`),
  CONSTRAINT `FK8crcyewdiqishredqwx9w1cnw` FOREIGN KEY (`user_id`) REFERENCES `his_user` (`id`),
  CONSTRAINT `FKanyqf7asaslfiu8qa9trhsq7f` FOREIGN KEY (`patient_id`) REFERENCES `his_patient` (`id`),
  CONSTRAINT `FKr4e9u7n5vuhgxvfkiwrvihqp3` FOREIGN KEY (`register_id`) REFERENCES `his_register` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_outpatient_queue
-- ----------------------------
INSERT INTO `his_outpatient_queue` VALUES ('402831817955892901795599121a0005', '2021-05-10 17:26:05', '0', '张#李医生', '40283181795589290179559912170004', '402880ea6a7df7d6016a7e5806bf0006', '402831817955892901795598a5b80003');
INSERT INTO `his_outpatient_queue` VALUES ('402831817955aeb7017955b36efa0003', '2021-05-10 17:54:53', '0', '马#李医生', '402831817955aeb7017955b36ef60002', '402880ea6a7df7d6016a7e5806bf0006', '402831817955aeb7017955b2b9d40001');
INSERT INTO `his_outpatient_queue` VALUES ('402831817955ed1e017955f0d73e0001', '2021-05-10 19:01:57', '0', '马#李医生', '402831817955ed1e017955f0d7380000', '402880ea6a7df7d6016a7e5806bf0006', '402831817955aeb7017955b0cfbd0000');
INSERT INTO `his_outpatient_queue` VALUES ('402831817955ed1e0179560f1c250009', '2021-05-10 19:35:01', '1', '祝#张医生', '402831817955ed1e0179560f1c220008', '402880ea6a7df7d6016a7e5ce3810008', '402831817955ed1e0179560e79550007');
INSERT INTO `his_outpatient_queue` VALUES ('40283181795626f20179562944ca0003', '2021-05-10 20:03:35', '0', '离哈哈哈#张医生', '40283181795626f20179562944c30002', '402880ea6a7df7d6016a7e5ce3810008', '40283181795626f2017956289ffd0001');
INSERT INTO `his_outpatient_queue` VALUES ('40283181795626f2017956306906000a', '2021-05-10 20:11:23', '0', '李哈哈#李医生', '40283181795626f20179563069010009', '402880ea6a7df7d6016a7e5806bf0006', '40283181795626f2017956301f330008');
INSERT INTO `his_outpatient_queue` VALUES ('40283181795626f2017956382ba1000f', '2021-05-10 20:19:52', '0', '张同学#李医生', '40283181795626f2017956382b9e000e', '402880ea6a7df7d6016a7e5806bf0006', '40283181795626f201795637dedb000d');
INSERT INTO `his_outpatient_queue` VALUES ('40283181795626f20179563ed4ed0013', '2021-05-10 20:27:08', '0', '离哈哈哈#张医生', '40283181795626f20179563ed4ea0012', '402880ea6a7df7d6016a7e5ce3810008', '40283181795626f2017956289ffd0001');
INSERT INTO `his_outpatient_queue` VALUES ('40283181795626f20179564373e60016', '2021-05-10 20:32:11', '0', '张同学#李医生', '40283181795626f20179564373e40015', '402880ea6a7df7d6016a7e5806bf0006', '40283181795626f201795637dedb000d');
INSERT INTO `his_outpatient_queue` VALUES ('402831817956464701795648d92f0003', '2021-05-10 20:38:05', '0', '张#李医生', '402831817956464701795648d9280002', '402880ea6a7df7d6016a7e5806bf0006', '40283181795646470179564897f70001');
INSERT INTO `his_outpatient_queue` VALUES ('402831817956500001795659c1d90002', '2021-05-10 20:56:33', '0', '吗#李医生', '402831817956500001795659c1d60001', '402880ea6a7df7d6016a7e5806bf0006', '402831817956500001795658c38c0000');
INSERT INTO `his_outpatient_queue` VALUES ('4028818b790e8d9d01790eb641830002', '2021-04-26 23:04:55', '0', '张花花#李医生', '4028818b790e8d9d01790eb6417b0001', '402880ea6a7df7d6016a7e5806bf0006', '402880ea6a77a772016a77a7f63c0000');
INSERT INTO `his_outpatient_queue` VALUES ('4028b8817161cc31017161cd810a0001', '2020-04-10 09:56:30', '0', '张花花#孙检查', '4028b8817161cc31017161cd80bc0000', '402881ea6aca4965016aca6a54d0000a', '402880ea6a77a772016a77a7f63c0000');
INSERT INTO `his_outpatient_queue` VALUES ('4028b88171626b7b0171626f02c50001', '2020-04-10 12:52:54', '1', '慕容清#孙检查', '4028b88171626b7b0171626f02450000', '402881ea6aca4965016aca6a54d0000a', '402880ea6a7df7d6016a7e35dec80000');
INSERT INTO `his_outpatient_queue` VALUES ('4028b8817162ff08017163049cc10001', '2020-04-10 15:36:18', '0', '张花花#李医生', '4028b8817162ff08017163049c9d0000', '402880ea6a7df7d6016a7e5806bf0006', '402880ea6a77a772016a77a7f63c0000');
INSERT INTO `his_outpatient_queue` VALUES ('4028b88171633e6b0171633fd4610001', '2020-04-10 16:40:59', '0', '张花花#孙检查', '4028b88171633e6b0171633fd4400000', '402881ea6aca4965016aca6a54d0000a', '402880ea6a77a772016a77a7f63c0000');
INSERT INTO `his_outpatient_queue` VALUES ('4028b8817163835e0171638e5cfb0003', '2020-04-10 18:06:46', '0', '张花花#张医生', '4028b8817163835e0171638e5ce00002', '402880ea6a7df7d6016a7e5ce3810008', '402880ea6a77a772016a77a7f63c0000');

-- ----------------------------
-- Table structure for his_patient
-- ----------------------------
DROP TABLE IF EXISTS `his_patient`;
CREATE TABLE `his_patient` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `card_id` varchar(20) NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nationality` varchar(4) NOT NULL,
  `sex` varchar(4) NOT NULL,
  `telphone` varchar(20) DEFAULT NULL,
  `career` varchar(20) DEFAULT NULL,
  `family_history` varchar(255) DEFAULT NULL,
  `marital_status` varchar(10) DEFAULT NULL,
  `past_history` varchar(255) DEFAULT NULL,
  `personal_history` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `his_patient_index` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_patient
-- ----------------------------
INSERT INTO `his_patient` VALUES ('402831817955892901795598a5b80003', '2021-05-10 17:25:37', '11', '1996-09-09', '1D', '21092119961011025X', '张', '汉族', '男', '', '1', '1', '1', '1', '1');
INSERT INTO `his_patient` VALUES ('402831817955aeb7017955b0cfbd0000', '2021-05-10 17:52:01', '胆大妄为啥所大所寻', '1995-02-16', '56', '210203199810260518', '马', '汉族', '男', '', '1', '1', '11', '1', '11');
INSERT INTO `his_patient` VALUES ('402831817955aeb7017955b2b9d40001', '2021-05-10 17:54:06', '下下次是在床上', '1998-10-26', '123', '210604199710292019', '马', '汉族', '男', '', '1', '1', '1', '1', '1');
INSERT INTO `his_patient` VALUES ('402831817955ed1e0179560e79550007', '2021-05-10 19:34:19', '撒大大', '1999-9-9', '000', '210106199804064936', '祝', '汉', '男', '01065165', null, null, null, null, null);
INSERT INTO `his_patient` VALUES ('40283181795626f2017956289ffd0001', '2021-05-10 20:02:53', '辽宁工业大学', '1999-10-11', '2D', '210921199610110022', '离哈哈哈', '汉族', '男', '', '学生', '无', '否', '无', '无');
INSERT INTO `his_patient` VALUES ('40283181795626f2017956301f330008', '2021-05-10 20:11:04', '辽宁工业大学', '1996-10-12', '3D', '210921199610120255', '李哈哈', '汉族', '男', '', '', '1', '', '1', '1');
INSERT INTO `his_patient` VALUES ('40283181795626f201795637dedb000d', '2021-05-10 20:19:32', '辽宁工业大学', '1998-10-26', '5D', '513436200004218136 ', '张同学', '汉族', '男', '', '1', '1', '否', '1', '1');
INSERT INTO `his_patient` VALUES ('40283181795646470179564897f70001', '2021-05-10 20:37:48', '辽宁工业大学', '2000-04-21', '22', '513436200004219614 ', '张', '汉族', '男', '', null, null, null, null, null);
INSERT INTO `his_patient` VALUES ('402831817956500001795658c38c0000', '2021-05-10 20:55:28', '设施大V吧是SV是', '1998-10-25', '14D', '21020319481025051X', '吗', '汉族', '男', '', null, null, null, null, null);
INSERT INTO `his_patient` VALUES ('402880ea6a77a772016a77a7f63c0000', '2019-05-02 16:27:37', '四川省成都市郫县红光镇', '1993-02-07', '1A553D21', '510727199806045201', '张花花', '汉', '女', null, '自营', '无遗传病史。', '已婚', '无重大疾病', '经常感冒。');
INSERT INTO `his_patient` VALUES ('402880ea6a7df7d6016a7e35dec80000', '2019-05-03 23:00:20', '四川省成都市双流区天府大道', '1995-04-13', '1A5CA981', '510727199504130125', '慕容清', '汉', '男', null, '出纳员', '否认家族遗传病史。', '未婚', '无肝炎、结核等传染病史及密切接触史。无重大外伤及手术史，无药物过敏史。预防接种史不详。', '生于原籍，无外地久居史，无不良嗜好。');
INSERT INTO `his_patient` VALUES ('4028b881715e31a401715e33ed970000', '2020-04-09 17:09:53', '四川省成都市', '1995', 'H334G2G', '35325463', 'seb', '汉', '男', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for his_register
-- ----------------------------
DROP TABLE IF EXISTS `his_register`;
CREATE TABLE `his_register` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `department` varchar(32) NOT NULL,
  `doctor` varchar(32) NOT NULL,
  `pay_type` varchar(10) NOT NULL,
  `register_type` varchar(10) NOT NULL,
  `treatment_price` varchar(10) NOT NULL,
  `patient_id` varchar(255) NOT NULL,
  `operator_email` varchar(50) NOT NULL,
  `operator_name` varchar(20) NOT NULL,
  `register_status` int(11) NOT NULL,
  `treatment_status` int(11) NOT NULL,
  `registered_num` varchar(50) NOT NULL,
  `doctor_id` varchar(255) NOT NULL,
  `charge_status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `his_register_index` (`patient_id`),
  CONSTRAINT `FKro0gncetto77fqmii4bxaprlu` FOREIGN KEY (`patient_id`) REFERENCES `his_patient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_register
-- ----------------------------
INSERT INTO `his_register` VALUES ('40283181795589290179559912170004', '2021-05-10 17:26:05', '1', '李医生', '现金', '普通门诊', '3.0', '402831817955892901795598a5b80003', 'register@shospital.com', '王挂号', '1', '1', 'RE1620638765591889', '402880ea6a7df7d6016a7e5806bf0006', '1');
INSERT INTO `his_register` VALUES ('402831817955aeb7017955b36ef60002', '2021-05-10 17:54:53', '1', '李医生', '现金', '普通门诊', '3.0', '402831817955aeb7017955b2b9d40001', 'register@shospital.com', '王挂号', '1', '1', 'RE1620640493300191', '402880ea6a7df7d6016a7e5806bf0006', '0');
INSERT INTO `his_register` VALUES ('402831817955ed1e017955f0d7380000', '2021-05-10 19:01:57', '1', '李医生', '现金', '普通门诊', '3.0', '402831817955aeb7017955b0cfbd0000', 'register@shospital.com', '王挂号', '1', '1', 'RE1620644517686762', '402880ea6a7df7d6016a7e5806bf0006', '0');
INSERT INTO `his_register` VALUES ('402831817955ed1e0179560f1c220008', '2021-05-10 19:35:01', '1', '张医生', '现金', '普通门诊', '2.0', '402831817955ed1e0179560e79550007', 'register@shospital.com', '王挂号', '1', '0', 'RE1620646501410864', '402880ea6a7df7d6016a7e5ce3810008', '0');
INSERT INTO `his_register` VALUES ('40283181795626f20179562944c30002', '2021-05-10 20:03:35', '2', '张医生', '现金', '普通门诊', '2.0', '40283181795626f2017956289ffd0001', '1208585122@qq.com', '薛管理', '1', '1', 'RE1620648215743129', '402880ea6a7df7d6016a7e5ce3810008', '1');
INSERT INTO `his_register` VALUES ('40283181795626f20179563069010009', '2021-05-10 20:11:23', '1', '李医生', '现金', '普通门诊', '3.0', '40283181795626f2017956301f330008', '1208585122@qq.com', '薛管理', '1', '1', 'RE1620648683777104', '402880ea6a7df7d6016a7e5806bf0006', '0');
INSERT INTO `his_register` VALUES ('40283181795626f2017956382b9e000e', '2021-05-10 20:19:52', '1', '李医生', '现金', '普通门诊', '3.0', '40283181795626f201795637dedb000d', '1208585122@qq.com', '薛管理', '1', '1', 'RE1620649192350250', '402880ea6a7df7d6016a7e5806bf0006', '1');
INSERT INTO `his_register` VALUES ('40283181795626f20179563ed4ea0012', '2021-05-10 20:27:08', '2', '张医生', '现金', '普通门诊', '2.0', '40283181795626f2017956289ffd0001', '1208585122@qq.com', '薛管理', '1', '1', 'RE1620649628906604', '402880ea6a7df7d6016a7e5ce3810008', '0');
INSERT INTO `his_register` VALUES ('40283181795626f20179564373e40015', '2021-05-10 20:32:11', '1', '李医生', '现金', '普通门诊', '3.0', '40283181795626f201795637dedb000d', '1208585122@qq.com', '薛管理', '1', '1', 'RE1620649931747297', '402880ea6a7df7d6016a7e5806bf0006', '0');
INSERT INTO `his_register` VALUES ('402831817956464701795648d9280002', '2021-05-10 20:38:05', '1', '李医生', '现金', '普通门诊', '3.0', '40283181795646470179564897f70001', '1208585122@qq.com', '薛管理', '1', '1', 'RE1620650285352909', '402880ea6a7df7d6016a7e5806bf0006', '1');
INSERT INTO `his_register` VALUES ('402831817956500001795659c1d60001', '2021-05-10 20:56:33', '1', '李医生', '现金', '普通门诊', '3.0', '402831817956500001795658c38c0000', '1208585122@qq.com', '薛管理', '1', '1', 'RE1620651393494317', '402880ea6a7df7d6016a7e5806bf0006', '1');
INSERT INTO `his_register` VALUES ('4028818b790e8d9d01790eb6417b0001', '2021-04-26 23:04:55', '1', '李医生', '现金', '普通门诊', '3.0', '402880ea6a77a772016a77a7f63c0000', '1208585122@qq.com', '薛管理', '-1', '0', 'RE1619449495930821', '402880ea6a7df7d6016a7e5806bf0006', '0');
INSERT INTO `his_register` VALUES ('4028b8817161cc31017161cd80bc0000', '2020-04-10 09:56:30', '12', '孙检查', '现金', '普通门诊', '3.0', '402880ea6a77a772016a77a7f63c0000', 'register@shospital.com', '王挂号', '1', '1', 'RE1586483790002406', '402881ea6aca4965016aca6a54d0000a', '1');
INSERT INTO `his_register` VALUES ('4028b88171626b7b0171626f02450000', '2020-04-10 12:52:54', '12', '孙检查', '支付宝', '普通门诊', '3.0', '402880ea6a7df7d6016a7e35dec80000', '1208585122@qq.com', '薛管理', '1', '0', 'RE1586494374458304', '402881ea6aca4965016aca6a54d0000a', '0');
INSERT INTO `his_register` VALUES ('4028b8817162ff08017163049c9d0000', '2020-04-10 15:36:18', '1', '李医生', '现金', '普通门诊', '3.0', '402880ea6a77a772016a77a7f63c0000', 'register@shospital.com', '王挂号', '1', '1', 'RE1586504178838585', '402880ea6a7df7d6016a7e5806bf0006', '1');
INSERT INTO `his_register` VALUES ('4028b88171633e6b0171633fd4400000', '2020-04-10 16:40:59', '12', '孙检查', '现金', '普通门诊', '3.0', '402880ea6a77a772016a77a7f63c0000', 'register@shospital.com', '王挂号', '1', '1', 'RE1586508059698640', '402881ea6aca4965016aca6a54d0000a', '1');
INSERT INTO `his_register` VALUES ('4028b8817163835e0171638e5ce00002', '2020-04-10 18:06:46', '2', '张医生', '支付宝', '普通门诊', '2.0', '402880ea6a77a772016a77a7f63c0000', 'register@shospital.com', '王挂号', '1', '1', 'RE1586513206495543', '402880ea6a7df7d6016a7e5ce3810008', '1');

-- ----------------------------
-- Table structure for his_role
-- ----------------------------
DROP TABLE IF EXISTS `his_role`;
CREATE TABLE `his_role` (
  `id` varchar(255) NOT NULL,
  `role` varchar(64) NOT NULL,
  `role_value` tinyint(2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_datetime` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_role
-- ----------------------------
INSERT INTO `his_role` VALUES ('402880ea6a7df7d6016a7e480e360001', 'druggist', '3', '药剂师', '2019-05-03 23:20:12');
INSERT INTO `his_role` VALUES ('402880ea6a7df7d6016a7e49e7b70002', 'nurseAdmin', '4', '护士管理员', '2019-05-03 23:22:13');
INSERT INTO `his_role` VALUES ('402880ea6a7df7d6016a7e4b18130003', 'technologyDoc', '5', '医技师', '2019-05-03 23:23:31');
INSERT INTO `his_role` VALUES ('402880ea6a7df7d6016a7e4d6f480004', 'tollCollector', '6', '划价收费员', '2019-05-03 23:26:05');
INSERT INTO `his_role` VALUES ('402880ea6a7df7d6016a7e4eb6360005', 'drugStoreAdmin', '7', '药房管理员', '2019-05-03 23:27:28');
INSERT INTO `his_role` VALUES ('402881e76a0b39e5016a0b3de7de0002', 'register', '2', '挂号员', '2019-04-11 15:12:47');
INSERT INTO `his_role` VALUES ('8ad8a0ec6a06851e016a068ab7b30000', 'admin', '0', '管理员', '2019-04-10 17:18:35');
INSERT INTO `his_role` VALUES ('8ad8a0ec6a06851e016a068b90480001', 'mdoctor', '1', '门诊医生', '2019-08-16 17:11:30');

-- ----------------------------
-- Table structure for his_toll
-- ----------------------------
DROP TABLE IF EXISTS `his_toll`;
CREATE TABLE `his_toll` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_toll
-- ----------------------------

-- ----------------------------
-- Table structure for his_toll_takedrug
-- ----------------------------
DROP TABLE IF EXISTS `his_toll_takedrug`;
CREATE TABLE `his_toll_takedrug` (
  `id` varchar(255) NOT NULL,
  `create_datetime` varchar(20) NOT NULL,
  `prescription_num` varchar(255) NOT NULL,
  `taking_drug_date_time` varchar(50) DEFAULT NULL,
  `taking_drug_operator` varchar(255) DEFAULT NULL,
  `taking_drug_status` int(11) NOT NULL,
  `toll_date_time` varchar(50) DEFAULT NULL,
  `toll_operator` varchar(255) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_toll_takedrug
-- ----------------------------
INSERT INTO `his_toll_takedrug` VALUES ('40283181795626f20179562e102c0007', '2021-05-10 20:08:49', 'O1620648239147', null, null, '0', '2021-05-10 20:08:49', '402881ea6abf196a016abf40b8400005', '40283181795626f2017956289ffd0001');
INSERT INTO `his_toll_takedrug` VALUES ('40283181795626f20179563ba9c70011', '2021-05-10 20:23:41', 'O1620649214911', null, null, '0', '2021-05-10 20:23:41', '8ad8a0ec6a06851e016a069172fa0002', '40283181795626f201795637dedb000d');
INSERT INTO `his_toll_takedrug` VALUES ('40283181795646470179564731e10000', '2021-05-10 20:36:16', 'O1620638829927', null, null, '0', '2021-05-10 20:36:16', '8ad8a0ec6a06851e016a069172fa0002', '402831817955892901795598a5b80003');
INSERT INTO `his_toll_takedrug` VALUES ('40283181795646470179564a18f50005', '2021-05-10 20:39:27', 'O1620650305394', null, null, '0', '2021-05-10 20:39:27', '8ad8a0ec6a06851e016a069172fa0002', '40283181795646470179564897f70001');
INSERT INTO `his_toll_takedrug` VALUES ('40283181795650000179565c18b30004', '2021-05-10 20:59:06', 'O1620651432233', null, null, '0', '2021-05-10 20:59:06', '8ad8a0ec6a06851e016a069172fa0002', '402831817956500001795658c38c0000');
INSERT INTO `his_toll_takedrug` VALUES ('4028818b790e8d9d01790eb5c8ac0000', '2021-04-26 23:04:24', 'O1586513242956', null, null, '0', '2021-04-26 23:04:24', '8ad8a0ec6a06851e016a069172fa0002', '402880ea6a77a772016a77a7f63c0000');
INSERT INTO `his_toll_takedrug` VALUES ('4028b88170c26daa0170c27190230004', '2020-03-10 11:16:27', '1583810030640', '2020-03-10 14:19:09', '402881ea6abf196a016abf2fbb5e0003', '1', '2020-03-10 11:30:34', '402881ea6abf196a016abf40b8400005', '402880ea6a7df7d6016a7e35dec80000');
INSERT INTO `his_toll_takedrug` VALUES ('4028b8817163835e0171638c51560000', '2020-04-10 18:04:32', 'O1586504278999', '2020-04-10 18:05:23', '402881ea6abf196a016abf2fbb5e0003', '1', '2020-04-10 18:04:32', '402881ea6abf196a016abf40b8400005', '402880ea6a77a772016a77a7f63c0000');

-- ----------------------------
-- Table structure for his_user
-- ----------------------------
DROP TABLE IF EXISTS `his_user`;
CREATE TABLE `his_user` (
  `id` varchar(255) NOT NULL,
  `email` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `plain_password` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL COMMENT ' ',
  `create_datetime` varchar(64) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `political_status` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `birthday` varchar(64) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `allow_num` int(10) NOT NULL DEFAULT '0',
  `department` tinyint(10) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `treatment_price` varchar(10) DEFAULT NULL,
  `work_address` varchar(30) DEFAULT NULL,
  `work_date_time` varchar(20) DEFAULT NULL,
  `work_status` varchar(10) DEFAULT NULL,
  `email_status` int(11) DEFAULT NULL,
  `validate_code` varchar(255) DEFAULT NULL,
  `department_type` tinyint(10) DEFAULT NULL,
  `now_num` int(10) NOT NULL DEFAULT '0',
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_user
-- ----------------------------
INSERT INTO `his_user` VALUES ('402880e86a24ccfc016a24cd6b240000', 'register@shospital.com', '王挂号', '123', 'b03ecbe66599f4451225edf293ffc8ae', '50db0e033e10810bc1a3c8fc6d2de7f9', '2019-04-16 14:20:03', '', '群众', '', '', '男', '0', null, null, null, null, null, null, '1', null, null, '0', '2020-03-24');
INSERT INTO `his_user` VALUES ('402880e86a24ccfc016a24e8e12a000b', 'register_2@shospital.com', 'register_2', '123', '7e93221630869a886899755ad3ae9fff', '611b5b68776ee4a8cb297a716ccc0b55', '2019-04-16 14:49:00', null, null, null, null, null, '0', null, null, null, null, null, null, '1', null, null, '0', null);
INSERT INTO `his_user` VALUES ('402880ea6a7df7d6016a7e5806bf0006', 'm_doctor_2@shospital.com', '李医生', '123', '97c7a1fc1f3e8c2e0c40d7b13b13a994', 'a45abce549ccbe83c5b229232e12ad5b', '2019-05-03 23:37:39', '', '党员', '15002488355', '1960-02-10', '男', '10', '1', '2', '3.0', '三楼311', null, null, '1', 'A45ABCE549CCBE83C5B229232E12AD5B', '0', '8', '2021-05-10');
INSERT INTO `his_user` VALUES ('402880ea6a7df7d6016a7e5ce3810008', 'm_doctor_3@shospital.com', '张医生', '123', '6669a63f1921092662fa61c7346ef578', '1f9c8b259edc93053702bc1af5ebc9a0', '2019-05-03 23:42:57', null, null, null, null, null, '3', '2', '3', '2.0', '一楼101', null, null, '1', '1F9C8B259EDC93053702BC1AF5EBC9A0', '0', '3', '2021-05-10');
INSERT INTO `his_user` VALUES ('402881ea6abf196a016abf2fbb5e0003', 'm_druggist_1@shospital.com', '黄药剂', '123', 'ebc444f9cf5d0362d2b574406bf6a37d', 'bcaf9c29f362cda8b2b9d8031b799078', '2019-05-16 13:48:55', null, null, null, null, null, '0', null, null, null, null, null, null, '1', 'BCAF9C29F362CDA8B2B9D8031B799078', null, '0', '2019-06-05');
INSERT INTO `his_user` VALUES ('402881ea6abf196a016abf40b8400005', 'm_tollCollector_1@shospital.com', '赵收费', '123', '732c0809461dd032d9d068dc9a30d93f', 'eb1f263c26e8c1ad016d0a38e9798bf9', '2019-05-16 14:07:30', null, null, null, null, null, '0', null, null, null, null, null, null, '1', 'EB1F263C26E8C1AD016D0A38E9798BF9', null, '0', null);
INSERT INTO `his_user` VALUES ('402881ea6aca4965016aca6a54d0000a', 'm_technologyDoc_1@shospital.com', '孙检查', '123', 'f907bfea4569408325280fff74600cc3', 'ec1f7da3ecbc4781ebb67a02a7304093', '2019-05-18 18:08:47', null, null, null, null, null, '5', '12', '2', '3.0', '四楼122', null, null, '1', 'EC1F7DA3ECBC4781EBB67A02A7304093', '0', '3', '2020-04-10');
INSERT INTO `his_user` VALUES ('4028b8816b01e30d016b01f2941f0000', 'drugStoreAdmin_1@shospital.com', '邓药管', '123', '1bc6b0bc8a97edf39264438ebd36455c', '35eb9694392fe78cca6cca2578dba9e1', '2019-05-29 12:56:43', null, null, null, null, null, '0', null, null, null, null, null, null, '1', '35EB9694392FE78CCA6CCA2578DBA9E1', null, '0', null);
INSERT INTO `his_user` VALUES ('4028b881714ef3fc01714ef4dd390000', '18081204729@163.com', 'sen', 'w', '8bc6b069eef6f8c8f28ad7909203e276', '922c45828eedac979995a0b77bb41cc0', '2020-04-06 18:06:42', null, null, null, null, null, '0', null, null, null, null, null, null, '0', '922C45828EEDAC979995A0B77BB41CC0', null, '0', null);
INSERT INTO `his_user` VALUES ('8ad8a0ec6a06851e016a069172fa0002', '1208585122@qq.com', '薛管理', '123', '3b6859e0f808a88b350b9878cd4e8ff5', '0d97c0c016d4759268b75a25d6eb4eb5', '2019-04-10 17:25:56', 'wwwww', '团员', '15202843353', '1996-09-24', '男', '0', null, null, null, null, null, null, '1', null, null, '0', '2020-03-10');
INSERT INTO `his_user` VALUES ('8ad8a0ec6a0a7e7b016a0a7ed6e50000', 'm_doctor@shospital.com', '彭医生', '123', '53cde41aa04572f1bbbb1184195c492c', '171a609704cecaa4e78ec7d51b71fd8c', '2019-04-11 11:44:05', null, null, null, null, null, '10', '10', '1', '5.0', '三楼302', null, null, '1', null, '1', '1', '2020-04-08');

-- ----------------------------
-- Table structure for his_user_role
-- ----------------------------
DROP TABLE IF EXISTS `his_user_role`;
CREATE TABLE `his_user_role` (
  `id` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  `description` varchar(64) NOT NULL COMMENT '邮箱+角色描述',
  `create_datetime` varchar(64) NOT NULL,
  `role_status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKonj60rt9n1rofgopjmongdc0d` (`role_id`),
  KEY `FKnq3n6y2wd8002bgn0rcs4f96y` (`uid`),
  CONSTRAINT `FKnq3n6y2wd8002bgn0rcs4f96y` FOREIGN KEY (`uid`) REFERENCES `his_user` (`id`),
  CONSTRAINT `FKonj60rt9n1rofgopjmongdc0d` FOREIGN KEY (`role_id`) REFERENCES `his_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of his_user_role
-- ----------------------------
INSERT INTO `his_user_role` VALUES ('402834a4710c25ab01710c2acce60000', '402880ea6a7df7d6016a7e5806bf0006', '402880ea6a7df7d6016a7e49e7b70002', 'm_doctor_2@shospital.com#nurseAdmin', '2020-03-24 18:51:03', '1');
INSERT INTO `his_user_role` VALUES ('402880e56a6ee7ff016a6eeb83dc0001', '8ad8a0ec6a06851e016a069172fa0002', '8ad8a0ec6a06851e016a068b90480001', '1208585122@qq.com#mdoctor', '2019-04-30 23:44:49', '1');
INSERT INTO `his_user_role` VALUES ('402880e56a6f2253016a6f22b8ec0000', '8ad8a0ec6a06851e016a069172fa0002', '402881e76a0b39e5016a0b3de7de0002', '1208585122@qq.com#register', '2019-05-01 00:45:07', '1');
INSERT INTO `his_user_role` VALUES ('402880e86a24ccfc016a24cd6b7b0001', '402880e86a24ccfc016a24cd6b240000', '402881e76a0b39e5016a0b3de7de0002', 'register@shospital.com#register', '2019-04-16 14:20:03', '1');
INSERT INTO `his_user_role` VALUES ('402880e86a24ccfc016a24e8e142000c', '402880e86a24ccfc016a24e8e12a000b', '402881e76a0b39e5016a0b3de7de0002', 'register_2@shospital.com#register', '2019-04-16 14:50:02', '1');
INSERT INTO `his_user_role` VALUES ('402880ea6a7df7d6016a7e5806d70007', '402880ea6a7df7d6016a7e5806bf0006', '8ad8a0ec6a06851e016a068b90480001', 'm_doctor_2@shospital.com#mdoctor', '2019-05-03 23:37:39', '1');
INSERT INTO `his_user_role` VALUES ('402880ea6a7df7d6016a7e5ce38a0009', '402880ea6a7df7d6016a7e5ce3810008', '8ad8a0ec6a06851e016a068b90480001', 'm_doctor_3@shospital.com#mdoctor', '2019-05-03 23:42:57', '1');
INSERT INTO `his_user_role` VALUES ('402880ed6aaa5655016aaa77ef260000', '8ad8a0ec6a06851e016a069172fa0002', '402880ea6a7df7d6016a7e480e360001', '1208585122@qq.com#druggist', '2019-05-12 13:15:47', '-1');
INSERT INTO `his_user_role` VALUES ('402881ea6abf196a016abf2fbb750004', '402881ea6abf196a016abf2fbb5e0003', '402880ea6a7df7d6016a7e480e360001', 'm_druggist_1@shospital.com#druggist', '2019-05-16 13:48:57', '1');
INSERT INTO `his_user_role` VALUES ('402881ea6abf196a016abf40b8570006', '402881ea6abf196a016abf40b8400005', '402880ea6a7df7d6016a7e4d6f480004', 'm_tollCollector_1@shospital.com#tollCollector', '2019-05-16 14:07:30', '1');
INSERT INTO `his_user_role` VALUES ('402881ea6aca4965016aca6a54e4000b', '402881ea6aca4965016aca6a54d0000a', '402880ea6a7df7d6016a7e4b18130003', 'm_technologyDoc_1@shospital.com#technologyDoc', '2019-05-18 18:08:47', '1');
INSERT INTO `his_user_role` VALUES ('4028b8816b01e30d016b01f294580001', '4028b8816b01e30d016b01f2941f0000', '402880ea6a7df7d6016a7e4eb6360005', 'drugStoreAdmin_1@shospital.com#drugStoreAdmin', '2019-05-29 12:56:43', '1');
INSERT INTO `his_user_role` VALUES ('4028b88170c344250170c344aeb20000', '402881ea6abf196a016abf2fbb5e0003', '402880ea6a7df7d6016a7e4b18130003', 'm_druggist_1@shospital.com#technologyDoc', '2020-03-10 15:07:03', '0');
INSERT INTO `his_user_role` VALUES ('4028b881710f588701710f5a68330000', '402880ea6a7df7d6016a7e5806bf0006', '402881e76a0b39e5016a0b3de7de0002', 'm_doctor_2@shospital.com#register', '2020-03-25 09:41:55', '0');
INSERT INTO `his_user_role` VALUES ('4028b881714ef3fc01714ef4dd830001', '4028b881714ef3fc01714ef4dd390000', '402880ea6a7df7d6016a7e480e360001', '18081204729@163.com#druggist', '2020-04-06 18:06:42', '0');
INSERT INTO `his_user_role` VALUES ('4028b8817162235101716225cf9d0000', '402880e86a24ccfc016a24cd6b240000', '402880ea6a7df7d6016a7e49e7b70002', 'register@shospital.com#nurseAdmin', '2020-04-10 11:32:57', '0');
INSERT INTO `his_user_role` VALUES ('8ad8a0ec6a06851e016a069173580003', '8ad8a0ec6a06851e016a069172fa0002', '8ad8a0ec6a06851e016a068ab7b30000', '1208585122@qq.com#admin', '2019-04-10 17:25:56', '1');
INSERT INTO `his_user_role` VALUES ('8ad8a0ec6a0a7e7b016a0a7ed7630001', '8ad8a0ec6a0a7e7b016a0a7ed6e50000', '8ad8a0ec6a06851e016a068b90480001', 'm_doctor@shospital.com#mdoctor', '2019-08-11 11:44:05', '1');
