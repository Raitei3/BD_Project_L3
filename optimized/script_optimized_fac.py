#!/usr/bin/env python
# -*- coding: utf-8 -*-

import csv
import MySQLdb



db = MySQLdb.connect(host="dbserver", user="antborde", passwd="poneysql", db="antborde")

db_flat = MySQLdb.connect(host="dbserver", user="antborde", passwd="poneysql", db="antborde")

cursor = db.cursor()
cursor_flat = db_flat.cursor()


#TABLE dept


print("import dept")

query_select_dept = "SELECT DISTINCT `departement` FROM `Maire_flat`"
cursor_flat.execute(query_select_dept)
dept = cursor_flat.fetchall()
query_dept = "INSERT INTO `dept` (`departement`) VALUES (%s)"

for data in dept:
    cursor.execute(query_dept, [data[0]])

#TABLE prfs

print("import prfs")

query_select_cp = "SELECT DISTINCT `code_professionnel` , `profession` FROM `Maire_flat`"
cursor_flat.execute(query_select_cp)
cp = cursor_flat.fetchall()
query_cp = "INSERT INTO `prfs` (`code_professionnel` , `profession`) VALUES (%s, %s)"

for data in cp:
    cursor.execute(query_cp, (data[0],data[1]))


#TABLE comm

print("import commune")

query_select_comm = "SELECT DISTINCT `commune`, `departement`, `population` FROM `Maire_flat`"
cursor_flat.execute(query_select_comm)
comm = cursor_flat.fetchall()
query_comm = "INSERT INTO `comm` (`commune`, `id_departement`, `population`) VALUES (%s, (SELECT `id` FROM `dept` WHERE `departement` = %s),%s)"

for data in comm:
    cursor.execute(query_comm, (data[0],data[1],data[2]))


#TABLE elue

print("import elue")

query_select_elue = "SELECT DISTINCT `nom`, `prenom`, `civilite`,`date_de_naissance`, `code_professionnel` FROM `Maire_flat`"
cursor_flat.execute(query_select_elue)
elue = cursor_flat.fetchall()
query_elue = "INSERT INTO `elue` (`nom`, `prenom`, `civilite`,`date_de_naissance`, `code_professionnel`) VALUES (%s,%s,%s,%s,%s)"

for data in elue:
    cursor.execute(query_elue, (data[0],data[1],data[2],data[3],data[4]))



#TABLE localité

print("import localite")

query_select_local = "SELECT DISTINCT `code_insee`, `commune`, `departement`,`nom`,`prenom`,`date_de_naissance` FROM `Maire_flat`"
cursor_flat.execute(query_select_local)
local = cursor_flat.fetchall()
query_local = "INSERT INTO `localite` (`code_insee`, `id_commune`, `id_maire`) VALUES (%s,(SELECT `id` FROM `comm` WHERE `commune` = %s AND `id_departement` = (SELECT `id` FROM `dept` WHERE `departement` = %s)),(SELECT `id` FROM `elue` WHERE `nom` = %s AND `prenom` = %s AND `date_de_naissance` = %s))"

for data in local:
    cursor.execute(query_local, (data[0],data[1],data[2],data[3],data[4],data[5]))

db.commit()

print("Importation terminé")
