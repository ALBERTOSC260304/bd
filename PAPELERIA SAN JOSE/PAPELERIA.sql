-- MySQL Script generated by MySQL Workbench
-- Mon Feb 10 20:40:02 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USUARIOS` (
  `ID_USUARIO` INT NOT NULL,
  `NOMBRE` VARCHAR(30) NOT NULL,
  `APELLIDOS` VARCHAR(32) NOT NULL,
  `CORREO` VARCHAR(50) NOT NULL,
  `CONTRASEÑA` INT(10) NOT NULL,
  `ID_VENTA` INT NOT NULL,
  PRIMARY KEY (`ID_USUARIO`, `ID_VENTA`));


-- -----------------------------------------------------
-- Table `mydb`.`VENTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VENTA` (
  `ID_VENTA` INT NOT NULL,
  `FECHA` DATE NULL,
  `TOTAL_PAGO` DOUBLE NULL,
  `ID_PRODUCTO` INT NOT NULL,
  PRIMARY KEY (`ID_VENTA`, `ID_PRODUCTO`),
  CONSTRAINT `VENTA`
    FOREIGN KEY (`ID_VENTA`)
    REFERENCES `mydb`.`USUARIOS` (`ID_VENTA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PRODUCTOS` (
  `ID_PRODUCTO` INT NOT NULL,
  `NOMBRE` VARCHAR(30) NULL,
  `CANTIDAD` INT(5) NULL,
  `PRECIO` DOUBLE NULL,
  `CATEGORIA` VARCHAR(45) NULL,
  `DESCRIPCION` VARCHAR(80) NULL,
  PRIMARY KEY (`ID_PRODUCTO`),
  CONSTRAINT `ID_PRODUCTO`
    FOREIGN KEY (`ID_PRODUCTO`)
    REFERENCES `mydb`.`VENTA` (`ID_PRODUCTO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`REPORTES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REPORTES` (
  `ID_REPORTE` INT NOT NULL,
  `DESCRICION` VARCHAR(255) NULL,
  `FECHA` DATETIME NULL,
  `GRAFICAS` VARCHAR(45) NULL,
  `ID_VENTA` INT NOT NULL,
  PRIMARY KEY (`ID_REPORTE`, `ID_VENTA`),
  INDEX `ID_VENTA_idx` (`ID_VENTA` ASC) VISIBLE,
  CONSTRAINT `ID_VENTA`
    FOREIGN KEY (`ID_VENTA`)
    REFERENCES `mydb`.`VENTA` (`ID_VENTA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`TICKETS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TICKETS` (
  `ID_TICKET` INT NOT NULL,
  `DETALLE` TEXT(2000) NULL,
  `FECHA` DATETIME NULL,
  `ID_VENTA` INT NOT NULL,
  PRIMARY KEY (`ID_TICKET`, `ID_VENTA`),
  INDEX `ID_VENTA_idx` (`ID_VENTA` ASC) VISIBLE,
  CONSTRAINT `ID_VENTA`
    FOREIGN KEY (`ID_VENTA`)
    REFERENCES `mydb`.`VENTA` (`ID_VENTA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`FORMA_PAGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FORMA_PAGO` (
  `ID_PAGO` INT NOT NULL,
  `ID_VENTA` INT NOT NULL,
  `METODO` VARCHAR(45) NULL,
  `MONTO` DOUBLE NULL,
  `AUTORIZACION` VARCHAR(45) NULL,
  `FECHA` DATETIME NULL,
  PRIMARY KEY (`ID_PAGO`, `ID_VENTA`),
  INDEX `ID_VENTA_idx` (`ID_VENTA` ASC) VISIBLE,
  CONSTRAINT `ID_VENTA`
    FOREIGN KEY (`ID_VENTA`)
    REFERENCES `mydb`.`VENTA` (`ID_VENTA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
