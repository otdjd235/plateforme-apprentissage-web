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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapitres`
--

LOCK TABLES `chapitres` WRITE;
/*!40000 ALTER TABLE `chapitres` DISABLE KEYS */;
INSERT INTO `chapitres` VALUES (1,1,'Variables et types de données',1),(2,1,'Structures de contrôle',2),(3,1,'Fonctions',3),(4,2,'Algorithmes de tri',1),(5,2,'Listes chaînées',2),(6,2,'Piles et files',3),(7,3,'Principes de la sécurité informatique',1),(8,3,'Types de menaces',2),(9,3,'Cryptographie de base',3),(10,4,'Pare-feux et antivirus',1),(11,4,'Sécurité réseau',2),(12,4,'Gestion des accès',3),(13,5,'Modèle OSI',1),(14,5,'Adressage IP',2),(15,5,'Protocoles réseau',3),(16,6,'Introduction à Cisco',1),(17,6,'Configuration de base',2),(18,6,'Routage statique et dynamique',3),(19,7,'Bases de données relationnelles',1),(20,7,'Requêtes SQL de base',2),(21,7,'Jointures et sous-requêtes',3),(22,8,'Gestion des utilisateurs',1),(23,8,'Sauvegardes et restaurations',2),(24,8,'Optimisation des requêtes',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours`
--

LOCK TABLES `cours` WRITE;
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` VALUES (1,1,'Introduction à la programmation',NULL,NULL,NULL),(2,1,'Algorithmique et structures de données',NULL,NULL,NULL),(3,2,'Cybersécurité : principes de base',NULL,NULL,NULL),(4,2,'Sécurité des systèmes et réseaux',NULL,NULL,NULL),(5,3,'Réseaux informatiques I',NULL,NULL,NULL),(6,3,'Configuration des routeurs et commutateurs',NULL,NULL,NULL),(7,4,'SQL et conception de base de données',NULL,NULL,NULL),(8,4,'Administration des bases de données',NULL,NULL,NULL);
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
  PRIMARY KEY (`id_exo`),
  KEY `id_chap` (`id_chap`),
  CONSTRAINT `exercice_ibfk_1` FOREIGN KEY (`id_chap`) REFERENCES `chapitres` (`id_chap`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercice`
--

LOCK TABLES `exercice` WRITE;
/*!40000 ALTER TABLE `exercice` DISABLE KEYS */;
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

--
-- Table structure for table `logs_debug`
--

DROP TABLE IF EXISTS `logs_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_debug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_debug`
--

LOCK TABLES `logs_debug` WRITE;
/*!40000 ALTER TABLE `logs_debug` DISABLE KEYS */;
INSERT INTO `logs_debug` VALUES (1,NULL,'2025-03-11 20:00:40');
/*!40000 ALTER TABLE `logs_debug` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoscours`
--

LOCK TABLES `videoscours` WRITE;
/*!40000 ALTER TABLE `videoscours` DISABLE KEYS */;
INSERT INTO `videoscours` VALUES (1,1,'Vidéo : Variables et types de données',22,'https://www.youtube.com/watch?v=ycTlNetj3ao',1),(2,2,'Structures de contrôle',20,'https://www.youtube.com/watch?v=wgTlh8AQ1tc',1),(3,3,'Fonctions',10,'https://www.youtube.com/watch?v=KOmibP9DuTc',1),(4,4,'Algorithmes de tri',60,'https://www.youtube.com/watch?v=lFl4uc1X-gc',2),(5,5,'Listes chaînées',10,'https://www.youtube.com/watch?v=Al1soLUupns',2),(6,6,'Piles et files',24,'https://mediatheque.univ-paris1.fr/video/2339-cours-algo-avancee-structure-de-donnees-les-files-dattente/',2),(7,7,'Principes de la sécurité informatique',98,'https://www.youtube.com/watch?v=iIHzWdUDidk',3),(8,8,'Types de menaces',14,'https://www.youtube.com/watch?v=zTc1fIs0Xt8',3),(9,9,'Cryptographie de base',3,'https://www.youtube.com/watch?v=5fnugGA6tnM',3),(10,10,'Pare-feux et antivirus',7,'https://www.youtube.com/watch?v=0sKtEpCylTY',4),(11,11,'Sécurité réseau',5,'https://www.youtube.com/watch?v=W4lbk1_EdOY',4),(12,12,'Gestion des accès',48,'https://www.youtube.com/watch?v=XYsrq7Lq9SI',4),(13,13,'Modèle OSI',21,'https://www.youtube.com/watch?v=gONjleySTVU',5),(14,14,' Adressage IP',98,'https://www.youtube.com/watch?v=57p3kF2cR5M',5),(15,15,'Protocoles réseau',27,'https://www.lumni.fr/video/le-monde-connecte-les-reseaux-informatiques',5),(16,16,'Introduction à Cisco',34,'https://www.youtube.com/watch?v=6SeMNH8_CMo',6),(17,17,' Configuration de base',10,'https://www.youtube.com/watch?v=m_u0-LBjzpg',6),(18,18,'Routage statique et dynamique',9,'https://www.youtube.com/watch?v=I__hELW-H70',6),(19,19,'Bases de données relationnelles',34,'https://www.youtube.com/watch?v=paxyrZBzRK8',7),(20,20,'Requêtes SQL de base',6,'https://www.youtube.com/watch?v=f7-z8hWevmU',7),(21,21,'Jointures et sous-requêtes',12,'https://www.youtube.com/watch?v=ovsJ27Jg0cw',7),(22,22,'Gestion des utilisateurs',14,'https://www.youtube.com/watch?v=DGA-8hJowOg',8),(23,23,'Sauvegardes et restaurations',17,'https://www.youtube.com/watch?v=23ggAsmgAPE',8),(24,24,'Optimisation des requêtes',95,'https://www.youtube.com/watch?v=Z6sRptPPxzA',8);
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

-- Dump completed on 2025-04-02 19:28:39
