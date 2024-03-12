/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : smarthomemodel

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 15/10/2021 10:52:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `uid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('100', '10E69626A377C03C10C591B1015D87D6');
INSERT INTO `administrator` VALUES ('101', '10E69626A377C03C10C591B1015D87D6');
INSERT INTO `administrator` VALUES ('102', 'D147CFDBA873AFF3179596F7BE415168');
INSERT INTO `administrator` VALUES ('107', 'D147CFDBA873AFF3179596F7BE415168');
INSERT INTO `administrator` VALUES ('108', 'D147CFDBA873AFF3179596F7BE415168');

-- ----------------------------
-- Table structure for equipment_type
-- ----------------------------
DROP TABLE IF EXISTS `equipment_type`;
CREATE TABLE `equipment_type`  (
  `e_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intro` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`e_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment_type
-- ----------------------------
INSERT INTO `equipment_type` VALUES ('Door control', 'Control door');
INSERT INTO `equipment_type` VALUES ('Home  detector', 'Detect people at home');
INSERT INTO `equipment_type` VALUES ('Light control', 'Control light');
INSERT INTO `equipment_type` VALUES ('Temperature and humidity detector', 'Detect temperature and humidity');
INSERT INTO `equipment_type` VALUES ('Windows control', 'Control window');

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family`  (
  `fid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `room_num` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES ('100', 3);
INSERT INTO `family` VALUES ('101', 2);
INSERT INTO `family` VALUES ('102', 2);

-- ----------------------------
-- Table structure for hardware_equipment
-- ----------------------------
DROP TABLE IF EXISTS `hardware_equipment`;
CREATE TABLE `hardware_equipment`  (
  `e_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `manufacturer_uid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `equipment_type_e_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `family_fid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`e_id`) USING BTREE,
  INDEX `fk_hardware_equipment_manufacturer1_idx`(`manufacturer_uid`) USING BTREE,
  INDEX `fk_hardware_equipment_equipment_type1_idx`(`equipment_type_e_type`) USING BTREE,
  INDEX `fk_hardware_equipment_family1_idx`(`family_fid`) USING BTREE,
  CONSTRAINT `fk_hardware_equipment_equipment_type1` FOREIGN KEY (`equipment_type_e_type`) REFERENCES `equipment_type` (`e_type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_hardware_equipment_family1` FOREIGN KEY (`family_fid`) REFERENCES `family` (`fid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_hardware_equipment_manufacturer1` FOREIGN KEY (`manufacturer_uid`) REFERENCES `manufacturer` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hardware_equipment
-- ----------------------------
INSERT INTO `hardware_equipment` VALUES ('001', 'Detect temperature and humidity', 'my  home td detector', '102', 'Temperature and humidity detector', '102');
INSERT INTO `hardware_equipment` VALUES ('002', 'Control light', 'my home light control', '102', 'Light control', '102');
INSERT INTO `hardware_equipment` VALUES ('003', 'Control window', 'my  home window control', '102', 'Windows control', '102');
INSERT INTO `hardware_equipment` VALUES ('004', 'Control door', 'my  home door  control', '102', 'Door control', '102');
INSERT INTO `hardware_equipment` VALUES ('005', 'Detetct home', 'my home detect', '102', 'Home  detector', '102');

-- ----------------------------
-- Table structure for manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer`  (
  `uid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES ('100', 'D147CFDBA873AFF3179596F7BE415168');
INSERT INTO `manufacturer` VALUES ('101', '10E69626A377C03C10C591B1015D87D6');
INSERT INTO `manufacturer` VALUES ('102', '10E69626A377C03C10C591B1015D87D6');
INSERT INTO `manufacturer` VALUES ('103', '6DBBD890B873552921B435AA97A06A3C');
INSERT INTO `manufacturer` VALUES ('104', 'D1A85C9D977445EDECED09E7C6D0F305');
INSERT INTO `manufacturer` VALUES ('105', 'CED7B74297FF0DD54D86819CF5078E86');
INSERT INTO `manufacturer` VALUES ('106', '224AEE944CDE0EFDF8EE8AC2F563C2E4');
INSERT INTO `manufacturer` VALUES ('107', 'D147CFDBA873AFF3179596F7BE415168');
INSERT INTO `manufacturer` VALUES ('108', 'D147CFDBA873AFF3179596F7BE415168');

-- ----------------------------
-- Table structure for measure_data
-- ----------------------------
DROP TABLE IF EXISTS `measure_data`;
CREATE TABLE `measure_data`  (
  `measure_time` datetime(2) NOT NULL,
  `temperature` double(6, 2) NULL DEFAULT NULL,
  `humidity` double(6, 2) NULL DEFAULT NULL,
  `brightness` int NULL DEFAULT NULL,
  `door` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `windows` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Buzzer` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `switch_status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Vibration_sensor` bit(1) NULL DEFAULT NULL,
  `Human_infrared` bit(1) NULL DEFAULT NULL,
  `Sunshade_angle` int NULL DEFAULT NULL,
  `led` int NULL DEFAULT NULL,
  `hardware_equipment_e_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`measure_time`, `hardware_equipment_e_id`) USING BTREE,
  INDEX `fk_measure_data_hardware_equipment1_idx`(`hardware_equipment_e_id`) USING BTREE,
  CONSTRAINT `fk_measure_data_hardware_equipment1` FOREIGN KEY (`hardware_equipment_e_id`) REFERENCES `hardware_equipment` (`e_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of measure_data
-- ----------------------------
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:39.00', 21.00, 44.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:39.00', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:39.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:39.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:39.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:49.00', 21.00, 44.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:49.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:49.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:49.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:49.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:59.00', 21.00, 44.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:59.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:59.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:59.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:39:59.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:09.00', 21.00, 44.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:09.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:09.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:09.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:09.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:19.00', 21.00, 44.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:19.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:19.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:19.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:19.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:29.00', 21.00, 44.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:29.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:29.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:29.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 10:40:29.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:29.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:29.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:29.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:29.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:29.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:39.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:39.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:39.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:39.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:39.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:49.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:49.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:49.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:49.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:49.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:59.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:59.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:59.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:59.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:55:59.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:09.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:09.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:09.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:09.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:09.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:19.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:19.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:19.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:19.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:19.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:29.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:29.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:29.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:29.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:29.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:39.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:39.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:39.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:39.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:39.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:49.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:49.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:49.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:49.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:56:49.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:00.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:00.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:00.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:00.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:00.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:10.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:10.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:10.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:10.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:10.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:20.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:20.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:20.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:20.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:20.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:30.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:30.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:30.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:30.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:30.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:40.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:40.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:40.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:40.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:40.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:50.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:50.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:50.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:50.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:57:50.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:00.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:00.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:00.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:00.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:00.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:10.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:10.00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:10.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:10.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:10.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:20.00', 28.00, 33.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '001');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:20.00', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '002');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:20.00', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 1, NULL, '003');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:20.00', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, '004');
INSERT INTO `measure_data` VALUES ('2021-10-12 21:58:20.00', NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, NULL, '005');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `family_fid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `fk_user_family1_idx`(`family_fid`) USING BTREE,
  CONSTRAINT `fk_user_family1` FOREIGN KEY (`family_fid`) REFERENCES `family` (`fid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('001', '8531C3A5925F72D77B9F0E4F5BF64A50', '102');
INSERT INTO `user` VALUES ('002', '8ECB67885BF300DE53E838311E5E5715', '102');
INSERT INTO `user` VALUES ('stan', '8E2DC00186C159073BCF297C39AB57F2', '102');
INSERT INTO `user` VALUES ('tom', '8ECB67885BF300DE53E838311E5E5715', '102');

SET FOREIGN_KEY_CHECKS = 1;
