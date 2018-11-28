-- -----------------------------------------------------
-- Table `play`.`actor`
-- -----------------------------------------------------
INSERT INTO `actor` VALUES (1,'박철민','1967-01-18','','thumb_박철민.jpg',0),(2,'태항호','1983-07-22',NULL,'default.jpg',0),(3,'노진원','1970-04-21',NULL,'default.jpg',0),(4,'민선경','1990-02-04',NULL,'default.jpg',0),(5,'장우진','1981-02-05',NULL,'default.jpg',0),(6,'최정원','1969-08-02',NULL,'default.jpg',0),(7,'이건명','1972-04-03',NULL,'default.jpg',0),(8,'오만석','1975-01-30',NULL,'default.jpg',0),(9,'유준상','1969-11-28',NULL,'default.jpg',0),(10,'이항나','1970-02-22',NULL,'default.jpg',0),(11,'이현수','1984-06-13',NULL,'default.jpg',0),(12,'김사홍','1985-11-06',NULL,'default.jpg',0);

-- -----------------------------------------------------
-- Table `play`.`area`
-- -----------------------------------------------------
INSERT INTO `play`.`area` (`a_id`, `a_name`) VALUES ('1', '서울/대학로');
INSERT INTO `play`.`area` (`a_id`, `a_name`) VALUES ('2', '서울/기타');
INSERT INTO `play`.`area` (`a_id`, `a_name`) VALUES ('3', '경기');
INSERT INTO `play`.`area` (`a_id`, `a_name`) VALUES ('4', '대전/충청');
INSERT INTO `play`.`area` (`a_id`, `a_name`) VALUES ('5', '부산/대구/경상');
INSERT INTO `play`.`area` (`a_id`, `a_name`) VALUES ('6', '광주/전주/전라');

-- -----------------------------------------------------
-- Table `play`.`genre`
-- -----------------------------------------------------
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('1', '로맨틱코미디');
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('2', '공포/스릴러');
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('3', '드라마');
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('4', '코믹');
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('5', '기타');

-- -----------------------------------------------------
-- Table `play`.`member`
-- -----------------------------------------------------
INSERT INTO `member` VALUES (1,'member1','1234','일반회원1',0,'1_member@gmail.com','01012345601',0),(2,'member2','1234','일반회원2',0,'2_member@gmail.com','01012345602',0),(3,'member3','1234','일반회원3',0,'3_member@gmail.com','01012345603',0),(4,'member4','1234','일반회원4',0,'4_member@gmail.com','01012345604',0),(5,'member5','1234','일반회원5',0,'5_member@gmail.com','01012345605',0),(6,'member6','1234','일반회원6',0,'6_member@gmail.com','01012345606',0),(7,'member7','1234','일반회원7',0,'7_member@gmail.com','01012345607',0),(8,'member8','1234','일반회원8',0,'8_member@gmail.com','01012345608',0),(9,'member9','1234','일반회원9',0,'9_member@gmail.com','01012345609',0),(10,'member10','1234','일반회원10',0,'10_member@gmail.com','01012345610',0),(11,'member11','1234','일반회원11',0,'11_member@gmail.com','01012345611',0),(12,'member12','1234','일반회원12',0,'12_member@gmail.com','01012345612',0),(13,'member13','1234','일반회원13',0,'13_member@gmail.com','01012345613',0),(14,'member14','1234','일반회원14',0,'14_member@gmail.com','01012345614',0),(15,'member15','1234','일반회원15',0,'15_member@gmail.com','01012345615',0),(16,'member16','1234','일반회원16',0,'16_member@gmail.com','01012345616',0),(17,'member17','1234','일반회원17',0,'17_member@gmail.com','01012345617',0),(18,'member18','1234','일반회원18',0,'18_member@gmail.com','01012345618',0),(19,'member19','1234','일반회원19',0,'19_member@gmail.com','01012345619',0),(20,'member20','1234','일반회원20',0,'20_member@gmail.com','01012345620',0),(21,'admin1','1234','연극어드민1',1,'1playadmin@gmail.com','01087654321',0),(22,'admin2','1234','연극어드민2',1,'2playadmin@gmail.com','01087654322',0),(23,'admin3','1234','연극어드민3',1,'3playadmin@gmail.com','01087654323',0),(24,'super','1234','총관리자',2,'superadmin@gmail.com','01011112222',0);

-- -----------------------------------------------------
-- Table `play`.`article`
-- -----------------------------------------------------
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '1', '회원가입 관련 사항', '회원 가입은 이러한 방식으로 진행하면 됩니다!', '2018-11-26', '0');
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '2', 'FAQ 티켓은 어떻게 사용하죠?','티켓 사용법은 아래와 같습니다.', '2018-11-26', '0');
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '2', 'FAQ 환불 및 취소는 어떻게 하나요?','환불 및 취소는 어떻게 하나요?', '2018-11-26', '0');
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '2', 'FAQ. 구매 후 영수증은 어떻게 발급받나요?','Q. 구매 후 영수증은 어떻게 발급받나요?', '2018-11-26', '0');
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '2', '질문 있어요!','대답해주세요', '2018-11-26', '0');
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '3', '질문 있어요!','대답해주세요', '2018-11-26', '0');
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '3', '질문 있어요!','대답해주세요', '2018-11-26', '0');
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '3', '질문 있어요!','대답해주세요', '2018-11-26', '0');
INSERT INTO `play`.`article` (`m_code`, `a_board`, `a_title`, `a_content`, `a_time`, `a_comment`) VALUES ('1', '3', '질문 있어요!','대답해주세요', '2018-11-26', '0');

-- -----------------------------------------------------
-- Table `play`.`play`
-- -----------------------------------------------------
INSERT INTO `play` VALUES (1,21,'발칙한 로맨스','섹시 발랄 코미디 연극','환불가능','JTN 아트홀 2관',4,1,1,'p_image1.jpg','main_balchik.jpg','balchik1.jpg',NULL,NULL),(2,21,'오마이갓','세상종말 로맨스','환불불가','봄날 아트홀 2관',2,1,1,'p_image0.png','default.png',NULL,NULL,NULL),(3,22,'메리골드','치유받을 수 있는 소확행 뮤지컬','환불가능','대학로 열린극장',3,1,1,'p_image0.png','default.png',NULL,NULL,NULL),(4,22,'뷰티풀 라이프','따뜻한 공감을 부르는 우리네 사랑이야기','환불불가','JTN 아트홀 4관',3,1,1,'p_image0.png','default.png',NULL,NULL,NULL),(5,23,'와일드 패밀리','가족코믹극','환불가능','미마지아트센터 풀빛극장',4,1,1,'p_image0.png','default.png',NULL,NULL,NULL),
(6,23,'죽여주는 이야기','코미디 연극','환불가능','JTN 아트홀 1관',4,1,1,'deathstory.jpg','main_deathstory.jpg','deathstory1.jpg',NULL,NULL),
(7,23,'파이어맨','드라마 연극','환불가능','봄날 아트홀 3관',3,1,1,'fireman.jpg','main_fireman.jpg','fireman1.jpg',NULL,NULL),
(8,22,'호두까기인형','코미디 연극','환불가능','JTN 아트홀 2관',4,1,1,'hodu.jpg','main_hodu.jpg','hodu1.jpg',NULL,NULL),
(9,21,'노배우의 마지막 연기','드라마 연극','환불가능','JTN 아트홀 3관',3,1,1,'lastplay.jpg','main_lastplay.jpg','lastplay1.jpg',NULL,NULL),
(10,23,'렛잇고','발랄 코미디 연극','환불가능','대학로 열린극장',4,1,1,'letitgo.jpg','main_letitgo.jpg','letitgo1.jpg',NULL,NULL),
(11,23,'내 생에 가장 아름다운 추억','드라마 연극','환불가능','종로 극장',4,2,1,'lifememory.jpg','main_lifememory.jpg','lifememory1.jpg',NULL,NULL),
(12,22,'사라진마술사','코미디 연극','환불가능','예술 회관',3,3,1,'magician.jpg','main_magician.jpg','magician1.jpg',NULL,NULL),
(13,22,'오! 나의 귀신님','로맨틱 코미디 연극','환불가능','소래포 극장',1,3,1,'myghost.jpg','main_myghost.jpg','myghost1.jpg',NULL,NULL),
(14,21,'두 여자','공포/스릴러 연극','환불가능','봄날 아트홀 1관',2,1,1,'twowoman.jpg','main_twowoman.jpg','twowoman1.jpg',NULL,NULL),
(15,23,'술래잡기','공포/스릴러 연극','환불가능','대학로 열린극장',2,1,1,'술래잡기.jpg','main_술래잡기.jpg','술래잡기1.jpg',NULL,NULL),
(16,21,'점바치','드라마 연극','환불가능','예술 회관',4,3,1,'점바치.jpg','main_점바치.jpg','점바치1.jpg',NULL,NULL)
;

-- -----------------------------------------------------
-- Table `play`.`schedule`
-- -----------------------------------------------------
INSERT INTO `schedule` VALUES (1,1,40,12000,'2018-11-28 11:00:00',1,2,0),(2,1,40,12000,'2018-11-29 11:00:00',3,4,0),(3,1,40,12000,'2018-11-30 11:00:00',1,2,0),(4,1,40,12000,'2018-12-01 11:00:00',3,4,0),(5,1,40,12000,'2018-12-02 11:00:00',1,2,0),(6,1,40,12000,'2018-12-03 11:00:00',3,4,0),(7,1,40,12000,'2018-12-04 11:00:00',1,2,0),(8,1,40,12000,'2018-12-05 11:00:00',3,4,0),(9,1,40,12000,'2018-12-06 11:00:00',1,2,0),(10,1,40,12000,'2018-12-07 11:00:00',3,4,0),(11,1,40,12000,'2018-12-08 11:00:00',1,2,0),(12,1,40,12000,'2018-12-09 11:00:00',3,4,0),(13,1,40,12000,'2018-12-10 11:00:00',1,2,0),(14,2,40,9000,'2018-11-28 05:00:00',5,6,0),(15,2,40,12000,'2018-11-28 11:00:00',7,8,0),(16,2,40,9000,'2018-11-29 05:00:00',5,6,0),(17,2,40,12000,'2018-11-29 11:00:00',7,8,0),(18,2,40,9000,'2018-11-30 05:00:00',5,6,0),(19,2,40,12000,'2018-11-30 11:00:00',7,8,0),(20,2,40,9000,'2018-12-01 05:00:00',5,6,0),(21,2,40,12000,'2018-12-01 11:00:00',7,8,0),(22,2,40,9000,'2018-12-02 05:00:00',5,6,0),(23,2,40,12000,'2018-12-02 11:00:00',7,8,0),(24,2,40,9000,'2018-12-03 05:00:00',5,6,0),(25,2,40,12000,'2018-12-03 11:00:00',7,8,0),(26,2,40,9000,'2018-12-04 05:00:00',5,6,0),(27,2,40,12000,'2018-12-04 11:00:00',7,8,0),(28,2,40,9000,'2018-12-05 05:00:00',5,6,0),(29,2,40,12000,'2018-12-05 11:00:00',7,8,0),(30,2,40,9000,'2018-12-06 05:00:00',5,6,0),(31,2,40,12000,'2018-12-06 11:00:00',7,8,0),(32,2,40,9000,'2018-12-07 05:00:00',5,6,0),(33,2,40,12000,'2018-12-07 11:00:00',7,8,0),(34,2,40,9000,'2018-12-08 05:00:00',5,6,0),(35,2,40,12000,'2018-12-08 11:00:00',7,8,0),(36,2,40,9000,'2018-12-09 05:00:00',5,6,0),(37,2,40,12000,'2018-12-09 11:00:00',7,8,0),(38,2,40,9000,'2018-12-10 05:00:00',5,6,0),(39,2,40,12000,'2018-12-10 11:00:00',7,8,0),(40,3,40,9000,'2018-11-27 09:00:00',9,10,0),(41,3,40,12000,'2018-11-29 09:00:00',9,10,0),(42,3,40,9000,'2018-11-30 09:00:00',9,10,0),(43,3,40,12000,'2018-12-01 09:00:00',9,10,0),(44,3,40,9000,'2018-12-03 09:00:00',9,10,0),(45,3,40,12000,'2018-12-05 09:00:00',9,10,0),(46,3,40,9000,'2018-12-07 09:00:00',9,10,0),(47,3,40,12000,'2018-12-09 09:00:00',9,10,0),(48,3,40,9000,'2018-12-11 09:00:00',9,10,0),(49,3,40,12000,'2018-12-13 09:00:00',9,10,0),(50,3,40,9000,'2018-12-15 09:00:00',9,10,0),(51,3,40,12000,'2018-12-17 09:00:00',9,10,0),(52,4,30,15000,'2018-11-27 10:00:00',11,12,0),(53,4,30,15000,'2018-11-28 10:00:00',11,12,0),(54,4,30,15000,'2018-11-30 10:00:00',11,12,0),(55,4,30,15000,'2018-12-02 10:00:00',11,12,0),(56,4,30,15000,'2018-12-04 10:00:00',11,12,0),(57,4,30,15000,'2018-12-06 10:00:00',11,12,0),(58,4,30,15000,'2018-12-08 10:00:00',11,12,0),(59,4,30,15000,'2018-12-10 10:00:00',11,12,0),(60,4,30,15000,'2018-12-12 10:00:00',11,12,0),(61,4,30,15000,'2018-12-14 10:00:00',11,12,0),(62,4,30,15000,'2018-12-16 10:00:00',11,12,0),(63,4,30,15000,'2018-12-17 10:00:00',11,12,0);

-- -----------------------------------------------------
-- Table `play`.`payment`
-- -----------------------------------------------------
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '1', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '2', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '3', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '4', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '5', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '6', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '7', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '8', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '9', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '10', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '1', '2000', '1', '2018-11-23 16:15:02');
INSERT INTO `play`.`payment` ( `m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) VALUES ( '1', '2', '2000', '1', '2018-11-23 16:15:02');

-- -----------------------------------------------------
-- Table `play`.`play_appear`
-- -----------------------------------------------------
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('1', '1');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('1', '2');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('2', '3');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('2', '4');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('3', '5');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('3', '6');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('4', '7');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('4', '8');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('5', '9');
INSERT INTO `play`.`play_appear` (`p_id`, `a_id`) VALUES ('5', '10');

-- -----------------------------------------------------
-- Table `play`.`prefer_actor`
-- -----------------------------------------------------
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('1', '1');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('1', '2');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('2', '3');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('2', '4');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('3', '5');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('3', '6');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('4', '7');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('4', '8');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('5', '9');
INSERT INTO `play`.`prefer_actor` (`m_code`, `a_id`) VALUES ('5', '10');

-- -----------------------------------------------------
-- Table `play`.`question_answer`
-- -----------------------------------------------------
INSERT INTO `question_answer` VALUES (1,'2018-11-21 09:42:09','재밌나요?',1,1,1,0),(2,'2018-11-21 09:45:09','이름이 뭔가요?',2,1,2,0),(3,'2018-11-21 09:50:09','재밌습니다',3,1,1,0);

-- -----------------------------------------------------
-- Table `play`.`review`
-- -----------------------------------------------------
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('1', '1', NOW(), '존잼', '5');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('2', '2', now(), '핵노잼', '1');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('3', '3', NOW(), '노잼', '2');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('4', '4', NOW(), '평범', '3');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('5', '5', NOW(), '핵노잼', '1');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('1', '6', NOW(), '노잼', '2');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('2', '7', NOW(), '존잼', '5');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('3', '8', NOW(), '평범', '3');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('4', '9', NOW(), '노잼', '2');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('5', '10', NOW(), '존잼', '5');

-- -----------------------------------------------------
-- Table `play`.`shopping_basket`
-- -----------------------------------------------------
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('1', '1');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('1', '5');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('2', '2');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('2', '1');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('3', '3');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('3', '4');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('4', '4');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('4', '2');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('5', '5');
INSERT INTO `play`.`shopping_basket` (`m_code`, `p_id`) VALUES ('5', '3');
