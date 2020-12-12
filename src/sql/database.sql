SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `datago` ;

CREATE SCHEMA IF NOT EXISTS `datago` DEFAULT CHARACTER SET utf8 ;
USE `datago` ;

DROP TABLE IF EXISTS `datago`.`Dataset`;

CREATE TABLE IF NOT EXISTS `datago`.`Dataset`
(
	`GUID` INT PRIMARY KEY NOT NULL AUTO_INCREMENT
)
ENGINE=InnoDB;


DROP TABLE IF EXISTS `datago`.`User`;

CREATE TABLE IF NOT EXISTS `datago`.`User`
(
	`idUser` INT PRIMARY KEY NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `photo` VARCHAR(45) NOT NULL
)
ENGINE=InnoDB;


DROP TABLE IF EXISTS `datago`.`Metadata` ;

CREATE TABLE IF NOT EXISTS `datago`.`Metadata` (
  `key` VARCHAR(225) NOT NULL,
  `value` VARCHAR(225) NULL,
  `GUID` INT NOT NULL,
  FOREIGN KEY (`GUID`) REFERENCES `datago`.`Dataset` (`GUID`)
)
ENGINE=InnoDB;

DROP TABLE IF EXISTS `datago`.`Comment`;

CREATE TABLE IF NOT EXISTS `datago`.`Comment` 
(
	`idComment` INT NOT NULL,
    `author` VARCHAR(45) NOT NULL,
    `body` VARCHAR(5000) NOT NULL,
    `parent` VARCHAR(45) NOT NULL,
    `GUID` INT NOT NULL,
    PRIMARY KEY (`idComment`),
	FOREIGN KEY (`GUID`) REFERENCES `datago`.`Dataset` (`GUID`)
)
ENGINE=InnoDB;

DROP TABLE IF EXISTS `datago`.`Datafile`;

CREATE TABLE IF NOT EXISTS `datago`.`Datafile`
(
	`idDatafile` INT NOT NULL,
    `path` LONGTEXT NULL,
    `User_idUser` INT NOT NULL,
    `User_name` VARCHAR(45) NOT NULL,
    `GUID` INT NOT NULL,
    PRIMARY KEY (`idDatafile`),
	FOREIGN KEY (`GUID`) REFERENCES `datago`.`Datafile` (`GUID`),
	FOREIGN KEY (`User_idUser`) REFERENCES `datago`.`Datafile` (`User_idUser`)
)
ENGINE=InnoDB;

DROP TABLE IF EXISTS `datago`.`Access`;

CREATE TABLE IF NOT EXISTS `datago`.`Access`
(
	`role` VARCHAR(45) NOT NULL,
    `permission` LONGTEXT NOT NULL,
    `User_idUser` INT NOT NULL,
    `User_name` VARCHAR(45),
    `GUID` INT NOT NULL,
    FOREIGN KEY (`GUID`) REFERENCES `datago`.`Dataset` (`GUID`),
	FOREIGN KEY (`User_idUser`) REFERENCES `datago`.`User` (`idUser`),
    FOREIGN KEY (`User_name`) REFERENCES `datago`.`User` (`name`)
)
ENGINE=InnoDB;

DROP TABLE IF EXISTS `datago`.`Category`;

CREATE TABLE IF NOT EXISTS `datago`.`Category`
(
	`idCategory` INT NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `description` VARCHAR(5000),
    `GUID` INT NOT NULL,
    FOREIGN KEY (`idCategory`) REFERENCES `datago`.`Dataset` (`GUID`)
)
ENGINE=InnoDB;