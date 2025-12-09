-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 09 déc. 2025 à 15:40
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur`
--

CREATE TABLE `acteur` (
  `id_acteur` int NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `nb_film` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`id_acteur`, `nom`, `prenom`, `date_naissance`, `nb_film`) VALUES
(1, 'Duris', 'Romain', '1974-05-28', 60),
(2, 'Exarchopoulos', 'Adele', '1993-11-22', 23),
(3, 'Borhinger', 'Richard', '1942-06-16', 132),
(4, 'Galbaru', 'michel', '1922-10-27', NULL),
(5, 'Parillaud', 'Anne', '1960-05-06', 35),
(6, 'Ford', 'Harrison', '1942-06-13', 64),
(7, 'Fisher', 'Carrie', '1956-10-21', 74),
(8, 'Saladana', 'Zoe', '1978-06-19', 31),
(9, 'Weaver', 'Sigourney', '1949-10-08', 66),
(10, 'Rend', 'Jean', '1948-06-30', 75);

-- --------------------------------------------------------

--
-- Structure de la table `casting`
--

CREATE TABLE `casting` (
  `id_film` int NOT NULL,
  `id_acteur` int NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nb_jour_tournage` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `casting`
--

INSERT INTO `casting` (`id_film`, `id_acteur`, `role`, `nb_jour_tournage`) VALUES
(1, 1, 'Francois', 100),
(1, 2, 'Julia', 100),
(2, 5, 'Nikita', 68),
(2, 10, 'Victor le nettoyeur', 9),
(3, 6, 'Han  Solo', 201),
(3, 7, 'Princesse Leia', 200),
(4, 8, 'Neyitiri', 50),
(4, 8, 'Dr Grace Austine', 45);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id_film` int NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `genre1` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `genre2` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_sortie` date DEFAULT NULL,
  `id_pays` int DEFAULT NULL,
  `id_realisateur` int DEFAULT NULL,
  `distributeur` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `duree` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id_film`, `titre`, `genre1`, `genre2`, `date_sortie`, `id_pays`, `id_realisateur`, `distributeur`, `duree`) VALUES
(1, 'subway', 'Policier', 'Drame', '1985-04-10', 1, 1, 'GAUMONT', 104),
(2, 'Nikita', 'Drame', 'Romantique', '1990-02-21', 1, 1, 'GAUMONT', 118),
(3, 'Star wars le retour du jedi', 'Action', 'Sf', '1983-10-19', 1, 2, '20th Century Fox', 133),
(4, 'Avatar', 'Action', 'SF', '2009-10-16', 1, 2, '20th Century Fox', 170);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id_pays` int NOT NULL,
  `libelle` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id_pays`, `libelle`) VALUES
(1, 'France'),
(2, 'Etats-Unis');

-- --------------------------------------------------------

--
-- Structure de la table `réalisateur`
--

CREATE TABLE `réalisateur` (
  `id_realisateur` int NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `nb_film_ecrit` int DEFAULT NULL,
  `nb_film_produit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `réalisateur`
--

INSERT INTO `réalisateur` (`id_realisateur`, `nom`, `prenom`, `date_naissance`, `nb_film_ecrit`, `nb_film_produit`) VALUES
(1, 'Besson', 'Lucas', '1959-03-18', 49, 99),
(2, 'Lucas', 'Georges', '1944-05-14', 79, 64),
(3, 'Cameron', 'James', '1954-08-16', 22, 23);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`id_acteur`);

--
-- Index pour la table `casting`
--
ALTER TABLE `casting`
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_acteur` (`id_acteur`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`),
  ADD KEY `id_pays` (`id_pays`),
  ADD KEY `id_realisateur` (`id_realisateur`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id_pays`);

--
-- Index pour la table `réalisateur`
--
ALTER TABLE `réalisateur`
  ADD PRIMARY KEY (`id_realisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteur`
--
ALTER TABLE `acteur`
  MODIFY `id_acteur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id_pays` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `réalisateur`
--
ALTER TABLE `réalisateur`
  MODIFY `id_realisateur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `casting`
--
ALTER TABLE `casting`
  ADD CONSTRAINT `casting_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  ADD CONSTRAINT `casting_ibfk_2` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`);

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`),
  ADD CONSTRAINT `film_ibfk_2` FOREIGN KEY (`id_realisateur`) REFERENCES `réalisateur` (`id_realisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
