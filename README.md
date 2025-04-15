#  Guide de Configuration de l'Environnement de Développement

Ce fichier explique comment préparer votre environnement pour exécuter ce projet Flask + MySQL.

---

##  1. Installer les Dépendances

Avant de commencer, assurez-vous d'avoir **Python** et **MySQL** installés sur votre machine.

###  Installation des Packages Python

1. Assurez-vous d'utiliser **Python 3.8+**
2. Installez les dépendances requises avec :
   ```sh
   pip install -r requirements.txt
   ```

###  Installation de MySQL

- **Windows** : Installez MySQL via [MySQL Installer](https://dev.mysql.com/downloads/installer/)
- **macOS** :
  ```sh
  brew install mysql
  ```
- **Linux** :
  ```sh
  sudo apt install mysql-server
  ```

Assurez-vous que MySQL est bien lancé avec :

```sh
mysql -u root -p
```

---

##  2. Configurer le Fichier `.env`

Le projet utilise un fichier `.env` pour stocker les variables sensibles. Créez un fichier `.env` à la racine du projet et ajoutez :

```ini
FLASK_APP=run.py
FLASK_ENV=development
DB_USER=root
DB_PASSWORD=your_password
DB_HOST=localhost
DB_NAME=your_database
SECRET_KEY=my_very_secret_key_123
```

Remplacez `your_password` et `your_database` par vos informations réelles.

---

##  3. Créer la Base de Données

1. Ouvrez MySQL :
   ```sh
   mysql -u root -p
   ```
2. Créez la base de données :
   ```sql
   CREATE DATABASE your_database;
   ```
   (Remplacez `your_database` par le nom défini dans votre `.env`)

---

##  4. Appliquer les Migrations SQL

Une fois la base de données créée, appliquez les migrations existantes :

```sh
./database/apply_migrations.sh   # (Git Bash/Linux/macOS)
```

ou, si vous utilisez Windows PowerShell :

```powershell
./database/apply_migrations.ps1
```

Cela exécutera tous les fichiers `.sql` du dossier `database/` pour initialiser la base de données.

---

##  5. Lancer l'Application Flask

Après avoir configuré votre base de données, lancez l’application :

```sh
python run.py
```

Puis ouvrez [**http://127.0.0.1:5000/**](http://127.0.0.1:5000/) dans votre navigateur.

---

##  Récapitulatif

| Étape                         | Commande                                           |
| ----------------------------- | -------------------------------------------------- |
| **Installer les dépendances** | `pip install -r requirements.txt`                  |
| **Configurer **``             | Ajouter `DATABASE_USER`, `DATABASE_PASSWORD`, etc. |
| **Créer la base de données**  | `CREATE DATABASE your_database;`                   |
| **Appliquer les migrations**  | `./apply_migrations.sh`                            |
| **Lancer Flask**              | `python run.py`                                    |

Après ces étapes, votre environnement sera prêt à fonctionner correctement

