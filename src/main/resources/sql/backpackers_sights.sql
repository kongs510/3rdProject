DROP TABLE IF EXISTS `sights`;

CREATE TABLE `sights` (
  `sightsNo` int NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `latlng` varchar(300) NOT NULL,
  `ellipsis` varchar(300) NOT NULL,
  `link` varchar(300) NOT NULL,
  `sightsContent` varchar(2000) NOT NULL,
  PRIMARY KEY (`sightsNo`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) AUTO_INCREMENT=12;

INSERT INTO `sights` VALUES (1,'북한산','37.661749, 126.993376','경기 고양시 덕양구 대서문길 375','www.knps.or.kr/front','<p>북한산 국립공원으로 오세요~</p>'),(2,'북악산','37.593203, 126.973331','서울 종로구 부암동','http://www.chf.or.kr/c1/sub5_4.jsp','<p>북악산으로 가볼까요? 네 그랜디크내ㅔㅣ언 hi</p><p><br></p><p><img src=\"/backpackers/gear/image/34\" style=\"width: 50%;\"></p><p><br></p><p><img src=\"/backpackers/gear/image/35\" style=\"width: 50%;\"><br></p>'),(3,'인왕산','37.585199, 126.959328','서울 종로구 무악동 산2-1','http://','인왕산을 걸어요~adsfasdf'),(4,'낙산공원','37.580740, 127.007475','서울 종로구 낙산길 41','https://parks.seoul.go.kr/template/sub/naksan.do','낙산공원에서 야경을!'),(5,'남산공원','37.551097, 126.990903','서울 중구 삼일대로 231','http://parks.seoul.go.kr/namsan','<p>남산공원에서 야경을!</p>');
