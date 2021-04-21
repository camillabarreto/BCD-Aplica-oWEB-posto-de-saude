-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pp02camilla
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pp02camilla` ;

-- -----------------------------------------------------
-- Schema pp02camilla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pp02camilla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `pp02camilla` ;

-- -----------------------------------------------------
-- Table `pp02camilla`.`Pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Pessoa` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Pessoa` (
  `CPF` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Situação`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Situação` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Situação` (
  `idSituação` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSituação`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Posto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Posto` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Posto` (
  `idPosto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPosto`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Fabricante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Fabricante` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Fabricante` (
  `idFabricante` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFabricante`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Vacina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Vacina` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Vacina` (
  `idVacina` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `doses` INT NOT NULL,
  `intervalo` INT NOT NULL,
  `idFabricante` INT NOT NULL,
  PRIMARY KEY (`idVacina`, `idFabricante`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Agenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Agenda` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Agenda` (
  `idPosto` INT NOT NULL,
  `idVacina` INT NOT NULL,
  `idFabricante` INT NOT NULL,
  `data` DATE NOT NULL,
  `idSituação` INT NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPosto`, `idVacina`, `idFabricante`, `idSituação`, `CPF`),
  INDEX `fk_Aplicacao_Posto1_idx` (`idPosto` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Calendario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Calendario` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Calendario` (
  `idCalendario` INT NOT NULL,
  `ano` DATE NOT NULL,
  PRIMARY KEY (`idCalendario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Calendario_has_Vacina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Calendario_has_Vacina` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Calendario_has_Vacina` (
  `idCalendario` INT NOT NULL,
  `idVacina` INT NOT NULL,
  `idFabricante` INT NOT NULL,
  `meses` INT NOT NULL,
  PRIMARY KEY (`idCalendario`, `idVacina`, `idFabricante`),
  INDEX `fk_Calendario_has_Vacina_Calendario1_idx` (`idCalendario` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Compra` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Compra` (
  `idCompra` INT NOT NULL,
  `lote` VARCHAR(45) NOT NULL,
  `dataFabricacao` DATE NOT NULL,
  `dataValidade` DATE NOT NULL,
  `dosesPorFrasco` INT NOT NULL,
  `unidades` INT NOT NULL,
  `dosesDescartadas` INT NOT NULL,
  `idVacina` INT NOT NULL,
  `idFabricante` INT NOT NULL,
  PRIMARY KEY (`idCompra`, `idVacina`, `idFabricante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Doenca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Doenca` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Doenca` (
  `idDoenca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDoenca`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pp02camilla`.`Doenca_has_Vacina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pp02camilla`.`Doenca_has_Vacina` ;

CREATE TABLE IF NOT EXISTS `pp02camilla`.`Doenca_has_Vacina` (
  `idDoenca` INT NOT NULL,
  `idVacina` INT NOT NULL,
  `idFabricante` INT NOT NULL,
  PRIMARY KEY (`idDoenca`, `idVacina`, `idFabricante`),
  INDEX `fk_Doenca_has_Vacina_Doenca1_idx` (`idDoenca` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
