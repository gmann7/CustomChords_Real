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
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ordine` (
  `idordine` int(11) NOT NULL AUTO_INCREMENT,
  `dataordine` date NOT NULL,
  `stato` varchar(15) NOT NULL,
  `commenti` text,
  `email` varchar(50) NOT NULL,
  `indirizzospedizione` varchar(45) NOT NULL,
  `numerocarta` varchar(45) DEFAULT NULL,
  `cittaspedizione` varchar(45) NOT NULL,
  PRIMARY KEY (`idordine`),
  KEY `email` (`email`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `cliente` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (1,'2019-05-23','Consegnato','Niente','luca@gmail.com','via pastocchi','456789','vico'),(3,'2019-06-01','Consegnato','Niente','mattia@gmail.com','via viosa','224839','palermo'),(4,'2019-02-22','Consegnato','Niente','ziapeppa@gmail.com','via anastasio','928490','sorrento'),(16,'2019-07-12','Attesa','Niente','lucapesce@gmail.com','via catarro 4','49392209','Vico'),(17,'2019-07-12','Attesa','Niente','lucapesce@gmail.com','via tor 4','57575959','Meta'),(18,'2019-07-12','Attesa','Niente','stellaba@gmail.com','Via capasso 7','889638283','Ferrara'),(19,'2019-07-12','Attesa','Niente','simone@gmail.com','via ciabatta 9','98382920','Positano'),(20,'2019-07-12','Attesa','Niente','stellaba@gmail.com','via s croce 5','92929929','Positano'),(21,'2019-07-12','Attesa','Niente','simone@gmail.com','via daniele','0329300','Campobasso'),(22,'2019-07-12','Attesa','Niente','stellaba@gmail.com','jfdlsajfla','jflsafjla','jfkaljfal'),(23,'2019-07-13','Attesa','Niente','lucapesce@gmail.com','Via tassoni 5','09765657','Milano'),(24,'2019-07-13','Attesa','Niente','lorenzo@gmail.com','Via lattea','39042090','Boiano'),(25,'2019-07-13','Attesa','Niente','lorenzo@gmail.com','via canaglia','9304290','Boiano'),(26,'2019-07-13','Attesa','Niente','lucapesce@gmail.com','via canemorto','93383883','Vico'),(27,'2019-07-14','Attesa','Niente','simone@gmail.com','Via maggiore 9','9232-3211-3213-9432','Siracusa'),(28,'2019-07-14','Attesa','Niente','gianluca@gmail.com','Via canaglia 1','89134891','Brescia'),(29,'2019-07-14','Attesa','Niente','mariopaone@gmail.com','fjgug','56686','Sorebti'),(30,'2019-07-15','Attesa','Niente','simone@gmail.com','da peppe 5','928228289','Giuseppe Vesuviana'),(31,'2019-07-15','Attesa','Niente','simone@gmail.com','Montepersuo 3','93042802q','Positano');
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-16  1:07:41
