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
-- Table structure for table `dettagliordine`
--

DROP TABLE IF EXISTS `dettagliordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dettagliordine` (
  `idordine` int(11) NOT NULL,
  `idprodotto` varchar(15) NOT NULL,
  `quantita` int(11) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `iva` int(11) NOT NULL,
  PRIMARY KEY (`idordine`,`idprodotto`),
  KEY `idprodotto` (`idprodotto`),
  CONSTRAINT `dettagliordine_ibfk_1` FOREIGN KEY (`idordine`) REFERENCES `ordine` (`idordine`),
  CONSTRAINT `dettagliordine_ibfk_2` FOREIGN KEY (`idprodotto`) REFERENCES `prodotto` (`idprodotto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dettagliordine`
--

LOCK TABLES `dettagliordine` WRITE;
/*!40000 ALTER TABLE `dettagliordine` DISABLE KEYS */;
INSERT INTO `dettagliordine` VALUES (1,'aa33',1,40.00,22),(1,'gio6',1,90.00,22),(3,'ipu7',1,75.00,22),(3,'tp44',1,50.00,22),(4,'tp44',1,50.00,22),(16,'aa33',3,120.00,22),(16,'tp44',1,50.00,22),(17,'lo88',1,60.00,22),(17,'ui98',1,75.00,22),(17,'up98',2,90.00,22),(18,'aa33',1,40.00,22),(18,'up98',2,90.00,22),(19,'aa33',1,40.00,22),(19,'up98',1,45.00,22),(20,'gio6',1,90.00,22),(21,'gnl2',1,120.00,22),(21,'ui98',1,75.00,22),(22,'ui98',1,75.00,22),(23,'gio6',1,90.00,22),(23,'lo88',1,60.00,22),(24,'tp44',1,50.00,22),(24,'up98',2,90.00,22),(25,'ui98',1,75.00,22),(26,'gnl2',1,120.00,22),(27,'ui98',1,75.00,22),(28,'up98',1,45.00,22),(29,'ipu7',1,75.00,22),(29,'up98',1,45.00,22),(30,'gnl2',1,120.00,22),(30,'ipu7',1,75.00,22),(30,'ui98',3,225.00,22),(31,'bas2',3,60.00,22);
/*!40000 ALTER TABLE `dettagliordine` ENABLE KEYS */;
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
