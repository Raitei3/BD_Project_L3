#!/usr/bin/env python
# -*- coding: utf-8 -*-

import csv
import MySQLdb



db = MySQLdb.connect(host="localhost", user="root", passwd="shadow", db="Maire_Optimized")

db_flat = MySQLdb.connect(host="localhost", user="root", passwd="shadow", db="Maire_flat")

cursor = db.cursor()
cursor_flat = db_flat.cursor()

maire_data     = csv.reader(open("../data_maire.csv"))

maire_data.next()

#TABLE dept


print("import dept")

query_select_dept = "SELECT DISTINCT `departement` FROM `Maire`"
cursor_flat.execute(query_select_dept)
dept = cursor_flat.fetchall()
query_dept = "INSERT INTO `dept` (`departement`) VALUES (%s)"

for data in dept:
    cursor.execute(query_dept, [data[0]])

#TABLE prfs

print("import prfs")

query_select_cp = "SELECT DISTINCT `code_professionnel` , `profession` FROM `Maire`"
cursor_flat.execute(query_select_cp)
cp = cursor_flat.fetchall()
query_cp = "INSERT INTO `prfs` (`code_professionnel` , `profession`) VALUES (%s, %s)"

for data in cp:
    cursor.execute(query_cp, (data[0],data[1]))

#TABLE localité

print("import localite")

query_select_local = "SELECT DISTINCT `commune`, `code_insee`, `population`,`departement` FROM `Maire`"
cursor_flat.execute(query_select_local)
local = cursor_flat.fetchall()
query_local = "INSERT INTO `localite` (`commune`, `code_insee`, `population`,`id_departement`) VALUES (%s,%s,%s, (SELECT `id` FROM `dept` WHERE `departement` = %s))"

for data in local:
    cursor.execute(query_local, (data[0],data[1],data[2],data[3]))

#TABLE elue
db.commit()

print("import elue")

query_select_elue = "SELECT DISTINCT `nom`, `prenom`, `civilite`,`date_de_naissance`, `code_professionnel`, `code_insee`,`commune` FROM `Maire`"
cursor_flat.execute(query_select_elue)
elue = cursor_flat.fetchall()
query_elue = "INSERT INTO `elue` (`nom`, `prenom`, `civilite`,`date_de_naissance`, `code_professionnel`, `id_localite`) VALUES (%s,%s,%s,%s,%s, (SELECT `id` FROM `localite` WHERE  `code_insee` = %s AND `commune` = %s))"

for data in elue:
    cursor.execute(query_elue, (data[0],data[1],data[2],data[3],data[4],data[5],data[6]))



db.commit()

print("Importation terminé")
