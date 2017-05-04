-- This database is made by king caku and king caku only
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema HOPVERKEFNI
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema HOPVERKEFNI
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HOPVERKEFNI` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `HOPVERKEFNI` ;

-- -----------------------------------------------------
-- Table `HOPVERKEFNI`.`MEMEBERSHIP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOPVERKEFNI`.`MEMEBERSHIP` (
  `MEM_NUM` INT NOT NULL,
  `MEM_FNAME` VARCHAR(45) NULL,
  `MEM_LNAME` VARCHAR(45) NULL,
  `MEM_STREET` VARCHAR(45) NULL,
  `MEM_CITY` VARCHAR(45) NULL,
  `MEM_STATE` VARCHAR(45) NULL,
  `MEM_ZIP` VARCHAR(45) NULL,
  `MEM_BALANCE` DECIMAL(5,2) NULL,
  PRIMARY KEY (`MEM_NUM`))
ENGINE = InnoDB;

INSERT INTO `HOPVERKEFNI`.`MEMEBERSHIP` (`MEM_NUM`,`MEM_FNAME`, `MEM_LNAME`, `MEM_STREET`, `MEM_CITY`, `MEM_STATE`, `MEM_ZIP`,`MEM_BALANCE`)
VALUES
(102, "Tami" , "Dawson", "2632 Takli Circle", "Norene", "TN", "37136", 11),
(103, "Curt", "Knight", "4025 Cornell Court", "Flatgap", "KY", "41219", 6),
(104, "Jamal", "Melendez", "788 East 145th Avenue", "Quebeck", "TN", "38579", 0),
(105, "Iva", "McClain", "6045 Musket Ball Circle", "Summit", "KY", "42783", 15),
(106, "Miranda", "Parks", "4469 Maxwell Place", "Germantown", "TN", "38183", 0),
(107, "Rosario", "Elliott", "7578 Danner Avenue", "Columbia", "TN", "38402", 5),
(108, "Mattie", "Guy", "4390 Evergreen Steet", "Lily", "KY", "40740", 0),
(109, "Clint", "Ochoa", "1711 Elm Steet", "Greenville", "TN", "37745", 10),
(110, "Lewis", "Rosales", "4524 Southwind Circle", "Counce", "TN", "38326", 0),
(111, "Stacy", "Mann", "2789 East Cook Avenue", "Murfreesboro", "TN", "37132", 8),
(112, "Luis", "Trujillo", "7267 Melvin Avenue", "Heiskell", "TN", "37754", 3),
(113, "Minnie", "Gonzales", "6430 Vasili Drive", "Willston", "TN", "38076", 0);

-- -----------------------------------------------------
-- Table `HOPVERKEFNI`.`RENTAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOPVERKEFNI`.`RENTAL` (
  `RENT_NUM` INT NOT NULL,
  `RENT_DATE` DATE NULL,
  `MEM_NUM` INT NOT NULL,
  INDEX `fk_table1_MEMEBERSHIP_idx` (`MEM_NUM` ASC),
  PRIMARY KEY (`RENT_NUM`),
  CONSTRAINT `fk_table1_MEMEBERSHIP`
    FOREIGN KEY (`MEM_NUM`)
    REFERENCES `HOPVERKEFNI`.`MEMEBERSHIP` (`MEM_NUM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO  `HOPVERKEFNI`.`RENTAL` (`RENT_NUM`,`RENT_DATE`,`MEM_NUM`)
VALUES
(1001, '09-03-01', 103),
(1002, '09-03-01', 105),
(1003, '09-03-02', 102),
(1004, '09-03-02', 110),
(1005, '09-03-02', 111),
(1006, '09-03-02', 107),
(1007, '09-03-02', 104),
(1008, '09-03-03', 105),
(1009, '09-03-03', 111);

-- -----------------------------------------------------
-- Table `HOPVERKEFNI`.`PRICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOPVERKEFNI`.`PRICE` (
  `PRICE_CODE` INT NOT NULL,
  `PRICE_DESCRIPTION` VARCHAR(45) NULL,
  `PRICE_RENTFEE` DECIMAL(5,2) NULL,
  `PRICE_DAILYLATEFEE` DECIMAL(5,2) NULL,
  PRIMARY KEY (`PRICE_CODE`))
ENGINE = InnoDB;

INSERT INTO  `HOPVERKEFNI`.`PRICE` (`PRICE_CODE`,`PRICE_DESCRIPTION`,`PRICE_RENTFEE`,`PRICE_DAILYLATEFEE`)
VALUES
(1, "Standard", 2, 1),
(2,"New Realese", 3.5, 3),
(3,"Discount", 1.5, 1),
(4,"Weekly Special", 1, .5);

-- -----------------------------------------------------
-- Table `HOPVERKEFNI`.`MOVIE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOPVERKEFNI`.`MOVIE` (
  `MOVIE_NUM` INT NOT NULL,
  `MOVIE_TITLE` VARCHAR(45) NULL,
  `MOVIE_YEAR` DATE NULL,
  `MOVIE_COST` DECIMAL(5,2) NULL,
  `MOVIE_GENRE` VARCHAR(45) NULL,
  `PRICE_CODE` INT NOT NULL,
  PRIMARY KEY (`MOVIE_NUM`),
  INDEX `fk_MOVIE_PRICE1_idx` (`PRICE_CODE` ASC),
  CONSTRAINT `fk_MOVIE_PRICE1`
    FOREIGN KEY (`PRICE_CODE`)
    REFERENCES `HOPVERKEFNI`.`PRICE` (`PRICE_CODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `HOPVERKEFNI`.`MOVIE` (`MOVIE_NUM`,`MOVIE_TITLE`,`MOVIE_YEAR`,`MOVIE_COST`,`MOVIE_GENRE`,`PRICE_CODE`)
VALUES
(1234, "The Cesar Family Christmas", '2007-01-01', 39.95, "FAMILY", 2),
(1235, "Smokey Mountain Wildlife", '2004-01-01', 59.95, "ACTION", 1),
(1236, "Richard Goodhope", '2008-01-01', 59.95, "DRAMA", 2),
(1237, "Beatnik Fever", '2007-01-01', 29.95, "COMEDY", 2),
(1238, "Constant Companion", '2008-01-01', 89.95, "DRAMA", 2),
(1239, "Where Hope Dies", '1998-01-01', 25.49, "DRAMA", 3),
(1245, "Time To Burn", '2005-01-01', 45.49, "ACTION", 1),
(1246, "What He Doesn't Know", '2006-01-01', 58.29, "COMEDY", 1);

-- -----------------------------------------------------
-- Table `HOPVERKEFNI`.`VIDEO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOPVERKEFNI`.`VIDEO` (
  `VID_NUM` INT NOT NULL,
  `VID_INDATE` DATE NULL,
  `MOVIE_NUM` INT NOT NULL,
  PRIMARY KEY (`VID_NUM`),
  INDEX `fk_VIDEO_MOVIE1_idx` (`MOVIE_NUM` ASC),
  CONSTRAINT `fk_VIDEO_MOVIE1`
    FOREIGN KEY (`MOVIE_NUM`)
    REFERENCES `HOPVERKEFNI`.`MOVIE` (`MOVIE_NUM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `HOPVERKEFNI`.`VIDEO` (`VID_NUM`,`VID_INDATE`,`MOVIE_NUM`)
VALUES
(54321, '08-06-18', 1234),
(54324, '08-06-18', 1234),
(54325, '08-06-18', 1234),
(34341, '07-01-22', 1235),
(34342, '07-01-22', 1235),
(34366, '09-03-02', 1236),
(34367, '09-03-02', 1236),
(34368, '09-03-02', 1236),
(34369, '09-03-02', 1236),
(44392, '08-10-21', 1237),
(44397, '08-10-21', 1237),
(59237, '09-02-14', 1237),
(61388, '07-01-25', 1239),
(61353, '06-01-28', 1245),
(61354, '06-01-28', 1245),
(61367, '08-07-30', 1246),
(61369, '08-07-30', 1246);

-- -----------------------------------------------------
-- Table `HOPVERKEFNI`.`DETAILRENTAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HOPVERKEFNI`.`DETAILRENTAL` (
  `RENT_NUM` INT NOT NULL,
  `VID_NUM` INT NOT NULL,
  `DETAIL_FEE` DECIMAL NULL,
  `DETAIL_DUEDATE` DATE NULL,
  `DETAIL_RETURNDATE` DATE NULL,
  `DETAIL_DAILYFEE` DECIMAL(5,2) NULL,
  PRIMARY KEY (`RENT_NUM`, `VID_NUM`),
  INDEX `fk_DETAILRENTAL_VIDEO1_idx` (`VID_NUM` ASC),
  CONSTRAINT `fk_DETAILRENTAL_RENTAL1`
    FOREIGN KEY (`RENT_NUM`)
    REFERENCES `HOPVERKEFNI`.`RENTAL` (`RENT_NUM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETAILRENTAL_VIDEO1`
    FOREIGN KEY (`VID_NUM`)
    REFERENCES `HOPVERKEFNI`.`VIDEO` (`VID_NUM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
 
 INSERT INTO `DETAILRENTAL` (`RENT_NUM`,`VID_NUM`,`DETAIL_FEE`,`DETAIL_DUEDATE`,`DETAIL_RETURNDATE`,`DETAIL_DAILYFEE`) 
 VALUES 
 (1001,54321,1,"09-03-06","09-03-07",3),
 (1002,54324,1,"09-03-06","09-03-07",3),
 (1003,34341,1,"09-03-06","09-03-07",1),
 (1004,34369,1,"09-03-06","09-03-07",3),
 (1005,61369,1,"09-03-06","09-03-05",1),
 (1006,61367,1,"09-03-06","09-03-05",1),
 (1008,61354,1,"09-03-06","09-03-05",1),
 (1009,61353,1,"09-03-06","09-03-05",1);

-- its not real nothing is real!!!
-- þetta virkar simmi king
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

