-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 11 mai 2022 à 17:40
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_ecoit`
--

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `id` int(11) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `specialite` text NOT NULL,
  `mdp` varchar(20) NOT NULL,
  `image` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `demande`
--

INSERT INTO `demande` (`id`, `nom`, `prenom`, `email`, `specialite`, `mdp`, `image`) VALUES
(4, 'pierre', 'estla', 'pierremi@gmail.com', 'développeur', 'pierreestla71', ''),
(5, 'jean', 'thierry', 'jj@orange.fr', 'cybersécurité', 'jeanmich8525', ''),
(6, 'poiret', 'usul', 'usul.poir@gmail.com', 'Langage html', 'usulapoiret4521', ''),
(7, 'Charlie', 'Reynolds', 'CharlieBReynolds@armyspy.com', 'développeur web/Mobile', 'ail4Ah1ei', '');

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

CREATE TABLE `formations` (
  `id` int(20) NOT NULL,
  `titre` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`id`, `titre`, `created_at`, `id_user`) VALUES
(1, 'HTML CSS', '2022-04-21 16:57:36', 33),
(2, 'les videos', '2022-04-21 17:15:47', 33),
(4, 'les grid css', '2022-05-11 09:13:29', 33);

-- --------------------------------------------------------

--
-- Structure de la table `lecon`
--

CREATE TABLE `lecon` (
  `id` int(255) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `VideoPath` text,
  `Nom` varchar(255) NOT NULL,
  `Creator` int(255) NOT NULL,
  `SectionId` tinyint(4) NOT NULL,
  `VideoName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lecon`
--

INSERT INTO `lecon` (`id`, `Description`, `VideoPath`, `Nom`, `Creator`, `SectionId`, `VideoName`) VALUES
(1, 'premier cours des balises', 'Documents/Balises HTML _ cours GRATUIT pour les Débutants (99 _ 100).mp4', 'les balise', 33, 5, 'Balises HTML _ cours GRATUIT pour les Débutants (99 _ 100).mp4'),
(2, 'balises des contôles', 'Documents/Balises HTML _ cours GRATUIT pour les Débutants (99 _ 100).mp4', 'control', 33, 6, 'Balises HTML _ cours GRATUIT pour les Débutants (99 _ 100).mp4'),
(3, 'les concept de la grille css sont très simple on montre comment utiliser une grille avec trois pistes en colonnes', 'Documents/b8mwmgvAeMrppKbl.mp4', 'concept de la grille', 33, 8, 'b8mwmgvAeMrppKbl.mp4');

-- --------------------------------------------------------

--
-- Structure de la table `lecondocs`
--

CREATE TABLE `lecondocs` (
  `LeconId` tinyint(4) NOT NULL,
  `DocPath` varchar(255) NOT NULL,
  `DocName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lecondocs`
--

INSERT INTO `lecondocs` (`LeconId`, `DocPath`, `DocName`) VALUES
(1, 'Documents/balise.webp', 'balise.webp');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(4) NOT NULL COMMENT 'role_id',
  `role` varchar(255) DEFAULT NULL COMMENT 'role_text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Editor'),
(3, 'User');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `formationID` int(11) NOT NULL,
  `Creator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `section`
--

INSERT INTO `section` (`id`, `Nom`, `formationID`, `Creator`) VALUES
(5, 'les bases', 1, 33),
(6, 'les controls', 2, 33),
(8, 'les modele ', 4, 33);

-- --------------------------------------------------------

--
-- Structure de la table `userformations`
--

CREATE TABLE `userformations` (
  `UserId` tinyint(4) NOT NULL,
  `FormationId` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `userformations`
--

INSERT INTO `userformations` (`UserId`, `FormationId`) VALUES
(47, 1),
(47, 2),
(47, 4),
(49, 1),
(49, 2),
(49, 4),
(50, 1),
(50, 2),
(50, 4);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleid` tinyint(4) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `roleid`, `isActive`, `created_at`, `updated_at`) VALUES
(32, 'pierre', 'pierremi@gmail.com', 'd0d3d7db62a38e500184c45817a01615cd2dd0ae', 3, 0, '2022-04-19 19:21:18', '2022-04-19 19:21:18'),
(33, 'pedro', 'pedro@orange.fr', 'cc12fe7c8c0889bcd0753f4844b1ab693417c0b4', 2, 0, '2022-04-19 19:24:38', '2022-04-19 19:24:38'),
(36, 'Joh', 'johndoe@gmail.com', 'cf2a79d1a04bc52f42cc085e26522575b34dd8ac', 1, 0, '2020-12-19 14:35:56', '2020-12-19 14:35:56'),
(37, 'Garland', 'GarlandLaisne@armyspy.com', '6d4c012c6d85a73fde65625c8e511251dde82624', 3, 0, '2022-05-02 20:40:09', '2022-05-02 20:40:09'),
(38, 'Neufville', 'JeromeNeufville@jourrapide.com', 'b586925d275d149cf72f5ee5845e6fb257f27fa2', 3, 0, '2022-05-01 20:51:01', '2022-05-01 20:51:01'),
(39, 'Plouffe', 'SergePlouffe@jourrapide.com', 'ab47277b157a52989c8a59a5a1fbb2017a15d972', 2, 0, '2022-04-20 20:52:36', '2022-04-20 20:52:36'),
(40, 'Beausoleil', 'OrvilleBeausoleil@rhyta.com', '11f9853c62efa54b4b0bfb53ba7b77a98a179038', 3, 0, '2022-05-01 20:53:44', '2022-05-01 20:53:44'),
(41, 'Chabot', 'SeymourChabot@dayrep.com', '14d0592a2483dcb69e7417263adb328690deb94e', 2, 0, '2022-04-30 20:55:07', '2022-04-30 20:55:07'),
(42, 'Aymon', 'AymonGodin@jourrapide.com', '168200ba73d14bacd81648866aa5741fcfb5a557', 3, 0, '2022-04-28 20:56:25', '2022-04-28 20:56:25'),
(43, 'Lepage', 'BarryLepage@armyspy.com', '6b8fd950a58052250e60ebe2067526745fdcebd9', 3, 0, '2022-03-31 20:57:48', '2022-03-31 20:57:48'),
(44, 'Lajeunesse', 'ClaudeLajeunesse@dayrep.com', 'ac56561a4fbcaabd0e8c6250287b3c4e732fef92', 2, 0, '2022-04-29 20:59:17', '2022-04-29 20:59:17'),
(45, 'Garceau', 'DavidGarceau@armyspy.com', '3ff3246906224368dfc3d9cb65b6f6cfa21a4dde', 3, 0, '2022-04-21 08:57:16', '2022-04-21 08:57:16'),
(46, 'Philip', 'PhilipBenoit@armyspy.com', '528daa2c9ff58105a7fdd1484a86bc18ac5bb966', 3, 0, '2022-04-30 08:59:38', '2022-04-30 08:59:38'),
(47, 'junior', 'junior.louis@orange.fr', '6ba8d45ce6558ddeef5b825eefba9857833ace5a', 3, 0, '2022-05-11 12:50:00', '2022-05-11 12:50:00'),
(50, 'victor', 'vivi.hertu@gmail.com', '852f02a7a8d64cf4bbf31461b52141df67bc3358', 3, 0, '2022-05-11 17:33:57', '2022-05-11 17:33:57');

-- --------------------------------------------------------

--
-- Structure de la table `validatedlecons`
--

CREATE TABLE `validatedlecons` (
  `UserId` tinyint(4) NOT NULL,
  `LeconId` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `validatedlecons`
--

INSERT INTO `validatedlecons` (`UserId`, `LeconId`) VALUES
(32, 1),
(32, 2),
(50, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lecon`
--
ALTER TABLE `lecon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lecondocs`
--
ALTER TABLE `lecondocs`
  ADD PRIMARY KEY (`LeconId`,`DocPath`),
  ADD KEY `DocId` (`DocPath`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`,`formationID`);

--
-- Index pour la table `userformations`
--
ALTER TABLE `userformations`
  ADD PRIMARY KEY (`UserId`,`FormationId`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleid` (`roleid`);

--
-- Index pour la table `validatedlecons`
--
ALTER TABLE `validatedlecons`
  ADD PRIMARY KEY (`UserId`,`LeconId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demande`
--
ALTER TABLE `demande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `lecon`
--
ALTER TABLE `lecon`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role_id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
