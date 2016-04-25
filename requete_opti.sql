/*Récupérer la liste des maires par ordre alphabétique des noms, prénoms*/
SELECT nom, prenom, civilite, date_de_naissance, code_professionnel FROM elue
 ORDER BY nom,prenom ASC;

/* 0.0375 sec

/*Récupérer la liste des maires par ordre alphabétique des communes, départements: */
 SELECT nom, prenom, civilite, date_de_naissance, code_professionnel,commune,departement
 FROM elue E,localite L,comm C, dept D
 WHERE E.id=L.id_maire
AND L.id_commune=C.id
AND C.id_departement=D.id
 ORDER BY commune,departement ASC;

/* 0.1423 sec .

/*Savoir le nombre de population de la commune d’une mairie (ex la mairie qui se localise à code_insee= 97502)*/
 SELECT population FROM comm C , localite L
 WHERE C.id=L.id_commune AND L.code_insee=97502;

/* 0.0082 sec

/*Lister tous les mairies par ordre décroissant du nombre de population de la commune */
 SELECT code_insee,commune,departement,population
  FROM comm C,dept D,localite L
 WHERE C.id=L.id_commune
 AND C.id_departement=D.id
 ORDER BY population DESC;

/* 0.0647

/*les professions de tous les maires du département de la gironde*/

 SELECT nom, prenom, civilite, date_de_naissance, code_professionnel,commune,departement
 FROM elue E,localite L,comm C, dept D
 WHERE E.id=L.id_maire
AND L.id_commune=C.id
AND C.id_departement=D.id
AND D.departement="GIRONDE"
 ORDER BY commune,departement ASC;

/*0.0029 sec*/


/*Lister les professions des maires par ordre décroissant du nombre de l’occurrence des professions */

 SELECT E.code_professionnel,profession, count(E.code_professionnel) AS nb_prof FROM elue E, prfs P
 WHERE P.code_professionnel=E.code_professionnel
 GROUP BY code_professionnel
 ORDER BY nb_prof DESC;

/*0.0135 sec

 /*lister les maires qui n’ont aucune profession déclarée */

 SELECT E.nom,E.prenom FROM elue E
 WHERE E. code_professionnel=57;

/* 0.0004 sec */


/*Savoir le nombre de commune qui ont le même nom et qui se situent dans des départements différents */

SELECT commune FROM comm
GROUP by commune
HAVING count(commune)>1;

/*0.0379 sec



/* listé les departement de france*/

SELECT DISTINCT departement from dept;

/*0.0003 sec*/


update dept set departement = LOWER(departement);


/*0.0098 sec*/
