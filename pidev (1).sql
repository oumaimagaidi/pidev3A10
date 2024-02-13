-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 13 fév. 2024 à 19:45
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pidev`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `Id_commande` int(11) NOT NULL,
  `Date_commande` varchar(255) NOT NULL,
  `Montant_totale` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `Id_produit` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Id_commande`, `Date_commande`, `Montant_totale`, `Quantite`, `Id_produit`, `id`) VALUES
(3, '13/02/2024', 2500, 1, 1, 21);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `id` int(100) NOT NULL,
  `profilepicture` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL,
  `username` varchar(15) NOT NULL,
  `UserType` enum('ADMIN','CLIENT','ARTISTE') NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `specialite` varchar(50) DEFAULT NULL,
  `debutCarriere` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `profilepicture`, `name`, `lastname`, `email`, `password`, `username`, `UserType`, `adresse`, `specialite`, `debutCarriere`) VALUES
(21, 'aa', 'admin', 'admin', 'aaaaa', 'admin00', 'admin1', 'ADMIN', NULL, NULL, NULL),
(22, 'bb', 'admin2', 'admin2', 'bbbb', 'admin00', 'admin2', 'ADMIN', NULL, NULL, NULL),
(24, 'ok', 'ok', 'ok', 'ok', 'ok', 'ko', 'ARTISTE', NULL, 'photoshop', '2003'),
(25, 'cc', 'admin3', 'admin3', 'cccc', 'admin00', 'admin3', 'ARTISTE', NULL, 'photoshop', '2003');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `Id_produit` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Prix` float NOT NULL,
  `Stock` int(11) NOT NULL,
  `Date_Creation` varchar(255) NOT NULL,
  `Categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`Id_produit`, `Nom`, `Description`, `Prix`, `Stock`, `Date_Creation`, `Categorie`) VALUES
(1, 'test', 'test', 2, 2, '12 k', 'mm');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`Id_commande`),
  ADD KEY `id` (`id`),
  ADD KEY `Id_produit` (`Id_produit`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`Id_produit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `Id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `Id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`Id_produit`) REFERENCES `produits` (`Id_produit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
