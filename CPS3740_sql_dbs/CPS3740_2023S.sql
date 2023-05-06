-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: imc.kean.edu    Database: CPS3740_2023S
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Money_tomaselj`
--

DROP TABLE IF EXISTS `Money_tomaselj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Money_tomaselj` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `cid` int(11) NOT NULL,
  `type` char(1) NOT NULL,
  `sid` int(11) NOT NULL,
  `amount` float NOT NULL,
  `mydatetime` datetime NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `code` (`code`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  CONSTRAINT `Money_tomaselj_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `CPS3740`.`Customers` (`id`),
  CONSTRAINT `Money_tomaselj_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `CPS3740`.`Sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Money_tomaselj`
--

LOCK TABLES `Money_tomaselj` WRITE;
/*!40000 ALTER TABLE `Money_tomaselj` DISABLE KEYS */;
INSERT INTO `Money_tomaselj` VALUES (1,'record1',1,'D',5,333,'2023-05-03 17:58:30','Hello 1'),(4,'record3',1,'W',6,3,'2023-05-03 17:58:30','New3'),(5,'record4',1,'W',3,4,'2023-05-03 17:58:30','Hello 4');
/*!40000 ALTER TABLE `Money_tomaselj` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-06  1:29:53
