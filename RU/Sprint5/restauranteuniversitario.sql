SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Bolsistas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Bolsistas` (
  `matricula` INT NOT NULL ,
  `nome` VARCHAR(100) NULL ,
  `situacao` VARCHAR(10) NULL ,
  PRIMARY KEY (`matricula`) ,
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Casos_especiais`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Casos_especiais` (
  `matricula` INT NOT NULL ,
  `nome` VARCHAR(100) NULL ,
  `situacao` VARCHAR(10) NULL ,
  `DataIngresso` DATE NULL ,
  PRIMARY KEY (`matricula`) ,
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gestores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Gestores` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(100) NULL ,
  `Unidade` VARCHAR(50) NULL ,
  `Tipo` VARCHAR(15) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parametros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Parametros` (
  `codigo` VARCHAR(20) NOT NULL ,
  `descricao` VARCHAR(150) NULL ,
  `valor` DOUBLE NULL ,
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) ,
  PRIMARY KEY (`codigo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `tipo` VARCHAR(15) NULL ,
  PRIMARY KEY (`codigo`) ,
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Refeicao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Refeicao` (
  `idRefeicao` INT NOT NULL AUTO_INCREMENT ,
  `valor` DECIMAL(5,2) NULL ,
  `valorUFERSA` DECIMAL(5,2) NULL ,
  `total` DECIMAL(5,2) NULL ,
  `data` DATETIME NULL ,
  `idUsuario` INT NOT NULL ,
  PRIMARY KEY (`idRefeicao`) ,
  UNIQUE INDEX `idRefeicao_UNIQUE` (`idRefeicao` ASC) ,
  INDEX `idUsuario_idx` (`idUsuario` ASC) ,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `mydb`.`Usuario` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
