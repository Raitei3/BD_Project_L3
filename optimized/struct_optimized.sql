DROP DATABASE IF EXISTS `Maire_Optimized`;
CREATE DATABASE `Maire_Optimized`;

USE `Maire_Optimized`

CREATE TABLE `dept`(
  `id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `departement`varchar(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE `prfs`(
  `code_professionnel` TINYINT(3) UNSIGNED NOT NULL PRIMARY KEY,
  `profession`varchar(80) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE `comm`(
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `commune` varchar(60) NOT NULL,
  `id_departement` TINYINT(3) UNSIGNED NOT NULL,
  `population` MEDIUMINT(7) UNSIGNED NOT NULL,
  CONSTRAINT `cle_dept` FOREIGN KEY (`id_departement`) REFERENCES `dept`(`id`)
)ENGINE=InnoDB;

CREATE TABLE `elue`(
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nom` TINYTEXT NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `civilite` char(1) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `code_professionnel` TINYINT(3) UNSIGNED NOT NULL,
  CONSTRAINT `cle_prfs` FOREIGN KEY (`code_professionnel`) REFERENCES `prfs`(`code_professionnel`)
)ENGINE=InnoDB;

CREATE TABLE `localite`(
  `code_insee` varchar(7) NOT NULL PRIMARY KEY,
  `id_commune` SMALLINT(6) UNSIGNED NOT NULL,
  `id_maire`  SMALLINT(6) UNSIGNED NOT NULL,
  CONSTRAINT `cle_commune` FOREIGN KEY (`id_commune`) REFERENCES `comm`(`id`),
  CONSTRAINT `cle_maire` FOREIGN KEY (`id_maire`) REFERENCES `elue`(`id`)
)ENGINE=InnoDB;
