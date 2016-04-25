/*Récupérer la liste des maires par ordre alphabétique des noms, prénoms*/

SELECT nom, prenom, civilite, date_de_naissance, code_professionnel FROM Maire
 ORDER BY nom,prenom ASC;

 /*0.0374 sec


/*Récupérer la liste des maires par ordre alphabétique des communes, départements: */
 SELECT nom, prenom, civilite, date_de_naissance, code_professionnel,commune,departement
 FROM Maire
 ORDER BY commune,departement ASC;

 /* 0.0230 sec */


/*Savoir le nombre de population de la commune d’une mairie (ex la mairie qui se localise à code_insee= 97502)*/
 SELECT population FROM Maire
 WHERE  code_insee=97502;

/* 0.0109 sec */

/*Lister tous les mairies par ordre décroissant du nombre de population de la commune */
SELECT code_insee,commune,departement,population
 FROM Maire
ORDER BY population DESC;

/*0.0180 sec)*/

/*les professions de tous les maires du département de la gironde*/
SELECT nom, prenom, civilite, date_de_naissance, code_professionnel,commune,departement
FROM Maire
WHERE departement = "GIRONDE";

/*0.0069 sec

/*Lister les professions des maires par ordre décroissant du nombre de l’occurrence des professions */

SELECT code_professionnel,profession, count(code_professionnel) AS nb_prof FROM Maire
GROUP BY code_professionnel
ORDER BY nb_prof DESC;

/*0.0161 sec*/

 /*lister les maires qui n’ont aucune profession déclarée */

 SELECT nom,prenom from Maire WHERE code_professionnel = 57;

/*0.0011 sec

 /*Savoir le nombre de commune qui ont le même nom et qui se situent dans des départements différents */
 SELECT commune
 FROM Maire
 GROUP BY commune
 HAVING count( commune ) >1;

 /*0.0364 sec

/* listé les departement de france*/

SELECT DISTINCT departement from Maire;


/*.0084 sec*/

update Maire set departement = LOWER(departement);

/*0.1889 sec*/
