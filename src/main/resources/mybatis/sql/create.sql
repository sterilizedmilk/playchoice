-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema playchoice
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema playchoice
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `playchoice` DEFAULT CHARACTER SET utf8 ;
USE `playchoice` ;

-- -----------------------------------------------------
-- Table `playchoice`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`actor` (
  `a_id` INT(11) NOT NULL AUTO_INCREMENT,
  `a_name` VARCHAR(20) NOT NULL,
  `a_birth` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_homepage` VARCHAR(60) NULL DEFAULT NULL,
  `a_picture` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `playchoice`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`area` (
  `a_id` INT(11) NOT NULL,
  `a_area` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `playchoice`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`genre` (
  `g_id` INT(11) NOT NULL,
  `g_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`g_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `playchoice`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`member` (
  `m_code` INT(11) NOT NULL,
  `m_id` VARCHAR(45) NOT NULL,
  `m_pw` VARCHAR(45) NOT NULL,
  `m_name` VARCHAR(45) NOT NULL,
  `m_level` TINYINT(4) NOT NULL DEFAULT '1',
  `m_mail` VARCHAR(45) NOT NULL,
  `m_phone` VARCHAR(20) NULL DEFAULT NULL,
  `m_black` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_code`),
  UNIQUE INDEX `m_id_UNIQUE` (`m_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `playchoice`.`play`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`play` (
  `p_id` INT(11) NOT NULL,
  `t_id` INT(11) NOT NULL,
  `p_name` VARCHAR(45) NOT NULL,
  `p_info` TEXT NOT NULL,
  `p_refund_policy` TEXT NOT NULL,
  `p_location` VARCHAR(100) NOT NULL,
  `p_score_total` INT(11) NOT NULL DEFAULT '0',
  `g_id` INT(11) NOT NULL,
  `a_id` INT(11) NOT NULL,
  PRIMARY KEY (`p_id`),
  INDEX `fk_play_genre1_idx` (`g_id` ASC),
  INDEX `fk_play_area1_idx` (`a_id` ASC),
  CONSTRAINT `fk_play_area1`
    FOREIGN KEY (`a_id`)
    REFERENCES `playchoice`.`area` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_genre1`
    FOREIGN KEY (`g_id`)
    REFERENCES `playchoice`.`genre` (`g_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `playchoice`.`show`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`show` (
  `s_id` INT(11) NOT NULL,
  `p_id` INT(11) NOT NULL,
  `s_ticket` INT(11) NOT NULL,
  `s_price` INT(11) NOT NULL,
  `s_time` TIMESTAMP NULL DEFAULT NULL,
  `a_id1` INT(11) NOT NULL,
  `a_id2` INT(11) NOT NULL,
  PRIMARY KEY (`s_id`),
  INDEX `fk_show_play1_idx` (`p_id` ASC),
  INDEX `fk_show_actor1_idx` (`a_id1` ASC),
  INDEX `fk_show_actor2_idx` (`a_id2` ASC),
  CONSTRAINT `fk_show_actor1`
    FOREIGN KEY (`a_id1`)
    REFERENCES `playchoice`.`actor` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_actor2`
    FOREIGN KEY (`a_id2`)
    REFERENCES `playchoice`.`actor` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_play1`
    FOREIGN KEY (`p_id`)
    REFERENCES `playchoice`.`play` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `playchoice`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`article` (
  `a_id` INT NOT NULL,
  `m_code` INT NOT NULL,
  `a_board` VARCHAR(20) NOT NULL,
  `a_file` VARCHAR(45) NOT NULL,
  `a_content` TEXT NOT NULL,
  `a_time` TIMESTAMP NOT NULL,
  `a_target_id` INT NULL,
  `a_solved` TINYINT NULL,
  PRIMARY KEY (`a_id`),
  INDEX `fk_article_member1_idx` (`m_code` ASC),
  CONSTRAINT `fk_article_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `playchoice`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playchoice`.`prefer_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`prefer_actor` (
  `m_code` INT(11) NOT NULL,
  `actor_a_id` INT(11) NOT NULL,
  INDEX `fk_prefer_actor_member1_idx` (`m_code` ASC),
  INDEX `fk_prefer_actor_actor1_idx` (`actor_a_id` ASC),
  CONSTRAINT `fk_prefer_actor_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `playchoice`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prefer_actor_actor1`
    FOREIGN KEY (`actor_a_id`)
    REFERENCES `playchoice`.`actor` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playchoice`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`payment` (
  `p_id` INT NOT NULL,
  `m_code` INT(11) NOT NULL,
  `p_time` TIMESTAMP NOT NULL,
  `p_price` INT NOT NULL,
  `p_canceled` TINYINT NOT NULL DEFAULT 0,
  `p_cancel_target_id` INT NULL,
  PRIMARY KEY (`p_id`),
  INDEX `fk_payment_payment1_idx` (`p_cancel_target_id` ASC),
  INDEX `fk_payment_member1_idx` (`m_code` ASC),
  CONSTRAINT `fk_payment_payment1`
    FOREIGN KEY (`p_cancel_target_id`)
    REFERENCES `playchoice`.`payment` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `playchoice`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playchoice`.`play_appear`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`play_appear` (
  `play_p_id` INT(11) NOT NULL,
  `actor_a_id` INT(11) NOT NULL,
  INDEX `fk_play_appear_play1_idx` (`play_p_id` ASC),
  INDEX `fk_play_appear_actor1_idx` (`actor_a_id` ASC),
  CONSTRAINT `fk_play_appear_play1`
    FOREIGN KEY (`play_p_id`)
    REFERENCES `playchoice`.`play` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_appear_actor1`
    FOREIGN KEY (`actor_a_id`)
    REFERENCES `playchoice`.`actor` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playchoice`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`reservation` (
  `p_id` INT NOT NULL,
  `r_id` INT NOT NULL,
  `s_id` INT(11) NOT NULL,
  `r_price` INT NOT NULL,
  `r_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`r_id`, `p_id`),
  INDEX `fk_reservation_payment1_idx` (`p_id` ASC),
  INDEX `fk_reservation_show1_idx` (`s_id` ASC),
  CONSTRAINT `fk_reservation_payment1`
    FOREIGN KEY (`p_id`)
    REFERENCES `playchoice`.`payment` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_show1`
    FOREIGN KEY (`s_id`)
    REFERENCES `playchoice`.`show` (`s_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playchoice`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`review` (
  `m_code` INT(11) NOT NULL,
  `s_id` INT(11) NOT NULL,
  `r_register_time` TIMESTAMP NOT NULL,
  `r_content` TEXT NOT NULL,
  `r_play_score` TINYINT NOT NULL,
  `r_actor1_score` TINYINT NULL,
  `r_actor2_score` TINYINT NULL,
  INDEX `fk_review_member1_idx` (`m_code` ASC),
  PRIMARY KEY (`m_code`, `s_id`),
  INDEX `fk_review_show1_idx` (`s_id` ASC),
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `playchoice`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_show1`
    FOREIGN KEY (`s_id`)
    REFERENCES `playchoice`.`show` (`s_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playchoice`.`question_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`question_answer` (
  `q_id` INT NOT NULL,
  `q_time` TIMESTAMP NOT NULL,
  `q_content` TEXT NOT NULL,
  `m_code` INT(11) NOT NULL,
  `p_id` INT(11) NOT NULL,
  `q_target_id` INT NOT NULL,
  PRIMARY KEY (`q_id`),
  INDEX `fk_question_answer_member1_idx` (`m_code` ASC),
  INDEX `fk_question_answer_play1_idx` (`p_id` ASC),
  INDEX `fk_question_answer_question_answer1_idx` (`q_target_id` ASC),
  CONSTRAINT `fk_question_answer_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `playchoice`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_answer_play1`
    FOREIGN KEY (`p_id`)
    REFERENCES `playchoice`.`play` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_answer_question_answer1`
    FOREIGN KEY (`q_target_id`)
    REFERENCES `playchoice`.`question_answer` (`q_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `playchoice`.`shopping_basket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `playchoice`.`shopping_basket` (
  `m_code` INT(11) NOT NULL,
  `s_id` INT(11) NOT NULL,
  INDEX `fk_shopping_basket_member1_idx` (`m_code` ASC),
  INDEX `fk_shopping_basket_show1_idx` (`s_id` ASC),
  PRIMARY KEY (`m_code`, `s_id`),
  CONSTRAINT `fk_shopping_basket_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `playchoice`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_basket_show1`
    FOREIGN KEY (`s_id`)
    REFERENCES `playchoice`.`show` (`s_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
