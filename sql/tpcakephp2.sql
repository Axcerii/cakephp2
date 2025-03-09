-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 09 mars 2025 à 18:12
-- Version du serveur : 9.0.1
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tpcakephp2`
--
CREATE DATABASE IF NOT EXISTS `tpcakephp2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `tpcakephp2`;

-- --------------------------------------------------------

--
-- Structure de la table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country` varchar(60) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country`, `created`, `modified`) VALUES
(1, 'Paris', 'France', '2025-03-09 14:14:29', '2025-03-09 14:14:29'),
(2, 'Bruxelles', 'Belgique', '2025-03-09 14:14:38', '2025-03-09 14:14:38'),
(3, 'Eraf', 'Augeaime', '2025-03-09 14:14:44', '2025-03-09 14:14:44'),
(4, 'Relatia', 'Saxifra', '2025-03-09 14:14:57', '2025-03-09 14:14:57');

-- --------------------------------------------------------

--
-- Structure de la table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
CREATE TABLE IF NOT EXISTS `phinxlog` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20250306151741, 'CreateCities', '2025-03-06 15:21:38', '2025-03-06 15:21:38', 0),
(20250306152214, 'CreateCities', '2025-03-06 15:23:23', '2025-03-06 15:23:23', 0),
(20250306152239, 'CreateUsers', '2025-03-06 15:23:23', '2025-03-06 15:23:23', 0),
(20250306152314, 'CreateTrips', '2025-03-06 15:23:23', '2025-03-06 15:23:23', 0),
(20250306155329, 'CreateTripsCities', '2025-03-06 15:53:44', '2025-03-06 15:53:44', 0);

-- --------------------------------------------------------

--
-- Structure de la table `trips`
--

DROP TABLE IF EXISTS `trips`;
CREATE TABLE IF NOT EXISTS `trips` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `trips`
--

INSERT INTO `trips` (`id`, `user_id`, `title`, `created`, `modified`) VALUES
(1, 1, 'RoadTrip', '2025-03-09 14:35:04', '2025-03-09 14:35:04'),
(2, 2, 'De la mer aux montagnes !', '2025-03-09 14:46:23', '2025-03-09 14:46:23'),
(12, 1, 'Test', '2025-03-09 17:56:38', '2025-03-09 17:56:38');

-- --------------------------------------------------------

--
-- Structure de la table `trips_cities`
--

DROP TABLE IF EXISTS `trips_cities`;
CREATE TABLE IF NOT EXISTS `trips_cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trip_id` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `trips_cities`
--

INSERT INTO `trips_cities` (`id`, `trip_id`, `city_id`) VALUES
(1, 1, 2),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created`, `modified`) VALUES
(1, 'Serii', '$2y$10$MLRHW2HwkG.j8PiGDmPfvOvMXm0/KUUAg/BXRzaIQfv8YuAwvBqhu', '2025-03-06 15:49:52', '2025-03-06 15:49:52'),
(2, 'Axcel', '$2y$10$CgIFRfvWyAYbI/KgbZo89edOxf.rfduv06mLvd/dPs0WAoxAwGYeG', '2025-03-09 14:13:36', '2025-03-09 14:13:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
