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
-- Table `mydb`.`Refeicao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Refeicao` (
  `idRefeicao` INT NOT NULL AUTO_INCREMENT ,
  `valor` DECIMAL(5,2) NULL ,
  `valorUFERSA` DECIMAL(5,2) NULL ,
  `total` DECIMAL(5,2) NULL ,
  `matriculaBolsista` INT NULL ,
  `matriculaCasoEspecial` INT NULL ,
  `idGestor` INT NULL ,
  PRIMARY KEY (`idRefeicao`) ,
  UNIQUE INDEX `idRefeicao_UNIQUE` (`idRefeicao` ASC) ,
  INDEX `matriculaBosista_idx` (`matriculaBolsista` ASC) ,
  INDEX `matriculaCasoEspecial_idx` (`matriculaCasoEspecial` ASC) ,
  INDEX `idGestor_idx` (`idGestor` ASC) ,
  CONSTRAINT `matriculaBosista`
    FOREIGN KEY (`matriculaBolsista` )
    REFERENCES `mydb`.`Bolsistas` (`matricula` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `matriculaCasoEspecial`
    FOREIGN KEY (`matriculaCasoEspecial` )
    REFERENCES `mydb`.`Casos_especiais` (`matricula` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idGestor`
    FOREIGN KEY (`idGestor` )
    REFERENCES `mydb`.`Gestores` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
