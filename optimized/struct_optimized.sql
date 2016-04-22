DROP DATABASE IF EXISTS `Maire_Optimized`;
CREATE DATABASE `Maire_Optimized`;

CREATE TABLE `dept`(
  `id` SMALLINT NOT NULL PRIMARY KEY,
  `departement`varchar(50) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE `prfs`(
  `code_professionnel` SMALLINT NOT NULL PRIMARY KEY,
  `profession`varchar(120) NOT NULL
)ENGINE=InnoDB;


CREATE TABLE `elue`(
  `id` int NOT NULL PRIMARY KEY,
  `nom` TINYTEXT NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `civilite` char(1) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `code_professionnel` SMALLINT NOT NULL,
  `id_localité` int NOT NULL
  CONSTRAINT `cle_localité` FOREIGN KEY `id_localité` REFERENCES `localité`(`id`)
)ENGINE=InnoDB;

CREATE TABLE `localité`(
  `id` int NOT NULL PRIMARY KEY,
  `commune` varchar(50) NOT NULL,
  `code_insee` MEDIUMINT(6) UNSIGNED NOT NULL,
  `population` MEDIUMINT(7) UNSIGNED NOT NULL,
  `id_departement` SMALLINT NOT NULL
  CONSTRAINT `cle_dept` FOREIGN KEY `id_departement` REFERENCES `dept`(`id`)
)ENGINE=InnoDB;
