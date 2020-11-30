DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `userId` varchar(50) NOT NULL,
  `userPw` varchar(100) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `grade` int NOT NULL DEFAULT '0',
  `userJoinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userLoginDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `postCode` int NOT NULL,
  `address` varchar(400) NOT NULL,
  `detailAddress` varchar(400) NOT NULL,
  `extraAddress` varchar(400) NOT NULL,
  `phoneNum` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
);



INSERT INTO `member` VALUES ('admin','123','admin','admin@naver.com',1,'2020-10-06 05:05:50','2020-10-06 05:05:51',0,'','','',NULL),('bit1','','kong','comingdown@naver.com',0,'2020-09-30 14:23:54','2020-09-30 14:23:54',0,'','','',NULL),('bit1111','1234','kong','comingdown@naver.com',0,'2020-10-14 01:48:33','2020-10-14 01:48:33',6309,'서울 강남구 개포로32길 13','123-1234',' (개포동, 삼성파크빌)','1011111111'),('bit12','','kong','comingdown@naver.com',0,'2020-10-12 09:51:36','2020-10-12 09:51:36',0,'서울 서초구 남부순환로 2374','한예종1',' (서초동)',NULL),('bit1234','@A1234567','kong','comingdown@naver.com',0,'2020-10-13 09:52:32','2020-10-13 09:52:32',0,'서울 성북구 돌곶이로 3','123-1234',' (석관동)',NULL),('bit2','@A1234567','kong','comingdown@naver.com',0,'2020-10-13 01:00:53','2020-10-13 01:00:53',0,'서울 서초구 남부순환로 2374','302-123',' (서초동)',NULL),('kim','123','김대영','kmhg9650@naver.com',0,'2020-10-14 08:39:23','2020-10-14 08:39:23',0,'서울 강남구 가로수길 5','',' (신사동)',NULL),('test1','1234','kong','comingdown@naver.com',0,'2020-10-13 00:51:38','2020-10-13 00:51:38',0,'서울 서초구 남부순환로 2374','321-123',' (서초동)',NULL),('test23','1234','kong','comingdown@naver.com',0,'2020-09-30 08:03:09','2020-09-30 08:03:09',0,'','','',NULL),('yoursitup123','1234','kong','comingdown@naver.com',0,'2020-10-13 01:20:39','2020-10-13 01:20:39',0,'서울 성북구 돌곶이로 3','123-1234',' (석관동)',NULL);

