-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema play
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema play
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `play` DEFAULT CHARACTER SET utf8 ;
USE `play` ;

-- -----------------------------------------------------
-- Table `play`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`actor` (
  `a_id` INT(11) NOT NULL AUTO_INCREMENT,
  `a_name` VARCHAR(20) NOT NULL,
  `a_birth` DATE NOT NULL,
  `a_homepage` VARCHAR(60) NULL DEFAULT NULL,
  `a_picture` VARCHAR(45) NULL DEFAULT NULL,
  `a_deleted` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`a_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `play`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`area` (
  `a_id` INT(11) NOT NULL AUTO_INCREMENT,
  `a_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`a_id`),
  UNIQUE INDEX `a_area_UNIQUE` (`a_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `play`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`genre` (
  `g_id` INT(11) NOT NULL AUTO_INCREMENT,
  `g_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`g_id`),
  UNIQUE INDEX `g_name_UNIQUE` (`g_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `play`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`member` (
  `m_code` INT(11) NOT NULL AUTO_INCREMENT,
  `m_id` VARCHAR(45) NOT NULL,
  `m_pw` VARCHAR(45) NOT NULL,
  `m_name` VARCHAR(45) NOT NULL,
  `m_level` TINYINT(4) NOT NULL DEFAULT '1',
  `m_mail` VARCHAR(45) NOT NULL,
  `m_phone` VARCHAR(20) NULL DEFAULT NULL,
  `m_status` TINYINT(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`m_code`),
  UNIQUE INDEX `m_id_UNIQUE` (`m_id` ASC),
  UNIQUE INDEX `m_mail_UNIQUE` (`m_mail` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `play`.`play`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`play` (
  `p_id` INT(11) NOT NULL AUTO_INCREMENT,
  `m_code` INT(11) NOT NULL,
  `p_name` VARCHAR(45) NOT NULL,
  `p_info` TEXT NOT NULL,
  `p_refund_policy` TEXT NOT NULL,
  `p_location` VARCHAR(100) NOT NULL,
  `g_id` INT(11) NOT NULL,
  `a_id` INT(11) NOT NULL,
  `p_status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`p_id`),
  INDEX `fk_play_genre1_idx` (`g_id` ASC),
  INDEX `fk_play_area1_idx` (`a_id` ASC),
  INDEX `fk_play_member1_idx` (`m_code` ASC),
  CONSTRAINT `fk_play_area1`
    FOREIGN KEY (`a_id`)
    REFERENCES `play`.`area` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_genre1`
    FOREIGN KEY (`g_id`)
    REFERENCES `play`.`genre` (`g_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `play`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `play`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`schedule` (
  `s_id` INT(11) NOT NULL AUTO_INCREMENT,
  `p_id` INT(11) NOT NULL,
  `s_ticket` INT(11) NOT NULL,
  `s_price` INT(11) NOT NULL,
  `s_time` TIMESTAMP NOT NULL,
  `a_id1` INT(11) NOT NULL,
  `a_id2` INT(11) NOT NULL,
  `s_canceled` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`s_id`),
  INDEX `fk_show_play1_idx` (`p_id` ASC),
  INDEX `fk_show_actor1_idx` (`a_id1` ASC),
  INDEX `fk_show_actor2_idx` (`a_id2` ASC),
  CONSTRAINT `fk_show_actor1`
    FOREIGN KEY (`a_id1`)
    REFERENCES `play`.`actor` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_actor2`
    FOREIGN KEY (`a_id2`)
    REFERENCES `play`.`actor` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_play1`
    FOREIGN KEY (`p_id`)
    REFERENCES `play`.`play` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `play`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`article` (
  `a_id` INT NOT NULL AUTO_INCREMENT,
  `m_code` INT NOT NULL,
  `a_board` VARCHAR(20) NOT NULL,
  `a_file` VARCHAR(45) NOT NULL,
  `a_content` TEXT NOT NULL,
  `a_time` TIMESTAMP NOT NULL,
  `a_target_id` INT NULL,
  `a_deleted` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`a_id`),
  INDEX `fk_article_member1_idx` (`m_code` ASC),
  CONSTRAINT `fk_article_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `play`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `play`.`prefer_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`prefer_actor` (
  `m_code` INT(11) NOT NULL,
  `a_id` INT(11) NOT NULL,
  INDEX `fk_prefer_actor_member1_idx` (`m_code` ASC),
  INDEX `fk_prefer_actor_actor1_idx` (`a_id` ASC),
  CONSTRAINT `fk_prefer_actor_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `play`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prefer_actor_actor1`
    FOREIGN KEY (`a_id`)
    REFERENCES `play`.`actor` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `play`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`payment` (
  `p_id` INT NOT NULL AUTO_INCREMENT,
  `m_code` INT(11) NOT NULL,
  `s_id` INT(11) NOT NULL,
  `p_price` INT NOT NULL,
  `p_quantity` INT NOT NULL,
  `p_time` TIMESTAMP NOT NULL,
  `p_canceled` TINYINT NOT NULL DEFAULT 0,
  `p_cancel_target_id` INT NULL,
  PRIMARY KEY (`p_id`),
  INDEX `fk_payment_payment1_idx` (`p_cancel_target_id` ASC),
  INDEX `fk_payment_member1_idx` (`m_code` ASC),
  INDEX `fk_payment_show1_idx` (`s_id` ASC),
  CONSTRAINT `fk_payment_payment1`
    FOREIGN KEY (`p_cancel_target_id`)
    REFERENCES `play`.`payment` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `play`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_show1`
    FOREIGN KEY (`s_id`)
    REFERENCES `play`.`schedule` (`s_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `play`.`play_appear`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`play_appear` (
  `p_id` INT(11) NOT NULL,
  `a_id` INT(11) NOT NULL,
  INDEX `fk_play_appear_play1_idx` (`p_id` ASC),
  INDEX `fk_play_appear_actor1_idx` (`a_id` ASC),
  CONSTRAINT `fk_play_appear_play1`
    FOREIGN KEY (`p_id`)
    REFERENCES `play`.`play` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_play_appear_actor1`
    FOREIGN KEY (`a_id`)
    REFERENCES `play`.`actor` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `play`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`review` (
  `m_code` INT(11) NOT NULL,
  `s_id` INT(11) NOT NULL,
  `r_register_time` TIMESTAMP NOT NULL,
  `r_content` TEXT NOT NULL,
  `r_play_score` TINYINT NOT NULL,
  `r_actor1_score` TINYINT NULL,
  `r_actor2_score` TINYINT NULL,
  `r_deleted` TINYINT NOT NULL DEFAULT 0,
  INDEX `fk_review_member1_idx` (`m_code` ASC),
  PRIMARY KEY (`m_code`, `s_id`),
  INDEX `fk_review_show1_idx` (`s_id` ASC),
  CONSTRAINT `fk_review_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `play`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_show1`
    FOREIGN KEY (`s_id`)
    REFERENCES `play`.`schedule` (`s_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `play`.`question_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`question_answer` (
  `q_id` INT NOT NULL AUTO_INCREMENT,
  `q_time` TIMESTAMP NOT NULL,
  `q_content` TEXT NOT NULL,
  `m_code` INT(11) NOT NULL,
  `p_id` INT(11) NOT NULL,
  `q_target_id` INT NOT NULL,
  `q_deleted` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`q_id`),
  INDEX `fk_question_answer_member1_idx` (`m_code` ASC),
  INDEX `fk_question_answer_play1_idx` (`p_id` ASC),
  INDEX `fk_question_answer_question_answer1_idx` (`q_target_id` ASC),
  CONSTRAINT `fk_question_answer_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `play`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_answer_play1`
    FOREIGN KEY (`p_id`)
    REFERENCES `play`.`play` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_answer_question_answer1`
    FOREIGN KEY (`q_target_id`)
    REFERENCES `play`.`question_answer` (`q_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `play`.`shopping_basket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`shopping_basket` (
  `m_code` INT(11) NOT NULL,
  `p_id` INT(11) NOT NULL,
  INDEX `fk_shopping_basket_member1_idx` (`m_code` ASC),
  PRIMARY KEY (`m_code`, `p_id`),
  INDEX `fk_shopping_basket_play1_idx` (`p_id` ASC),
  CONSTRAINT `fk_shopping_basket_member1`
    FOREIGN KEY (`m_code`)
    REFERENCES `play`.`member` (`m_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shopping_basket_play1`
    FOREIGN KEY (`p_id`)
    REFERENCES `play`.`play` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `play`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `play`.`image` (
  `p_id` INT(11) NOT NULL,
  `i_path` VARCHAR(60) NOT NULL,
  `i_tag` VARCHAR(45) NOT NULL,
  INDEX `fk_image_play1_idx` (`p_id` ASC),
  CONSTRAINT `fk_image_play1`
    FOREIGN KEY (`p_id`)
    REFERENCES `play`.`play` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
