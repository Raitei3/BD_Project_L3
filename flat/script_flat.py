#!/usr/bin/env python
# -*- coding: utf-8 -*-


import csv
import MySQLdb

# Connexion à la BD

db = MySQLdb.connect(host="localhost", user="root", passwd="shadow", db="Maire_flat")

cursor = db.cursor()

# Ouverture des fichiers csv et création d'un reader
maire_data     = csv.reader(open("../data_maire.csv"))

# On passe la première ligne qui contient le nom des attributs
maire_data.next()

# On créé une requête et on remplit la BD

query = "INSERT INTO `Maire` (`code_insee`, `departement`, `commune`, `population`, `nom`, `prenom`, `civilite`, `date_de_naissance`, `code_professionnel`, `profession`) \
         VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

for data in maire_data:
    data = (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9])
    cursor.execute(query, data)

db.commit()

print("Importation terminé")
