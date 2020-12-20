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
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prodotto` (
  `idprodotto` varchar(15) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `descrizione` text NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `sottocategoria` varchar(50) DEFAULT NULL,
  `quantitadisp` int(11) NOT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `vetrina` tinyint(1) DEFAULT NULL,
  `iva` double NOT NULL,
  PRIMARY KEY (`idprodotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES ('aa33','Sunburst','Chitarra Classica 3/4, Sunburst','chitarra','classica',120,55.00,1,22),('addd','Advance','Akai Advance 49 Tastiera controller','tastiera','midi',50,440.00,1,22),('ales','Alexis','Alesis Q25, tastiera USB/MIDI da 25 tasti','tastiera','midi',40,60.00,1,22),('aria','Aria ','Aria FEB Fretless Electro Acoustic Bass Guitar, Light Vintage Burst','basso','acustico',50,250.00,1,22),('asis','Alesis','Alesis Recital Pro 88 Note Digital Piano','tastiera','elettrica',30,355.00,1,22),('bas2','Sunber','Sunburst','basso','elettrico',67,109.00,1,22),('bask','Bascher','Basso Elettroacustico','basso','acustico',30,110.00,1,22),('bllt','Bullet ','Squier Bullet Stratocaster Hard Tail, Fiesta Red','chitarra','elettrica',50,112.00,1,22),('btju','BattJ','Batteria Junior 3 Pezzi, Verde','percussione','batteria',60,100.00,1,22),('clss','Classic','Chitarra Classica, Natural','chitarra','classica',90,50.00,1,22),('ddrm','DDrum','DDrum Hybrid 6pc Shell Pack w/ Built In Triggers, Black','percussione','batteria',20,900.00,1,22),('edge','Edge ','Dean Edge 09M Basso, Satin Natural','basso','elettrico',30,146.00,1,22),('epfn','Epiphone','Manegevvole e completa','chitarra','elettrica',100,77.00,1,22),('fllb','FullBatt','BDK-1 Batteria Full Size Principianti, Nera','percussione','batteria',49,220.00,1,22),('gdin','Godin ',' Slim Cedar, Black','chitarra','acustica',60,1350.00,1,22),('gio6','Alesis','Alesis Turbo Mesh Batteria Elettronica ','percussione','batteria',77,300.00,1,22),('gnl2','Roland','Roland TD - 1K V-Drums Batteria elettronica','percussione','batteria',15,430.00,1,22),('gppa','Geppax','Akai LPK25 Laptop tastiera per Performance','tastiera','midi',80,44.00,1,22),('grta','Greta','Gretsch G2655T Streamliner CB Jr, Fairline Blue','chitarra','elettrica',30,480.00,1,22),('grts','Gretsch ','G5422TG 2016 Electromatic Hollow Body, Walnut Stain','chitarra','elettrica',15,1133.00,1,22),('hb00','HB','RedSub HB Basso, Sunburst','basso','elettrico',50,214.00,1,22),('hert','Hartwood ','Hartwood Renaissance Chitarra Classica','chitarra','classica',40,110.00,1,22),('hils','Hillsboro ','Dean Hillsboro Junior 3/4 Bass, Metallic Red','basso','elettrico',50,130.00,1,22),('htwd','Hartwood ','Prime Dreadnought Chitarra Elettro Acustica, Natural','chitarra','acustica',40,140.00,1,22),('ipu7','Cippi','DP-20 Pianoforte Digitale + Pacchetto Sgabello Piano','tastiera','elettrica',80,550.00,1,22),('jbso','Gibson','Gibson Hummingbird, Vintage Cherry Sunburst','chitarra','acustica',60,3200.00,1,22),('kmpt','Komplete ','Native Instruments Komplete Kontrol A61','tastiera','midi',50,240.00,1,22),('ktwe','Cutaway ','Chitarra Elettroacustica a Cutaway Singolo ','chitarra','acustica',50,80.00,1,22),('lbts','LibTas','Imparare a suonare la tastiera. Guida facile per imparare ','corso','guida',30,10.00,1,22),('lbuk','ukul','How to Play Ukulele Handy Guide','corso','guida',30,13.00,1,22),('lo88','Mantide','Chitarra ergonomia','chitarra','classica',80,60.00,0,22),('mgny','Mahogany ','Travel Guitar','chitarra','acustica',40,120.00,1,22),('mkka','Makka','Akai MPK Mini MK 2 Laptop Production Tastiera','tastiera','midi',54,79.00,1,22),('mnbt','MiniBatt','Batteria Junior 5 Pezzi, Vinaccio','percussione','batteria',50,150.00,1,22),('mnch','Mancha','La Mancha Circon Classical Acoustic Guitar','chitarra','classica',50,530.00,1,22),('mnki','MiniKey','SubZero MINIKEY Controller MIDI da 25 Tasti','tastiera','midi',30,38.00,1,22),('musc','Music ','Music Man BFR John Petrucci Majesty, Koa #M07341','chitarra','elettrica',30,4700.00,1,22),('nord','Nord','Nord Electro 6D Tastiera Semi Pesata 73 Note','tastiera','elettrica',50,1780.00,1,22),('numa','Numa','Studiologic Numa Tastiera Compatta 2X','tastiera','midi',35,699.00,1,22),('oxyg','Oxygen','M-Audio Oxygen 49 V4 Controller USB','tastiera','midi',60,135.00,1,22),('pggg','Piaggero','Yamaha Piaggero NP12 Pianoforte Digitale Portatile, Nero','tastiera','eletttrica',30,210.00,1,22),('rdgo','RolandGo','Roland Go:Piano Digitale 61 Tasti, Nero','tastiera','elettrica',50,290.00,1,22),('rdsb','RedSub ','RedSub SF Basso, Tobacco Sunburst','basso','elettrico',78,155.00,1,22),('rnbk','Roundback','Basso Elettro Acustico Roundback 5 Corde ','basso','acustico',70,120.00,1,22),('rold','Roland','Roland TD-50KV V-Drums Pro Batteria Elettronica','percussione','batteria',20,5400.00,1,22),('sdpi','Sdipi','SDP-1 Pianoforte Digitale Portatile ','tastiera','elettrica',50,150.00,1,22),('sqr1','Squier','Frizzante ','chitarra','elettrica',30,110.00,1,22),('sub0','SubZero','Per tutti','chitarra','elettrica',30,145.00,1,22),('tgwd','Tanglewood ','Inscription Dreadnought Cutaway ','chitarra','acustica',60,160.00,1,22),('tkmn','Takamine','GN11MCE NEX, Natural Satin','chitarra','acustica',50,305.00,1,22),('tkmo','Takamo','Chitarra Elettro Acustica, Sunburst','chitarra','acustica',40,500.00,1,22),('tlcs','Telecaster','Fender in pieno stile anni 50','chitarra','elettrica',20,400.00,1,22),('tor3','Streamer ','Warwick GPS Streamer CV Passive 5 String Bass 2015, Natural Satin','basso','elettrico',80,1400.00,1,22),('tp44','ClassicDeluxe','Chitarra Elettro Classica Deluxe, Nera','chitarra','classica',80,75.00,1,22),('trnd','Tornado','Mapex Tornado III 22\" Batteria Rock, Blue con Crash Extra','percussione','batteria',50,310.00,1,22),('trno','Torino ','Squier Affinity Bronco Bass, Torino Red','basso','acustico',70,175.00,1,22),('tund','Thunderbird ','Epiphone Thunderbird IV, Vintage Sunburst','basso','elettrico',66,310.00,1,22),('ui98','Junio','Junior 1/2 Chitarra Classica, Rossa','chitarra','classica',68,35.00,1,22),('up98','DeadDay','Day of the Dead Chitarra Classica Junior','chitarra','classica',90,45.00,1,22),('vidc','ChitDvd','Come Suonare La Chitarra: Video Corso per Imparare a Suonare Formato Kindle','corso','videocorso',80,7.00,1,22),('vlnl','Villanelle','Hartwood Villanelle Basso Elettro Acustico','basso','acustico',20,200.00,1,22),('ymha','YamahaClassic ','Yamaha C40BL Chitarra Classica, Black','chitarra','classica',40,140.00,1,22);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
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
