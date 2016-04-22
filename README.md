# BD_Project_L3

data_maire.csv est la base de donné en csv récupéré

dans le dossier flat se touve 4 scripts 2 pour chez soi sur son pc et 2 pour
les pc du cremi (a cause des limites à une seul base de donné)

pour généré la table plate:

ouvrir le fichier script_flat_fac.py et remplacer mon identifiant
par le tiens ainsi que le mot de passe a cette ligne :
db = MySQLdb.connect(host="dbserver", user="antborde", passwd="poneysql", db="antborde")



mysql -h dbserver -p
\. struct_flat_fac.sql
quitter mysql
python script_flat_fac.py

et voila tout est prét et tout est dans phpmyadmin
