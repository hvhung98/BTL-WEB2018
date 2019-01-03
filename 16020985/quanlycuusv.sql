-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quanlycuusv
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema quanlycuusv
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quanlycuusv` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `quanlycuusv` ;

-- -----------------------------------------------------
-- Table `quanlycuusv`.`diachi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`diachi` (
  `iddiachi` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tendiachi` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`iddiachi`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`namhoc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`namhoc` (
  `idnamhoc` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nienkhoa` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `lopquanly` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `nganhhoc` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `chuongtrinhdaotao` VARCHAR(30) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idnamhoc`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`quequan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`quequan` (
  `idquequan` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tenquequan` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idquequan`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`cuusinhvien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`cuusinhvien` (
  `idcuusinhvien` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hoten` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `gioitinh` VARCHAR(10) CHARACTER SET 'utf8' NOT NULL,
  `ngaysinh` DATE NOT NULL,
  `sdt` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
  `email` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `anh` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `idquequan` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `iddiachi` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `idnamhoc` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `gioithieu` VARCHAR(300) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `online` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcuusinhvien`),
  INDEX `fk_cuusinhvien_namhoc` (`idnamhoc` ASC) VISIBLE,
  INDEX `fk_cuusinhvien_quequan` (`idquequan` ASC) VISIBLE,
  INDEX `fk_cuusinhvien_diachi` (`iddiachi` ASC) VISIBLE,
  CONSTRAINT `fk_cuusinhvien_diachi`
    FOREIGN KEY (`iddiachi`)
    REFERENCES `quanlycuusv`.`diachi` (`iddiachi`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cuusinhvien_namhoc`
    FOREIGN KEY (`idnamhoc`)
    REFERENCES `quanlycuusv`.`namhoc` (`idnamhoc`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cuusinhvien_quequan`
    FOREIGN KEY (`idquequan`)
    REFERENCES `quanlycuusv`.`quequan` (`idquequan`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16021004
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`baidang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`baidang` (
  `idbaidang` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tieude` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `noidung` TEXT CHARACTER SET 'utf8' NOT NULL,
  `hinhanh` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `yeuthich` SMALLINT(5) NOT NULL DEFAULT '0',
  `idcuusinhvien` INT(10) UNSIGNED NOT NULL,
  `thoigian` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idbaidang`),
  INDEX `fk_baidang_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  CONSTRAINT `fk_baidang_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`binhluan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`binhluan` (
  `idbinhluan` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `like_cmt` SMALLINT(5) NOT NULL DEFAULT '0',
  `idbaidang` SMALLINT(5) UNSIGNED NOT NULL,
  `idcuusinhvien` INT(10) UNSIGNED NOT NULL,
  `thoigian` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idbinhluan`),
  INDEX `fk_binhluan_baidang` (`idbaidang` ASC) VISIBLE,
  INDEX `fk_binhluan_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  CONSTRAINT `fk_binhluan_baidang`
    FOREIGN KEY (`idbaidang`)
    REFERENCES `quanlycuusv`.`baidang` (`idbaidang`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_binhluan_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 60
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`khaosat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`khaosat` (
  `MaKS` INT(11) NOT NULL AUTO_INCREMENT,
  `TieuDe` VARCHAR(255) NULL DEFAULT NULL,
  `TrangThaiKS` VARCHAR(10) NULL DEFAULT NULL,
  `MaNguoiTao` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`MaKS`),
  INDEX `MaNguoiTao` (`MaNguoiTao` ASC) VISIBLE,
  CONSTRAINT `khaosat_ibfk_1`
    FOREIGN KEY (`MaNguoiTao`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`))
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`cauhoi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`cauhoi` (
  `MaCH` INT(11) NOT NULL AUTO_INCREMENT,
  `NoiDungCH` VARCHAR(255) NULL DEFAULT NULL,
  `LoaiCauHoi` VARCHAR(10) NULL DEFAULT NULL,
  `MaKS` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`MaCH`),
  INDEX `MaKS` (`MaKS` ASC) VISIBLE,
  CONSTRAINT `cauhoi_ibfk_1`
    FOREIGN KEY (`MaKS`)
    REFERENCES `quanlycuusv`.`khaosat` (`MaKS`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`coquan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`coquan` (
  `idcoquan` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tencoquan` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `loaihinh` VARCHAR(25) CHARACTER SET 'utf8' NOT NULL,
  `iddiachi` SMALLINT(5) UNSIGNED NOT NULL,
  `email_cpn` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`idcoquan`),
  INDEX `fk_coquan_diachi` (`iddiachi` ASC) VISIBLE,
  CONSTRAINT `fk_coquan_diachi`
    FOREIGN KEY (`iddiachi`)
    REFERENCES `quanlycuusv`.`diachi` (`iddiachi`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`congtac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`congtac` (
  `idcuusinhvien` INT(10) UNSIGNED NULL DEFAULT NULL,
  `idcoquan` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
  `thoigian` DATE NULL DEFAULT NULL,
  `vitri` VARCHAR(60) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `mucluong` DECIMAL(10,0) NULL DEFAULT NULL,
  INDEX `fk_congtac_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  INDEX `fk_congtac_coquan` (`idcoquan` ASC) VISIBLE,
  CONSTRAINT `fk_congtac_coquan`
    FOREIGN KEY (`idcoquan`)
    REFERENCES `quanlycuusv`.`coquan` (`idcoquan`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_congtac_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`lichsu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`lichsu` (
  `idlichsu` INT(11) NOT NULL AUTO_INCREMENT,
  `idcuusinhvien` INT(10) UNSIGNED NULL DEFAULT NULL,
  `noidung` TEXT CHARACTER SET 'utf8' NOT NULL,
  `thoigian` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idlichsu`),
  INDEX `fk_lichsu_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  CONSTRAINT `fk_lichsu_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 203
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`like_baidang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`like_baidang` (
  `idcuusinhvien` INT(10) UNSIGNED NOT NULL,
  `like_baidang1` TINYINT(4) NOT NULL DEFAULT '0',
  `like_baidang2` TINYINT(4) NOT NULL DEFAULT '0',
  `like_baidang3` TINYINT(4) NOT NULL DEFAULT '0',
  `dislike_baidang1` TINYINT(4) NOT NULL DEFAULT '0',
  `dislike_baidang2` TINYINT(4) NOT NULL DEFAULT '0',
  `dislike_baidang3` TINYINT(4) NOT NULL DEFAULT '0',
  `like_baidang7` TINYINT(4) NOT NULL DEFAULT '0',
  `dislike_baidang7` TINYINT(4) NOT NULL DEFAULT '0',
  `like_baidang8` TINYINT(4) NOT NULL DEFAULT '0',
  `dislike_baidang8` TINYINT(4) NOT NULL DEFAULT '0',
  INDEX `fk_like_baidang_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  CONSTRAINT `fk_like_baidang_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`like_cmt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`like_cmt` (
  `idcuusinhvien` INT(10) UNSIGNED NOT NULL,
  `like_cmt58` TINYINT(4) NOT NULL DEFAULT '0',
  `dislike_cmt58` TINYINT(4) NOT NULL DEFAULT '0',
  `like_cmt59` TINYINT(4) NOT NULL DEFAULT '0',
  `dislike_cmt59` TINYINT(4) NOT NULL DEFAULT '0',
  INDEX `fk_like_cmt_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  CONSTRAINT `fk_like_cmt_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`like_rep_cmt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`like_rep_cmt` (
  `idcuusinhvien` INT(10) UNSIGNED NOT NULL,
  INDEX `fk_like_rep_cmt_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  CONSTRAINT `fk_like_rep_cmt_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`luachon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`luachon` (
  `MaLC` INT(11) NOT NULL AUTO_INCREMENT,
  `NoiDungLC` VARCHAR(255) NULL DEFAULT NULL,
  `MaCH` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`MaLC`),
  INDEX `MaCH` (`MaCH` ASC) VISIBLE,
  CONSTRAINT `luachon_ibfk_1`
    FOREIGN KEY (`MaCH`)
    REFERENCES `quanlycuusv`.`cauhoi` (`MaCH`))
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`thongbao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`thongbao` (
  `idthongbao` INT(10) NOT NULL AUTO_INCREMENT,
  `idcuusinhvien` INT(10) UNSIGNED NOT NULL,
  `idbaidang` SMALLINT(5) UNSIGNED NOT NULL,
  `noidung` VARCHAR(200) CHARACTER SET 'utf8' NOT NULL,
  `thoigian` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idthongbao`),
  INDEX `fk_thongbao_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  INDEX `fk_thongbao_baidang` (`idbaidang` ASC) VISIBLE,
  CONSTRAINT `fk_thongbao_baidang`
    FOREIGN KEY (`idbaidang`)
    REFERENCES `quanlycuusv`.`baidang` (`idbaidang`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_thongbao_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 132
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`thuchienkhaosat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`thuchienkhaosat` (
  `MaTH` INT(11) NOT NULL AUTO_INCREMENT,
  `MaKS` INT(11) NULL DEFAULT NULL,
  `MaSV` INT(10) UNSIGNED NULL DEFAULT NULL,
  `ThoiGianTH` TIMESTAMP NULL DEFAULT NULL,
  `TrangThaiTH` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`MaTH`),
  INDEX `MaKS` (`MaKS` ASC) VISIBLE,
  INDEX `MaSV` (`MaSV` ASC) VISIBLE,
  CONSTRAINT `thuchienkhaosat_ibfk_1`
    FOREIGN KEY (`MaKS`)
    REFERENCES `quanlycuusv`.`khaosat` (`MaKS`),
  CONSTRAINT `thuchienkhaosat_ibfk_2`
    FOREIGN KEY (`MaSV`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`tinnhan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`tinnhan` (
  `idtinnhan` INT(11) NOT NULL AUTO_INCREMENT,
  `id_user1` INT(10) UNSIGNED NOT NULL,
  `noidung` TEXT CHARACTER SET 'utf32' NOT NULL,
  `id_user2` INT(10) UNSIGNED NOT NULL,
  `thoigian` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtinnhan`),
  INDEX `fk_tinnhan_cuusinhvien` (`id_user1` ASC) VISIBLE,
  CONSTRAINT `fk_tinnhan_cuusinhvien`
    FOREIGN KEY (`id_user1`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 91
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`traloi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`traloi` (
  `idtraloi` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idbinhluan` SMALLINT(5) UNSIGNED NOT NULL,
  `rep_cmt` VARCHAR(200) CHARACTER SET 'utf8' NOT NULL,
  `like_rep_cmt` SMALLINT(5) NOT NULL DEFAULT '0',
  `idcuusinhvien` INT(10) UNSIGNED NOT NULL,
  `thoigian` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtraloi`),
  INDEX `fk_traloi_binhluan` (`idbinhluan` ASC) VISIBLE,
  INDEX `fk_traloi_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  CONSTRAINT `fk_traloi_binhluan`
    FOREIGN KEY (`idbinhluan`)
    REFERENCES `quanlycuusv`.`binhluan` (`idbinhluan`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_traloi_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 87
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`traloicauhoi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`traloicauhoi` (
  `MaTH` INT(11) NULL DEFAULT NULL,
  `MaLC` INT(11) NULL DEFAULT NULL,
  INDEX `MaTH` (`MaTH` ASC) VISIBLE,
  INDEX `MaLC` (`MaLC` ASC) VISIBLE,
  CONSTRAINT `traloicauhoi_ibfk_1`
    FOREIGN KEY (`MaTH`)
    REFERENCES `quanlycuusv`.`thuchienkhaosat` (`MaTH`),
  CONSTRAINT `traloicauhoi_ibfk_2`
    FOREIGN KEY (`MaLC`)
    REFERENCES `quanlycuusv`.`luachon` (`MaLC`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `quanlycuusv`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quanlycuusv`.`user` (
  `iduser` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `password_user` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `idcuusinhvien` INT(10) UNSIGNED NULL DEFAULT NULL,
  `role_user` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL DEFAULT 'normal',
  `ngaytao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dangnhapgannhat` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iduser`),
  INDEX `fk_user_cuusinhvien` (`idcuusinhvien` ASC) VISIBLE,
  CONSTRAINT `fk_user_cuusinhvien`
    FOREIGN KEY (`idcuusinhvien`)
    REFERENCES `quanlycuusv`.`cuusinhvien` (`idcuusinhvien`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
