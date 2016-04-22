

DROP DATABASE IF EXISTS `Maire_flat`;
CREATE DATABASE `Maire_flat`;

USE `Maire_flat`;

CREATE TABLE `Maire`(
  `code_insee` MEDIUMINT(6) UNSIGNED NOT NULL,
  `departement`varchar(50) NOT NULL,
  `commune` varchar(50) NOT NULL,
  `population` MEDIUMINT(7) UNSIGNED NOT NULL,
  `nom` TINYTEXT NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `civilite` char(1) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `code_professionnel` SMALLINT NOT NULL,
  `profession` varchar(120)
)ENGINE=InnoDB;
