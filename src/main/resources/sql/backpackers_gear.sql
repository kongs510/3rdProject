DROP TABLE IF EXISTS `gear`;
CREATE TABLE `gear` (
  `gearNo` int NOT NULL AUTO_INCREMENT,
  `gearTitle` varchar(300) NOT NULL,
  `gearContent` varchar(2000) NOT NULL,
  PRIMARY KEY (`gearNo`),
  UNIQUE KEY `gearTitle_UNIQUE` (`gearTitle`)
);
INSERT INTO `gear` VALUES (1,'백패킹이 처음이신가요?','Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),(2,'백패킹에 필요한 장비들','Lorem ipsum dolor sit amet, consectetur adipisicing elit.'),(30,'백피킹을 가요22','<p><img src=\"/backpackers/gear/image/45\" style=\"width: 50%;\">df</p><p><br></p><p><img src=\"/backpackers/gear/image/44\" style=\"width: 50%;\">asdf</p><p>asdf</p><p>asdf</p>');

