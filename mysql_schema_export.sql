-- MySQL Script generated by MySQL Workbench
-- Wed Oct 19 14:53:03 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ds_jobs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ds_jobs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ds_jobs` ;
USE `ds_jobs` ;

-- -----------------------------------------------------
-- Table `ds_jobs`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ds_jobs`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `population` INT NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ds_jobs`.`job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ds_jobs`.`job` (
  `job_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `location_id` INT NOT NULL,
  `company` VARCHAR(45) NULL,
  `description` VARCHAR(13000) NULL,
  PRIMARY KEY (`job_id`),
  INDEX `location_id_idx` (`location_id` ASC) VISIBLE,
  CONSTRAINT `location_id`
    FOREIGN KEY (`location_id`)
    REFERENCES `ds_jobs`.`location` (`location_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ds_jobs`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ds_jobs`.`skill` (
  `skill_id` INT NOT NULL AUTO_INCREMENT,
  `skill` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`skill_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ds_jobs`.`job_skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ds_jobs`.`job_skill` (
  `job_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  `job_skill_id` INT NOT NULL AUTO_INCREMENT,
  INDEX `job_idx` (`job_id` ASC) VISIBLE,
  UNIQUE INDEX `multi_unique` (`job_id` ASC, `skill_id` ASC) VISIBLE,
  PRIMARY KEY (`job_skill_id`),
  CONSTRAINT `job`
    FOREIGN KEY (`job_id`)
    REFERENCES `ds_jobs`.`job` (`job_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `skill`
    FOREIGN KEY (`skill_id`)
    REFERENCES `ds_jobs`.`skill` (`skill_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;