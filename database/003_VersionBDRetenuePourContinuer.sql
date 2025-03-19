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
  PRIMARY KEY (`id_certif`),
  KEY `id_user` (`id_user`),
  KEY `id_domaine` (`id_domaine`),
  CONSTRAINT `certifications_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `certifications_ibfk_2` FOREIGN KEY (`id_domaine`) REFERENCES `discipline` (`id_domaine`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
INSERT INTO `certifications` VALUES (1,1,2,'2025-03-19 13:41:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapitres`
--

LOCK TABLES `chapitres` WRITE;
/*!40000 ALTER TABLE `chapitres` DISABLE KEYS */;
INSERT INTO `chapitres` VALUES (1,1,'Définition des probabilités',1),(2,1,'Probabilité conditionnelle',2),(3,1,'probabilités pour Ducobu',3),(4,3,'Introduction aux Probabilités',1),(5,3,'Théorèmes Fondamentaux',2),(6,3,'Applications Avancées',3),(7,4,'Introduction au Pythonning',1),(8,4,'Pyhton advanced',2),(9,4,'Pyhton Pour Serveur',3);
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
INSERT INTO `chapitres_complete` VALUES (1,7,'2025-03-19 13:39:15'),(1,8,'2025-03-19 13:40:49'),(1,9,'2025-03-19 13:41:49');
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
INSERT INTO `choixdiscipline` VALUES (1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours`
--

LOCK TABLES `cours` WRITE;
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` VALUES (1,1,'Introduction aux Probabilités','Apprentissage des bases des probabilités','Cours complet avec exercices',120),(3,1,'Probabilités Avances','Apprentissage des bases des probabilités 2','Cours  avec exercices',120),(4,2,'Pyhton','CoursdePython','PyhtonnerCoeUnPro',120),(5,2,'C++','CoursdeC++','BestObjectOrientedProgrammingLangage',120),(6,2,'Java','CoursJava','BestJavaOnlineCOurse',120);
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
INSERT INTO `cours_complete` VALUES (1,4,'2025-03-19 13:41:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline`
--

LOCK TABLES `discipline` WRITE;
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` VALUES (1,'Mathématiques'),(2,'Programmation');
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
INSERT INTO `exercice` VALUES (1,1,'exo1_cours1'),(2,2,'exo2_cours1'),(3,3,'exo3_cours1'),(4,4,'exo1_cours3'),(5,5,'exo2_cours3'),(6,6,'exo3_cours3'),(7,7,'exo1_cours4'),(8,8,'exo2_cours4'),(9,9,'exo3_cours4');
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
INSERT INTO `exercices_complete` VALUES (1,7,'2025-03-19 13:39:15'),(1,8,'2025-03-19 13:40:49'),(1,9,'2025-03-19 13:41:49');
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
INSERT INTO `suivre` VALUES (1,4,'terminé',100.00);
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
INSERT INTO `users` VALUES (1,'frero','frero@gmail.com','1234567810','2000-11-20','monmotdpasse','2025-03-19 13:21:16','etudiant');
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
INSERT INTO `videos_complete` VALUES (1,7,'2025-03-19 13:37:43'),(1,8,'2025-03-19 13:40:10'),(1,9,'2025-03-19 13:41:24');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoscours`
--

LOCK TABLES `videoscours` WRITE;
/*!40000 ALTER TABLE `videoscours` DISABLE KEYS */;
INSERT INTO `videoscours` VALUES (1,1,'Définition des probabilités',10,'http://exemple.com/video1.mp4',1),(2,2,'Probabilité conditionnelle',10,'http://exemple.com/video1.mp4',1),(3,3,'probabilités pour Ducobu',10,'http://exemple.com/video1.mp4',1),(4,4,'Introduction aux Probabilités',10,'http://exemple.com/video1.mp4',3),(5,5,'Théorèmes Fondamentaux',10,'http://exemple.com/video1.mp4',3),(6,6,'Applications Avancées',10,'http://exemple.com/video1.mp4',3),(7,7,'Introduction au Pythonning',10,'http://exemple.com/video1.mp4',4),(8,8,'Pyhton advanced',10,'http://exemple.com/video1.mp4',4),(9,9,'Pyhton Pour Serveur',10,'http://exemple.com/video1.mp4',4);
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

-- Dump completed on 2025-03-19  9:53:57
