#  Guide de Gestion des Migrations SQL

Ce fichier explique comment ajouter des changements à la base de données, comment les pousser sur GitHub et comment appliquer les changements des coéquipiers sur votre base de données locale.

---

##  1. Ajouter un Nouveau Changement dans la Base de Données

###  Création d'un fichier SQL pour une migration
1. Accédez au dossier `database/`.
2. Créez un nouveau fichier SQL avec un numéro incrémental:
   ```sh
   touch database/003_add_new_table.sql
   ```
3. Ouvrez le fichier et ajoutez vos modifications SQL, par exemple:
   ```sql
   CREATE TABLE orders (
       id INT AUTO_INCREMENT PRIMARY KEY,
       user_id INT NOT NULL,
       total_price DECIMAL(10,2) NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       FOREIGN KEY (user_id) REFERENCES users(id)
   );
   ```

---

##  2. Pousser vos Changements sur GitHub

1. Ajoutez le fichier SQL au suivi Git :
   ```sh
   git add database/003_add_new_table.sql
   ```
2. Commitez le changement avec un message descriptif :
   ```sh
   git commit -m "Ajout de la table orders"
   ```
3. Poussez les changements vers le dépôt GitHub :
   ```sh
   git push origin main
   ```

---

##  3. Appliquer les Changements d'un Coéquipier

1. Récupérez les dernières modifications :
   ```sh
   git pull origin main
   ```
2. Exécutez le script pour appliquer les migrations SQL :
   ```sh
   ./apply_migrations.sh   # (Git Bash/Linux/macOS)
   ```
   ou, sur Windows PowerShell :
   ```powershell
   ./apply_migrations.ps1
   ```
3. Vérifiez que les modifications sont bien appliquées en consultant la base de données :
   ```sql
   SHOW TABLES;
   ```

---

##  Récapitulatif

| Action | Commandes |
|--------|----------|
| **Ajouter une migration SQL** | `touch database/00X_new_change.sql` |
| **Rédiger le SQL** | Ajouter des requêtes `CREATE`, `ALTER`, etc. |
| **Pousser sur GitHub** | `git add`, `git commit`, `git push` |
| **Récupérer les mises à jour** | `git pull` |
| **Appliquer les migrations** | `./apply_migrations.sh` |

Avec cette méthode, chaque membre de l'équipe garde une base de données locale synchronisée avec le projet ! 🚀

