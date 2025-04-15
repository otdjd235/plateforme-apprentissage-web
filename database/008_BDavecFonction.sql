-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_database
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrateur` (
  `id_admin` int NOT NULL,
  `dateDerniereIntervention` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nbUserGerer` int DEFAULT '0',
  PRIMARY KEY (`id_admin`),
  CONSTRAINT `administrateur_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateur`
--

LOCK TABLES `administrateur` WRITE;
/*!40000 ALTER TABLE `administrateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifications` (
  `id_certif` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_domaine` int DEFAULT NULL,
  `date_obtention` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cours` int DEFAULT NULL,
  PRIMARY KEY (`id_certif`),
  KEY `id_user` (`id_user`),
  KEY `id_domaine` (`id_domaine`),
  KEY `fk_certif_cours` (`id_cours`),
  CONSTRAINT `certifications_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `certifications_ibfk_2` FOREIGN KEY (`id_domaine`) REFERENCES `discipline` (`id_domaine`) ON DELETE CASCADE,
  CONSTRAINT `certifications_ibfk_3` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`),
  CONSTRAINT `fk_certif_cours` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapitres`
--

DROP TABLE IF EXISTS `chapitres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapitres` (
  `id_chap` int NOT NULL AUTO_INCREMENT,
  `id_cours` int DEFAULT NULL,
  `titre_chap` varchar(200) NOT NULL,
  `ordre` int DEFAULT NULL,
  PRIMARY KEY (`id_chap`),
  KEY `id_cours` (`id_cours`),
  CONSTRAINT `chapitres_ibfk_1` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapitres`
--

LOCK TABLES `chapitres` WRITE;
/*!40000 ALTER TABLE `chapitres` DISABLE KEYS */;
INSERT INTO `chapitres` VALUES (1,1,'Variables et types de données',1),(2,1,'Structures de contrôle',2),(3,1,'Fonctions',3),(4,2,'Algorithmes de tri',1),(5,2,'Listes chaînées',2),(6,2,'Piles et files',3),(7,3,'Principes de la sécurité informatique',1),(8,3,'Types de menaces',2),(9,3,'Cryptographie de base',3),(10,4,'Pare-feux et antivirus',1),(11,4,'Sécurité réseau',2),(12,4,'Gestion des accès',3),(13,5,'Modèle OSI',1),(14,5,'Adressage IP',2),(15,5,'Protocoles réseau',3),(16,6,'Introduction à Cisco',1),(17,6,'Configuration de base',2),(18,6,'Routage statique et dynamique',3),(19,7,'Bases de données relationnelles',1),(20,7,'Requêtes SQL de base',2),(21,7,'Jointures et sous-requêtes',3),(22,8,'Gestion des utilisateurs',1),(23,8,'Sauvegardes et restaurations',2),(24,8,'Optimisation des requêtes',3),(25,9,'Introduction à la POO',1),(26,9,'Classes et objets',2),(27,9,'Héritage et polymorphisme',3),(28,10,'HTML et la structure d\'une page',1),(29,10,'CSS : Mise en forme des pages',2),(30,10,'JavaScript : Dynamisme et interactions',3),(31,11,'Principales vulnérabilités',1),(32,11,'Protection contre les attaques XSS/CSRF',2),(33,11,'Gestion sécurisée des utilisateurs',3),(34,12,'Méthodologie de pentest',1),(35,12,'Outils et techniques d’attaque',2),(36,12,'Élaboration d’un rapport de test',3),(37,13,'Technologies Wi-Fi',1),(38,13,'Sécurisation des réseaux sans fil',2),(39,13,'Installation et déploiement',3),(40,14,'Concepts fondamentaux de virtualisation',1),(41,14,'Utilisation des VLAN',2),(42,14,'SDN et la virtualisation avancée',3),(43,15,'Introduction à la sécurité Cloud',1),(44,15,'Gestion des identités et des accès',2),(45,15,'Chiffrement et surveillance',3);
/*!40000 ALTER TABLE `chapitres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapitres_complete`
--

DROP TABLE IF EXISTS `chapitres_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chapitres_complete` (
  `id_user` int NOT NULL,
  `id_chap` int NOT NULL,
  `date_completion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`id_chap`),
  KEY `id_chap` (`id_chap`),
  CONSTRAINT `chapitres_complete_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `chapitres_complete_ibfk_2` FOREIGN KEY (`id_chap`) REFERENCES `chapitres` (`id_chap`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapitres_complete`
--

LOCK TABLES `chapitres_complete` WRITE;
/*!40000 ALTER TABLE `chapitres_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `chapitres_complete` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_into_cours_complete` AFTER INSERT ON `chapitres_complete` FOR EACH ROW BEGIN
    DECLARE course_id INT;
    DECLARE total_chapitres INT;
    DECLARE chapitres_termines INT;

    -- Obtenir le cours du chapitre complété
    SELECT id_cours INTO course_id
    FROM chapitres
    WHERE id_chap = NEW.id_chap;

    -- Nombre total de chapitres dans ce cours
    SELECT COUNT(*) INTO total_chapitres
    FROM chapitres
    WHERE id_cours = course_id;

    -- Nombre de chapitres complétés par cet utilisateur dans ce cours
    SELECT COUNT(*) INTO chapitres_termines
    FROM chapitres_complete cc
    JOIN chapitres c ON cc.id_chap = c.id_chap
    WHERE cc.id_user = NEW.id_user AND c.id_cours = course_id;

    -- Si l'étudiant a terminé tous les chapitres
    IF chapitres_termines = total_chapitres THEN
        -- Et que ce cours n'est pas encore marqué comme complété
        IF NOT EXISTS (
            SELECT 1 FROM cours_complete
            WHERE id_user = NEW.id_user AND id_cours = course_id
        ) THEN
            INSERT INTO cours_complete (id_user, id_cours)
            VALUES (NEW.id_user, course_id);
        END IF;

        DELETE FROM suivre
        WHERE id_user = NEW.id_user AND id_cours = course_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `choixdiscipline`
--

DROP TABLE IF EXISTS `choixdiscipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choixdiscipline` (
  `id_user` int NOT NULL,
  `id_domaine` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_domaine`),
  KEY `id_domaine` (`id_domaine`),
  CONSTRAINT `choixdiscipline_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `choixdiscipline_ibfk_2` FOREIGN KEY (`id_domaine`) REFERENCES `discipline` (`id_domaine`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choixdiscipline`
--

LOCK TABLES `choixdiscipline` WRITE;
/*!40000 ALTER TABLE `choixdiscipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `choixdiscipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cours`
--

DROP TABLE IF EXISTS `cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cours` (
  `id_cours` int NOT NULL AUTO_INCREMENT,
  `id_domaine` int DEFAULT NULL,
  `nom_cours` varchar(100) NOT NULL,
  `description_courte` text,
  `description_complete` text,
  `duree_totale` int DEFAULT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `id_domaine` (`id_domaine`),
  CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`id_domaine`) REFERENCES `discipline` (`id_domaine`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours`
--

LOCK TABLES `cours` WRITE;
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` VALUES (1,1,'Introduction à la programmation','Découvre les bases de la programmation.','Ce cours introduit les fondements de la programmation, incluant les variables, les structures conditionnelles et les fonctions. Il est conçu pour les débutants souhaitant comprendre comment les programmes informatiques sont construits.',82),(2,1,'Algorithmique et structures de données','Approfondis tes compétences en algorithmique.','Ce cours couvre les algorithmes de tri, les structures de données telles que les listes chaînées, les piles et les files. Il est idéal pour ceux qui veulent maîtriser les fondements logiques de la programmation avancée.',124),(3,2,'Cybersécurité : principes de base','Découvre les bases de la cybersécurité.','Ce cours présente les principes fondamentaux de la cybersécurité, les types de menaces auxquels les systèmes sont confrontés, et une introduction à la cryptographie pour protéger les données.',115),(4,2,'Sécurité des systèmes et réseaux','Protège tes systèmes et réseaux informatiques.','Explore les concepts liés aux pare-feux, antivirus, sécurité réseau et gestion des accès. Ce cours est destiné à ceux qui veulent mettre en place des environnements sécurisés.',90),(5,3,'Réseaux informatiques I','Comprends le fonctionnement des réseaux informatiques.','Ce cours t’introduit aux fondamentaux des réseaux informatiques : le modèle OSI, l’adressage IP, les protocoles réseau. Indispensable pour tout administrateur réseau.',176),(6,3,'Configuration des routeurs et commutateurs','Apprends à configurer routeurs et commutateurs.','Découvre comment configurer des équipements réseau Cisco : commutateurs, routeurs, routage statique et dynamique. Idéal pour une carrière en réseau ou pour préparer la certification Cisco.',83),(7,4,'SQL et conception de base de données','Apprends à concevoir et interroger une base SQL.','Ce cours enseigne la conception de bases de données relationnelles, les requêtes SQL de base, les jointures et les sous-requêtes. Parfait pour débuter avec les SGBD relationnels.',82),(8,4,'Administration des bases de données','Maîtrise l’administration d’une base de données.','Explore les tâches d\'administration telles que la gestion des utilisateurs, les sauvegardes/restaurations et l\'optimisation des requêtes. Ce cours est pour les futurs administrateurs de bases de données.',156),(9,1,'Introduction à Java','Apprends à créer des sites web modernes.','Ce cours t’apprend à structurer une page web avec HTML et à la styliser avec CSS. Il est destiné aux débutants souhaitant se lancer dans le développement web.',90),(10,1,'Dévelppement Web : HTML & CSS','Premiers pas avec JavaScript.','Ce cours initie aux bases du langage JavaScript, à la manipulation du DOM et aux événements pour rendre les pages web interactives.',100),(11,2,'Analyse des vulnérabilités','Apprends à détecter et corriger les failles de sécurité.','Ce cours présente les techniques d’analyse des vulnérabilités, les outils courants comme Nmap et Nessus, et les bonnes pratiques pour sécuriser les systèmes.',95),(12,3,'Wireshark et Analyse de Paquets','Analyse le trafic réseau avec Wireshark.','Ce cours couvre les bases de l’analyse de paquets avec Wireshark, comment inspecter les protocoles et diagnostiquer les problèmes réseau.',85),(13,3,'TCP/IP Avancé','Maîtrise les protocoles TCP/IP.','Un cours pour comprendre en profondeur les protocoles TCP, UDP, IP, ICMP, et leur rôle dans la transmission des données sur Internet.',110),(14,4,'MongoDB : bases du NoSQL','Introduction aux bases de données NoSQL.','Découvre les concepts clés de MongoDB, comment structurer des documents JSON, interroger les collections et modéliser tes données sans schéma rigide.',100),(15,2,'Sécurité dans le Cloud','Protéger les données dans un environnement cloud.','Ce cours couvre les principes fondamentaux de la sécurité dans les environnements cloud, les responsabilités partagées, les menaces communes et les bonnes pratiques de chiffrement, d\'identité et de conformité.',105);
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cours_complete`
--

DROP TABLE IF EXISTS `cours_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cours_complete` (
  `id_user` int NOT NULL,
  `id_cours` int NOT NULL,
  `date_completion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`id_cours`),
  KEY `id_cours` (`id_cours`),
  CONSTRAINT `cours_complete_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `cours_complete_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours_complete`
--

LOCK TABLES `cours_complete` WRITE;
/*!40000 ALTER TABLE `cours_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `cours_complete` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_certification_after_course` AFTER INSERT ON `cours_complete` FOR EACH ROW BEGIN
    -- Vérifie si une certification existe déjà
    IF NOT EXISTS (
        SELECT 1 FROM certifications
        WHERE id_user = NEW.id_user AND id_cours = NEW.id_cours
    ) THEN
        -- Insérer avec la bonne colonne : date_obtention (et non date_certification)
        INSERT INTO certifications (id_user, id_cours, date_obtention)
        VALUES (NEW.id_user, NEW.id_cours, CURRENT_DATE());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discipline` (
  `id_domaine` int NOT NULL AUTO_INCREMENT,
  `nom_dom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_domaine`),
  UNIQUE KEY `nom_dom` (`nom_dom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline`
--

LOCK TABLES `discipline` WRITE;
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` VALUES (4,'Base de données'),(1,'Informatique'),(3,'Réseau'),(2,'Sécurité');
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiants` (
  `id_user` int NOT NULL,
  `nbFormationsSuivies` int DEFAULT '0',
  PRIMARY KEY (`id_user`),
  CONSTRAINT `etudiants_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
INSERT INTO `etudiants` VALUES (1,1);
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercice`
--

DROP TABLE IF EXISTS `exercice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercice` (
  `id_exo` int NOT NULL AUTO_INCREMENT,
  `id_chap` int DEFAULT NULL,
  `enonce` text NOT NULL,
  `choix_1` text,
  `choix_2` text,
  `choix_3` text,
  `choix_4` text,
  `bonne_reponse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_exo`),
  KEY `id_chap` (`id_chap`),
  CONSTRAINT `exercice_ibfk_1` FOREIGN KEY (`id_chap`) REFERENCES `chapitres` (`id_chap`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercice`
--

LOCK TABLES `exercice` WRITE;
/*!40000 ALTER TABLE `exercice` DISABLE KEYS */;
INSERT INTO `exercice` VALUES (1,1,'Quel type de données est retourné par la fonction input() en Python ?','int','float','string','bool','choix_3'),(2,2,'Que fait l\'instruction if x > 5: en Python ?','Elle compare si x est supérieur ou égal à 5','Elle exécute un bloc si x est inférieur à 5','Elle vérifie si x est égal à 5','Elle exécute un bloc si x est strictement supérieur à 5','choix_4'),(3,3,'Quelle est la bonne syntaxe pour définir une fonction en Python ?','fonction maFonction():','function maFonction()','def maFonction():','create maFonction()','choix_3'),(4,4,'Quel est l’algorithme de tri le plus rapide en moyenne ?','Tri à bulles','Tri insertion','Tri rapide','Tri fusion','choix_3'),(5,5,'Quelle structure permet un accès en O(1) pour insérer en tête ?','Liste simple','Liste doublement chaînée','Pile','File','choix_2'),(6,6,'Quelle est la structure idéale pour un traitement FIFO ?','Pile','Arbre binaire','Liste chaînée','File','choix_4'),(7,7,'Quel est l\'objectif principal de la cybersécurité ?','Assurer le bon fonctionnement d\'Internet','Protéger les systèmes et les données','Empêcher les utilisateurs d\'accéder au réseau','Créer des logiciels antivirus','choix_2'),(8,8,'Qu\'est-ce qu\'un ransomware ?','Un logiciel malveillant qui crypte les fichiers et demande une rançon','Un antivirus puissant','Un type de pare-feu','Une technique de piratage réseau','choix_1'),(9,9,'Quelle méthode est la plus utilisée pour vérifier l\'identité d\'un utilisateur ?','Reconnaissance faciale','Mot de passe','Empreinte digitale','Code PIN','choix_2'),(10,10,'Quel est le rôle principal d’un pare-feu ?','Créer des sauvegardes','Contrôler le trafic réseau','Crypter les données','Analyser les logs','choix_2'),(11,11,'Quel protocole sécurise les communications réseau ?','HTTP','FTP','SSH','IP','choix_3'),(12,12,'Qu’est-ce que l’authentification à deux facteurs ?','Une méthode de backup','Un type de virus','Une technique de piratage','Une méthode de sécurité avec deux étapes','choix_4'),(13,13,'Quel équipement permet de connecter plusieurs appareils dans un réseau local ?','Un routeur','Un modem','Un switch','Un câble Ethernet','choix_3'),(14,14,'Combien d\'adresses différentes peut contenir une adresse IPv4 ?','2^16','2^32','2^64','2^8','choix_2'),(15,15,'Quel protocole est utilisé pour envoyer des pages web ?','FTP','SMTP','HTTP','DNS','choix_3'),(16,16,'Quel constructeur est célèbre pour ses équipements réseaux ?','Samsung','Microsoft','Cisco','Google','choix_3'),(17,17,'Quel composant est nécessaire pour configurer un réseau ?','Processeur','Disque dur','Routeur','Carte graphique','choix_3'),(18,18,'Le routage dynamique utilise :','Des chemins fixes','Un tableau statique','Des protocoles pour adapter le chemin','Des câbles directs','choix_3'),(19,19,'Quel est l\'élément principal dans un modèle relationnel ?','La fonction','La procédure','La table','La colonne','choix_3'),(20,20,'Quelle commande SQL permet de récupérer des données ?','UPDATE','SELECT','INSERT','DELETE','choix_2'),(21,21,'À quoi sert une clé étrangère ?','À identifier de manière unique une ligne','À relier deux tables entre elles','À trier les données','À calculer des sommes','choix_2'),(22,22,'Quelle commande SQL sert à ajouter un utilisateur ?','CREATE USER','GRANT','INSERT','ALTER','choix_1'),(23,23,'Pourquoi faire une sauvegarde d’une base de données ?','Pour supprimer les données','Pour économiser de l’espace','Pour restaurer en cas de problème','Pour changer le mot de passe','choix_3'),(24,24,'Quelle commande permet d\'analyser les performances d\'une requête ?','EXPLAIN','SHOW TABLES','INSERT','GRANT','choix_1'),(25,25,'Quel est le principal avantage de la programmation orientée objet (POO) ?','Réduction du code source','Meilleure organisation et réutilisabilité du code','Amélioration des performances','Moins de lignes de code à écrire','choix_2'),(26,26,'En POO, que représente une classe ?','Une instance d’un objet','Un type de boucle','Un modèle définissant des objets','Un élément HTML','choix_3'),(27,27,'Le polymorphisme permet :','De stocker plusieurs objets dans un tableau','D’utiliser différentes implémentations d’une même méthode','De compiler plus vite','D’éviter l’héritage','choix_2'),(28,28,'Quel élément HTML définit le contenu principal d’une page ?','<main>','<div>','<section>','<article>','choix_1'),(29,29,'Quelle propriété CSS permet de changer la couleur du texte ?','background-color','font-weight','color','text-align','choix_3'),(30,30,'Quelle méthode JavaScript est utilisée pour réagir à un clic utilisateur ?','addStyle()','click()','addEventListener()','onclickAlert()','choix_3'),(31,31,'Quelle est une vulnérabilité courante des sites web ?','Injection SQL','Erreurs de typage','Lenteur du serveur','Manque de support mobile','choix_1'),(32,32,'Comment se protéger contre les attaques CSRF ?','Utiliser HTTPS uniquement','Utiliser des tokens anti-CSRF','Compresser les pages','Optimiser le CSS','choix_2'),(33,33,'Quelle pratique est recommandée pour stocker les mots de passe ?','Stockage en clair','Encodage en base64','Hachage avec salage','Compression des mots de passe','choix_3'),(34,34,'Quelle est la première étape d’un test d’intrusion (pentest) ?','Exploitation','Rapport','Reconnaissance','Nettoyage','choix_3'),(35,35,'Quel outil est couramment utilisé pour les scans de vulnérabilités ?','Wireshark','Metasploit','Burp Suite','Nmap','choix_4'),(36,36,'Que doit contenir un rapport de pentest ?','La date de naissance de l’analyste','Des captures d’écran inutiles','Des preuves claires et des recommandations','Une copie de la base de données','choix_3'),(37,37,'Quelle technologie est souvent utilisée pour les connexions sans fil ?','Bluetooth','Wi-Fi','Zigbee','NFC','choix_2'),(38,38,'Quel est un bon moyen de sécuriser un réseau Wi-Fi ?','Désactiver le SSID','Utiliser WPA3','Changer la couleur du routeur','Ajouter un fond d’écran','choix_2'),(39,39,'Que signifie ‘déploiement’ dans le contexte réseau ?','Configurer les pare-feu','Installer et rendre opérationnel un système','Créer une base de données','Changer d’adresse IP','choix_2'),(40,40,'Quel est un avantage de la virtualisation ?','Plus de câbles nécessaires','Moins de sécurité','Optimisation des ressources physiques','Incompatibilité logicielle','choix_3'),(41,41,'À quoi servent les VLAN ?','Accélérer les disques durs','Partager un écran','Segmenter logiquement un réseau','Changer la langue système','choix_3'),(42,42,'Qu’est-ce que le SDN ?','Un protocole Wi-Fi','Une méthode de routage manuel','Un concept de virtualisation avancée','Un câble spécial','choix_3'),(43,43,'Quel est un avantage majeur de la sécurité Cloud ?','Accès limité uniquement en local','Pas de sauvegardes','Gestion centralisée de la sécurité','Incompatibilité mobile','choix_3'),(44,44,'Quel principe permet de limiter les droits d’un utilisateur à ce qui est strictement nécessaire ?','Single Sign-On','Règle du moindre privilège','Double authentification','Cloud Lock','choix_2'),(45,45,'Quel est le rôle du chiffrement dans la sécurité ?','Ralentir le système','Créer une copie de secours','Empêcher l’accès non autorisé aux données','Changer l’adresse IP','choix_3');
/*!40000 ALTER TABLE `exercice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercices_complete`
--

DROP TABLE IF EXISTS `exercices_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercices_complete` (
  `id_user` int NOT NULL,
  `id_exo` int NOT NULL,
  `date_completion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`id_exo`),
  KEY `id_exo` (`id_exo`),
  CONSTRAINT `exercices_complete_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `exercices_complete_ibfk_2` FOREIGN KEY (`id_exo`) REFERENCES `exercice` (`id_exo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercices_complete`
--

LOCK TABLES `exercices_complete` WRITE;
/*!40000 ALTER TABLE `exercices_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercices_complete` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_progression_exercices` AFTER INSERT ON `exercices_complete` FOR EACH ROW BEGIN
    DECLARE total_chapitres INT DEFAULT 0;
    DECLARE course_id INT DEFAULT 0;
    DECLARE increment_progress FLOAT DEFAULT 0;

    -- Trouver le chapitre lié à l'exercice
    DECLARE chap_id INT;

    SELECT id_chap INTO chap_id
    FROM exercice
    WHERE id_exo = NEW.id_exo;

    -- Trouver le cours associé à ce chapitre
    SELECT id_cours INTO course_id
    FROM chapitres
    WHERE id_chap = chap_id;

    -- Nombre total de chapitres du cours
    SELECT COUNT(*) INTO total_chapitres
    FROM chapitres
    WHERE id_cours = course_id;

    -- Calcul de la progression à ajouter (chaque vidéo ou exo = 1/2 chapitre = progression / (chapitres * 2))
    IF total_chapitres > 0 THEN
        SET increment_progress = (1.0 / (total_chapitres * 2)) * 100;
    ELSE
        SET increment_progress = 0;
    END IF;

    -- Mise à jour de la progression
    UPDATE suivre
    SET progression = LEAST(100, progression + increment_progress)
    WHERE id_user = NEW.id_user AND id_cours = course_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `chapitre_complete` AFTER INSERT ON `exercices_complete` FOR EACH ROW BEGIN
    DECLARE chap_id INT;

    -- Récupérer le chapitre lié à l'exercice
    SELECT id_chap INTO chap_id
    FROM exercice
    WHERE id_exo = NEW.id_exo;

    -- Vérifier si la vidéo du chapitre a déjà été complétée
    IF EXISTS (
        SELECT 1
        FROM videoscours v
        JOIN videos_complete vc ON v.id_vid = vc.id_vid
        WHERE v.id_chap = chap_id AND vc.id_user = NEW.id_user
    ) THEN
        -- Vérifier si le chapitre n'est pas déjà marqué comme complété
        IF NOT EXISTS (
            SELECT 1
            FROM chapitres_complete
            WHERE id_user = NEW.id_user AND id_chap = chap_id
        ) THEN
            -- Marquer le chapitre comme complété
            INSERT INTO chapitres_complete (id_user, id_chap)
            VALUES (NEW.id_user, chap_id);
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professeur` (
  `id_prof` int NOT NULL,
  `nbFormationsOffertes` int DEFAULT '0',
  `evaluationMoyenne` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id_prof`),
  CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur`
--

LOCK TABLES `professeur` WRITE;
/*!40000 ALTER TABLE `professeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ressources`
--

DROP TABLE IF EXISTS `ressources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ressources` (
  `id_ressource` int NOT NULL AUTO_INCREMENT,
  `id_chap` int DEFAULT NULL,
  `nom_fichier` varchar(255) NOT NULL,
  `url_fichier` text NOT NULL,
  PRIMARY KEY (`id_ressource`),
  KEY `id_chap` (`id_chap`),
  CONSTRAINT `ressources_ibfk_1` FOREIGN KEY (`id_chap`) REFERENCES `chapitres` (`id_chap`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ressources`
--

LOCK TABLES `ressources` WRITE;
/*!40000 ALTER TABLE `ressources` DISABLE KEYS */;
/*!40000 ALTER TABLE `ressources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suivre`
--

DROP TABLE IF EXISTS `suivre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suivre` (
  `id_user` int NOT NULL,
  `id_cours` int NOT NULL,
  `statut` enum('en cours','terminé') DEFAULT 'en cours',
  `progression` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id_user`,`id_cours`),
  KEY `id_cours` (`id_cours`),
  KEY `idx_suivre_user_cours` (`id_user`,`id_cours`),
  CONSTRAINT `suivre_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `suivre_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suivre`
--

LOCK TABLES `suivre` WRITE;
/*!40000 ALTER TABLE `suivre` DISABLE KEYS */;
/*!40000 ALTER TABLE `suivre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` enum('etudiant','prof','admin') NOT NULL DEFAULT 'etudiant',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ducobu','ducobu@gmail.com','12345678','2000-01-01','scrypt:32768:8:1$n65HzNN1eJ2r4UNu$1c697461afc53c6897c602e34729a1cb214f7d9da22d89cba950a76d7ea6521e166fb557923bf60054c023184fe0cba89e82e2d3139c7d626912b7befbf960b3','2025-04-03 15:35:57','etudiant');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_complete`
--

DROP TABLE IF EXISTS `videos_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_complete` (
  `id_user` int NOT NULL,
  `id_vid` int NOT NULL,
  `date_completion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`id_vid`),
  KEY `id_vid` (`id_vid`),
  CONSTRAINT `videos_complete_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `videos_complete_ibfk_2` FOREIGN KEY (`id_vid`) REFERENCES `videoscours` (`id_vid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_complete`
--

LOCK TABLES `videos_complete` WRITE;
/*!40000 ALTER TABLE `videos_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos_complete` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_progression_videos` AFTER INSERT ON `videos_complete` FOR EACH ROW BEGIN
    DECLARE total_chapitres INT DEFAULT 0;
    DECLARE course_id INT DEFAULT 0;
    DECLARE increment_progress FLOAT DEFAULT 0;

    -- Trouver le chapitre lié à la vidéo
    DECLARE chap_id INT;

    SELECT id_chap INTO chap_id
    FROM videoscours
    WHERE id_vid = NEW.id_vid;

    -- Trouver le cours associé à ce chapitre
    SELECT id_cours INTO course_id
    FROM chapitres
    WHERE id_chap = chap_id;

    -- Nombre total de chapitres du cours
    SELECT COUNT(*) INTO total_chapitres
    FROM chapitres
    WHERE id_cours = course_id;

    -- Calcul de l'incrément de progression
    IF total_chapitres > 0 THEN
        SET increment_progress = (1.0 / (total_chapitres * 2)) * 100;
    ELSE
        SET increment_progress = 0;
    END IF;

    -- Mise à jour de la progression
    UPDATE suivre
    SET progression = LEAST(100, progression + increment_progress)
    WHERE id_user = NEW.id_user AND id_cours = course_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `videoscours`
--

DROP TABLE IF EXISTS `videoscours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videoscours` (
  `id_vid` int NOT NULL AUTO_INCREMENT,
  `id_chap` int DEFAULT NULL,
  `titre` varchar(200) NOT NULL,
  `duree` int DEFAULT NULL,
  `url_video` text NOT NULL,
  `id_cours` int DEFAULT NULL,
  PRIMARY KEY (`id_vid`),
  KEY `id_chap` (`id_chap`),
  KEY `id_cours` (`id_cours`),
  CONSTRAINT `videoscours_ibfk_1` FOREIGN KEY (`id_chap`) REFERENCES `chapitres` (`id_chap`) ON DELETE CASCADE,
  CONSTRAINT `videoscours_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `chapitres` (`id_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoscours`
--

LOCK TABLES `videoscours` WRITE;
/*!40000 ALTER TABLE `videoscours` DISABLE KEYS */;
INSERT INTO `videoscours` VALUES (1,1,'Vidéo : Variables et types de données',22,'https://www.youtube.com/watch?v=ycTlNetj3ao',1),(2,2,'Structures de contrôle',20,'https://www.youtube.com/watch?v=wgTlh8AQ1tc',1),(3,3,'Fonctions',10,'https://www.youtube.com/watch?v=KOmibP9DuTc',1),(4,4,'Algorithmes de tri',60,'https://www.youtube.com/watch?v=lFl4uc1X-gc',2),(5,5,'Listes chaînées',10,'https://www.youtube.com/watch?v=Al1soLUupns',2),(6,6,'Piles et files',24,'https://mediatheque.univ-paris1.fr/video/2339-cours-algo-avancee-structure-de-donnees-les-files-dattente/',2),(7,7,'Principes de la sécurité informatique',98,'https://www.youtube.com/watch?v=iIHzWdUDidk',3),(8,8,'Types de menaces',14,'https://www.youtube.com/watch?v=zTc1fIs0Xt8',3),(9,9,'Cryptographie de base',3,'https://www.youtube.com/watch?v=5fnugGA6tnM',3),(10,10,'Pare-feux et antivirus',7,'https://www.youtube.com/watch?v=0sKtEpCylTY',4),(11,11,'Sécurité réseau',5,'https://www.youtube.com/watch?v=W4lbk1_EdOY',4),(12,12,'Gestion des accès',48,'https://www.youtube.com/watch?v=XYsrq7Lq9SI',4),(13,13,'Modèle OSI',21,'https://www.youtube.com/watch?v=gONjleySTVU',5),(14,14,' Adressage IP',98,'https://www.youtube.com/watch?v=57p3kF2cR5M',5),(15,15,'Protocoles réseau',27,'https://www.lumni.fr/video/le-monde-connecte-les-reseaux-informatiques',5),(16,16,'Introduction à Cisco',34,'https://www.youtube.com/watch?v=6SeMNH8_CMo',6),(17,17,' Configuration de base',10,'https://www.youtube.com/watch?v=m_u0-LBjzpg',6),(18,18,'Routage statique et dynamique',9,'https://www.youtube.com/watch?v=I__hELW-H70',6),(19,19,'Bases de données relationnelles',34,'https://www.youtube.com/watch?v=paxyrZBzRK8',7),(20,20,'Requêtes SQL de base',6,'https://www.youtube.com/watch?v=f7-z8hWevmU',7),(21,21,'Jointures et sous-requêtes',12,'https://www.youtube.com/watch?v=ovsJ27Jg0cw',7),(22,22,'Gestion des utilisateurs',14,'https://www.youtube.com/watch?v=DGA-8hJowOg',8),(23,23,'Sauvegardes et restaurations',17,'https://www.youtube.com/watch?v=23ggAsmgAPE',8),(24,24,'Optimisation des requêtes',95,'https://www.youtube.com/watch?v=Z6sRptPPxzA',8),(25,25,'Introduction a la programmation OO',NULL,'https://www.youtube.com/watch?v=jexyOTLa62c',9),(26,26,'Classes et objets',NULL,'https://www.youtube.com/watch?v=Vw6nHeHezLI',9),(27,27,'Heritages et Polymorphisme',NULL,'https://www.youtube.com/watch?v=PIbSz87K7Qw',9),(28,28,'Introduction à HTML',NULL,'https://https://www.youtube.com/watch?v=ok-plXXHlWw',10),(29,29,'Bases du CSS',NULL,'https://www.youtube.com/watch?v=1Rs2ND1ryYc',10),(30,30,'Les premiers pas avec JavaScript',NULL,'https://www.youtube.com/watch?v=jS4aFq5-91M',10),(31,31,'Principales vulnérabilités',NULL,'https://www.youtube.com/watch?v=cVC5TW-XGyQ',11),(32,32,'Protection cxontre les attaques XSS ou CSRF',NULL,'https://www.youtube.com/watch?v=xsnBRYZnBUc',11),(33,33,'Gestion des utilisateurs',NULL,'https://www.youtube.com/watch?v=kq6E-g6AXk0',11),(34,34,'Gestion des utilisateurs',NULL,'https://www.youtube.com/watch?v=OKqyyl_lEKs',12),(35,35,'Intro aux techniques d\'attaques WIFI',NULL,'https://www.youtube.com/watch?v=mXGCGxxtu0s',12),(36,36,'Elaboration d\'un rapport de test',NULL,'https://www.youtube.com/watch?v=o4iTeF1-LxQ',12),(37,37,'Fonctionnement du WIFI',NULL,'https://www.youtube.com/watch?v=LsyfJc83SQo&t=109s',13),(38,38,'Sécurisation des réseaux sans-fil',NULL,'https://www.youtube.com/watch?v=WSEhYhK7vCQ',13),(39,39,'Installation et déploiement',NULL,'https://www.youtube.com/watch?v=JQiKk0NSzBk',13),(40,40,'Concepts fondamentaux de virtualisation',NULL,'https://www.youtube.com/watch?v=4J_00mQ5BAs',14),(41,41,'Utilisation des VLAN',NULL,'https://www.youtube.com/watch?v=nsv28gyZozU',14),(42,42,'SDN et virtualisation avancée',NULL,'https://www.youtube.com/watch?v=8ZMHwSd2io0',14),(43,43,'Introduction à la sécurité cloud',NULL,'https://www.youtube.com/watch?v=8OC0lj53KKI&list=PLsfnCRA9QVnSj4gbP5W1W1CXjPRhe1oE2',15),(44,44,'Gestion des identités et des accès',NULL,'https://www.youtube.com/watch?v=pymdiofd1jU',15),(45,45,'Chiffrement en informatique',NULL,'https://www.youtube.com/watch?v=0aBiP3gaDwk',15);
/*!40000 ALTER TABLE `videoscours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-11 18:10:20
DROP FUNCTION IF EXISTS totalUserFollowingClass;
DROP FUNCTION IF EXISTS userLearningStats;
DELIMITER //
CREATE FUNCTION totalUserFollowingClass (inIdCours INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM suivre
    WHERE id_cours = inIdCours;

    RETURN total;
END //

CREATE FUNCTION userLearningStats(inUserId INT)
RETURNS JSON
DETERMINISTIC
BEGIN
    DECLARE completedCours INT DEFAULT 0;
    DECLARE completedChapters INT DEFAULT 0;
    DECLARE coursSuivis INT DEFAULT 0;

    SELECT COUNT(*) INTO completedCours
    FROM cours_complete
    WHERE id_user = inUserId;

    SELECT COUNT(*) INTO completedChapters
    FROM chapitres_complete
    WHERE id_user = inUserId;

    SELECT COUNT(*) INTO coursSuivis
    FROM suivre
    WHERE id_user = inUserId;

    RETURN JSON_OBJECT(
        'cours_complete', completedCours,
        'chapitres_complete', completedChapters,
        'cours_suivis', coursSuivis
    );
END //

DELIMITER ;

-- Insertion des nouveaux cours fictif
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (16, 1, 'Développement mobile (fictive)', 'Introduction au sujet de développement mobile.', 'Ce cours offre une compréhension approfondie de développement mobile à travers des exemples pratiques et des études de cas concrets.', 99);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (17, 2, 'Mathématiques appliquées (fictive)', 'Introduction au sujet de mathématiques appliquées.', 'Ce cours offre une compréhension approfondie de mathématiques appliquées à travers des exemples pratiques et des études de cas concrets.', 145);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (18, 3, 'Systèmes embarqués (fictive)', 'Introduction au sujet de systèmes embarqués.', 'Ce cours offre une compréhension approfondie de systèmes embarqués à travers des exemples pratiques et des études de cas concrets.', 131);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (19, 4, 'Développement de jeux (fictive)', 'Introduction au sujet de développement de jeux.', 'Ce cours offre une compréhension approfondie de développement de jeux à travers des exemples pratiques et des études de cas concrets.', 93);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (20, 1, 'Intelligence Artificielle (fictive)', 'Introduction au sujet de intelligence artificielle.', 'Ce cours offre une compréhension approfondie de intelligence artificielle à travers des exemples pratiques et des études de cas concrets.', 122);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (21, 2, 'DevOps (fictive)', 'Introduction au sujet de devops.', 'Ce cours offre une compréhension approfondie de devops à travers des exemples pratiques et des études de cas concrets.', 68);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (22, 3, 'Analyse de données (fictive)', 'Introduction au sujet de analyse de données.', 'Ce cours offre une compréhension approfondie de analyse de données à travers des exemples pratiques et des études de cas concrets.', 91);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (23, 4, 'Design UX/UI (fictive)', 'Introduction au sujet de design ux/ui.', 'Ce cours offre une compréhension approfondie de design ux/ui à travers des exemples pratiques et des études de cas concrets.', 89);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (24, 1, 'Blockchain (fictive)', 'Introduction au sujet de blockchain.', 'Ce cours offre une compréhension approfondie de blockchain à travers des exemples pratiques et des études de cas concrets.', 92);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (25, 2, 'Gestion de projet (fictive)', 'Introduction au sujet de gestion de projet.', 'Ce cours offre une compréhension approfondie de gestion de projet à travers des exemples pratiques et des études de cas concrets.', 79);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (26, 3, 'Programmation fonctionnelle (fictive)', 'Introduction au sujet de programmation fonctionnelle.', 'Ce cours offre une compréhension approfondie de programmation fonctionnelle à travers des exemples pratiques et des études de cas concrets.', 120);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (27, 4, 'Machine Learning (fictive)', 'Introduction au sujet de machine learning.', 'Ce cours offre une compréhension approfondie de machine learning à travers des exemples pratiques et des études de cas concrets.', 86);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (28, 1, 'Vision par ordinateur (fictive)', 'Introduction au sujet de vision par ordinateur.', 'Ce cours offre une compréhension approfondie de vision par ordinateur à travers des exemples pratiques et des études de cas concrets.', 66);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (29, 2, 'Cloud Computing (fictive)', 'Introduction au sujet de cloud computing.', 'Ce cours offre une compréhension approfondie de cloud computing à travers des exemples pratiques et des études de cas concrets.', 146);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (30, 3, 'Robotique (fictive)', 'Introduction au sujet de robotique.', 'Ce cours offre une compréhension approfondie de robotique à travers des exemples pratiques et des études de cas concrets.', 71);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (31, 4, 'Sécurité mobile (fictive)', 'Introduction au sujet de sécurité mobile.', 'Ce cours offre une compréhension approfondie de sécurité mobile à travers des exemples pratiques et des études de cas concrets.', 76);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (32, 1, 'Traitement du signal (fictive)', 'Introduction au sujet de traitement du signal.', 'Ce cours offre une compréhension approfondie de traitement du signal à travers des exemples pratiques et des études de cas concrets.', 100);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (33, 2, 'Systèmes temps réel (fictive)', 'Introduction au sujet de systèmes temps réel.', 'Ce cours offre une compréhension approfondie de systèmes temps réel à travers des exemples pratiques et des études de cas concrets.', 78);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (34, 3, 'Électronique numérique (fictive)', 'Introduction au sujet de électronique numérique.', 'Ce cours offre une compréhension approfondie de électronique numérique à travers des exemples pratiques et des études de cas concrets.', 86);
INSERT INTO cours (id_cours, id_domaine, nom_cours, description_courte, description_complete, duree_totale) VALUES (35, 4, 'Langages bas niveau (fictive)', 'Introduction au sujet de langages bas niveau.', 'Ce cours offre une compréhension approfondie de langages bas niveau à travers des exemples pratiques et des études de cas concrets.', 136);

-- Insertion des chapitres fictif
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (46, 16, 'Chapitre 1 : Concepts clés de développement mobile', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (47, 16, 'Chapitre 2 : Concepts clés de développement mobile', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (48, 17, 'Chapitre 1 : Concepts clés de mathématiques appliquées', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (49, 17, 'Chapitre 2 : Concepts clés de mathématiques appliquées', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (50, 18, 'Chapitre 1 : Concepts clés de systèmes embarqués', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (51, 18, 'Chapitre 2 : Concepts clés de systèmes embarqués', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (52, 18, 'Chapitre 3 : Concepts clés de systèmes embarqués', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (53, 19, 'Chapitre 1 : Concepts clés de développement de jeux', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (54, 19, 'Chapitre 2 : Concepts clés de développement de jeux', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (55, 20, 'Chapitre 1 : Concepts clés de intelligence artificielle', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (56, 20, 'Chapitre 2 : Concepts clés de intelligence artificielle', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (57, 20, 'Chapitre 3 : Concepts clés de intelligence artificielle', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (58, 21, 'Chapitre 1 : Concepts clés de devops', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (59, 21, 'Chapitre 2 : Concepts clés de devops', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (60, 21, 'Chapitre 3 : Concepts clés de devops', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (61, 22, 'Chapitre 1 : Concepts clés de analyse de données', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (62, 22, 'Chapitre 2 : Concepts clés de analyse de données', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (63, 23, 'Chapitre 1 : Concepts clés de design ux/ui', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (64, 23, 'Chapitre 2 : Concepts clés de design ux/ui', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (65, 23, 'Chapitre 3 : Concepts clés de design ux/ui', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (66, 24, 'Chapitre 1 : Concepts clés de blockchain', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (67, 24, 'Chapitre 2 : Concepts clés de blockchain', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (68, 25, 'Chapitre 1 : Concepts clés de gestion de projet', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (69, 25, 'Chapitre 2 : Concepts clés de gestion de projet', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (70, 26, 'Chapitre 1 : Concepts clés de programmation fonctionnelle', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (71, 26, 'Chapitre 2 : Concepts clés de programmation fonctionnelle', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (72, 27, 'Chapitre 1 : Concepts clés de machine learning', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (73, 27, 'Chapitre 2 : Concepts clés de machine learning', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (74, 28, 'Chapitre 1 : Concepts clés de vision par ordinateur', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (75, 28, 'Chapitre 2 : Concepts clés de vision par ordinateur', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (76, 28, 'Chapitre 3 : Concepts clés de vision par ordinateur', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (77, 29, 'Chapitre 1 : Concepts clés de cloud computing', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (78, 29, 'Chapitre 2 : Concepts clés de cloud computing', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (79, 30, 'Chapitre 1 : Concepts clés de robotique', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (80, 30, 'Chapitre 2 : Concepts clés de robotique', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (81, 30, 'Chapitre 3 : Concepts clés de robotique', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (82, 31, 'Chapitre 1 : Concepts clés de sécurité mobile', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (83, 31, 'Chapitre 2 : Concepts clés de sécurité mobile', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (84, 31, 'Chapitre 3 : Concepts clés de sécurité mobile', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (85, 32, 'Chapitre 1 : Concepts clés de traitement du signal', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (86, 32, 'Chapitre 2 : Concepts clés de traitement du signal', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (87, 33, 'Chapitre 1 : Concepts clés de systèmes temps réel', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (88, 33, 'Chapitre 2 : Concepts clés de systèmes temps réel', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (89, 33, 'Chapitre 3 : Concepts clés de systèmes temps réel', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (90, 34, 'Chapitre 1 : Concepts clés de électronique numérique', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (91, 34, 'Chapitre 2 : Concepts clés de électronique numérique', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (92, 34, 'Chapitre 3 : Concepts clés de électronique numérique', 3);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (93, 35, 'Chapitre 1 : Concepts clés de langages bas niveau', 1);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (94, 35, 'Chapitre 2 : Concepts clés de langages bas niveau', 2);
INSERT INTO chapitres (id_chap, id_cours, titre_chap, ordre) VALUES (95, 35, 'Chapitre 3 : Concepts clés de langages bas niveau', 3);

-- Insertion des vidéos fictif
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (46, 46, 'Vidéo : Développement mobile - Partie 1', 25, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 16);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (47, 47, 'Vidéo : Développement mobile - Partie 2', 14, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 16);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (48, 48, 'Vidéo : Mathématiques appliquées - Partie 1', 17, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 17);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (49, 49, 'Vidéo : Mathématiques appliquées - Partie 2', 17, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 17);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (50, 50, 'Vidéo : Systèmes embarqués - Partie 1', 14, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 18);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (51, 51, 'Vidéo : Systèmes embarqués - Partie 2', 42, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 18);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (52, 52, 'Vidéo : Systèmes embarqués - Partie 3', 37, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 18);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (53, 53, 'Vidéo : Développement de jeux - Partie 1', 18, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 19);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (54, 54, 'Vidéo : Développement de jeux - Partie 2', 33, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 19);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (55, 55, 'Vidéo : Intelligence Artificielle - Partie 1', 46, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 20);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (56, 56, 'Vidéo : Intelligence Artificielle - Partie 2', 47, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 20);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (57, 57, 'Vidéo : Intelligence Artificielle - Partie 3', 27, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 20);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (58, 58, 'Vidéo : DevOps - Partie 1', 45, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 21);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (59, 59, 'Vidéo : DevOps - Partie 2', 28, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 21);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (60, 60, 'Vidéo : DevOps - Partie 3', 43, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 21);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (61, 61, 'Vidéo : Analyse de données - Partie 1', 33, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 22);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (62, 62, 'Vidéo : Analyse de données - Partie 2', 20, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 22);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (63, 63, 'Vidéo : Design UX/UI - Partie 1', 47, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 23);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (64, 64, 'Vidéo : Design UX/UI - Partie 2', 51, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 23);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (65, 65, 'Vidéo : Design UX/UI - Partie 3', 26, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 23);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (66, 66, 'Vidéo : Blockchain - Partie 1', 26, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 24);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (67, 67, 'Vidéo : Blockchain - Partie 2', 26, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 24);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (68, 68, 'Vidéo : Gestion de projet - Partie 1', 56, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 25);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (69, 69, 'Vidéo : Gestion de projet - Partie 2', 42, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 25);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (70, 70, 'Vidéo : Programmation fonctionnelle - Partie 1', 37, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 26);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (71, 71, 'Vidéo : Programmation fonctionnelle - Partie 2', 24, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 26);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (72, 72, 'Vidéo : Machine Learning - Partie 1', 33, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 27);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (73, 73, 'Vidéo : Machine Learning - Partie 2', 15, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 27);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (74, 74, 'Vidéo : Vision par ordinateur - Partie 1', 60, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 28);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (75, 75, 'Vidéo : Vision par ordinateur - Partie 2', 51, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 28);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (76, 76, 'Vidéo : Vision par ordinateur - Partie 3', 14, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 28);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (77, 77, 'Vidéo : Cloud Computing - Partie 1', 59, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 29);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (78, 78, 'Vidéo : Cloud Computing - Partie 2', 28, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 29);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (79, 79, 'Vidéo : Robotique - Partie 1', 10, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 30);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (80, 80, 'Vidéo : Robotique - Partie 2', 42, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 30);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (81, 81, 'Vidéo : Robotique - Partie 3', 30, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 30);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (82, 82, 'Vidéo : Sécurité mobile - Partie 1', 12, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 31);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (83, 83, 'Vidéo : Sécurité mobile - Partie 2', 39, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 31);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (84, 84, 'Vidéo : Sécurité mobile - Partie 3', 22, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 31);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (85, 85, 'Vidéo : Traitement du signal - Partie 1', 42, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 32);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (86, 86, 'Vidéo : Traitement du signal - Partie 2', 48, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 32);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (87, 87, 'Vidéo : Systèmes temps réel - Partie 1', 35, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 33);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (88, 88, 'Vidéo : Systèmes temps réel - Partie 2', 43, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 33);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (89, 89, 'Vidéo : Systèmes temps réel - Partie 3', 18, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 33);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (90, 90, 'Vidéo : Électronique numérique - Partie 1', 10, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 34);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (91, 91, 'Vidéo : Électronique numérique - Partie 2', 54, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 34);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (92, 92, 'Vidéo : Électronique numérique - Partie 3', 39, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 34);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (93, 93, 'Vidéo : Langages bas niveau - Partie 1', 50, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 35);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (94, 94, 'Vidéo : Langages bas niveau - Partie 2', 52, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 35);
INSERT INTO videoscours (id_vid, id_chap, titre, duree, url_video, id_cours) VALUES (95, 95, 'Vidéo : Langages bas niveau - Partie 3', 32, 'https://www.youtube.com/watch?v=9Fvor2HUR0E', 35);

-- Insertion des exercices fictif
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (46, 46, 'Quel est un concept important dans développement mobile (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (47, 47, 'Quel est un concept important dans développement mobile (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (48, 48, 'Quel est un concept important dans mathématiques appliquées (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (49, 49, 'Quel est un concept important dans mathématiques appliquées (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (50, 50, 'Quel est un concept important dans systèmes embarqués (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (51, 51, 'Quel est un concept important dans systèmes embarqués (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (52, 52, 'Quel est un concept important dans systèmes embarqués (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (53, 53, 'Quel est un concept important dans développement de jeux (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (54, 54, 'Quel est un concept important dans développement de jeux (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (55, 55, 'Quel est un concept important dans intelligence artificielle (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (56, 56, 'Quel est un concept important dans intelligence artificielle (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (57, 57, 'Quel est un concept important dans intelligence artificielle (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (58, 58, 'Quel est un concept important dans devops (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (59, 59, 'Quel est un concept important dans devops (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (60, 60, 'Quel est un concept important dans devops (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (61, 61, 'Quel est un concept important dans analyse de données (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (62, 62, 'Quel est un concept important dans analyse de données (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (63, 63, 'Quel est un concept important dans design ux/ui (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (64, 64, 'Quel est un concept important dans design ux/ui (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (65, 65, 'Quel est un concept important dans design ux/ui (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (66, 66, 'Quel est un concept important dans blockchain (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (67, 67, 'Quel est un concept important dans blockchain (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (68, 68, 'Quel est un concept important dans gestion de projet (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (69, 69, 'Quel est un concept important dans gestion de projet (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (70, 70, 'Quel est un concept important dans programmation fonctionnelle (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (71, 71, 'Quel est un concept important dans programmation fonctionnelle (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (72, 72, 'Quel est un concept important dans machine learning (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (73, 73, 'Quel est un concept important dans machine learning (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (74, 74, 'Quel est un concept important dans vision par ordinateur (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (75, 75, 'Quel est un concept important dans vision par ordinateur (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (76, 76, 'Quel est un concept important dans vision par ordinateur (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (77, 77, 'Quel est un concept important dans cloud computing (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (78, 78, 'Quel est un concept important dans cloud computing (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (79, 79, 'Quel est un concept important dans robotique (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (80, 80, 'Quel est un concept important dans robotique (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (81, 81, 'Quel est un concept important dans robotique (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (82, 82, 'Quel est un concept important dans sécurité mobile (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (83, 83, 'Quel est un concept important dans sécurité mobile (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (84, 84, 'Quel est un concept important dans sécurité mobile (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (85, 85, 'Quel est un concept important dans traitement du signal (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (86, 86, 'Quel est un concept important dans traitement du signal (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (87, 87, 'Quel est un concept important dans systèmes temps réel (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (88, 88, 'Quel est un concept important dans systèmes temps réel (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (89, 89, 'Quel est un concept important dans systèmes temps réel (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (90, 90, 'Quel est un concept important dans électronique numérique (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (91, 91, 'Quel est un concept important dans électronique numérique (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (92, 92, 'Quel est un concept important dans électronique numérique (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (93, 93, 'Quel est un concept important dans langages bas niveau (partie 1) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (94, 94, 'Quel est un concept important dans langages bas niveau (partie 2) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');
INSERT INTO exercice (id_exo, id_chap, enonce, choix_1, choix_2, choix_3, choix_4, bonne_reponse) VALUES (95, 95, 'Quel est un concept important dans langages bas niveau (partie 3) ?', 'Option 1', 'Option 2', 'Option 3', 'Option 4', 'choix_1');