-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema conCiber
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema conCiber
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `conCiber` DEFAULT CHARACTER SET utf8 ;
GRANT ALL PRIVILEGES ON `conCiber`.* TO 'conCiber'@'%';
USE `conCiber` ;

-- -----------------------------------------------------
-- Table `conCiber`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conCiber`.`role` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `conCiber`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conCiber`.`user` (
  `id` BIGINT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_role1_idx` (`role_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_category_id`)
    REFERENCES `conCiber`.`role` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `conCiber`.`entry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conCiber`.`entry` (
  `id` BIGINT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `create_time` TIMESTAMP NOT NULL,
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_entry_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_entry_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `conCiber`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conCiber`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conCiber`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `entry_id` BIGINT NOT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `fk_category_entry1_idx` (`entry_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_entry1`
    FOREIGN KEY (`entry_id`)
    REFERENCES `conCiber`.`entry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `conCiber`.`challengue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conCiber`.`challengue` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conCiber`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conCiber`.`comments` (
  `id` INT NOT NULL,
  `content` VARCHAR(250) NULL,
  `entry_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_entry_idx` (`entry_id` ASC) VISIBLE,
  INDEX `fk_comments_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_entry`
    FOREIGN KEY (`entry_id`)
    REFERENCES `conCiber`.`entry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `conCiber`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
