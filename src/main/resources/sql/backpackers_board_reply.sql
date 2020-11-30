DROP TABLE IF EXISTS `board_reply`;

CREATE TABLE `board_reply` (
  `reply_no` int NOT NULL AUTO_INCREMENT,
  `reply_id` varchar(50) NOT NULL,
  `reply_depth` int NOT NULL,
  `reply_time` timestamp NOT NULL,
  `reply_content` varchar(45) NOT NULL,
  `reply_delete` int NOT NULL DEFAULT '1',
  `board_no` int NOT NULL,
  PRIMARY KEY (`reply_no`)
);

INSERT INTO `board_reply` VALUES (32,'kim',1,'2020-10-13 07:05:09','댓글수정123ㄴㅇㄴㅇ',1,2),(40,'kim',1,'2020-10-13 08:05:20','댓글수정123ㄴㅇㄴㅇ',1,3),(50,'admin',1,'2020-10-14 06:18:36','김대영11111',1,15),(51,'admin',1,'2020-10-14 06:18:40','김대영21',1,15),(55,'admin',1,'2020-10-14 07:09:27','sadsadsa',1,15);
