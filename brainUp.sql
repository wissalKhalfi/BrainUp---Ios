-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:8889
-- Généré le :  Ven 12 Mai 2017 à 11:54
-- Version du serveur :  5.5.38
-- Version de PHP :  5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `brainUp`
--

-- --------------------------------------------------------

--
-- Structure de la table `Memory`
--

CREATE TABLE `Memory` (
  `id` int(11) NOT NULL,
  `best1` int(11) DEFAULT NULL,
  `best2` int(11) DEFAULT NULL,
  `best3` int(11) DEFAULT NULL,
  `best4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `player`
--

CREATE TABLE `player` (
`id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(10) NOT NULL,
  `country` varchar(40) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birthdate` date NOT NULL,
  `id_memory` int(10) DEFAULT NULL,
  `id_quizz` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `player`
--

INSERT INTO `player` (`id`, `username`, `email`, `password`, `country`, `gender`, `birthdate`, `id_memory`, `id_quizz`) VALUES
(4, 'wissal', 'wissal.kh@esp.tn', 'wissal', 'Tunisia', 'Female', '1970-01-01', NULL, NULL),
(19, 'Guilherme', 'wi@esp.tn', 'wissal27', 'gigolo', 'Male', '0000-00-00', NULL, NULL),
(20, 'wissal', 'wi@esp.tn', 'wissalkh', 'Tunisia', 'Male', '1970-01-01', NULL, NULL),
(21, 'mohamed ali', 'mohamed.ali@esprit.tn', 'wissalkh', 'Tunisia', 'Male', '1990-06-19', NULL, NULL),
(22, 'mmouadh', 'mousse.lamine@esp.tn', 'wissalkh', 'Tunisia', 'Male', '1989-07-02', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Quiz`
--

CREATE TABLE `Quiz` (
  `id` int(11) NOT NULL,
  `best1` int(11) DEFAULT NULL,
  `best2` int(11) DEFAULT NULL,
  `best3` int(11) DEFAULT NULL,
  `best4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Memory`
--
ALTER TABLE `Memory`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `player`
--
ALTER TABLE `player`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Quiz`
--
ALTER TABLE `Quiz`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `player`
--
ALTER TABLE `player`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
