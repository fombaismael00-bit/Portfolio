-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 14 nov. 2025 à 13:04
-- Version du serveur : 8.0.39
-- Version de PHP : 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `agence location`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int NOT NULL,
  `nom_categorie` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `nom_categorie`, `description`) VALUES
(1, 'Citadine', 'Véhicule petit'),
(2, 'Supercars', 'Véhicule rapide');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client,` int NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client,`, `nom`, `prenom`, `telephone`, `email`, `adresse`) VALUES
(1, 'Fomba', 'Ismael', '0651692523', 'fombaismael00@gmail.com', '16 Rue Paul Langevin 93430'),
(2, 'Saint', 'Franklin', '06413254187122', 'Franklin99@gmail.com', 'Los Angeles');

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE `employes` (
  `id_employe` int NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `poste` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `salaire` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `employes`
--

INSERT INTO `employes` (`id_employe`, `nom`, `prenom`, `poste`, `salaire`) VALUES
(1, 'Li', 'Kang', 'manager', 2500),
(2, 'Bezos', 'Jeff', 'PDG', 50000);

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id_location` int NOT NULL,
  `id_client` int NOT NULL,
  `id_voiture` int NOT NULL,
  `id_employe` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin,` date NOT NULL,
  `montant_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id_location`, `id_client`, `id_voiture`, `id_employe`, `date_debut`, `date_fin,`, `montant_total`) VALUES
(1, 1, 1, 2, '2025-11-22', '2025-11-29', 4000),
(2, 2, 2, 1, '2025-11-20', '2025-11-22', 2000);

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE `voitures` (
  `id_voiture` int NOT NULL,
  `immatriculation` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `marque` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `modele` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `annee` int NOT NULL,
  `prix_jour` float NOT NULL,
  `id_categorie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`id_voiture`, `immatriculation`, `marque`, `modele`, `annee`, `prix_jour`, `id_categorie`) VALUES
(1, 'BD158EA', 'Lamborghini', 'Urus', 2025, 250, 2),
(2, 'BD154IO', 'Renault', 'CLIO V', 2024, 50, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client,`);

--
-- Index pour la table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`id_employe`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_voiture` (`id_voiture`),
  ADD KEY `id_employe` (`id_employe`);

--
-- Index pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`id_voiture`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voitures` (`id_voiture`),
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client,`),
  ADD CONSTRAINT `locations_ibfk_3` FOREIGN KEY (`id_employe`) REFERENCES `employes` (`id_employe`);

--
-- Contraintes pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD CONSTRAINT `voitures_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
