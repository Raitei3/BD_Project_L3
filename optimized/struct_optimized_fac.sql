

USE `antborde`

DROP TABLE IF EXISTS `dept`
CREATE TABLE `dept`(
  `id` SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `departement`varchar(50) NOT NULL
)ENGINE=InnoDB;

DROP TABLE IF EXISTS `prfs`
CREATE TABLE `prfs`(
  `code_professionnel` SMALLINT NOT NULL PRIMARY KEY,
  `profession`varchar(120) NOT NULL
)ENGINE=InnoDB;

DROP TABLE IF EXISTS `comm`
CREATE TABLE `comm`(
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `commune` varchar(80) NOT NULL,
  `id_departement` SMALLINT NOT NULL,
  `population` MEDIUMINT(7) UNSIGNED NOT NULL,
  CONSTRAINT `cle_dept` FOREIGN KEY (`id_departement`) REFERENCES `dept`(`id`)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS `elus`
CREATE TABLE `elue`(
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `civilite` char(1) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `code_professionnel` SMALLINT NOT NULL,
  CONSTRAINT `cle_prfs` FOREIGN KEY (`code_professionnel`) REFERENCES `prfs`(`code_professionnel`)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS `localite`
CREATE TABLE `localite`(
  `code_insee` varchar(20) NOT NULL PRIMARY KEY,
  `id_commune` int NOT NULL,
  `id_maire`  int NOT NULL,
  CONSTRAINT `cle_commune` FOREIGN KEY (`id_commune`) REFERENCES `comm`(`id`),
  CONSTRAINT `cle_maire` FOREIGN KEY (`id_maire`) REFERENCES `elue`(`id`)
)ENGINE=InnoDB;
