CREATE SCHEMA `www` ;
use `www`;
CREATE TABLE `www`.`tbl_user` (
  `userID` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`userID`));
  CREATE TABLE `www`.`tbl_search` (
  `search_title` VARCHAR(50) NOT NULL,
  `search_key` INT(11) NOT NULL AUTO_INCREMENT,
  `userID` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`search_key`),
  INDEX `userID_idx` (`userID` ASC),
  CONSTRAINT ``
    FOREIGN KEY (`userID`)
    REFERENCES `www`.`tbl_user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
