-- -----------------------------------------------------
-- Table `play`.`actor`
-- -----------------------------------------------------
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('1', '박철민', '1967-01-18');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('2', '태항호', '1983-07-22');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('3', '노진원', '1970-04-21');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('4', '민선경', '1990-02-04');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('5', '장우진', '1981-02-05');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('6', '최정원', '1969-08-02');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('7', '이건명', '1972-04-03');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('8', '오만석', '1975-01-30');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('9', '유준상', '1969-11-28');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('10', '이항나', '1970-02-22');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('11', '이현수', '1984-06-13');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('12', '김사홍', '1985-11-06');

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
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('1', 'test', '1234', '테스트', 'test@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('2', 'egoing', '1234', '이고잉', 'egoing@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('3', 'sejong', '1234', '킹세종', 'ksejong@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('4', 'jeongjo', '1234', '정조', 'jeongjo@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('5', 'sejo', '1234', '세조', 'sejo@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('6', 'leejune', '1234', '함이준', 'needs_ham@naver.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('7', 'cr7', '1234', '호날두', 'cr7@naver.com');

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
-- Table `play`.`play`
-- -----------------------------------------------------
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`, `p_status`, `p_image0`) VALUES ('1', '1', '발칙한 로맨스', '섹시 발랄 코미디 연극', '환불가능', 'JTN 아트홀 2관', '4', '1','0','p_image0');
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`, `p_status`, `p_image0`) VALUES ('2', '2', '오마이갓', '세상종말 로맨스', '환불불가', '봄날 아트홀 2관', '2', '1','0','p_image0');
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`, `p_status`, `p_image0`) VALUES ('3', '2', '메리골드', '치유받을 수 있는 소확행 뮤지컬', '환불가능', '대학로 열린극장', '3', '1','0','p_image0');
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`, `p_status`, `p_image0`) VALUES ('4', '3', '뷰티풀 라이프', '따뜻한 공감을 부르는 우리네 사랑이야기', '환불불가', 'JTN 아트홀 4관', '3', '1','0','p_image0');
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`, `p_status`, `p_image0`) VALUES ('5', '4', '와일드 패밀리', '가족코믹극', '환불가능', '미마지아트센터 풀빛극장', '4', '1','0','p_image0');

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
-- Table `play`.`schedule`
-- -----------------------------------------------------
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('1', '1', '10', '12000', now(), '1', '2');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('2', '1', '10', '12000', now(), '3', '4');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('3', '2', '10', '12000', now(), '5', '6');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('4', '2', '10', '12000', now(), '1', '2');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('5', '3', '10', '12000', now(), '3', '4');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('6', '3', '10', '12000', now(), '5', '6');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('7', '4', '10', '12000', now(), '1', '2');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('8', '4', '10', '12000', now(), '3', '4');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('9', '5', '10', '12000', now(), '5', '6');
INSERT INTO `play`.`schedule` (`s_id`, `p_id`, `s_ticket`, `s_price`, `s_time`, `a_id1`, `a_id2`) VALUES ('10', '5', '10', '12000', now(), '3', '4');

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
