DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `order_item`;
DROP TABLE IF EXISTS `product_item`;
DROP TABLE IF EXISTS `product_image`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `order_status`;
DROP TABLE IF EXISTS `shop`;
DROP TABLE IF EXISTS `item`;
DROP TABLE IF EXISTS `option_table`;
DROP TABLE IF EXISTS `option_group`;
DROP TABLE IF EXISTS `sub_category`;
DROP TABLE IF EXISTS `main_category`;
DROP TABLE IF EXISTS `brand`;
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

INSERT INTO `member` VALUES ('admin','admin','admin','admin@admin.com',1,'2020-10-06 05:05:50','2020-10-06 05:05:51',0,'','','',NULL);

CREATE TABLE `brand` (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `brandCode` varchar(45) NOT NULL,
  `brandName` varchar(60) NOT NULL,
  PRIMARY KEY (`brandId`),
  UNIQUE KEY `brandCode_UNIQUE` (`brandCode`)
) AUTO_INCREMENT=6;

INSERT INTO `brand` 
VALUES (1,'A01','ADIDAS'),
  (2,'N01','NIKE'),
  (3,'N02','NORTHFACE'),
  (4,'J01','JEEP'),
  (5,'I01','IKEA');

CREATE TABLE `main_category` (
  `mainCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `mainCategoryCode` varchar(45) NOT NULL,
  `mainCategoryName` varchar(60) NOT NULL,
  PRIMARY KEY (`mainCategoryId`),
  UNIQUE KEY `mainCategoryCode_UNIQUE` (`mainCategoryCode`)
) AUTO_INCREMENT=8;

INSERT INTO `main_category` 
VALUES (4,'A','clothing'),
  (5,'B','food'),
  (6,'C','camping'),
  (7,'D','hiking');

CREATE TABLE `sub_category` (
  `subCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `subCategoryCode` varchar(45) NOT NULL,
  `subCategoryName` varchar(60) NOT NULL,
  `mainCategoryCode` varchar(45) NOT NULL,
  PRIMARY KEY (`subCategoryId`),
  UNIQUE KEY `subCategoryCode_UNIQUE` (`subCategoryCode`),
  KEY `fk_sub_category_main_category_idx` (`mainCategoryCode`),
  CONSTRAINT `fk_sub_category_main_category` FOREIGN KEY (`mainCategoryCode`) REFERENCES `main_category` (`mainCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=14;

INSERT INTO `sub_category` 
  VALUES (8,'AA','tops','A'),
  (9,'AB','pants','A'),
  (10,'AC','hats','A'),
  (11,'AD','shoes','A'),
  (12,'CA','tent','C'),
  (13,'CB','barbeque','C');

CREATE TABLE `option_group` (
  `optionGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `optionGroupCode` varchar(45) NOT NULL,
  `optionGroupName` varchar(45) NOT NULL,
  PRIMARY KEY (`optionGroupId`),
  UNIQUE KEY `optionCategoryCode_UNIQUE` (`optionGroupCode`)
) AUTO_INCREMENT=6;

INSERT INTO `option_group` 
VALUES (1,'color','Color'),
  (2,'size-tops','Size'),
  (3,'size-roman','Size'),
  (4,'size-shoes','Size'),
  (5,'size-one','Size');

CREATE TABLE `option_table` (
  `optionId` int(11) NOT NULL AUTO_INCREMENT,
  `optionCode` varchar(45) NOT NULL,
  `optionName` varchar(45) NOT NULL,
  `optionGroupCode` varchar(45) NOT NULL,
  PRIMARY KEY (`optionId`),
  UNIQUE KEY `optionCode_UNIQUE` (`optionCode`),
  KEY `fk_option_option_group_idx` (`optionGroupCode`),
  CONSTRAINT `fk_option_option_group` FOREIGN KEY (`optionGroupCode`) REFERENCES `option_group` (`optionGroupCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=21 ;

INSERT INTO `option_table` 
VALUES (10,'color-blue','Blue','color'),
  (11,'color-white','White','color'),
  (12,'color-red','Red','color'),
  (13,'size-tops-90','90','size-tops'),
  (14,'size-tops-100','100','size-tops'),
  (15,'size-tops-110','110','size-tops'),
  (16,'size-roman-m','M','size-roman'),
  (17,'size-roman-l','L','size-roman'),
  (18,'size-roman-xl','XL','size-roman'),
  (19,'color-black','Black','color'),
  (20,'size-one','One Size','size-one');

CREATE TABLE `item` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemCode` varchar(60) NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `mainCategoryCode` varchar(45) NOT NULL,
  `subCategoryCode` varchar(45) NOT NULL,
  `brandCode` varchar(45) NOT NULL,
  `firstOptionCode` varchar(45) DEFAULT NULL,
  `secondOptionCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  UNIQUE KEY `itemCode_UNIQUE` (`itemCode`),
  KEY `fk_item_main_category_idx` (`mainCategoryCode`),
  KEY `fk_item_sub_category_idx` (`subCategoryCode`),
  KEY `fk_item_brand_idx` (`brandCode`),
  KEY `fk_item_option_1_idx` (`firstOptionCode`),
  KEY `fk_item_option_2_idx` (`secondOptionCode`),
  CONSTRAINT `fk_item_brand` FOREIGN KEY (`brandCode`) REFERENCES `brand` (`brandCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_main_category` FOREIGN KEY (`mainCategoryCode`) REFERENCES `main_category` (`mainCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_option_1` FOREIGN KEY (`firstOptionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_option_2` FOREIGN KEY (`secondOptionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_sub_category` FOREIGN KEY (`subCategoryCode`) REFERENCES `sub_category` (`subCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=41 ;

INSERT INTO `item` 
VALUES (20,'item01','아디프린 윈드브레이커',97000,'A','AA','A01','color-blue','size-roman-m'),
  (21,'item02','아디프린 윈드브레이커',97000,'A','AA','A01','color-blue','size-roman-l'),
  (22,'item03','아디프린 윈드브레이커',97000,'A','AA','A01','color-blue','size-roman-xl'),
  (23,'item04','ZNE 봄버 자켓',169000,'A','AA','A01','color-white','size-roman-m'),
  (24,'item05','ZNE 봄버 자켓',169000,'A','AA','A01','color-white','size-roman-l'),
  (25,'item06','ZNE 봄버 자켓',169000,'A','AA','A01','color-red','size-roman-m'),
  (26,'item07','ZNE 봄버 자켓',169000,'A','AA','A01','color-red','size-roman-l'),
  (27,'item08','에플라뢰 / 클라센',129900,'C','CB','I01',NULL,NULL),
  (28,'item09','코르푄',29900,'C','CB','I01',NULL,NULL),
  (29,'item10','잠스탁 베이스볼 캡',39000,'A','AC','A01','color-blue',NULL),
  (30,'item11','잠스탁 베이스볼 캡',39000,'A','AC','A01','color-white',NULL),
  (31,'item12','잠스탁 베이스볼 캡',39000,'A','AC','A01','color-black',NULL),
  (32,'item13','라이즈 365 롱슬리브 탑',69000,'A','AA','N01','color-blue','size-roman-m'),
  (33,'item14','라이즈 365 롱슬리브 탑',69000,'A','AA','N01','color-blue','size-roman-l'),
  (34,'item15','라이즈 365 롱슬리브 탑',69000,'A','AA','N01','color-black','size-roman-m'),
  (35,'item16','라이즈 365 롱슬리브 탑',69000,'A','AA','N01','color-black','size-roman-l'),
  (36,'item17','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-black','size-tops-90'),
  (37,'item18','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-blue','size-tops-100'),
  (38,'item19','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-red','size-tops-90'),
  (39,'item20','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-red','size-tops-100'),
  (40,'item21','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-red','size-tops-110');

CREATE TABLE `shop` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT,
  `shopCode` varchar(45) NOT NULL,
  `shopTitle` varchar(45) NOT NULL,
  `mainCategoryCode` varchar(45) NOT NULL,
  `subCategoryCode` varchar(45) NOT NULL,
  `shopDate` timestamp NOT NULL,
  `shopContent` varchar(3000) NOT NULL,
  `shopPrice` int(11) NOT NULL,
  PRIMARY KEY (`shopId`),
  UNIQUE KEY `shopCode_UNIQUE` (`shopCode`),
  KEY `fk_shop_main_category_idx` (`mainCategoryCode`),
  KEY `fk_shop_sub_category_idx` (`subCategoryCode`),
  CONSTRAINT `fk_shop_main_category` FOREIGN KEY (`mainCategoryCode`) REFERENCES `main_category` (`mainCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shop_sub_category` FOREIGN KEY (`subCategoryCode`) REFERENCES `sub_category` (`subCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=5 ;

INSERT INTO `shop` 
VALUES (1,'shop01','아디프린 윈드브레이커','A','AA','2020-09-30','과거를 사로잡은 가벼운 지지력과 청키한 실루엣. 혁신적인 기능과 스타일을 탄생시킨 아디프린+ 기술을 기념하는 윈드브레이커를 만나보세요. 바람을 막아주는 견고한 커버력과 스포티한 룩으로 언제 어디서나 편안하게 착용할 수 있습니다.',65000),
  (2,'shop02','ZNE 봄버 자켓','A','AA','2020-09-30','오피스와 트레일을 넘나드는 편안함. 레이어드에 용이한 여유 있는 드롭 숄더가 적용된 가벼운 다용도 재킷입니다. 포켓 채널에 이어폰을 연결하여 도시의 잡음을 차단하고 집중력을 유지할 수 있습니다.',129000),
  (3,'shop03','라이즈 365 롱슬리브 탑','A','AA','2020-09-15','라이즈 365 롱슬리브 탑',87000),
  (4,'shop04','시티 컴포트 캐시미어 팬츠','A','AB','2020-10-02','남성 조거 팬츠로 감촉이 매우 부드럽고, 보온성이 탁월한 캐시미어 100% 원사를 사용하였습니다.',269000);

CREATE TABLE `order_status` (
  `orderStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `orderStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`orderStatusId`),
  KEY `idx_order_status` (`orderStatus`)
) AUTO_INCREMENT=7 ;

INSERT INTO `order_status` 
VALUES (5,'CANCELED'),
  (6,'CHECKING'),
  (4,'DELIVERED'),
  (3,'DELIVERING'),
  (1,'ORDERED'),
  (2,'PAYED');

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(45) NOT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `orderStatus` varchar(45) DEFAULT NULL,
  `orderAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderCode_UNIQUE` (`orderCode`),
  KEY `fk_order_order_status_idx` (`orderStatus`),
  CONSTRAINT `fk_orders_member` FOREIGN KEY (`userId`) REFERENCES `backpackers`.`member` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_order_status` FOREIGN KEY (`orderStatus`) REFERENCES `order_status` (`orderStatus`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=23 ;

CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `shopCode` varchar(45) NOT NULL,
  `productCode` varchar(45) NOT NULL,
  `optionGroupCode` varchar(45) NOT NULL,
  `optionCode` varchar(45) NOT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `productCode_UNIQUE` (`productCode`),
  KEY `fk_product_shop_idx` (`shopCode`),
  KEY `fk_product_option_group_idx` (`optionGroupCode`),
  KEY `fk_product_option_idx` (`optionCode`),
  CONSTRAINT `fk_product_option` FOREIGN KEY (`optionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_option_group` FOREIGN KEY (`optionGroupCode`) REFERENCES `option_group` (`optionGroupCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shopCode`) REFERENCES `shop` (`shopCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=17 ;

INSERT INTO `product` 
VALUES (1,'shop01','product01','color','color-black'),
  (4,'shop02','product04','color','color-white'),
  (6,'shop02','product06','color','color-black'),
  (8,'shop03','product08','color','color-blue'),
  (10,'shop03','product10','color','color-red'),
  (12,'shop04','product12','color','color-black'),
  (15,'shop04','product15','color','color-blue'),
  (16,'shop04','product16','color','color-red');

CREATE TABLE `product_image` (
  `productImageId` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(45) NOT NULL,
  `imageCode` varchar(45) NOT NULL,	
  `imageURL` varchar(100) DEFAULT NULL,
  `imageOrder` int(11) NOT NULL,
  PRIMARY KEY (`productImageId`),
  KEY `fk_product_image_product_idx` (`productCode`),
  CONSTRAINT `fk_product_image_product` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=4 ;

INSERT INTO `product_image` 
VALUES (1,'product01','image01','product01-0.jpg',0),
  (2,'product01','image02','product01-1.jpg',1),
  (3,'product01','image03','product01-2.jpg',2),
  (4,'product04','image04','product04-0.jpg',0),
  (5,'product04','image05','product04-1.jpg',1),
  (6,'product04','image06','product04-2.jpg',2);

CREATE TABLE `product_item` (
  `productItemId` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(45) NOT NULL,
  `itemCode` varchar(45) NOT NULL,
  `optionGroupCode` varchar(45) NOT NULL,
  `optionCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productItemId`),
  KEY `fk_product_item_option_group_idx` (`optionGroupCode`),
  KEY `fk_product_item_option_idx` (`optionCode`),
  KEY `fk_product_item_item_idx` (`itemCode`),
  KEY `fk_product_item_product_idx` (`productCode`),
  CONSTRAINT `fk_product_item_item` FOREIGN KEY (`itemCode`) REFERENCES `item` (`itemCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_item_option` FOREIGN KEY (`optionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_item_option_group` FOREIGN KEY (`optionGroupCode`) REFERENCES `option_group` (`optionGroupCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_item_product` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=14 ;

INSERT INTO `product_item` 
VALUES (1,'product01','item01','size-roman','size-roman-m'),
  (2,'product01','item02','size-roman','size-roman-l'),
  (3,'product01','item03','size-roman','size-roman-xl'),
  (4,'product04','item04','size-tops','size-tops-90'),
  (5,'product04','item05','size-tops','size-tops-100'),
  (6,'product06','item06','size-tops','size-tops-90'),
  (7,'product06','item07','size-tops','size-tops-100'),
  (8,'product08','item13','size-roman','size-roman-m'),
  (9,'product10','item15','size-roman','size-roman-m'),
  (10,'product10','item16','size-roman','size-roman-l'),
  (11,'product12','item10','size-one','size-one'),
  (12,'product15','item11','size-one','size-one'),
  (13,'product16','item12','size-one','size-one');
  
CREATE TABLE `order_item` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(45) NOT NULL,
  `productCode` varchar(45) NOT NULL,
  `optionCode` varchar(45) NOT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `fk_order_item_order_idx` (`orderCode`),
  KEY `fk_order_product_idx` (`productCode`),
  KEY `fk_order_item_option_idx` (`optionCode`),
  CONSTRAINT `fk_order_item_option` FOREIGN KEY (`optionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_item_orders` FOREIGN KEY (`orderCode`) REFERENCES `orders` (`orderCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_item_product` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=35 ;

CREATE TABLE `cart` (
  `cartId` int NOT NULL AUTO_INCREMENT,
  `productCode` varchar(45) NOT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `cartDate` timestamp NOT NULL,
  `cartRemoved` tinyint(1) NOT NULL,
  `optionCode` varchar(45) NOT NULL,
  PRIMARY KEY (`cartId`),
  KEY `fk_cart_product_idx` (`productCode`),
  KEY `fk_cart_option_idx` (`optionCode`),
  KEY `fk_cart_member_idx` (`userId`),
  CONSTRAINT `fk_cart_option` FOREIGN KEY (`optionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_member` FOREIGN KEY (`userId`) REFERENCES `member` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ;