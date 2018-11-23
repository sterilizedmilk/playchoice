CREATE DATABASE  IF NOT EXISTS `play` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `play`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: play
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(20) NOT NULL,
  `a_birth` date NOT NULL,
  `a_homepage` varchar(60) DEFAULT NULL,
  `a_picture` varchar(45) DEFAULT NULL,
  `a_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 : 삭제됨',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(20) NOT NULL,
  PRIMARY KEY (`a_id`),
  UNIQUE KEY `a_area_UNIQUE` (`a_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_code` int(11) NOT NULL,
  `a_board` varchar(20) NOT NULL,
  `a_title` varchar(45) NOT NULL,
  `a_content` text NOT NULL,
  `a_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_comment` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`a_id`),
  KEY `fk_article_member1_idx` (`m_code`),
  CONSTRAINT `fk_article_member1` FOREIGN KEY (`m_code`) REFERENCES `member` (`m_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(20) NOT NULL,
  PRIMARY KEY (`g_id`),
  UNIQUE KEY `g_name_UNIQUE` (`g_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `m_code` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` varchar(45) NOT NULL,
  `m_pw` varchar(45) NOT NULL,
  `m_name` varchar(45) NOT NULL,
  `m_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 : 일반 사용자\n1 : 연극 관리자\n2 : 사이트 관리자',
  `m_mail` varchar(45) NOT NULL,
  `m_phone` varchar(20) DEFAULT NULL,
  `m_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 : 정상\n1 : 블랙리스트\n2 : 탈퇴',
  PRIMARY KEY (`m_code`),
  UNIQUE KEY `m_id_UNIQUE` (`m_id`),
  UNIQUE KEY `m_mail_UNIQUE` (`m_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_code` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_quantity` int(11) NOT NULL COMMENT '결제 총액',
  `p_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `p_canceled` tinyint(4) NOT NULL DEFAULT '0',
  `p_cancel_target_id` int(11) DEFAULT NULL COMMENT '이 결제가 취소한 결제의 p_id',
  PRIMARY KEY (`p_id`),
  KEY `fk_payment_payment1_idx` (`p_cancel_target_id`),
  KEY `fk_payment_member1_idx` (`m_code`),
  KEY `fk_payment_show1_idx` (`s_id`),
  CONSTRAINT `fk_payment_member1` FOREIGN KEY (`m_code`) REFERENCES `member` (`m_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_payment1` FOREIGN KEY (`p_cancel_target_id`) REFERENCES `payment` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_show1` FOREIGN KEY (`s_id`) REFERENCES `schedule` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `play`
--

DROP TABLE IF EXISTS `play`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_code` int(11) NOT NULL,
  `p_name` varchar(45) NOT NULL,
  `p_info` text NOT NULL,
  `p_refund_policy` text NOT NULL,
  `p_location` varchar(100) NOT NULL,
  `g_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `p_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 : 관리자만 볼 수 있음\n1 : 일반 사용자도 볼 수 있음',
  `p_image0` varchar(60) NOT NULL,
  `p_image1` varchar(60) DEFAULT NULL,
  `p_image2` varchar(60) DEFAULT NULL,
  `p_image3` varchar(60) DEFAULT NULL,
  `p_image4` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `fk_play_genre1_idx` (`g_id`),
  KEY `fk_play_area1_idx` (`a_id`),
  KEY `fk_play_member1_idx` (`m_code`),
  CONSTRAINT `fk_play_area1` FOREIGN KEY (`a_id`) REFERENCES `area` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_genre1` FOREIGN KEY (`g_id`) REFERENCES `genre` (`g_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_member1` FOREIGN KEY (`m_code`) REFERENCES `member` (`m_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `play_appear`
--

DROP TABLE IF EXISTS `play_appear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play_appear` (
  `p_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  KEY `fk_play_appear_play1_idx` (`p_id`),
  KEY `fk_play_appear_actor1_idx` (`a_id`),
  CONSTRAINT `fk_play_appear_actor1` FOREIGN KEY (`a_id`) REFERENCES `actor` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_appear_play1` FOREIGN KEY (`p_id`) REFERENCES `play` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prefer_actor`
--

DROP TABLE IF EXISTS `prefer_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prefer_actor` (
  `m_code` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  KEY `fk_prefer_actor_member1_idx` (`m_code`),
  KEY `fk_prefer_actor_actor1_idx` (`a_id`),
  CONSTRAINT `fk_prefer_actor_actor1` FOREIGN KEY (`a_id`) REFERENCES `actor` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_prefer_actor_member1` FOREIGN KEY (`m_code`) REFERENCES `member` (`m_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question_answer`
--

DROP TABLE IF EXISTS `question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_answer` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `q_content` text NOT NULL,
  `m_code` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `q_target_id` int(11) NOT NULL,
  `q_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`q_id`),
  KEY `fk_question_answer_member1_idx` (`m_code`),
  KEY `fk_question_answer_play1_idx` (`p_id`),
  KEY `fk_question_answer_question_answer1_idx` (`q_target_id`),
  CONSTRAINT `fk_question_answer_member1` FOREIGN KEY (`m_code`) REFERENCES `member` (`m_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_answer_play1` FOREIGN KEY (`p_id`) REFERENCES `play` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_answer_question_answer1` FOREIGN KEY (`q_target_id`) REFERENCES `question_answer` (`q_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) NOT NULL,
  `re_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `re_comment` text NOT NULL,
  PRIMARY KEY (`re_id`),
  KEY `fk_reply_article1_idx` (`a_id`),
  CONSTRAINT `fk_reply_article1` FOREIGN KEY (`a_id`) REFERENCES `article` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `m_code` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `r_register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `r_content` text NOT NULL,
  `r_play_score` tinyint(4) NOT NULL,
  `r_actor1_score` tinyint(4) DEFAULT NULL,
  `r_actor2_score` tinyint(4) DEFAULT NULL,
  `r_deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_code`,`s_id`),
  KEY `fk_review_member1_idx` (`m_code`),
  KEY `fk_review_show1_idx` (`s_id`),
  CONSTRAINT `fk_review_member1` FOREIGN KEY (`m_code`) REFERENCES `member` (`m_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_show1` FOREIGN KEY (`s_id`) REFERENCES `schedule` (`s_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `s_ticket` int(11) NOT NULL,
  `s_price` int(11) NOT NULL,
  `s_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_id1` int(11) NOT NULL,
  `a_id2` int(11) NOT NULL,
  `s_canceled` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`s_id`),
  KEY `fk_show_play1_idx` (`p_id`),
  KEY `fk_show_actor1_idx` (`a_id1`),
  KEY `fk_show_actor2_idx` (`a_id2`),
  CONSTRAINT `fk_show_actor1` FOREIGN KEY (`a_id1`) REFERENCES `actor` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_actor2` FOREIGN KEY (`a_id2`) REFERENCES `actor` (`a_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_play1` FOREIGN KEY (`p_id`) REFERENCES `play` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shopping_basket`
--

DROP TABLE IF EXISTS `shopping_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_basket` (
  `m_code` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`m_code`,`p_id`),
  KEY `fk_shopping_basket_member1_idx` (`m_code`),
  KEY `fk_shopping_basket_play1_idx` (`p_id`),
  CONSTRAINT `fk_shopping_basket_member1` FOREIGN KEY (`m_code`) REFERENCES `member` (`m_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_basket_play1` FOREIGN KEY (`p_id`) REFERENCES `play` (`p_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-22 13:11:23
