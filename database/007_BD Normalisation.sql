CREATE TABLE `certifications` (
  `id_certif` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `date_obtention` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cours` int DEFAULT NULL,
  PRIMARY KEY (`id_certif`),
  KEY `id_user` (`id_user`),
  KEY `fk_certif_cours` (`id_cours`),
  CONSTRAINT `certifications_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `etudiants` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `certifications_ibfk_3` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`),
  CONSTRAINT `fk_certif_cours` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`) ON DELETE CASCADE
);

CREATE TABLE exercice (
  id_exo INT NOT NULL AUTO_INCREMENT,
  id_chap INT DEFAULT NULL,
  enonce TEXT NOT NULL,
  PRIMARY KEY (id_exo),
  FOREIGN KEY (id_chap) REFERENCES chapitres(id_chap) ON DELETE CASCADE
);

CREATE TABLE choix_exercice (
  id_choix INT NOT NULL AUTO_INCREMENT,
  id_exo INT NOT NULL,
  texte_choix TEXT NOT NULL,
  est_bonne_reponse BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (id_choix),
  FOREIGN KEY (id_exo) REFERENCES exercice(id_exo) ON DELETE CASCADE
);

CREATE TABLE `videoscours` (
  `id_vid` int NOT NULL AUTO_INCREMENT,
  `id_chap` int DEFAULT NULL,
  `titre` varchar(200) NOT NULL,
  `duree` int DEFAULT NULL,
  `url_video` text NOT NULL,
  PRIMARY KEY (`id_vid`),
  KEY `id_chap` (`id_chap`),
  CONSTRAINT `videoscours_ibfk_1` FOREIGN KEY (`id_chap`) REFERENCES `chapitres` (`id_chap`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

