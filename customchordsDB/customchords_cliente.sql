-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: customchords
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `nome` varchar(15) NOT NULL,
  `cognome` varchar(15) NOT NULL,
  `datanascita` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `indirizzo` varchar(50) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `nazione` varchar(50) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `sesso` enum('M','F') NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('Gianluca','Mannini','1999-01-21','gianluca@gmail.com','Gianluca#1','456765432','flkajf','Meta','Italia',1,'M'),('Lorenzo','Turbo','1980-02-22','lorenzo@gmail.com','Lorenzo#1','739729','via cane','Campobasso','Italia',0,'M'),('luca','luchetto','2015-00-19','luca@gmail.com','si','98989','via cane','napoli','italia',0,'M'),('Luca','Pesce','1998-02-22','lucapesce@gmail.com','LucaPesce#1','9430590349','boh','Vico','Italia',0,'M'),('Mario','Paone','1998-03-28','mariopaone@gmail.com','MarioPaone#1','4832058120','via cane','Sorrento','Italia',1,'M'),('Matteo','Tacchino','1999-03-06','matteo@gmail.com','Matteo#1','743020','Via pesce','Pescare','Italia',0,'M'),('mattia','siculo','1997-09-28','mattia@gmail.com','MattiaSiculo#1','766666','via lo capo','palerno','italia',0,'M'),('Peppe','Provola','1994-02-04','provola@gmail.com','Peppee#1','33345431','scutari','Vico','Italia',0,'M'),('Simone','Tauro','1998-12-22','simone@gmail.com','Simone#1','9983838','Via maurizio','Positano','Italia',0,'M'),('stella','barba','1970-03-20','stellaba@gmail.com','StellaBarba#20','76656666','via santa croce','positano','Italia',0,'F'),('Giuseppa','Ziapeppa','1968-01-03','ziapeppa@gmail.com','Giuseppa#1','4559992','via chiesa nov','Poistano','italia',0,'F');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-16  1:07:42
