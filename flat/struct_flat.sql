

DROP DATABASE IF EXISTS `Maire_flat`;
CREATE DATABASE `Maire_flat`;

USE `Maire_flat`;
DROP TABLE IF EXISTS `Maire`;
CREATE TABLE `Maire`(
  `code_insee` varchar(7) NOT NULL,
  `departement` varchar(50) NOT NULL,
  `commune` varchar(60) NOT NULL,
  `population` MEDIUMINT(7) UNSIGNED NOT NULL,
  `nom` TINYTEXT NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `civilite` char(1) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `code_professionnel` TINYINT(3) UNSIGNED NOT NULL,
  `profession` varchar(80) NOT NULL,
  PRIMARY KEY(`code_insee`)
)ENGINE=InnoDB;
