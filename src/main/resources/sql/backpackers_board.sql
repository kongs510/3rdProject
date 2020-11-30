DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `board_no` int NOT NULL AUTO_INCREMENT,
  `board_subject` varchar(45) NOT NULL,
  `user_ID` varchar(20) DEFAULT NULL,
  `board_date` date NOT NULL,
  `board_content` varchar(200) DEFAULT NULL,
  `board_hits` int NOT NULL,
  `board_type` int NOT NULL,
  `board_delete` int NOT NULL,
  `board_maketime` time NOT NULL,
  `board_views` int NOT NULL,
  PRIMARY KEY (`board_no`)
);

INSERT INTO `board` VALUES (2,'학원에서 테스트 수정',NULL,'2020-10-13','학원에서 테스트 수정',0,1,1,'12:09:11',25),(3,'수정완료','kim','2020-10-13','수정입니다.',0,1,1,'12:21:48',829),(4,'비트캠프','kim','2020-10-13','',0,1,1,'17:12:51',1),(5,'수정완료','kim','2020-10-13','김대영',0,1,1,'17:13:13',38),(8,'sadsad','kim','2020-10-13','<p><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">dsfdsf</font></p>',0,1,1,'18:04:17',2),(9,'수정완료','kim','2020-10-13','<h2>ㅁㄴㅇㄴㅁㅇ</h2>',0,1,1,'18:13:01',19),(12,'머지한다음에 테스트',NULL,'2020-10-14','<p>테스트</p>',0,1,1,'13:33:44',6);


