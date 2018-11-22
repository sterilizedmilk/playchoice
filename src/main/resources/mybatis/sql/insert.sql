-- -----------------------------------------------------
-- Table `play`.`actor`
-- -----------------------------------------------------
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('1', '박철민', '1967-01-18');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('2', '태항호', '1983-07-22');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('3', '노진원', '1970-04-21');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('4', '민선경', '1990-02-04');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('5', '장우진', '1981-02-05');
INSERT INTO `play`.`actor` (`a_id`, `a_name`, `a_birth`) VALUES ('6', '최정원', '1969-08-02');

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
-- Table `play`.`article`
-- -----------------------------------------------------






-- -----------------------------------------------------
-- Table `play`.`genre`
-- -----------------------------------------------------
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('1', '로맨틱코미디');
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('2', '공포/스릴러');
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('3', '드라마');
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('4', '코믹');
INSERT INTO `play`.`genre` (`g_id`, `g_name`) VALUES ('5', '기타');

-- -----------------------------------------------------
-- Table `play`.`image`
-- -----------------------------------------------------






-- -----------------------------------------------------
-- Table `play`.`member`
-- -----------------------------------------------------
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('1', 'test', '1234', '테스트', 'test@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('2', 'egoing', '1234', '이고잉', 'egoing@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('3', 'sejong', '1234', '킹세종', 'ksejong@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('4', 'jeongjo', '1234', '정조', 'jeongjo@gmail.com');
INSERT INTO `play`.`member` (`m_code`, `m_id`, `m_pw`, `m_name`, `m_mail`) VALUES ('5', 'sejo', '1234', '세조', 'sejo@gmail.com');

-- -----------------------------------------------------
-- Table `play`.`payment`
-- -----------------------------------------------------






-- -----------------------------------------------------
-- Table `play`.`play`
-- -----------------------------------------------------
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`) VALUES ('1', '1', '발칙한 로맨스', '섹시 발랄 코미디 연극', '환불불가', 'JTN 아트홀 2관', '4', '1');
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`) VALUES ('2', '2', '오마이갓', '세상종말 로맨스', '환불불가', '봄날 아트홀 2관', '2', '1');
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`) VALUES ('3', '2', '메리골드', '치유받을 수 있는 소확행 뮤지컬', '환불불가', '대학로 열린극장', '3', '1');
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`) VALUES ('4', '3', '뷰티풀 라이프', '따뜻한 공감을 부르는 우리네 사랑이야기', '환불불가', 'JTN 아트홀 4관', '3', '1');
INSERT INTO `play`.`play` (`p_id`, `m_code`, `p_name`, `p_info`, `p_refund_policy`, `p_location`, `g_id`, `a_id`) VALUES ('5', '4', '와일드 패밀리', '가족코믹극', '환불불가', '미마지아트센터 풀빛극장', '4', '1');

-- -----------------------------------------------------
-- Table `play`.`play_appear`
-- -----------------------------------------------------






-- -----------------------------------------------------
-- Table `play`.`prefer_actor`
-- -----------------------------------------------------






-- -----------------------------------------------------
-- Table `play`.`question_answer`
-- -----------------------------------------------------






-- -----------------------------------------------------
-- Table `play`.`reservation`
-- -----------------------------------------------------






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
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('1', '1', now(), '존잼', '3');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('2', '2', now(), '노잼', '1');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('3', '3', now(), '존잼', '3');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('4', '4', now(), '노잼', '1');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('5', '5', now(), '존잼', '3');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('1', '6', now(), '노잼', '1');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('2', '7', now(), '존잼', '3');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('3', '8', now(), '노잼', '1');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('4', '9', now(), '존잼', '3');
INSERT INTO `play`.`review` (`m_code`, `s_id`, `r_register_time`, `r_content`, `r_play_score`) VALUES ('5', '10', now(), '노잼', '1');

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