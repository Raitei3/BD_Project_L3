#!/usr/bin/env python
# -*- coding: utf-8 -*-


import csv
import MySQLdb

# Connexion à la BD

db = MySQLdb.connect(host="localhost", user="root", passwd="shadow", db="Maire_flat")

cursor = db.cursor()

# Ouverture des fichiers csv et création d'un reader
maire_data     = csv.reader(open("../data_maire.csv")).decode('iso-8601')

# On passe la première ligne qui contient le nom des attributs
maire_data.next()

# On créé une requête et on remplit la BD

query = "INSERT INTO `Maire` (`code_insee`, `departement`, `commune`, `population`, `nom`, `prenom`, `civilite`, `date_de_naissance`, `code_professionnel`, `profession`) \
         VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"

for row in maire_data:
    data = (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9])

    cursor.execute(query, data)

db.commit()

print("Importation terminé")
