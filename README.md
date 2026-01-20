# Plateforme web d’apprentissage de cours gratuits

Projet initialement développé en équipe dans le cadre d’un cours universitaire.
Cette version est publiée à des fins de portfolio.

## Objectif
Développer une plateforme web permettant de proposer des cours gratuits
avec navigation par catégories et pages de leçons.

## Fonctionnalités
- Catalogue de cours
- Pages de leçons
- Navigation par catégories
- Interface responsive
- Structure front-end modulaire
- Authentification utilisateurs
- Sauvegarde de progression
- Base de données

## Ma contribution
- Développement intégrale de la Base de Donnée
- Developpement partielle requetes
- Intégration UI
- Gestion de la progression de l'apprentissage
  
## Stack
HTML, CSS, JavaScript

##  Tester le projet en local 
> Pour tester la version complète sur votre machine :

### Prérequis
- Python 3.8+  
- MySQL  
- pip  

### Installation

>```bash
> git clone https://github.com/otdjd235/plateforme-apprentissage-web.git
> cd plateforme-apprentissage-web
> pip install -r requirements.txt

### Configuration minimale

FLASK_APP=run.py
FLASK_ENV=development
DB_USER=root
DB_PASSWORD=your_password
DB_HOST=localhost
DB_NAME=portfolio_db
SECRET_KEY=dev_secret_key

### Créer la base de données

Ouvrir MySQL:  mysql -u root -p
Créeer la BD: CREATE DATABASE portfolio_db;

###Appliquer les migrations SQL

./database/apply_migrations.sh   # macOS / Linux / Git Bash
./database/apply_migrations.ps1  # Windows PowerShell

## Lancer l’application Flask
python run.py

Puis ouvrir dans un navigateur :
http://127.0.0.1:5000/

## 📸 Captures d’écran
![Accueil](Capture%20d%E2%80%99%C3%A9cran%202026-01-20%20073801.png)
![Cours](Capture%20d%E2%80%99%C3%A9cran%202026-01-20%20073917.png)
![Chapitres et exos](Capture%20d%E2%80%99%C3%A9cran%202026-01-20%20074037.png)

---
