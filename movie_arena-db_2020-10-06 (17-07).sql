# ************************************************************
# Sequel Pro SQL dump
# Version 5426
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.48)
# Database: movie_arena
# Generation Time: 2020-10-06 11:37:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table genres
# ------------------------------------------------------------

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(120) DEFAULT NULL,
  `soft_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;

INSERT INTO `genres` (`id`, `genre`, `soft_delete`, `created_at`)
VALUES
	(1,' Action',0,'2020-10-06 02:53:56'),
	(2,' Adventure',0,'2020-10-06 02:53:56'),
	(3,' Biography',0,'2020-10-06 02:53:56'),
	(4,' Comedy',0,'2020-10-06 02:53:56'),
	(5,' Crime',0,'2020-10-06 02:53:56'),
	(6,' Documentary',0,'2020-10-06 02:53:56'),
	(7,' Drama',0,'2020-10-06 02:53:56'),
	(8,' Family',0,'2020-10-06 02:53:56'),
	(9,' Fantasy',0,'2020-10-06 02:53:56'),
	(10,' Film-Noir',0,'2020-10-06 02:53:56'),
	(11,' History',0,'2020-10-06 02:53:56'),
	(12,' Horror',0,'2020-10-06 02:53:56'),
	(13,' Music',0,'2020-10-06 02:53:56'),
	(14,' Musical',0,'2020-10-06 02:53:56'),
	(15,' Mystery',0,'2020-10-06 02:53:56'),
	(16,' News',0,'2020-10-06 02:53:56'),
	(17,' Reality-TV',0,'2020-10-06 02:53:56'),
	(18,' Romance',0,'2020-10-06 02:53:56'),
	(19,' Sci-Fi',0,'2020-10-06 02:53:56'),
	(20,' Short',0,'2020-10-06 02:53:56'),
	(21,' Sport',0,'2020-10-06 02:53:56'),
	(22,' Talk-Show',0,'2020-10-06 02:53:56'),
	(23,' Thriller',0,'2020-10-06 02:53:56'),
	(24,' War',0,'2020-10-06 02:53:56'),
	(25,' Western',0,'2020-10-06 02:53:56'),
	(26,'Action',0,'2020-10-06 02:53:56'),
	(27,'Adult',0,'2020-10-06 02:53:56'),
	(28,'Adventure',0,'2020-10-06 02:53:56'),
	(29,'Animation',0,'2020-10-06 02:53:56'),
	(30,'Biography',0,'2020-10-06 02:53:56'),
	(31,'Comedy',0,'2020-10-06 02:53:56'),
	(32,'Crime',0,'2020-10-06 02:53:56'),
	(33,'Documentary',0,'2020-10-06 02:53:56'),
	(34,'Drama',0,'2020-10-06 02:53:56'),
	(35,'Family',0,'2020-10-06 02:53:56'),
	(36,'Fantasy',0,'2020-10-06 02:53:56'),
	(37,'Film-Noir',0,'2020-10-06 02:53:56'),
	(38,'Game-Show',0,'2020-10-06 02:53:56'),
	(39,'Horror',0,'2020-10-06 02:53:56'),
	(40,'Musical',0,'2020-10-06 02:53:56'),
	(41,'Mystery',0,'2020-10-06 02:53:56'),
	(42,'Romance',0,'2020-10-06 02:53:56'),
	(43,'Short',0,'2020-10-06 02:53:56'),
	(44,'Talk-Show',0,'2020-10-06 02:53:56'),
	(45,'Thriller',0,'2020-10-06 02:53:56'),
	(46,'Western',0,'2020-10-06 02:53:56');

/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table movies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `director` varchar(255) DEFAULT NULL,
  `imdb_score` varchar(255) DEFAULT NULL,
  `popularity` int(11) NOT NULL DEFAULT '1',
  `soft_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;

INSERT INTO `movies` (`id`, `title`, `director`, `imdb_score`, `popularity`, `soft_delete`, `created_at`)
VALUES
	(1,'Star Wars','George Lucas','8.8',88,0,'2020-10-06 14:19:55'),
	(2,'The Wizard of Oz','Victor Fleming','8.3',83,0,'2020-10-06 14:21:31'),
	(3,'The Wizard of Oz','Victor Fleming','8.3',83,0,'2020-10-06 14:38:42'),
	(4,'Cabiria','Giovanni Pastrone','6.6',66,0,'2020-10-06 16:49:51');

/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table movies_genre
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movies_genre`;

CREATE TABLE `movies_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL DEFAULT '1',
  `genre` int(11) DEFAULT NULL,
  `soft_delete` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `movies_genre` WRITE;
/*!40000 ALTER TABLE `movies_genre` DISABLE KEYS */;

INSERT INTO `movies_genre` (`id`, `movie_id`, `genre`, `soft_delete`, `created_at`)
VALUES
	(1,1,26,0,'2020-10-06 14:19:55'),
	(2,1,2,0,'2020-10-06 14:19:55'),
	(3,1,9,0,'2020-10-06 14:19:55'),
	(4,1,19,0,'2020-10-06 14:19:55'),
	(5,2,28,0,'2020-10-06 14:21:31'),
	(6,2,8,0,'2020-10-06 14:21:31'),
	(7,2,9,0,'2020-10-06 14:21:31'),
	(8,2,14,0,'2020-10-06 14:21:31'),
	(9,3,28,0,'2020-10-06 14:38:42'),
	(10,3,8,0,'2020-10-06 14:38:42'),
	(11,3,9,0,'2020-10-06 14:38:42'),
	(12,3,14,0,'2020-10-06 14:38:42'),
	(13,4,28,0,'2020-10-06 16:49:51'),
	(14,4,7,0,'2020-10-06 16:49:51'),
	(15,4,24,0,'2020-10-06 16:49:51');

/*!40000 ALTER TABLE `movies_genre` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `soft_delete` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `role` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_email` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `email_id`, `soft_delete`, `is_active`, `role`, `password`)
VALUES
	(1,'asim','asim@gmail.com',0,1,'admin','sha256$HKrhndJL$27c077578983171dcbe60241906957cd4179f847842cc6f494cba2906622eab9'),
	(2,'client','client@gmail.com',0,1,'viewer','sha256$qvSpgETK$04cccba610c75b3c11bb67711b10a4305a5cf944b67b8b776617da91e1159be9'),
	(3,'client','client-b@gmail.com',0,1,'viewer','sha256$v1mSzKLk$8894b6a09aed21d03d40bb126688956eb38aefeeedf6aba83abfa1e8b8d9d95c'),
	(4,'clientc','client-c@gmail.com',0,1,'viewer','sha256$ErQyRW8L$eb4f712dace4b299c8c645b3901c4915af592d17b34a2eacd77a88793a35e50a'),
	(5,'clientc','client-d@gmail.com',0,1,'viewer','sha256$PfO0guTC$e6867787ee2953d4ccbce440786846d34f4a5629d9c914eb3b502662e9e72d98');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
