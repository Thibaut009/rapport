-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 16 mai 2022 à 18:25
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `application`
--

-- --------------------------------------------------------

--
-- Structure de la table `autre frais`
--

DROP TABLE IF EXISTS `autre frais`;
CREATE TABLE IF NOT EXISTS `autre frais` (
  `autre_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `montant` int NOT NULL,
  PRIMARY KEY (`autre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `detient`
--

DROP TABLE IF EXISTS `detient`;
CREATE TABLE IF NOT EXISTS `detient` (
  `fk_user` int DEFAULT NULL,
  `fk_fiche` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `fk_utilisateur` (`fk_user`),
  KEY `fk_detient` (`fk_fiche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dispose`
--

DROP TABLE IF EXISTS `dispose`;
CREATE TABLE IF NOT EXISTS `dispose` (
  `fk_fiche` int DEFAULT NULL,
  `fk_autre` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  KEY `fk_fiche de frais` (`fk_fiche`),
  KEY `fk_autres frais` (`fk_autre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fiche_de_frais`
--

DROP TABLE IF EXISTS `fiche_de_frais`;
CREATE TABLE IF NOT EXISTS `fiche_de_frais` (
  `fiche_id` int NOT NULL AUTO_INCREMENT,
  `repas_midi` int NOT NULL,
  `kilometrage` int NOT NULL,
  `nuitee` int NOT NULL,
  `fk_autre` int DEFAULT NULL,
  PRIMARY KEY (`fiche_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fiche_de_frais`
--

INSERT INTO `fiche_de_frais` (`fiche_id`, `repas_midi`, `kilometrage`, `nuitee`, `fk_autre`) VALUES
(3, 3, 100, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `grades`
--

DROP TABLE IF EXISTS `grades`;
CREATE TABLE IF NOT EXISTS `grades` (
  `gr_id` int NOT NULL,
  `gr_libelle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`gr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `grades`
--

INSERT INTO `grades` (`gr_id`, `gr_libelle`) VALUES
(1, 'comptable'),
(2, 'visiteur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `matricule` varchar(100) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `fk_gr` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `est` (`fk_gr`)
) ENGINE=InnoDB AUTO_INCREMENT=202022 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`user_id`, `matricule`, `login`, `password`, `nom`, `prenom`, `fk_gr`) VALUES
(1, '101010', 'titi', 'azerty', 'gabet', 'thibaut', 1),
(2, '202020', 'syoma', 'Darwin01', 'ravaut', 'simon', 2),
(3, '303030', 'hyriusfr', 'jul', 'henocque', 'antoine', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `detient`
--
ALTER TABLE `detient`
  ADD CONSTRAINT `fk_detient` FOREIGN KEY (`fk_fiche`) REFERENCES `fiche_de_frais` (`fiche_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_utilisateur` FOREIGN KEY (`fk_user`) REFERENCES `utilisateurs` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `dispose`
--
ALTER TABLE `dispose`
  ADD CONSTRAINT `fk_autres frais` FOREIGN KEY (`fk_autre`) REFERENCES `autre frais` (`autre_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_fiche de frais` FOREIGN KEY (`fk_fiche`) REFERENCES `fiche_de_frais` (`fiche_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `est` FOREIGN KEY (`fk_gr`) REFERENCES `grades` (`gr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
