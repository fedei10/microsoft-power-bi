-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE,
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR
_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ventes_DM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ventes_DM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ventes_DM` DEFAULT CHARACTER SET utf8 ;
USE `ventes_DM` ;

-- -----------------------------------------------------
-- Table `ventes_DM`.`Dim_Temps`
-- -----------------------------------------------------




CREATE TABLE IF NOT EXISTS `ventes_DM`.`Dim_Temps` (
`idJours` DATE NOT NULL,
`Mois` INT NULL,
PRIMARY KEY (`idJours`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ventes_DM`.`Dim_Produits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventes_DM`.`Dim_Produits` (
`idProd` INT NOT NULL,
`NomProd` VARCHAR(45) NULL,
`CatProd` VARCHAR(45) NULL,
PRIMARY KEY (`idProd`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ventes_DM`.`Dim_Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventes_DM`.`Dim_Clients` (
`idCl` VARCHAR(5) NOT NULL,
`NomCl` VARCHAR(45) NULL,
`PaysCl` VARCHAR(45) NULL,
PRIMARY KEY (`idCl`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ventes_DM`.`Fact_Ventes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventes_DM`.`Fact_Ventes` (
`Quantite` INT NULL,
`Montant` DOUBLE NULL,
`idCl` VARCHAR(5) NOT NULL,
`idProd` INT NOT NULL,



`idJours` DATE NOT NULL,
PRIMARY KEY (`idCl`, `idProd`, `idJours`),
INDEX `idProd_idx` (`idProd` ASC) VISIBLE,
INDEX `idJours_idx` (`idJours` ASC) VISIBLE,
CONSTRAINT `idCl`
FOREIGN KEY (`idCl`)
REFERENCES `ventes_DM`.`Dim_Clients` (`idCl`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `idProd`
FOREIGN KEY (`idProd`)
REFERENCES `ventes_DM`.`Dim_Produits` (`idProd`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `idJours`
FOREIGN KEY (`idJours`)
REFERENCES `ventes_DM`.`Dim_Temps` (`idJours`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;