DROP DATABASE IF EXISTS `Maire_Optimized`;
CREATE DATABASE `Maire_Optimized`;

USE `Maire_Optimized`

CREATE TABLE `dept`(
  `id` SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `departement`varchar(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE `prfs`(
  `code_professionnel` SMALLINT NOT NULL PRIMARY KEY,
  `profession`varchar(120) NOT NULL
)ENGINE=InnoDB;


CREATE TABLE `localite`(
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `commune` varchar(80) NOT NULL,
  `code_insee` MEDIUMINT(6) UNSIGNED NOT NULL,
  `population` MEDIUMINT(7) UNSIGNED NOT NULL,
  `id_departement` SMALLINT NOT NULL,
  CONSTRAINT `cle_dept` FOREIGN KEY (`id_departement`) REFERENCES `dept`(`id`)
)ENGINE=InnoDB;

CREATE TABLE `elue`(
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `civilite` char(1) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `code_professionnel` SMALLINT NOT NULL,
  `id_localite` int NOT NULL,
  CONSTRAINT `cle_prfs` FOREIGN KEY (`code_professionnel`) REFERENCES `prfs`(`code_professionnel`),
  CONSTRAINT `cle_localite` FOREIGN KEY (`id_localite`) REFERENCES `localite`(`id`),
  PRIMARY KEY (`nom`,`prenom`,`date_de_naissance`)
)ENGINE=InnoDB;
