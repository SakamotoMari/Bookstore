/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2016-06-07 10:37:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `booktype` int(2) DEFAULT NULL,
  `name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `press` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `amount` int(4) DEFAULT NULL,
  `pic` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('WX001', '0', '爱你就像爱生命', '王小波，李银河', '浙江文艺出版社', '35.00', '10', 'WX001.jpg');
INSERT INTO `book` VALUES ('WX002', '0', '北欧神话', null, '陕西人民出版社', '50.00', '2', 'WX002.jpg');
INSERT INTO `book` VALUES ('WX003', '0', '故都的秋', '郁达夫', '天津文艺出版社', '39.00', '5', 'WX003.jpg');
INSERT INTO `book` VALUES ('WX004', '0', '以梦为马', '海子', '北京十月文艺出版社', '35.00', '5', 'WX004.jpg');
INSERT INTO `book` VALUES ('XJ001', '1', 'Head First Java', 'HF编写组', '中国电力出版社', '98.00', '10', 'XJ001.jpg');
INSERT INTO `book` VALUES ('XJ002', '1', 'MySQL必知必会', 'Ben Forta', '人民邮电出版社', '30.00', '5', 'XJ002.jpg');
INSERT INTO `book` VALUES ('XJ003', '1', '白帽子讲Web安全', '吴翰清', '电子工业出版社', '40.00', '15', 'XJ003.jpg');
INSERT INTO `book` VALUES ('XJ005', '1', '认知与设计', 'Jeff Johnson', '人民邮电出版社', '50.00', '20', 'XJ005.jpg');
INSERT INTO `book` VALUES ('YS001', '4', '奔跑吧！建筑师', '隈研吾', '中国工信出版集团', '60.00', '7', 'YS001.jpg');
INSERT INTO `book` VALUES ('YS002', '4', '加德纳艺术通史', '加德纳', '湖南工业出版社', '90.00', '5', 'YS002.jpg');
INSERT INTO `book` VALUES ('YS003', '4', '世界艺术史', 'Hugh Honneur', '北京美术摄影出版社', '85.00', '10', 'YS003.jpg');
INSERT INTO `book` VALUES ('YY001', '3', 'TOEFLiBT词汇', '张红岩', '群言出版社', '25.00', '6', 'YY001.jpg');
INSERT INTO `book` VALUES ('YY002', '3', '傲慢与偏见', '简·奥斯汀', '世界图书出版公司', '50.00', '15', 'YY002.jpg');
INSERT INTO `book` VALUES ('ZJ001', '5', '经济学原理', '曼昆', '北京大学出版社', '70.00', '6', 'ZJ001.jpg');
INSERT INTO `book` VALUES ('ZX001', '2', '存在与虚无', '萨特', '三联书店', '59.00', '3', 'ZX001.jpg');
INSERT INTO `book` VALUES ('ZX002', '2', 'SEIN UND ZEIT', '海德格尔', 'CERTAIN PRESS', '60.00', '2', 'ZX002.jpg');
INSERT INTO `book` VALUES ('ZX003', '2', '苏菲的世界', '乔斯坦·贾德', '人民文学出版社', '28.00', '20', 'ZX003.jpg');
INSERT INTO `book` VALUES ('ZX004', '2', '圣经的故事', '亨德里克·威廉·房龙', '三联出版社', '80.00', '10', 'ZX004.jpg');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `username` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `bookid` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `number` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('yui', 'XJ001', '1');
INSERT INTO `orders` VALUES ('RachelK', 'YY001', '1');
INSERT INTO `orders` VALUES ('RachelK', 'WX004', '1');
INSERT INTO `orders` VALUES ('RachelK', 'ZX004', '1');
INSERT INTO `orders` VALUES ('RachelK', 'ZX001', '1');
INSERT INTO `orders` VALUES ('RachelK', 'YS003', '1');
INSERT INTO `orders` VALUES ('RachelK', 'ZX004', '1');
INSERT INTO `orders` VALUES ('RachelK', 'ZX003', '1');
INSERT INTO `orders` VALUES ('rachelK', 'YS003', '1');
INSERT INTO `orders` VALUES ('RachelK', 'YS002', '1');
INSERT INTO `orders` VALUES ('RachelK', 'YY001', '1');
INSERT INTO `orders` VALUES ('RachelK', 'YS002', '1');
INSERT INTO `orders` VALUES ('RachelK', 'ZX001', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `username` char(20) DEFAULT NULL,
  `password` char(20) DEFAULT NULL,
  `userType` char(10) DEFAULT NULL,
  `realname` char(20) DEFAULT NULL,
  `sex` int(2) DEFAULT NULL,
  `email` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('admin', '123456', '2', 'admin', '0', 'MountLuBS@MLBS.net');
INSERT INTO `user_info` VALUES ('RicoS', '888888', '1', 'TingkaiSha', '1', 'RicoSha@MLBS.net');
INSERT INTO `user_info` VALUES ('RachelK', '888888', '1', 'RuiqiKong', '0', 'RachelKong@outlook.com');
INSERT INTO `user_info` VALUES ('JourneyZ', '888888', '1', 'YiningZheng', '0', 'journeyZheng@163.com');
INSERT INTO `user_info` VALUES ('ZhankeL', '888888', '1', 'ZhankeLiu', '1', 'ZhankeL@126.com');
INSERT INTO `user_info` VALUES ('YuyangL', '888888', '1', 'YuyangLiu', '1', 'YuyangL@google.com');
INSERT INTO `user_info` VALUES ('test', '000000', '0', 'TESTuser', '0', 'example@yahoo.com');
INSERT INTO `user_info` VALUES ('yui', '888888', '0', 'MakinoYui', '0', 'yuiyuimakino@yahoo.com');
