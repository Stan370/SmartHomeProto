/*
 Navicat Premium Data Transfer

 Source Server         : xdz
 Source Server Type    : MySQL
 Source Server Version : 50625
 Source Host           : localhost:3306
 Source Schema         : smarthomemodel

 Target Server Type    : MySQL
 Target Server Version : 50625
 File Encoding         : 65001

 Date: 08/07/2021 18:44:56
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of administrator
-- ----------------------------

-- ----------------------------
-- Table structure for equipment_type
-- ----------------------------
DROP TABLE IF EXISTS `equipment_type`;
CREATE TABLE `equipment_type`  (
  `e_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`e_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipment_type
-- ----------------------------
INSERT INTO `equipment_type` VALUES ('2001', 'light');
INSERT INTO `equipment_type` VALUES ('2002', 'cooker');

-- ----------------------------
-- Table structure for family
-- ----------------------------
DROP TABLE IF EXISTS `family`;
CREATE TABLE `family`  (
  `fid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `room_num` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of family
-- ----------------------------
INSERT INTO `family` VALUES ('001', 1);
INSERT INTO `family` VALUES ('002', 1);
INSERT INTO `family` VALUES ('003', 1);
INSERT INTO `family` VALUES ('004', 1);

-- ----------------------------
-- Table structure for hardware_equipment
-- ----------------------------
DROP TABLE IF EXISTS `hardware_equipment`;
CREATE TABLE `hardware_equipment`  (
  `e_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hardware_equipment
-- ----------------------------
INSERT INTO `hardware_equipment` VALUES ('3001', 'shit', 'led2', '1001', '2001', '001');
INSERT INTO `hardware_equipment` VALUES ('3002', 'bull shit', 'led3', '1002', '2001', '002');
INSERT INTO `hardware_equipment` VALUES ('3003', 'double shit', 'led4', '1003', '2001', '003');
INSERT INTO `hardware_equipment` VALUES ('3004', 'tired', 'led5', '1004', '2001', '004');

-- ----------------------------
-- Table structure for manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer`  (
  `uid` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES ('1001', '123456');
INSERT INTO `manufacturer` VALUES ('1002', '234567');
INSERT INTO `manufacturer` VALUES ('1003', '345678');
INSERT INTO `manufacturer` VALUES ('1004', '456789');

-- ----------------------------
-- Table structure for measure_data
-- ----------------------------
DROP TABLE IF EXISTS `measure_data`;
CREATE TABLE `measure_data`  (
  `measure_time` datetime(2) NOT NULL,
  `temperature` decimal(6, 2) NULL DEFAULT NULL,
  `humidity` decimal(6, 2) NULL DEFAULT NULL,
  `brightness` int(11) NULL DEFAULT NULL,
  `door` tinyint(4) NULL DEFAULT NULL,
  `windows` tinyint(4) NULL DEFAULT NULL,
  `Buzzer` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `switch_status` tinyint(4) NULL DEFAULT NULL,
  `Vibration_sensor` tinyint(4) NULL DEFAULT NULL,
  `Human_infrared` tinyint(4) NULL DEFAULT NULL,
  `Sunshade_angle` int(11) NULL DEFAULT NULL,
  `led` int(11) NULL DEFAULT NULL,
  `e_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`measure_time`, `e_id`) USING BTREE,
  INDEX `fk_measure_data_hardware_equipment1_idx`(`e_id`) USING BTREE,
  CONSTRAINT `fk_measure_data_hardware_equipment1` FOREIGN KEY (`e_id`) REFERENCES `hardware_equipment` (`e_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of measure_data
-- ----------------------------
INSERT INTO `measure_data` VALUES ('0000-00-00 00:00:00.00', 19.00, 79.00, 90, 0, 0, '1', 1, 1, 1, 15, 75, '3004');
INSERT INTO `measure_data` VALUES ('2021-07-05 00:00:00.00', 25.00, 88.00, 55, 1, 1, '0', 1, 1, 1, 360, 20, '3001');
INSERT INTO `measure_data` VALUES ('2021-07-08 00:00:00.00', 21.00, 78.00, 55, 1, 1, '0', 1, 1, 1, 180, 40, '3002');
INSERT INTO `measure_data` VALUES ('2021-07-09 00:00:00.00', 29.00, 55.00, 44, 0, 0, '1', 1, 1, 1, 275, 90, '3003');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('bom', '456', '002');
INSERT INTO `user` VALUES ('com', '789', '003');
INSERT INTO `user` VALUES ('dom', '101', '004');
INSERT INTO `user` VALUES ('tom', '123', '001');

SET FOREIGN_KEY_CHECKS = 1;
