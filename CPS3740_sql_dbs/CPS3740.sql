-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: imc.kean.edu    Database: CPS3740
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
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `hotelno` varchar(10) NOT NULL DEFAULT '',
  `guestno` decimal(5,0) NOT NULL DEFAULT 0,
  `datefrom` date NOT NULL DEFAULT '0000-00-00',
  `dateto` date DEFAULT NULL,
  `roomno` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`hotelno`,`guestno`,`datefrom`),
  KEY `roomno` (`roomno`,`hotelno`),
  KEY `guestno` (`guestno`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`roomno`, `hotelno`) REFERENCES `Room` (`roomno`, `hotelno`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`guestno`) REFERENCES `Guest` (`guestno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES ('ch01',10006,'2004-04-21',NULL,1101),('ch02',10002,'2004-04-25','2004-05-06',801),('dc01',10003,'2004-05-20',NULL,1001),('dc01',10007,'2004-05-13','2004-05-15',1001),('fb01',10001,'2004-04-01','2004-04-08',501),('fb01',10001,'2004-05-01',NULL,701),('fb01',10002,'2004-05-04','2004-05-29',601),('fb01',10004,'2004-04-15',NULL,601),('fb01',10005,'2004-05-02','2004-05-07',501),('fb02',10003,'2004-04-05','2010-04-04',1001),('fb02',10005,'2004-05-01','2030-05-04',1101);
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `Book_title` varchar(20) NOT NULL,
  `Author` varchar(15) DEFAULT NULL,
  `Publisher` varchar(15) DEFAULT NULL,
  `Description` varchar(30) DEFAULT NULL,
  `Cost` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`Book_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Branch` (
  `branchNo` char(4) NOT NULL,
  `street` varchar(25) NOT NULL,
  `city` varchar(15) NOT NULL,
  `postcode` varchar(8) NOT NULL,
  PRIMARY KEY (`branchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES ('B002','56 Cover Drive','London','NW10 6EU'),('B003','163 Main Street','Glasgow','G11 9QX'),('B004','32 Manse Road','Bristol','BS99 1NZ'),('B005','22 Deer Road','London','SW1 4EH'),('B007','16 Argyll Street','Aberdeen','AB2 3SU'),('X001','1 Main Ave','Union','07083');
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Building`
--

DROP TABLE IF EXISTS `Building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Building` (
  `BuildingNo` int(11) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`BuildingNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Building`
--

LOCK TABLES `Building` WRITE;
/*!40000 ALTER TABLE `Building` DISABLE KEYS */;
INSERT INTO `Building` VALUES (1,'Willis Hall, 1000 Morris Ave, Union, NJ','07081'),(2,'Henings Hall, 1000 Morris Ave, Union, NJ','07081'),(3,'STEM, 1000 Morris Ave, Union, NJ','07081');
/*!40000 ALTER TABLE `Building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BuildingRoom`
--

DROP TABLE IF EXISTS `BuildingRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BuildingRoom` (
  `BuildingNo` int(11) NOT NULL DEFAULT 0,
  `RoomNo` int(11) NOT NULL DEFAULT 0,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`BuildingNo`,`RoomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BuildingRoom`
--

LOCK TABLES `BuildingRoom` WRITE;
/*!40000 ALTER TABLE `BuildingRoom` DISABLE KEYS */;
INSERT INTO `BuildingRoom` VALUES (1,1,100),(1,2,20),(1,3,30),(2,1,70),(2,2,20);
/*!40000 ALTER TABLE `BuildingRoom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `sid` int(11) DEFAULT NULL,
  `major` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'CS'),(2,'CS'),(3,'CS'),(3,'Math'),(4,'Math'),(5,'Math'),(6,'Biolo'),(7,'Biolo'),(8,'Biolo'),(9,'STEM'),(10,'Engli');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course_demo`
--

DROP TABLE IF EXISTS `Course_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course_demo` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `s_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course_demo`
--

LOCK TABLES `Course_demo` WRITE;
/*!40000 ALTER TABLE `Course_demo` DISABLE KEYS */;
INSERT INTO `Course_demo` VALUES (2231,'Java',1001),(3500,'Web',0),(3740,'DB',1001);
/*!40000 ALTER TABLE `Course_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `gender` char(1) NOT NULL,
  `img` blob DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Mary1 Lee','huang','123','2000-01-01','M','����\0JFIF\0,,\0\0���Exif\0\0II*\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0(\0\0\0\0\0\0\01\0\"\0\0\0�\0\0\02\0\0\0\0�\0\0\0;\0\0\0\0�\0\0\0��\0\0\0\0\r\0\0i�\0\0\0\0\0\0X\0\0RICOH IMAGING COMPANY, LTD.\0PENTAX K-3\0,\0\0\0\0\0,\0\0\0\0\0Adobe Photoshop CC 2015 (Windows)\02018:06:05 17:53:43\0THOMAS_SHAHAN\0THOMAS_SHAHAN\0\0!\0��\0\0\0\0�\0\0��\0\0\0\0�\0\0\"�\0\0\0\0\0\0\0\'�\0\0\0\0�\0\00�\0\0\0\0\0\0\01�\0\0\0\0�\0\0\0�\0\0\0\00221�\0\0\0\0�\0\0�\0\0\0\0�\0\0�\n\0\0\0\0�\0\0�\0\0\0\0�\0\0�\n\0\0\0\0�\0\0�\0\0\0\0\0\0\0	�\0\0\0\0\0\0\0\n�\0\0\0\0�\0\0�\0\0\0\0\0\0\0�\0\0\0\0�\0\0\0�\0\0\0\0�\0\0\0�\0\0\0\0\0\0�\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0�\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0	�\0\0\0\0\0\0\0\0\n�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\02�\0\0\0\0\0\04�\0!\0\0\06\0\0\0\0\0\0\0\0\0�\0\0\0G\0\0\0\n\0\0\02018:05:23 02:45:13\02018:05:23 02:45:13\0H�o\0@B\0VLV\0@B\0\0\0\0\0\n\0\0\0�e\0\0d\0\0\0��\0\0�\0\0��\0\0�\0\0&\0\0\n\0\0\0�\0\0\n\0\0\0(\0\0\0\n\0\0\0:\0\0\0\n\0\0\0smc PENTAX-DA 55-300mm F4-5.8 ED\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0�\0\0\0\0\0\0�\0\0(\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0A\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0\0\0����\0JFIF\0,,\0\0��\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(��\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0j\0k\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\07\0\0\0\0\0\0!1A\"Qaq��#2��$B����3R���\0\Z\0\0\0\0\0\0\0\0\0\0\0\0��\0)\0	\0\0\0\0\0\0\0\0!1AQ\"#$2BRa���\0\0\0?\09��mg)�u�O�3���h#�����OCK�}ȹ/)b1�j��L�Z2U[v��6n���Lb��*U.o��O`��o��qc\n�\n��&?F)kR�o&�㳝�6޴7��?�޶e��f�C�7/�#o��YX>���&mz��ː��\n\Z�Ƴ�l�h>����,@g��Q�{=9\'�𾗦Đ�+�}(,ܠ�6B����ֈ���ush�ڎ��W��?�	\"��bI#�w��\\T p\'�Ht��1),�;X��J��ѰoB+���CJ��-��2��o2{��j}�Z4:o�.�2���,�\"L�8�7�I��`���\\:�|�T����r(���R��E�jW{Wt�D@�ܻh�u6���(�2�t�Z�u����@@c�*�h��>@n����[KU{��D\'�W��3қn�Nxe2 &2s�J�}~s�?�T�=��er�8�����c2ؖ^��җo5f��\0�:U\"}_G%�Dڣ|ʃf=-ԉ,СY/\n�R4�-M�ҦK<x��c�G^�D�y���/1�֛�.��r��n@f�޽����x�[B	����y��|Bd�~c�#;�GZ�p����R�I���Y]���~c���_J�;�Ӄ�����˜��F�g����ᶟzui���ĉזT\n}���v���i�|���7�g�)�R1{4�V������Ɍg�{����}���\n1��ǜls��֘86�ۆ�K=+�Or���f�j�@�)[��do2���=���!���ˈ�Ԟ�;��oz���L�b�;������G�s\'�>l����\0�k�����l2��jN\"��|\r����Mp.�9�5�V����PM>w�Tll��ޚ$���O��(q�h���U~攺�l��G�b��Td֧�K|2�����N6�P\r�0e�\n��)��(e�%��Z�h-Zlj�B�\n���}z	����ȫ��\nY�w�\r�\\�#d~w�+J�٭F� ��R�YI4���ޙc��x��ժ\'�KFV��\0�SN�q�,�1죜��j�ڝ>���j��U�?3N��I�f� q&)Z���G��A�T;Q�<�r��R�}y���d��1f�w�O}���>+�Ͳ;�+�;��g~��t�I7*d�����w9?.�*�ޕ��W�2�)+�o���NF�\0zJ���)��L��;�Hı��R�C��J)ƺG�X%�����Y��O��M	��͉buL7�䃜tv�j��J�����A �����D��E��nK�t�H�Q��\Zl��[v�ڳ�\r)�uU�\\[��P���އ��*�6�]8����5�]���]���t|zt���!�y]�����JyH9S�@TR��[��s�C�M~�܄Y_\ns�6�UJ���SI3�e9�1ror<�!]�n!}�;U-&g��J6z\Z�iV/o��\n�\0��\\14\n�=k�<�1ؘ�Fu�#�O�Fr{�\\��������0o^��Q�`��ˉK��R�֡5�\0����4��Opϱ�(�ޕ�IjI�])j�����[����x��#*b2~��r�$�`(	!8���;�\0�n�W��Jِ�yc��sdc#��N\Z�\Z=��:��wsJ��]�Ԏ���~�IԺ�a���K[�u��;�^��ϱ$����*��׭-���H�q����~��F���[�O�X/t��\0���|܇�?�޺��n_\ra��{����J��ѡ���?F���\"�2\',��l3������\'V\0���&���\0ijA�Ki$w���TA/��s��h�j\"gg��j��)g_��c��+�ex%a�z�S���+���;𱷛�#�9&��K6\\�چ�Zq���S���2���-b^k��N��c��!9t�&��q�{Sͅ�v�)Q���)�{�Ī�f���\r���H�\Z�\ni�x��gRHxN�����$���*{s�6��y���u1(}w۶߱��R���BD^$�O ; ��@ǯΤ�u��B�WW1B�X�_�F:� ��D����94U��YS;���|g�v8+�Ӿ�\0CZ��K�BG%���0�?���nsi�Mv�I��nb|����~��os�L�@w#-���4�w(�-|���[�%��m���~{Q�}� ��ϧ�e���@�s�c?j���\0\n���&�X�9�8�#�����5tI$1I5�����(vz��^f7�BQF�����r5�j�Fs�`m����D�@�8���x�u��unO<�3ע��ޢ������03җ���d���A^�����_�FGr)�=~>E�c���\Z4���At2T�:��`\r��.����%��XE�R��Ip���PMo��(���U��Oș^>�/��@lo�z�y�Y%���d���\\���4F��5[��d���#J�A�{�{\n��az5s$��4����ʤ�@��ک���^�d7*\\g�SC���T/�N\'��\\�r�{c\0�����h\Z�TUKx����g9����K��RK���<V����&F�z�}i��Y�)-c2G��(�zGojYB*Lx��O���yJ��\0�ɭ�7��b�\nw�F}k��dmElmf�5�+Ȉ�O��j���ՌsCb\Z�x�D�FJ`���@�ҵ���o$I�(!�\\s�=S��|���t绚���6m��F��\0}�i��k��Lֱ@�;���p:�Ug�o СI/gi�]�aP=O�B8��`\rZ������5 ԓ�\'ܒML��Ikoη�E97��_~��j<O��%����>\">�61�f�J�Ɋ6V�7HS���Go:F�˒(�\\a�Ƽ��Q�69c���V�Zqb~�ejP�\0�D��k^b4\\Kb&�D�� �\0��mŗJKZ������Lg�8ȥ+_���[�	�	�\r��|�2�^\'n�Ś�լ��{�c�yP��ڧ\rm�E%�G��4#\n\0�`?a�˅A�}=�_B�0��i\\(�jf,�D�ź@�zD�D��ec��Js��1�@�oz�Ki��5̞0��*�}1���h���*��a򭷌�	(J����#&v:�1��햙m�Bg#��ֈ-��� �������Yw��;����Fv�%Ic�^!��m�����?�W7�H�� �I�P�9m_�m�W:3xgs�֚������UUS�W��(dz�D8ifl�\0�O��f�sg���db$����8��P��Sr�r9�?�A%���Fe�J����\0�ݳ����4�<�	�	��~!qlg��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��+whttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.6-c067 79.157747, 2015/03/30-23:40:42        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:aux=\"http://ns.adobe.com/exif/1.0/aux/\" xmlns:exifEX=\"http://cipa.jp/exif/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:crs=\"http://ns.adobe.com/camera-raw-settings/1.0/\" dc:format=\"image/jpeg\" xmp:CreatorTool=\"PENTAX K-3 Ver. 1.11\" xmp:ModifyDate=\"2018-06-05T17:53:43-05:00\" xmp:CreateDate=\"2018-05-23T02:45:13\" xmp:Rating=\"0\" xmp:MetadataDate=\"2018-06-05T17:53:43-05:00\" aux:LensInfo=\"550/10 3000/10 40/10 58/10\" aux:Lens=\"smc PENTAX-DA 55-300mm F4-5.8 ED\" aux:LensID=\"7 236\" aux:ApproximateFocusDistance=\"400/100\" aux:LateralChromaticAberrationCorrectionAlreadyApplied=\"True\" exifEX:LensModel=\"smc PENTAX-DA 55-300mm F4-5.8 ED\" photoshop:DateCreated=\"2018-05-23T02:45:13\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"adobe:docid:photoshop:4758b914-6913-11e8-84da-e8c88cc3520f\" xmpMM:OriginalDocumentID=\"5684ABE1786A5D55095E4B0F2AD94CCE\" xmpMM:InstanceID=\"xmp.iid:ae01f1b7-b777-404f-a7e9-9b4d667bb66e\" crs:Version=\"10.3\" crs:ProcessVersion=\"10.0\" crs:WhiteBalance=\"Auto\" crs:AutoWhiteVersion=\"134348800\" crs:Temperature=\"6250\" crs:Tint=\"+30\" crs:Saturation=\"+18\" crs:Sharpness=\"106\" crs:LuminanceSmoothing=\"14\" crs:ColorNoiseReduction=\"25\" crs:VignetteAmount=\"0\" crs:ShadowTint=\"0\" crs:RedHue=\"0\" crs:RedSaturation=\"0\" crs:GreenHue=\"0\" crs:GreenSaturation=\"0\" crs:BlueHue=\"0\" crs:BlueSaturation=\"0\" crs:Vibrance=\"+12\" crs:HueAdjustmentRed=\"0\" crs:HueAdjustmentOrange=\"0\" crs:HueAdjustmentYellow=\"0\" crs:HueAdjustmentGreen=\"0\" crs:HueAdjustmentAqua=\"0\" crs:HueAdjustmentBlue=\"0\" crs:HueAdjustmentPurple=\"0\" crs:HueAdjustmentMagenta=\"0\" crs:SaturationAdjustmentRed=\"0\" crs:SaturationAdjustmentOrange=\"0\" crs:SaturationAdjustmentYellow=\"0\" crs:SaturationAdjustmentGreen=\"0\" crs:SaturationAdjustmentAqua=\"0\" crs:SaturationAdjustmentBlue=\"0\" crs:SaturationAdjustmentPurple=\"0\" crs:SaturationAdjustmentMagenta=\"0\" crs:LuminanceAdjustmentRed=\"0\" crs:LuminanceAdjustmentOrange=\"0\" crs:LuminanceAdjustmentYellow=\"0\" crs:LuminanceAdjustmentGreen=\"0\" crs:LuminanceAdjustmentAqua=\"0\" crs:LuminanceAdjustmentBlue=\"0\" crs:LuminanceAdjustmentPurple=\"0\" crs:LuminanceAdjustmentMagenta=\"0\" crs:SplitToningShadowHue=\"0\" crs:SplitToningShadowSaturation=\"0\" crs:SplitToningHighlightHue=\"0\" crs:SplitToningHighlightSaturation=\"0\" crs:SplitToningBalance=\"0\" crs:ParametricShadows=\"0\" crs:ParametricDarks=\"0\" crs:ParametricLights=\"0\" crs:ParametricHighlights=\"0\" crs:ParametricShadowSplit=\"25\" crs:ParametricMidtoneSplit=\"50\" crs:ParametricHighlightSplit=\"75\" crs:SharpenRadius=\"+1.0\" crs:SharpenDetail=\"25\" crs:SharpenEdgeMasking=\"41\" crs:PostCropVignetteAmount=\"-41\" crs:PostCropVignetteMidpoint=\"41\" crs:PostCropVignetteFeather=\"100\" crs:PostCropVignetteRoundness=\"0\" crs:PostCropVignetteStyle=\"1\" crs:PostCropVignetteHighlightContrast=\"0\" crs:GrainAmount=\"0\" crs:LuminanceNoiseReductionDetail=\"65\" crs:ColorNoiseReductionDetail=\"50\" crs:LuminanceNoiseReductionContrast=\"24\" crs:ColorNoiseReductionSmoothness=\"50\" crs:LensProfileEnable=\"0\" crs:LensManualDistortionAmount=\"0\" crs:PerspectiveVertical=\"0\" crs:PerspectiveHorizontal=\"0\" crs:PerspectiveRotate=\"0.0\" crs:PerspectiveScale=\"100\" crs:PerspectiveAspect=\"0\" crs:PerspectiveUpright=\"0\" crs:PerspectiveX=\"0.00\" crs:PerspectiveY=\"0.00\" crs:AutoLateralCA=\"1\" crs:Exposure2012=\"+3.55\" crs:Contrast2012=\"0\" crs:Highlights2012=\"-100\" crs:Shadows2012=\"0\" crs:Whites2012=\"0\" crs:Blacks2012=\"0\" crs:Clarity2012=\"0\" crs:DefringePurpleAmount=\"0\" crs:DefringePurpleHueLo=\"30\" crs:DefringePurpleHueHi=\"70\" crs:DefringeGreenAmount=\"0\" crs:DefringeGreenHueLo=\"40\" crs:DefringeGreenHueHi=\"60\" crs:Dehaze=\"+7\" crs:ToneMapStrength=\"0\" crs:ConvertToGrayscale=\"False\" crs:OverrideLookVignette=\"False\" crs:ToneCurveName=\"Medium Contrast\" crs:ToneCurveName2012=\"Linear\" crs:CameraProfile=\"Adobe Standard\" crs:CameraProfileDigest=\"60AC1A2E4B4616A5F94860B8586E09F4\" crs:LensProfileSetup=\"LensDefaults\" crs:LensProfileName=\"Adobe (smc PENTAX-DA 55-300mm F4-5.8 ED)\" crs:LensProfileFilename=\"PENTAX (smc PENTAX-DA 55-300mm F4-5.8 ED) - RAW.lcp\" crs:LensProfileDigest=\"66A57B210D74DD4D8A50AB84E129F65C\" crs:LensProfileDistortionScale=\"100\" crs:LensProfileChromaticAberrationScale=\"100\" crs:LensProfileVignettingScale=\"100\" crs:UprightVersion=\"151388160\" crs:UprightCenterMode=\"0\" crs:UprightCenterNormX=\"0.5\" crs:UprightCenterNormY=\"0.5\" crs:UprightFocalMode=\"0\" crs:UprightFocalLength35mm=\"35\" crs:UprightPreview=\"False\" crs:UprightTransformCount=\"6\" crs:UprightFourSegmentsCount=\"0\" crs:HasSettings=\"True\" crs:HasCrop=\"False\" crs:AlreadyApplied=\"True\" crs:RawFileName=\"_IMG6732.DNG\"> <dc:creator> <rdf:Seq> <rdf:li>THOMAS_SHAHAN</rdf:li> </rdf:Seq> </dc:creator> <dc:rights> <rdf:Alt> <rdf:li xml:lang=\"x-default\">THOMAS_SHAHAN</rdf:li> </rdf:Alt> </dc:rights> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>adobe:docid:photoshop:9d690368-3c25-11e8-ad1a-c81afb47333e</rdf:li> <rdf:li>xmp.did:847a961b-d5ad-0c4a-821a-29a1760dbd3b</rdf:li> <rdf:li>xmp.did:9c44662a-8045-4e48-ae8f-6e12befe9a6a</rdf:li> <rdf:li>xmp.did:facb6500-2e88-f84d-9215-aa99c7e4a43f</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"derived\" stEvt:parameters=\"converted from image/dng to image/tiff\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:847a961b-d5ad-0c4a-821a-29a1760dbd3b\" stEvt:when=\"2018-06-05T17:47:43-05:00\" stEvt:softwareAgent=\"Adobe Photoshop Camera Raw 10.3 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:609b3307-1de3-c74c-ad87-1395c95593d6\" stEvt:when=\"2018-06-05T17:53:43-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2015 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"converted\" stEvt:parameters=\"from image/tiff to image/jpeg\"/> <rdf:li stEvt:action=\"derived\" stEvt:parameters=\"converted from image/tiff to image/jpeg\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:ae01f1b7-b777-404f-a7e9-9b4d667bb66e\" stEvt:when=\"2018-06-05T17:53:43-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2015 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:609b3307-1de3-c74c-ad87-1395c95593d6\" stRef:documentID=\"xmp.did:847a961b-d5ad-0c4a-821a-29a1760dbd3b\" stRef:originalDocumentID=\"5684ABE1786A5D55095E4B0F2AD94CCE\"/> <crs:ToneCurve> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>32, 22</rdf:li> <rdf:li>64, 56</rdf:li> <rdf:li>128, 128</rdf:li> <rdf:li>192, 196</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurve> <crs:ToneCurveRed> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurveRed> <crs:ToneCurveGreen> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurveGreen> <crs:ToneCurveBlue> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurveBlue> <crs:ToneCurvePV2012> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012> <crs:ToneCurvePV2012Red> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Red> <crs:ToneCurvePV2012Green> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Green> <crs:ToneCurvePV2012Blue> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Blue> <crs:Look> <rdf:Description crs:Name=\"Adobe Color\" crs:Amount=\"1.000000\" crs:UUID=\"B952C231111CD8E0ECCF14B86BAA7077\" crs:SupportsAmount=\"false\" crs:SupportsMonochrome=\"false\" crs:SupportsOutputReferred=\"false\" crs:Copyright=\"© 2018 Adobe Systems, Inc.\"> <crs:Group> <rdf:Alt> <rdf:li xml:lang=\"x-default\">Profiles</rdf:li> </rdf:Alt> </crs:Group> <crs:Parameters> <rdf:Description crs:Version=\"10.3\" crs:ProcessVersion=\"10.0\" crs:ConvertToGrayscale=\"False\" crs:CameraProfile=\"Adobe Standard\" crs:LookTable=\"E1095149FDB39D7A057BAB208837E2E1\"> <crs:ToneCurvePV2012> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>22, 16</rdf:li> <rdf:li>40, 35</rdf:li> <rdf:li>127, 127</rdf:li> <rdf:li>224, 230</rdf:li> <rdf:li>240, 246</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012> <crs:ToneCurvePV2012Red> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Red> <crs:ToneCurvePV2012Green> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Green> <crs:ToneCurvePV2012Blue> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Blue> </rdf:Description> </crs:Parameters> </rdf:Description> </crs:Look> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>���Photoshop 3.0\08BIM\0\0\0\0\0PZ\0%G\0\0a\0P\0\rTHOMAS_SHAHAN7\020180523<\0024513+0000t\0\rTHOMAS_SHAHAN8BIM%\0\0\0\0\0*\"���Ց\'�-ᜱ>8BIM:\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0P\0r\0o\0o\0f\0 \0S\0e\0t\0u\0p\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o�\0\0\0\0\0\0\0\0\0Grn doub@o�\0\0\0\0\0\0\0\0\0Bl  doub@o�\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@r�\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM�\0\0\0\0\0,\0\0\0\0,\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\0\0\0�����������������������\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0v\0e\0r\0v\0e\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0�\0\0\0\0Rghtlong\0\0�\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0�\0\0\0\0Rghtlong\0\0�\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0]\0\0\0\0\0\0�\0\0\0j\0\0�\0\0��\0\0A\0\0����\0Adobe_CM\0��\0Adobe\0d�\0\0\0��\0�\0			\n\r\r\r��\0\0j\0�\"\0��\0\0\n��?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r��C%�S���cs5���&D�TdE£t6�U�e���u��F\'���������������Vfv��������7GWgw��������\05\0!1AQaq\"2����B#�R��3$b�r��CScs4�%���&5��D�T�dEU6te����u��F���������������Vfv��������\'7GWgw�������\0\0\0?\0��l�c6����.m����#�*��Ⱥ�길��V�+-h�\n8�����\\�܏{�3ZG�[�Ce_gi�vUK��,\\�i��%E�d��v{.`��I\'�6ve�,m��\0�i��и^�׮���wƦC��,�X�Kv��O?5����=Nʺ�#��,\0�<����Q]��g��D�Y�y��H��.��t����e��d��&5~�g�[��}_��*��{-�W7���D� ��[]s�N%��6��F��\\������m����R|<�/P\"\'XqvXe�W\"��CA� ��;�^�OO{�2=7���#����nn�D���\"����8���)�o���9����^6������m8V��v��![oL��7�2�Ya�\n��k�����<\0�enyp<	\0��ҭu�j\Z�\n5�\"�pt9;�р����eo.��ݕM�j�ri}O�(��X�5J\"��F�SE��Z�s�%Of�h\'Tk�mt�ơ:֓O��ᨠZ��|W��47�VKq][:��hi��Q5̬�l�<�?�r��]�!���oQk_���VpX���5#��h�2�3^3��<!J�ȵ���k�t\nM��$�5jkD�8��	��g�2��-��>� �<]ٮ���%��c��i�t{(\\�3we���H�9vؤ��\0W���@�ñ�K��O��\'_���>�K�iž��CU>��5�}u�����]�J�?�����s�V�}�s �k�*�>�a:��,m���U�E��������c���wn���tZ*w�<���rq,{]�3��=\r˫���d��z4zW���q	���u1�����5�}�X�B˨{�V��]e��L��)l��l���[���M�6]9;\Z�cY�ÛS-3�c\Z�����]-~�o1��0����l9������(�<�4i�l�~�c�ݙ؍H��w,���b����O\n��H�z52q\r��c�{ɀt@�V��������9\nM�����H�)R�^$��r�\Zh���\Z4/�M�`�-<�Y�t��ؘ��o�#�;\Z%����2��케w��+�}&��(��i������\\	f�>k%��8�6�L 2D���a�A��Ž�sa��Z	 ���u����%����t:�ߑ/�pWY�ц��$F��0v�kgO��>��<:��,f�&��$s����K��:OS��\n�\0�O����k�͎\'�Wn��l7d�/l;A�2�>>[����p����o�\Z4�dM͏�U�����Q>\\,�8C�c����ư��zE?Y�3�%���s�H�4���9�=�����Z�����;������#��_;�U��s��>�Um-�ӹ�G��F��a��[qp��cT�\0�\r������իe�̞Z�0<J���I,���>O��4J\\TNͺ�du+��ky-q\0��B������D��X}^�f��ה��}�����7����[�N��zO�DϷ�?ͽ����ٛ+��8��s�pt����s?��?ѥ`�Ȕ�D9�Q�e~�m-�蹧BpBI�Ņ�|����ِGP�E��h��~|�\0����_�k?�y-���Q�&:��c+ef+7� v*���`�U���N�||+������~RJ��Llc��ܪa���As���&���b��x+�ʶܞ�ks�D xj��Iwf2���\r�5���N�:�t�[���֓��+�45��T&�e���pպ��6AkK\\8Zu�C�$I�?���v諶�rN�\r ��y��Q�����x(�O��x�C�V��OWO�3���,\0W�~��s}�\0�$|W#�c�\r��I���IbxOF�	����e��s8h��7.��;��1�Ag�:���d�\Z���y��>�\">\'E�՚3 ��T�d��\0�yЕ����5]X�v���}&�ٷ�}��94_���1�c�����1��Y���\0Ap[�Ǟ6�`D��\0���q�\ry7��E�/���]��n���K���~y���m��M`���dNݪ�N�]IհYEOx\'��E�`���c�n���[�W�ҝE���Yef^���}�����t��_\Z=^��\'p�;��I�k:�6a\\�0���}c�ZI�����G��{,��\0����o��$/�\'�ִ���{�-o����}P��b�\0���k��y�l��B\ZKKx���k���	]Ө��{�>*0Hа\Z7N����f�5݂T����=��!t8��Tݧ�?r�v3]{MM�]$��ցf�5��\0���v[�liR�z6K2?D�73��X9�7\'�l{{��2�6K^�\0���q�=]�3m�֝��\nm}u�J$�eV߬5}���t�x��7���y&�mV�<#GQ�����=Э�&{�pV�9���y������EF\"�A�����ZUGt�V�%���P�ƍ�<Pq]]M.#B��K�US��uDF�iYp�+\"u������7��3Xj�q��;&��j��쬟N�;���c��X#����� y��c�ݯt��-\0�3\r����cc��9��1��}�<������\0����\0n�����O��pA`p�\0	c�쌗�Y��,�if�O>�d�mt��������\0pkj��cz��A �ĉ&\0��;������ic�����y�\r����מ`�r��%�xoIЀ���.�y-����.l���h;���\0EQا��z.EY�>ʃ�m$��<{�oӭ�\0���_�T~�\\[���h�n�mh�)��~�}�Ah{��X��\0�H?Z�e�ƭڜv>o���֤4��2}Ʃ埒ݣR -.���P�n�单�c�����q12k��\0�PX�&�V�	g�{ŏ��*X�4��̕S��9�g��1뾰�e�\'Z��\0�Է�_K�`D|�s��.�8��76��\\] A#����ܓX�u�@6a�##c�;�\rRH�j��gUk[�������t�Yx���D\Z��S���/���4�<|V�Oζ�͝�+����{Z��U��֢�o%	�ƌ��\'��{�Q�Hhʀ�}�ny�p����Q������\0����e�~�����\0�zP�\0�؎ MfF�L�\0,���^�]U�\0?�^kwvS����L�6�\Z�\0̫�\\�Q�םM�\0c��\0c�k��Q�s_�{�z�?�5�}���f��eu�osX�ѱ�ƀ\"����ѷ����@�-Ǉ�\\D�����.m,s�Ɨ?h�Hy��.=8����3�?����2���c��\\I\0���s��e��^�[�~=;��xh�֙�9�n����mj�{�:].�ʈ�ΐ������p��^�..`��v�G�g���&7P��P���.��!�[Sx�Ok�o�\n��W��k�ť�7O���S��i���K�k��:�X-��&��\0���Sg�1Z�o�y1�Ν��zfV.&��g���C�����������H���BD\\j�wc�	JC��yw�{�{ui��=\rx{e�Ӭ�-;n�O�ֲ�D�E`q�qRwQ�@��@�?�F\Z���[�[�o\0��3� �\n���Lh\r�۵��?��{:�M\0��q�lq?e�jw��q�r��\0�����}]�L�6�$��c����N����R��6���\0lV���M��������s�����Wn��b��6��m 3�;.�\0����H���X�}�V��s�z�w��r9���\0�����^?�h.�)���.���\0U�u����沍���]�E}5��u�����ꚲ1����ߔZ�w?H��i�|?沎o��d�zv3d��X>^�܁g���c��_Q���i���y���nc�qSo���&rx���\0]���\0�S��pnǪ�z�zU>ѵ�#x6��������!���ӭjt��fQ��8����K7�>������řO���\0��xs�y��\0��\0I��������~JIq�X8X8d�<�xǥ�o�P�h�;����+8�TT�`q=��(�蟥��T?9��~��U��^�����p�-i:���\r�Z�41�?�6��\0T���s���7���\0}���m��Ov�k�V�DU��\\�\\5_��5T�蟥�o�u[��q�;\'u���ۏ�5>\Z�\0�I���\'��3eO����1�U��n�}���>��?G����Z�m��lƘ�{A?��{:�{����U��\0�����\0׹�<7�o����\08BIM!\0\0\0\0\0]\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0C\0 \02\00\01\05\0\0\0\08BIM\0\0\0\0\0\0\0\0��\0C\0			\n\n\n\n\n\n	\n\n\n��\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n��\0\0�\0�\0��\0\0\0\0\0\0\0\0\0\0	\0\n��\0:\0\0\0\0!1\"AQa	2q��#B����$3R�����\0\0\0\0\0\0\0\0\0\0\0\0��\0:\0\0\0\0\0!1A�\"Qaq������2��#�4Bbr�����\0\0\0?\0b�\\k�^qi�M�w��	�|�j��N��=� %��f�׶�}-���:jY\0�$��\0�>>|�\0��ۆ����6H�8Z��It��\Zex�!�h�q�\0�>1_��.��e����\"��G�$����<R�\n��b�99TNi�f����wx��\ZN�p������E�~JcC���V^���=�j$��jdf�NA�y������o��%P������(�r���ԛT��CR�\\��,[�۶{~|}�8�\nՎ���39c����܍0f�cb��9��\0����@k�a�zs&[��Z�(���<��Y���o��������B��*������;*��g#Q���iu�O+˰���u�Ef;�۹A�����狘m���P�ɄZ�N�#�#�l��\0�׎9�Z�r���.�:Pjd��}�|����ۊ�qga\'h�F�.��uv���U���>�������߹ ����r���Gr�w���e���V���;~_S�.��٥<��A��Q������UQ��� ��}O�<�����ke=���匐6U�CGQqq�J�߶s���\0��pl&8�ua�*?�D� YA��#\0�ǿ��\0��1���9��|W�\n7��I�0ѩ=�c#��+l���V�ک�Ci\0DL���c����G�\0٫��T��[�:z�h�G[�_5������8����E���/��.wwt[�߫���\'ݑ�����r?_�f�?K��9Nh�۰WV���a�����D�������\0~>a���_U�4�E|���rϟX^�/�Ƹ��BUU�F��R:;�����M�<�\0Q����T���b���v�#\n�ȿC���Y�V��Zv�q��p��nհN��S��4��!\Z9y�%h�n�ز������m0�-m��-�|�YNʊ�O�Q�����0Q\"��~���i_P�њ:��p���ӗ;�EM��Ͳ�	��W\r�ԩ)&��I���o����0���\r�ȳ�K��y�]S�4�\0�Kw�CGQX���.w\ZB(�>�4*��U^��}�@7�*m7��D|2���v6���>v}��ݫ���W_m\Z��ISU����U����Ep�r��v�$�������2BC�7��\n���!��ʃO�_ڭV}���5E[��d��T����?,���s�}\\�}��@��C��!-w��4����+Ӕ�\\�؜��\0��o�5�Ѻ��9mdN��m�R����܍ķǷ�����c��\0|\\mtD�5������LЊp��%�@�	�,�S%�X��v���ȏ㺺*��VFdb�.�v��1���UUC�;�����K�rӶ�A�d2��h��]����DNv�[�X���Cb�O%d�-cc8�~_����J0i���܊\rOQY�i�s`��`6<����}8����	]tL{\r�@:j�$Ɔ��c*��8*Oq������jY]n��T0������A	�������x`�E�ʁ���#P꫆��8����Q����1���y?2��\0Z(�j%�\0,>h�l�I���Ft�����\0?^va�4dZ[��k�I+��1 E+!T�Gy\'�x�s�W �m7Cj�EQ�id��j�-)�~y������Z�YB6N0�G`w^zk��F��V�g�\Z��Z���/\"{Ӧ�,\0#��\np�-l�m���Y���A\r��f��7�G�w(5=����l{�2P�u?�Q��ӡ�`*���0vm�����\n��\ZX����p��Q+�u�IW3��}w�^az����Wݭs;5\r[AW]\rDq��L�*c��Sl�u.\'W��!���I��ߟ��r�L���u�TK����|�ǫy���&hcMKz��)���:�w��#��^w�[\\��*���BcsE�;�|}��T��3��?��>�y��g���/Fޡ�}��{I���z��D�S�gx�0�����;�db#t\0�\n �M4�Z	l�v������#�:h�7ǭ�Yd���a��7��U=U�.�47�o��.�j$�����ɸ�����W9���N.y?_�*d/����f��-u�?��zӭGA>j�/��%���D�\"�:�c9\0�\'��:��a�˯�}\\�	����k��Dv��{K�|��~ݸϸ�S���u3C�Y�>�\"�;c3����Λ]!i�.��:J��uBu$\nn��\0������rO��ɽ��@QQ-%�Ii�FX�8��\0ۀģ�h����W/Z�SRki�o0<��tC�>%�l��ÎT*2�8�Λ;+,\\��V�ޭ�R$Bcu_�3��\0�\\ք�9�f]T5��[E�Z�EFD�6�`��ÿ���္�*�=Y懺��A�3[�v�3dӹ㢤��9�S����[�¦�î	��/ˁF�+�B���\'Gq����������\0���]�N0{JǪm?5>�Zɡ�Qd8\'\nW\0����|��8]3�}��q^�:�\\�TL�b�Q5L��w8���������\0h@�3�t��P\\*��*��*U�j�D�Olgaؑ�~8�x��GT\\x���ǦS�ibN��*���N���e�t���M\n#����;�$%!C!l�*�Nύv��7����?ob�C�͙�a����T�����B��� s/LF��\\\r̃\nNCnG��E`r:��G������OM}=�/SzS��_i�l}\n�z��LP��9���$h��ɎKo2�ZF�H�5=7h�HrE���M%CL�@:o{o�Ͽ�	��(��c�m�>��mg.���ۦ��4�\'I�ǵ�A`!��\0U\n��H�wf����N2}=��$��x�E�E���;z���o�m�S��!I��&��-D�SI����|7`r�Hρ�\nyd�k�d������ﴯ������Z��SUu\r�[mPx�I�X����#S�Me+\"\"�r�_+��YH����C��j��w������|Ez@˧a��F�F�@R{v�;g��M����Դ����O�V��8R�7����\0���Na ��].\\v}P.���6\"���9#�?���\n�$�����ְVM�/��N������/Q��]��h\\�-W�i�)A�ዜ�|�~�\Z��2�t|8��J���-z.1@�H�������\Zxeg퍹)\nmqm��3�%A�N�H�%�5�k�NZ�Q,�Q�\'r����qV��ص�����|t�ƍkKR6�\0n��\0�\\^e\0,�/sw�&�Y�����\'Q�&PA$�۶~X�q��hi.�	�\0	=�8�,*�.Is�D�E`ӲԚW�ƀ�+�g��q���*�3C�ΰ�O�R6H�m���+���S\\uN�Yx�G�<�~?S� �(#��N>��4V��\Z�y%��\"-$e2�0��S���������`�\01���oō�?ڴ���.\'�Q�CUv�Ӥ4�Rzs�J����<��̻�`p{�Ծ(x��!���s���i�]wd�/p1��e��m�*����i)��lv��:����W]�er�\\�!�\'\"N�U/s!�-x�����U�}8sr\nH�%V�.^s�Ѩ.U�)&P������3L�RC$yuh�;\nm`��4=���0���e�V���ܖ���9M�}j����\ZDɨkz�F�yN�H��k+����D���A��TD_~H��su���[1n�\ZoE��i�}T�CC\n��6������<�@˔�H���A�`k�Hj�Cw���j���Ųx�z�$V�a��l���f�XS�c����(����(�����|�� �?�p�FϬt��Vҥ:�\'�p@V���r�$d\r�\'ܤ��8-E+5�����q.^Ì��i�`�y�=�Z:��e\0h=���c���%졥����{�Io$�Z�U^�ӈ�Ҳ�ӹ\n2<����\08[��)�a��j]n֭l-�<�����O���|���d��F��toh�tm�`K��X\0g돠�\0��EO���F�.6��].�\'Y]#���$��\'�����!�Zڂ�un�ګN�Yw`�v)�p�|�\0�ŭ�����$f�VZ-`i!՞�Ac�����Ʌ=}۔�sޞ�Gy�\ZY� ����\'=�?���`Y���lS3�M���xz��R�U	\"r\0^���>�0�k�/eU�6�.�| �&�-	�<��^�ܔi�ǂ�{p���z�W\rG<ӗisr��ק��5U}\r�#�&�{G�8�~��x)�3���%����5M��i�4�����$y\'��$nm�QR��E��l�W�%t��Z:ɑ�5�!Y�����Oc6,�n !�ǆ\\.�8��{u��Ti*��|����[���J�}d|F�޻�3�e���7�0$���[��\0�Ӟ�����\r�i��~G%��o�q��_��Rk+����d���A�M�D*�rw`���;�Fr.2���n\rӡHZ�As_�>�t�h^\\�Is��E<��wƃda�W,Ca�fB��$�q��E�[F.yy\"a����D���+���?��7\n+}��̴UM1~�BL�)H\Z���w���nUc�e�@�O^J���D\r�뫨m�.�l�v붚�i\'���n�Ũ�;�<��.~��F*�S	�����JXJ��x �o=�gn����i��o/�צ�U6-1i�b=Io4W\nĢ��ۭ2A���*i0��=�͎�T��,s��Yc�T�C/{-q������UD�c�����>�yy�{u?7�\r��o�OD\'���i�h��6�6�9\nd`����������_��������L���;��]x���Z�l��5�/I[J���)G���d`FA\r���w��ۢM.#���9�io0�F���j�x���-!?!�������T�:BCK�MN�^Ti�QC���yRq��p��Ns���ڈ\rA$BN�Q�M�+��?n;/����9��5�bs�q�|��\0#���+\r��NE���:\Z����\0Td\0����R$\'������hur�zm8]I\0g�c��,{bu�7�\"z�IGe��魱\"@ЩB��?��ߏ��CYQČ�i�d͍�x�گRS�\n�d�+�⒞yc�n����Ѣ[�J)�fg��ᝌA�J&~�!�J\\k��)������>>?���=Ѹ�X˗��u�S\ZVެ�Ǐؑ�>{��Yc�\n���!1\Z������i���Z��I�gKU��c\'\'h/��\0vP\n��Y�Ҵ�s�ϯo����e0�V�*MA�b��`a�z��`������g�b{��	�)c5%�_I#�\0)B��G������\Z�~�[�ӧI��D(dwU�(_k�pX�G	��v��Ga����PW��ڊ�����\rЙ��W��NYa��X�cYyI#�O���_T�n�}Gj�oZ\n���ۥQ��~��{�[��BC����˴�H�+,b $odu�5��^�m��`����!���Yt���ѧ��GV**\"�`)ꨒ�\n�e���\Z����r�H\Z3C*G�؎�wm푏s��=�U��s�_�|-�&����P�멡�%��(��G,\n��2T*�Š�L1�k0-�`�ݘa8�]�h����5M������\Z��V��^�Ԋ���%���:�E�����W{��x{*A��w�������c���K�C���&��TZ^)��N�-j2~x��~�n2��j	Sh��iygSҬ4�:�$>T�����>>�H���Z�?0����䆓\"E�aۿ0��i�\\%��^.�Q��\"1��π;�>|i�{=Ik$}� Z�����݀	|`���]eDQ�\n>:b����>���dq\ZC�.@��|v�����Fl�fR�t��\Z���}C%EX��T��Q�P�ZYZd-�M�q,e�cmړ%r����ۂ���73ۚ�3P\\������8k�1�(j�Uj�����T���<\\;KV��*v�Gl�by��1�@\0�\0��r�\rQ}`Y�Z��2m��(��jGF�*�!�r�?��o+��pI��2�)A��߯�֣���iMF����\\��	\n�4��8.X�pr6�$�\'�B�kf���\':{�&^�jm4�®K���AD^��*H��Hi���pY>�e��`C�!âSo[�vo�Em�Jr������\re��R�R�v6��2;Դ2&!�H�7�*,A�B8��\\q¤_V3d4�ߵE����Of�X�2Ӥ�T�c�������IU �UX�L���)���>mwqww��\"�|X��4��\'������Yu�5�����Ak��)���k�0�Wu/,Q���%�N��/C�Y0K�\\M�3s�v����ٱͬ�nQ늚�}�[�:��QI�9JKaz����)Z�`��4��HЩ= �(X(c��F��6��x�p����:����J���MZ���CO\r]��P�u��$D�@Co\n�ԅ\0����J�-{;���\'��c��v���8Ko�~R��	z���ZK.���jJ4 =ј̱m\n�L�Ƿ�l��s|Z��r�o�vG����Yek#0L\0�*+H�mmZ��bFі??Ӆ2����pS��R��u��x�,���)�だ#Wy(��$�ۍ��W�s�vd�F;X~]���>\\k╍�	]<2F�����t:v?�uʡF�<���C,����kE�CԾS�+�!;�ñ�3���|��r�h�Q_�|��嵽(�{�Q/��|pe?tiV��Ӷܔ���i�5D4z1S����7˷����a�a�����y�/VA]%�wL���R��+�#7ʺ�s<_�c�E&F����u��#���K���(#K��1�ا�\0�uC\Z˕q��+�Ϩ�9ۥ�����a-BM2�;�D����=�N�\0�^��qE5H�s��67 �~|��\Z�	��$=�v���s.��)��wX�j�\n��a��;�ǻ�\'4�F���+���\rIC��n�[��Q\r=���N�UU�1Ҽ��E�B�e�H!�+m 3���;{:�[�l}�*���gޫ9eC�4���)ԼR\Z�\r�����B�n*₨L�<�;�L�#��{u����F��~~(e���n��--5T�hmv�i)�V�@�Ґ�*�ݕ�jJn�E[���S�\0�j;(فc���<��59�7��(�F��ּ��.����_In�����Ks��N*����bHJ����L+��2�6�)�h��\"������WGy\\~=u�\\�8�QY�s�r�U��Sl����\n��KO[\Z�J��ƅ��E$��Î����d�[;s@�1�Z���oesc.��׺tt���\0��j����WMS>���Km�s��=��.��G�	�ڊgv�v����YQ0ٹ|����m\'m����֩�\ZG3�j�VN�DI#D���l�&��\\er�Mͫi���`��su���k٨��߷�-4�IAj4�0�~�~c�!q�*\r``�s9c�	e�l�K�ǎ�������^��<7�;���X*��A��MQ�K$��}�qYG��>��Y(�WF�\"��VR�:WS�؀\n|���<�0,�j�lT3��v�Y%�+�F�����ӎ���Q#���u����i�7gw�v?,yi_��,����R�CV[�)Im�uY���$��`g�������&|?[^.p����]�Si�!zgpJ�9��J�r$!j���I��Ң��W��tf�>\\P���bfqq�������ְ^���5<r,5&0\Z2�C7���,0���g��2�<Z��?k���L���7NZ[57����M����R(Ox\"\'#~��98���Xm�C���[tV���Σ��e߮�Q[u�}�Z}5\r�h�)�F�{��!r��HP7��?O=TA�qi�S�jl\"�q���e�����_�+k�B��EIЇ��KӰ\'p��2�����(�Ӭu���;���ܟ�L{n�)�t���\\��\nK��t����QM2\nt�-�̻�\"]	Yd.��$k�������7���!����իKr��:\Z\Zz� ��1�R��bI:+nģ�]�������9��:�V	�-ij&�˔��ot\Z��oi[���t��R�P�����#�9��Ƌ��I#7P��G3�x\0?{�~<�M`h�)��z�P_!�Z�W�=e���ڧl���(��b�!��;hT��!�4��}���^��e�G�����/�o�Z��EuW��E;�iã�������#���7o��5���C�\"����\0e��gf�3����|��-U6��u�D��P�k��\n�a�W`3�����=��/��+$kNĤ��:B�]�L\Z��E�(\0̊�;�����+�8A��<YE�9yO�6�G�`0eP{v��D�W�u�_2}.W�x��ᐌa���\Z\' Y+��s݅#,��ȰILv@�c��=��`���j� ��O(�������j{MʛqBcr6�����@8�y|?,�Wt5�����Ut�����\r+D� 2�S`������p�I���DS��ZY�&�n��[��cH�ݳ�g�������\r	�����\r:ƁT�v�L�jRzf�j����W��Ke��K�z$e̫�H\0w>D���&�Ղ��ܟ�>���L\0K�Uji�os�Z�]s�U�kTIC2��dd���\Z��+Ʈ����k�r���dc��\0����k�SV_P�L�t��j�t��FDR6ւn�n\"�m�)2���QخH4�RHϾ}:�r��	e�Z�*�Ҽ���̗Z�B�UR�(�5;j��\n2���������N��xӼ��칭��)��\\߶z9���i]1gԺ�K�5|���ГV�S!��#GI��=0�ۗ�!��i�4�z���予��[�\r�F�S�o\"0����[u%%:�Kr���N��#Nb���3H���!��3�&C����T�V46M�-__q����Au�|seA��r�>�41G\\�ij�45K�Fi�\Zdi6���z���s�3�&&�X�G����;���W�^)�t����^��0�xM+�\n�ZS�!��R�bøwG	d�sz����2���_ ��PVZl�յ�茒�ts�W�cyQ4��`��̤?��AÚ蝣���<�)5{L��F�>����/�Q��=_ku��T��X��\0I54S9>rKH��<���:6�\\�v_2�&\Z�3k[�z�X:��WLʬ/�����©(\Z����ޫ:���ˁkR���1/�\0k#�>���	�c2ԕe���-�^)CpH*?~���ݣ�(u|���в<A�I=��������X�/�J��*�G.Z	���N�s������H�.F��x�TO��2m$��>����Qmg2kGr2���>�M	�uc��|���ZY�(\r��S�IɎM��i��53&1�����\nn��vG}:�P�>�S�Tm�n�~��oSڢ�@z3��d��Nsf`�����|aOv�ށ�$�����|<�6?��.ppKG�c�*]3ʭwj�ȴt	O<���۽�|Tn���_l�j}Ι�0�}�\Z���\'_��o�wZg�u������R�����[p���±����@��$ш��,�$����%p^B���rb떀�})r�)um��=����⾗FAM���N���dC�#�c�8BbaR��3�J�;5��C�=oo�\Z�����؏B�,��R�\ZU`#�HS�����k���2���\\���rS��_�Cr��_��l��L���].o_t��d�wy%�X\"I%;0C2��d+���hj�ƃ���B����j�Ϡ�6���:ϕ�����5UT Uz��m6���c\"�ȎH!�o�����?�nmm�G������0;��`��럽�//C���|䊧H^���P̰߭�R:�&炱z�\r�0�go�	\0{xO��q��������.��Ew�Ǐ�nI�Ж�C�5�2�b��C��H %�q�1����,RB�Gr���ZF�nO���y#��������1�YI��j���v��+G\r]t�5���W`Q�ԏ$���#k��3��|k��gx�\0��\0� �F��{|/4E����\'�O������ b��m1�k=&����5\\�e��;v�$��i�eI 	�ќЊ�ԓ%ix�_h#�	e���[�i��\Z��RG0�SmG�1�	2�ɀ|��:�>�Ѷ[E�Jؓ�-����ZF&�62�+|�Cw�4��GN�(?��W���K�%ΐ���Z햔��/w`<�IU�-F\rv��>*��b6��l���	�S7FJ���1(��禨e� �����\nf�B��G�U?ק3*��k�t\\F�:ܪR��$s��m��P�Y��Ɍ�+I��8Z0F|s˟A}O��6�c�r9��Y������&��7�M�y�F���d3Pۡ����\0����)f�Y�;���4a���k���\09&���O<�zb�_r��P��m�\"���$����Dm�@��TJƝ`_������p���z��*�Ij��-=��D��W�˶���V�t\'.����\nI&E��\0Q<#��$m�)��0�:v���\0���HV�婒�KU3��\0w}� p�\r�>����\\���bz�s�FMG��:j�o�ݨ��zG{m��^ib��8&C�Rm����l]�3뽮��̞�\n`b9��eꎦ�m��a�ʰCX����۳�)Q�0�ђ���\ZH����ٰƬކ�Iv8���\0݁C]t��i���I٦kf���ZJ%��C+B�I�y:�����\n��u7�\\g��?����������M���T����O�]��{ն�)�k�@�K%�\\���P/lgxݞ�ۻ{�W���H����w�[n����<�|��6�YO돗t:��f��45kQItԕs�SN�X�L͂�[�#������پ�\0�����H��_�KN����C�HWp�oF$�݇�����2>}Q\\d������G^o�W��K��2\0c|��\Z�8���*W~���sEs;VY��GS$�<f5pr����4�̐�6��v�k�\\��֋�!��g �#���ǥ� {�d4��(�e��VeG���Q�.��^�#�Cri���w��F�ƒh�ћ�b��\0�\Z���z�H)����l�\0���-\'\r��]���۩=�:�5CS�*^J}�F\' �������\"-p��9�	^��}eַ�t�t��X5��P�І�S�p3�$�w�ȥ.��?���x�HlsD�\0P��5	�ֿ�i:\r;n�Q�F�k�hm����31���(:�Y�T�]�Z<����&�֏�����f��/Q+��eݹ��&��יڶ�.��I֞?��D���;���e3����ˠ���&�����^��Fi�ӕu6�K�+^���=Xh���Ghbtܫ���4;F���*9�\0Q�:ʪ\n��U��*����V�ጬ쥣hT�����%q#ip�u�D�H9B�.��]���q�\\]��TB�p�<\Z����n�`���ޛ[e�c5����r��[��\n�k�V�*��0W}���c�Z\n�����/u!���,z�Ղ�p��3v���Ь��+碩�U�fyz1U����v��\Z]�2ɕ�0�_r�On�m9�>�I���47-ue׼��.��_���ͦ롂9�S�/F�}��̟�3�J����l��ں�d{]&������h�g���\rE�\Z+u�\\�\'�ڴ��Q�H����A!U�����R@.2�`��JyX\r�=�n����<:��{u뿊��Q��P�a��ܳ�	$�����O�/Z#��u�1O�H��ޔ����\0l.3��d������x�����z�ȆѴeG7*�ItI�B�>ϟl(x������\rYV�G(앧0@l�;n����-w{M�����L�+u��KZV\\��d���x?�H�l�X\\�������Qi�X��#*�s����P�V��*i�nbA3ǉrA���\0���}\Z��حW�\0d.i/���VF>��Q�ǃ����������)D�+��2IK#�C�v�\\�3����ϊ_L�l�0\0M���<}gMg�Q�KWY!Zxi�I�$�\0��7c�8Q��iZH$3�4����z����#�e���\ny�*��/pR\"�U��EA��#YX�ʧyUuS#E�h��6�ۮy_a�����9�z���g�������OL)��\0�(��E%D��\"�;fe8��Hiި\n\'�G�st����^���o*u���Pi�[���P��JU�+�FbT�9���vw<#d��^.��C�w���߯��T�IXjm�\n�uQN�P�*���ե�LL6�ܥ�0K�8���Q���D^G�W��Օt�UT�SOM�\Z��T�$������\0���&R��/��-���sE�K��9q�:\Z��z�h%h�kġ�T�\r,t�l1���u�OI\"\n�B� n��믚������*�KErmAI��]ѣ�UIS֣�Oޣ�2���eA#h�s��bu�[��լ��7>�yC�/:��G��m��n�V�$�w�j:7�*�\"1f� da��VD���)뙮�>V8������a�q��\0c=];s��Ϣ�T\\���A\\�*����$0�5º�gw�Q\n��c�a���a��`��n|�\0��n7S%E@m�nHώD[�P��ۂ��Fs�?�׌]o2>�@AJ�nC�U���{U]<�w���b�A�÷�����nN\ZIQ��l�^�#]v����t=�M�&0���1���44�־�M��k�\n٢)��$7jg��Q�I��ۿ�<^��sӒ%��=����J���el|>|l+(^�9�i8q*����m�e�VD�c����8����u�h#�cH���Ԕ�@MD���������?-kE�c{1e�mz��zB�+Q�\\k�)�\0\n�Gvv!QQU�݈TUfb\0lq�{�h�(z茱��9��Ӕ~��/���*-m���8���\r=��H6+�N���I�Uc= 1*�T<��u=�>BmnC�GY����?S�<y�t|���� ��oLܹū4n���M�Y��u��i憢I[����)�hA&�c%6f3B��S��\0P4\r�����T��6M7����K�Ü���:�� 5q�Ls�T*�ZJ�;�F��k�ۤ!����Ŗ��䏦�u��H�ܦ;��;}3rQ��p���[�*��(���K�^�QO\"��%r@g˰R\0ځH,�\r��\\��xt3��V���mꗛ/��E]JPQ�W�~�V���*zN	�C;g�7f���#���U#b0��tꚛo9k�n�B�Xn�5��uC��aTf]���O�\\t���^guH��%�4j�+]�n����\Z��{������!��=;M!�QER÷N64�\r��)d\rߕx����ڟ�6V�	j���r����^�Yd�ĕ��K�\r��}��u\rrpY*aډ*ߡ��O]YEMs�GKD�?��U �\"�cO\n�$J\"�\"VW��&�.����햐z�\Z��mԕ��(椂���.4�G�Y�a0��Ok��fa��XʮG�m<��h�a�5Mc�\"�ӝ��L��KQS-e<���r�$*�>�p>��HL�8����e�q9U�`��cq��j\rw�2��R�#)����\Z��������¶(#���.<��9�u��>���܆T6�$#�a�6\n�Ob�Tc�߄��V��h����\"�W���a�WI�\r��ƅ�KqѰGn��$5j�M4ڂ��d��l�??��~����`���\0�5������\0k����~�ot�E8���1j\n3�1/\0�\\��~P��ԓ����B�ma{���:�&�\n��s�=�<����8�v&GX3m��`��\0;n\"��OʝOR�[d������8\'�� �g�����ä��Яh7��\"[=2���\Z*C�ü����Qʁ��y����p	�����զ�́�&��8{�p��ɝS�w����4�R�VG����#KR�(歨���y�`��¢�dB�ؓ���B����d~U�8���>Yd\'�f��Mw�i�6�h-���?���+���P:��,ƍ,Gb);p�!.����X��c����\0T�j�_\\-�+]����&��\Z.���l��b�=5q�M�?��1����M���Yrn�. Ґ����+��:b���ˍP��5/�+e[=�o�]2:�½�s1e7Q���\0����Q|ԉd���d�{�iadt=i���7v]э����30^�~j}���Q����;��	�T�twZyC�z����`{�I�0���d�{����lx�:�_����aE��y{���ʘ��XY�*i�\0����Q}�ē&��o����n��u�]�\0�텻Kzo�V�}0�}c�km����GEu�ڮ0S�����l��dbc��˄]�UC*#8�\0 3>��,p�a���SV?��D�n_uw7�mEŁ����zu�mn��>�r�`��-�r�f��� p�9��dx� �5r����	KxXp�o��dFW��^\\ ��v��n@�qZ�?�s�o�)��	���ǫ�]6�#�h��̀Em�P�b��\n\"BI�m��ū�.u�<םIIkX/7�J��MK��X� �1Ih��������2|p�/���H��P2p�;�ʫz�I?�uK0��)�t�*k�gd�*���� \0��w E�C��I�q���\n6��*�}��̘�{�O3���zt�\\ e�*6�1p��d\0FI�®��$��\06Qq���\0��DZ�|�Uu�f�B��#<k�#�������c�MU2:;d��� <�����U��\'��+������a�v����؜������Ec���\";��?��v�Z�I�K$�7�UYjJMM���pT��;~�ᔟ�k�w:�T7�P��w�@9�_CGMnյ�te,�B%F���dP��rH?����M���Y��@��*���Ss��,.`jA�e���=B��$��\0,@�=��x��W�����5	���;���Qp���z��x�l��\'����O��K**\'�\\�x�66���&��������(����.�tӖ�b�۩���UJ�A\Z���積�{�;��Ȁ�������Y�1��{�\0���3��륞~eh�\r}ƾ��y�dv����Ǹ��U\Zb�S�P�;p5L�kIi�>}tT�C[b��h��������^�V��o�U�t��^�JҚ�a�B�����Vp�8�+�U8\0I؃~X��>����ϟ�\n�e�Rs��\01���h�\'�?��$��Sӌ�1�U7�qD!*:�\"^K\Z>��E�H\Z.M��Or�Di�#�)�Y�)��\r�$����ۉ\n���<g�[?i�X_�e\Z���h�}�ۋ�ҢE���+�C#y9]�FH�� ���M<����\0���a\0a~�ki�5Vht��Ӵ�1[QQI�lr\0 ��\nq�T}�Á���{�QZ���R��=�M\\+zJ�:�UM9� ���	��89$�i�y�׈Q|�iu���IiD���Q�id����{3�J��p<v\0�QS�jt��_�%\\�wb>���^bj\n��jw������E�e	�v$u$>�����.sh�c\\I=l��j�B�Լ���R�n�kO2�ue51�?�X�0O`H?�-�$g}��_�i��!���媎�(&�w��R�Fj\r*�����Pr��U���re<�m6W��4�.��y����5ZU�0�Qը��C����C\0r[��[5CK������.^t���0�$���7|+�Vȁp1�kK�{�ʨ����C��\\�}\0��7�}�B�b�[\\��+72i�t��ST��)9��rq��i�\0�AH��n��Ũ9L��w�>i�d�����-kH�Kh�&9\r�[�Ƕ;��e�$�?h�����CZhke��V��p�<q���T������A!Z2��Us���������:k��$�{�{�@�q�+�T�I��m��\r��eN���9|I���=���^�HK�˖���H���ɿ�[�d�$�En?���\"68$Oa�A��[3xYӂ�\0t�Zv\Z�~`�{��\"ysOc��\Z�eH�h�Iʻ�������_?��c�r�T����|D�\Zȯm�:v�x�K|Nii)�y��FX��&YO`\0xP�\0&��yA(���+\"S۩��\ZT*�@�#�� �R\0�|8��_k�.��p�]�u�k��))��JC� te�	a��q��.�_N�\0 ��oEXq�\n�GKq��p��Q��1�t�lIaܲ>O�|O��b�}�\0+���_0u]���ԵΌ%X�����Iݕ ���GaۆT�s�{�˅i5�*�{���_T䲘�k���s�@\'=�!��\0˭��f�����\"�l�!���S�	A��\0��Ns���H�\'+Đl���H���Cn���0y8f�����L\\A8P&�<��*�mOq�K�z��2!]q�q#��#�Fx<0=�1q��꠬ko��6j�-��z��� �@O9=��r��sE��b�W�������Q���S�œ���l�����%�\Z��M�/誺�W]$�A��\\�¾�φ}���;`�y����#��O\'�Q����\Zb���:Ԇ6�SO�;��)�����S�4����>^	uD��M�+��','3 King St.','Union','NJ','07083'),(2,'Mary2 Lee','mary','22','1990-08-13','F','����\0JFIF\0,,\0\0��\0C\0\n\n\n\r\r��\0C		\r\r��\0\0g\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0=\0\0\0\0\0\0\0!1A\"Qaq�����2B#Rb����$3S�����\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\"\0\0\0\0\0\0\0\0\0!1\"2AQR��\0\0\0?\0�W�KH��^I�Q$Q�z$��U��#�!�[��7>��P\nQ	\Z�8�#]���u]��\0�*�8ŴjZ�c�<#�R��.��� �ҏq�A>gʰ�\0\rb<1�*��U���[��Ȥ�f�n6��ցJ��yQ)N�\'�>(�n]d�bNd颂�����R�{ܗc�W��cn^\'�D)������kc��sw����Sn�Nr;���Цb�l-JD�A\0�/o[{NoJ�#\"@\0G)�ݛ��v�͊Z�=Ȅ� ��w��%�B����64La����UxxT����D��>�(93�b]B���@���#NuA{ѕ��ZWT�2s9u���M�K�BI\'�t�T[�%=ji ����������٧9�W�ؑ�b��Z�P�2����F��:��n�q�7u�ղc�a\\�qWw!�X4Uw	e��i\rd!1?qU��+D�Ԏ�\'1;�\"˛��}i=�7qE$\rch��a�ǆQü_�2�i����@�T|��t�����$7����;�S�!�8}q��-���6~�T��k�Oq��Td�Z`��K6��H$h$�R����\nU�	xMxWʾ��_��mF��8�	����R�=�~gڄ����눿\0Ʋ>�na.��?�^�}	�YQ	<f����ge\0��n~G�ֳ�1o��JUn��ġdr��\0e�54��AЊ�g|�}JT��S����G��e�2�\0Z@uI\0�������(��IQ��_n�\0�C����j	T)��X���֥�\"M�R��	$��G��|*ؽ%�p�a�%��!J���޴-[%i����k	�/+8�I\n��������R�t)P:�\Z\Zb�Zl6sy���JU�Ea! �F�I����yi(;LLs�}�KS�#��]���醬��j�����Y(Ɯ*J�\0�$|�o�[{�\'.R��$o�|�1��)¤,gH�guT�X>,���\0X��bBF_��~-ŖxjR0�;d�r	=��+��K��,���W��+` ���=�^�<���U���\\.�ŕ,��JY2I�$�C;b�z��&�S��8�r��@G`�LN�IS�S�6�&\r��2�JR�� sT��`�͵��d�ݗPCh*#ڕ\'n�=���:\0<��l6�]��	#�����ו����Ez(�T�I�V`BKE ��A��z����\0���J2��fj���V#C;��p�R�=��@�4x�5��a\r\"�i)��S$ò5� U��%K%q��Lz�l�D��5�%ޕBN+�����S�$i�F����R0녾%!�4��3��	0���bj0%L��-Gg	��\\��\\t��|�\n���Z\\�K؍��Bs��9IFu#C��\0=��q_����xCIeAy��B�������^��ڈ��u�Id��1Ӕ�}Es���7�y�n�bm!�ű7\r6�W�VRT2i�B�QLo��<5�\'*\\p��\0�D�\0���$&q���%J\0`s$oL3�Z����}u�ʒ�\n��y���*\0�O=b}�\0�q7Nc�p��8���!s��Ó��d]ͤ<�z��iVWJФ�1�@�1:�Fx�|�q�;�V��?�3�3s�@w	A\0J��F�:��W-=9��B��5�O�I�>ڷ4�pt���\\`Ε�O�����.c��mOea��3�A&A ������C�k�1��킒��\"\0�\\��.mk�>��;D)K�����tw�8���)JI)l�&��k��5�����h�\nT΀�|��i�� �IVn���O3H�l�	4�{V��P�4�����$��}�Mb@Uw�|\Z_���8����X\Z��\0j(�}�U�������V*�שp�3�D�J���R�1JM��^����TiȞt�ß�$��u�P��9�5sr� �|*f5���U�e�$$���@��I��U��j�V,^���eu�G|�C��X�\"�Uի�RD�\"=577m�R��J��\0��\0�p����!�i��p�,Զ��l*���d�3�\0IV�D�z�F>�K��eД�L���JR�I�c��P�������i�L��itICa)��\'Ed�5 ��I�N���o��yql���RI9PHs0(�&R��{S:V7���s� ���u�r�D�-_��@�b��kŶcp�-6��)����5�v=��nѫk�6���RA1 �����X;m{��Q-�J�T�t�z4�\'�%�a!,�(�r������S7`\Z$N�}��6��=����0�9n}�˕9��;v�\'*���$���c�z���l���]�I>tr�L�J\nMH�C>�|1	��;�Gf3���q�R�9�\"}�f�\"Ā��oṔy����p�����@҅jV�\r9$�*ѧ9@���Lѡ���\'�ӣ�THt#��O����R|��\0]���\0�f�^ЮH�&��;�4JB�*N��齽�\0�\Z���8���Zԣ�r~@x�|�}4�z�ڑ�ͤ��\"9ER�fb������-�M�)R�Hʡ�^���	H���h�t����l�z�]O5�}���6|D��%M�-,T��`�::�<��V����̽� m���5��&�mIyH���D��I�q�����^�Lb�6����bxj��n	.[ݴ\n�v���Qt� Fs��C�>��n-ܸ�r��-��ĥa:6����JP�\'l��T	s	|��n����s�\0X0��$��O=*��:=M��1�o[R�{޼d� ����o��Ad\\�Ş��eP|.�t/�3|Eoas��o���s�N�\"�3�����Nl�JA*��Nރ�A��0������넸�j-ݫ3��Fd��d���V��\0�m,�z����\r!\"c`I=��d61�{!�xNƪ�n�q��eY�b��v���֜�CQ�4��4w\Z(��A��uD��*P���<�\'�N�QG�}��	�\'O�����[����U��Di�kB^�.K�K �\0�E^�6�k�Q��%ķ�}�S�$���S��M��џ]�I:A�,��|M┢2��u�A�b|j�C��ڕ �P4�Xaͯ��ɀ=����<��i����=�j���A�\0�iOG�Q+�Tv�Ҥ��W%r��9�T��(:��W�p���uOO�S,1�_Z��\nm�WP��T����6㉭�e%֮�\r��d?>t��jB��ܾ��suÁ�Ҝ-�ʂd$��z�ҙ�OVsl�6�A��+�L��3�N�Cx�	�L�8K\'���9�a#^���\0��;����,���V����$������,�⒆[/]>�~��E�AI雴��j;�Kt�l��X�^��	�+\\wBд��v�H� ��?q[�x���=׸����(\0����\"LF��<i��=68���s��\nz���T�?ØD�����?L\\O��-�`7M�\n`��+��V��(�m\\eŝ��[5�M=����\n�H�{���+ŭ�=���\r��V�A�̥������S� ��8���v(�o\Zk\"Y���I?8��AX^\'v��19m5�e�ipV�(�S��e0\re���ۣ�8�J0�&�R[�J�M��\0F��\r5��(�l�a��:���ֲ�7�5af��%�\n�d(��\r�����o1����R�y:�����ʓ僼}�o�,|%�T�=�\r#����	�.��Q9���q�+L��D�l2��TJ�I�%��<ba��@Nh0\"*B-T���\nؓ>�S	ߥ<���#N��*��4�B	��iWA<>��\'ҙ�\0�-�)\";�*U�\r��mT	�4���v˘@\'MiR�4eލ�0d�UM�D��N�F�R�Y����X���kp�Y|!`���ju�b6ָ[�(&��B\0$�Lh`(���ҥH��U��WW�m_�K��O�z�]t&�JS�JR����\0i�:w�h��ɳ	e����*T���������m,��Z�863��������|��>ԩR���n9�Ȳ��6�]�:\Z*BJgQ�Z�on\0\ZR�GUQ�dD�l��ȓ�(�1�M��:��#�*T�b��A~zy�h�����<iR�0Ajb4�J�*���','333 Central St.','Newark','NJ','07029'),(3,'Tim Smith','tim','2020','1970-12-20','M','����\0JFIF\0,,\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0q\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0B\0\n\0\0\0\0!1\"AQaq�2����#34r�BR�$%5Cbs��������\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0#\0\0\0\0\0\0\0\0\0\0!1A\"2BQq��\0\0\0?\0���Ax��^�Kb�--�W@W@\ZQ6WJ��Z@Wŷ����w	^G�2�O\0{�y�o�\n!��g���N?=����	���a����rNi��.�OX̻Hq�BN���_�G�]c����K�m�U	(bɐ?f�\'�#R����H���pRz�#8��T��Ť�q���O�8��yn��ͥXwx�Q-��k��\\�c���Ɯ�����5�|kLU���j�j�k132N����m.N��%TCn���\0u`ԍ�\\�ۢ�ڽTg���*�),R1d-�u��SWlk�����-AI��<����j�[+��y�&���?Ƌ�k��1��޳g�ʻ�c�������U< �0G�2V+`�=��_O�v�K8�2r>��t�r5	a�L��󻎭�z�J�����������E\Z�M�_,ԇ����\'|@\"��?�5E��:��D-u�)YI\0���ҡ�\\YY��[�BڥI}����J��GO�\\9�i5�^*tJ�\0��rTסMp�v+�)m��g��8���{�DV�<������ү\Z�t;���k�w4]DD���3�xa��I���v�N��T���,����2���ݜ���b����Z�����:ȓ�T����H�u2~� �c�NE��^��l��#yR᧺�V241�&@�n,@8�FFz\0q�P{�mFuQ+-�Q��g\0�\0889�\0�J�����)5tu��́6;/L��>|��Sᰱ��H�D�gxP\n�^r��9ǟƱJNS{b��>�����o���i�ͱ@\'?�~z�z����8�I0�ّ�Ƿ#���&�@Z��#>w\'��`�}�8��*���c�Q���P���`p��q��ή����i�^����f��	�=Ć:z�:��j:]梙t�]�:�UY��0.�8���|$d������v�[���ss\"��$�\0�^��<�ϟZ�<Z蒃��gEkKr�)�}\0B�l� ���ج��\'==�\r�h ����\rB&!���y�T�f���i�\0��o�=pkL\Zk���Kd�-J(�Ci\0(/���L�[��}��f������,�+b��]��ܬ7G�pÅ�4֣{x���K=�4���`b3�I�N3�ӷ�R���_�n��අ�:+G�ҕ�v�o�i�����&�`�f�g��iR���9W3\0��OZp.h��g�o�5���w&Er�C0R�<X%�p�<�jM6�����6�q\r�ֆ&ya/�\"�I�`�Nj8\\��caj��\r9o��ZX��@{�\\p�}�x#��\0иm��,Q#I+��U$���+�G��Y�{��L��.��v��\'�#�ں��}Z���5��3� �y�iU����I���_Z3ea�Zك��0s���??���������w%��w~�˻�	ǰ$�x�����ho������\0Ƨ�@���Xg���5�ӆX�؁��b���I)��	rrx:t$��t��u�ý���$�9�ƭ��P�o�\Zp2y���oN��	m�#^H�Dy\0�>�#��W\'HIf�%l��o�P�+ġ>�݂��sӦp<�G4&H��_�M�V\'i�w�v�Ǯz�����]WS��!TFcRs�)��\'�y�)d.�j��ƙe\nX��$�Hl`�O3��*ҵ�\'x�n��0er2��rA9�#�z)�:������Pc�9ڭ��g���^jW��H���z�rY��8\0�����@�y>�$C���[\'�gצ:�kg%cWv�\r��U�pѺ�0��s���1ko��f;_��n�WO��|�,B`���Uw#�y�����L�H�a��p$))@N�����=��l�2��G6;W�M&[.�[�BKql�H8�1@�����-f��٣7.��AV\r���Y�X}OP��4v�K��Y��h������vy%�0cS�X�s��Nf8��mN�i�m���C���#\' 瓜ҡ���\r���E�e]�?�r8��I)teR�{U������[��E~�-����[#$���\rWB�O**T�E��F����6R��e,N\r��Nq��c����\\����?�\rh7m\0��X��;���?U5L���k������Alr����@�׏/O�#N�[x�T��vS��7gӽ���>r.g!��\0�\n9=9�\\ԣ�Ӧ�Z�$��\"9D~$pTr�@a�:�������lX�Ё��ɂ\0�89?/��_}!�O���h��6!�/9����W)U!V��b�m�����U�FFʑ�ED��;����s��C����Md�?hbx\Z;+���.�o�S�\0�F=9�\'�4j��Z���n�t�r��#$u=>�g�Z~Q�Z��m�H��g7`�V�	\'��j�}v���b|tf�p��9#8;�<�A銑jo�Uhr�H�1�r�Q�� �y��N�ੜ�\\ 2�@t���59��4�����AMq g�@��;yީиVR\0>x�˚b[y/.�nfh��&A��|�g���k��ۻ�;@\"Q��$���x$��j�e��M-�e22�͏rp=I�oLҧeӲ7�{ٙ����\0��H��W��E��J���J�O����\0�R+@��P�i�-/})�?�6�1ׅ`�13��\0Ǖ�y�)��K6�y��?��[t��Ƈ!�p�\0�\0w�8����-)o�J��s���5�Y+V��y���H�5��n3�^�|��ho��h7�*ZFZ]��B@�ϯ�Q�۶��˹�>�ui27��8�\0�Ƥjח���}u/w�Wj��N\Z���	��j�����*�Wei@uu\n��O�u�F5y�#�\"��� �ʮ�n�d.=�y�I$�+�3�JyW+�S����T���N\0�l1��Ԍs@]Ő�LR!|9�p�9��\0ֹf\0�lآ��Dm5�Z�]���(x���<c�CJ�-�����}9�k8�����ۤ�2G�Ȅ3�\"�\'���F封#C�N<\n�1�K�-9B�;�)��̜�s��sV�#ܞC���p�n�+��a!<��y�{��Lt�Z�-���G_N�I�ͮ0���٢�t\n���G\\t�~�x�ݘ �}����\0�늳k�Yڸy�l�I�8�>k�{@�\\8�V��PL��N@9��#���Yv]F�T��3��~�E-��E�8#�����Cn&� cIr1��wQ\\��o�<�N=@>�J���cR�vkq��9#����K\'&�4dȒ�͂�i����FXg*X�>�R���:.Kܴ�΄��\0t��u��}/[iwƏP���������?�{Ieon���0X��g�a�׭�Iw��z晨m�1��e��$���E�eu�Y[ƶFH�%�y��c�G4�d����<�qNF��iԉ�`���xFh�Z���\0f]��\0�,��RH�l�m�h��Z������m\"/�jlGZ�ɖ��.2C�r>�E6�\Z����#h�}Ȫ\rΫd���*}�ѕ�#�Ԧr����4t��22��Wj��}>�4>�a��3�8�\0�Pn����R��w��?���V[��5[�^+�+�m�3�FIz���V��z��_�ݚ����#�q�x������:�t�&�T�\0[���3����6��	����p=NsR��V����^�0RYX0T�����[����9\n2��\rr�]�=��<Gv$���\09�	���VU4�G�x$e�\n�c<��A�u���#���^59T1���I�zq����=�B�1��#m��\0�g��±g]Tj��72���h�Ȣ8����O��5x�Ҏ��!�،� w�|��+=��ku��f�E]Ɂ�\0po\\�E=��gV�+�u�ԓ���v�ց�9q�v�Kk�2kkb����b?vwd�:���e�w��,f;���� 9*��\0�\0Pk�����7E	%6PC��zS�~��%�-�;Fޠ�=H���N,��{]�Z�,�wIqw\\���A���ǈ\ZUM���S�&-Bp������]�N�>���$,�oV��)��d\'�\\|��F�n��U�ɘgi���T}�U}Y1�j�G$�R�X�n�������+ȱ�lN<�=�{PNd�\\�<��|�ĲwQ��VF$g<��?���+,�\n�d��F��܌�0.-�˙���,�9���\"�!��@�6:���\0x���<��<��~5�-��3���ʣ�9 �c s�A��T�S���N�H�]gjW;I�\\�k����F{�ልHj����\0����;*��ԭ���o*��$�DJv�$�	$��G �ZUղ�x��9�������#Y>�=�a�\'���O�c�$��T��ڍ쉵0�\"2<c9N1�\0pH\0���H��X���c��:�A�d�\'���F�N[˓y���6nI\ns��s��<�*�/b4͓����l��`X��@>>��J�5_d@^�L�{\'h]$9*�<��ϯ��.�\0������e�g�q�=q�*�\0��i00y-���y���M��5��U�����q�y�h�4��0x�u%�f<�g��g���Q>��vQ�$c`�z֜���\0��	��p9 ���M\Zc��r@��}���q\\�#3\nUǇc��m��~�ԫ.F�e�y�V�.�\r(�1�T������jݐ�!]��g\nH<�1������*��Bg��a*��d��\ZX\0/!�_zTjK�n&��������*U�Ά����W�\0\Zh�\0���R�H�&7���\ZnN��J�PcK�o���U��?�J�\'�����GC�ƕ*H��2|W��\0\rſ�4�R}��@���\n`�\07��)R��br�f��?����&/�R�]0L��I���4��Y?^��U�vo�5*T��?O��','122 Main Ave.','Edison','NJ','07731'),(4,'Sarah Hoo','sarah','33','2020-11-23','F','����\0JFIF\0\0H\0H\0\0��\0C\0\n\n\Z \"\"\Z��\0C\r\r��\0\0}\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0>\0\0\0\0\0!1A\"Qaq��#2B�R�3br���$4C������\0\0\0\0\0\0\0\0\0\0\0\0\0��\04\0\0\0\0\0\0\0!1AQaq��\"������#2B�b��\0\0\0?\0���;�����mF�pb�f�e0��c�T�V�eǝ%{a.�2�t`L.��j�0�`b@P.I;��+B|��A����<���YUNgS!�I�6��\0Y���>��x�ē�3I�#�K�E}7$��|68�MF�v�[��4�-O���vr.�C�Q	DF���g9u}/��O��Chc�����f�[)�Xgܛ\r\'��?�<{L��ʣQ��\ZM��\0���8���p�MP�{�Uw �q�~�]D�P-�K�\r��$>�ĕ�~�Β���ԍ�¢E:.;�a�Y��elZ�;�e;�<�Aa�����:�f�l����8|<�*TK���x-�$xl��FO����Kf�u-PQmH�&����,,��.��,�KC1ج�u��w�b��t������\n����?}����e�۶P\nl*)&�xX]^28\'�,lU�GqpPt�s�\n�V�$Rt�%2ۦ\Z��(��W�;����c��Tf\"�Y#;*q�a�8w���[+@%ޔ�i-\"�`���\r�p�M��r�eQ~ Ͳ��\'��:����bN���UK�c�%e>y�EQ��\n�P����.x�/qr�yQH��[!�}e7����:E�\r���4���6�2��R��/K��ˌ����Q���3ն>�\r����`���CQ��HI�Z��8�?Jjzը����5*I�Ѡi5jopA�ů{�m<E|�N�\'�t>��G�<;L�e<F���?�+��n�&`,4�T��i�������4��}ƿ�ZN!��H��=�\n��*3\n��\"��_��}�:��ƽ-z^�\'b	����\\E��KU�q�,.�\r:THbIӪGul����n���rB��0�	:#x��`{0��\0\rP���o���*h�D�Ff�u5��q���k����H��p1���pa�ӡ��q�G��R�Qq\\��4��M#C�若�C:�F��\n�o��\"�r�<��㬢\nVA�Qхϱ�mQM]<��Y%rQ�=D�{G;�����q�s��a�W|�yG� �/a��(U`������K�d���&0˽���ޗ�G)q`�z�go��}Pn%��カ�uSHH��.�C������ؑ��:_��M�a|��n\Z�Ɯ�*��H&[IZ�[�a���W�y�S��]��r@�;����\0�c���˩f㷼z�C���4�4n�)��i6E��I,��*\\�!?��kv��\Z�Z���MW�IĪ�H�Z�k�|��m^\rοᬶ�༑\rv7��0{���tA��}�E����Yw�r�{��/�ǂ���\0��\0j���Tl�z��Kc�8C���!��a��P��Fح|r�W��랞@�δ��\0��@�,4��bqY]M�ҽMeDt��<�#Xt��v�78�>;q�q�oMA��6QBbf	�m����s{l	#�)�4��A���f���T�4u.��,���_���A���c�\'�a��C��)N\'T�p	/�P>\0w�3D�r,�����J�A]�qr�=-��u�f�dy���\\T���*,����A�\r��M¯L\0p�Z.TY�0��8��Q���/=�g�=4\r[B@ux�� �����\r`�H�\"ID�+[��0��Xl��΅lG��1�����x�%�s�<m���!��H��b�ʺy��uC�Y䨙��V�,��i]6=F:����T.�l�S�eM=�^�d��[{���Q9��MMx1��=��Zr/p�X����O��|���n}B�;H��z�ժ�`�-H����\"���u�Uͱ���S��5H��TVNI��<I㦠�`v����)�TT�*H_f15aRO@m���4�H�\n\'�vQw���\Zm�{�=�|p�I-9C=\\�>��sV}��۲��GK[s����TC���>z)��|R��\":���T�$�R�qiYu\0.I,F�����\n��S\"���Ȥ��c˩̅\nB4�tSȀ�]�\\�B�o|h�\rx����C<�-nZ�6e�H{y�Žm�o��2RK?G����[����gd�u���_�g:�ԕ2S��� �ۮ5/��5OĻ�I+�s�Ĝ�r�\"��	Hd=����ܜjo�yxG���wR*eNc)�	�|K�c*��5�������`h�3L�������sH�[~ö*�$/rX�8v���7�9��N�+Co���}���F\"��*M�\\v9�@o\\v6�C�+���^*����E���c�MM�De��5����:@�\\�\0Oko�T��YQ�j�\Z�ȧ�$����\0�b;��>7��q��4U���U\r\0`nl\0��ۭ��1�󼪓;&��mrh�I҂�Q������m3e��\nu�!J��U�����6�n�\0e8k��1M�}) ��i����w�1U�@��6�M�9��O]��TY\r�y+#ά��\Z����g������g������<[�,���V�X�}۰���Vw@��幁�%^J9LBe�����RT�&����8W��s\0���[�Ht�\n���˟r���Ҙ�r��8c�����6�v�uG,Sq�v}���k �a�b3���3�U��M����lH�C�-m�7\Z�44Y�Բ:OC�\"����b�\rɱ�ֹ�>�V�k�\0i\0E�r���X�\"����=&EM=\"��+0=\n�H5����r�L���bd#��)����F�H$(����x/6���U>���]YM,���IK�v�5�CU���\"P���$%�O�xW�Λ��;-�\0���CQn[H\'���#1^��.yᨊ�j�%#���H�Έ!����l����:JZ�)^nL��p�^�����[Oly�J&2�M�tT:����=�|+AL���-=	FܚZY�;��?�q|�_�D7O_$�P)��e������Pg��S��ؘ�Gː�V��-0eFx�SA;��Q��lE�e����l?�\r���b\"��\0���S,��V�%�fW6�iG�[���\0�w�U2h���\"�ޖ79�i�-A[�d|Dԕ��`�����qq�\'�WDJB�\n\0���6S=26���I�.O��q2�� ���|��Tn������2�A;�vݫsO(���\0N���M���9�	;���7���|/�IT�0�K*��qk(�\0��HiT:�=�;	�ɡ�������]e]�10X�E�A�3<���ZO��Yyv�T�{m��z`����a���j�h^�yX��8�[�͈����09��9�*s\'�?��h�(�*��m��ES�b�\0T��|E�l��l����9 7�k�:o�}T���u%����U�Ԡ��e��E�[o��c���<����zi�ڴun�#�g�����B�5+�O�o��M����/���+GS�T�Eq�����z�c�9��#4uz%N���:�W���p{��h�\0(9|?SR�*MQPA���\0��k�u؋�vz�\0�d�\rʹ��\'fU��q\r.g���#�_X��$�s!7+�~��6�R\r���SS;sg�Ln4k\'J�}��ĒN�q���V���:ĺ�4;(���v����!��W\n�i@0�:��t�M|��\ndb\'\0u����c0Jx������\0aE���ꪖ���.	d<�(V��V4#��WE�*T�c{��3���jY�Ai#$�R��F���h����E�M��g¸H�\0�M�J�C���d�|��q���9\Z�_���X�	���Z�\r<l����c�e�C��}��\0CU4�KH�]UR�ٙ�H=I���;�tǚZ8�e�dJ�T���2���%�R����ç��¦\Z��ZH\r�a�}=��/��;�orN�9�t:��������M	;����-��\\�-�I�Yo$��\Z��������\n(j$V�9,/`f�7��Qao@\0��g�i���*E[7,�5��a�t����Hە��-̲�����긪$�b�©����=�;դ��a����g9%��IDnܪ�F�vk0��q��\nU�Ӡ����&�B��!���\0���h0lI��#x�gzhF�6$�0R�������\\!C�C~������>���%�]?M�K����6�U���AQ����Q���Y�pnq�X�;��±�N�Sbo��wS��ҥ%���S�Dr�cf����O���\\֖Z�S���\00�\"Ǧ5=M4uT�E!b�-�������~�����S$&�fQ�\'N�����E��M^�hӽmS�,�%FY-}����X!1\0��؍�}���ƫ��\0\"Z�\\�4�erl����v�i�2\Z9�\0�-����~��^�Li��zn�G�q�-k_~�3���������\'{]L�\n\Zg������� <S���UUlt�h\"]]�\0	�aq��l	 bO�HRwsa�nuN��W(YLv<��~����]�ڻc�q\rS��)h��Gv�i���5Cm;�mu�Tgqu<�j��R1!9�*�G�P>z�;�\0h�����ڮ5����g��F����9̩B�D��i�皙��e��Pm�k�����bV���b���{������z���0�ڳ��N�����i)���MV6�t���˯S�iN�D���w�,2�-�-`����a<�,�稱CT.�7\n����9��^y�$�(Ӧ����F�\'�l�Y��a�����D�)O�\0�N!	�\'6B���0^�/�|-[W>gR�<�2���O��~���B=�W�q�����*�p�d+w��\0?\Z1;��7>�a�A�\ZJ�pz����#�i�œ���������M���\0bn��B���*����J917�=�x��A��EHQw�����L������[a����g��,e�{c�d��@e��.��q���\'�K0����Jɹ��C���d�d\ZR�6>�eY�C���IY\0��P}A�p}�EkX���\n\r��cۋ���*�<\"���j�%M%͕E�~�o��o�$|14�e��=�1X��\r��\0��h_ͨm�$���4q�i|=0/���b\r���+t�-��!@f�72�#��f��r|�\\ǥ��[8B	*@���r:��_	eut,��\Z��o��cp_R�R�+�O(��X(>̤|A�c��mls�ge ������e�K��UH�S%Nb�se%�SH���܈�s�a�v},\"K$��Ҩd%$7ѱ��ľS�ɓNR[�U�e���?�m_��]Nd2d�vSr�8�5������X���l�Ca�>圜H��x*ޭڡ�F�{��kc�uj���USU(�N����\0{��ص(�3��]?�U���E��H�Q�-��e�So��%ӫ�|eU<z�>H�$�GC���k�r?��|N8/�k��0���9wY���=}϶.��� x��3��)Ł�����\r%UH��d�\n�AlGQ�fa�^�\r��JR�;�Q�M[CeX��n����r��>x`*#WU�؞�8+\"XJ������Q0\0�/\"�7`�M���ID$�81h�#X>�&M4��\0��\r�| N�9�r�ve7���a�<�ʤ ���rj-U-��Cj��m��u�p�@��釼W�}�@D��ɷ�ͷ�����#�4C?�gid�cH��SmW��+�R�׬ǈ��y�*X1N�����،�MQi�cB/��\\\"�\0���OL9�ʲ��*j�$�I���\r�7\\�����CO4q=\ZK��l��=�ߧ���u��Aڃ8���)���p��˓�_pll6��K���Ê8�oSϤ�f��	�.l\r�w����,�ZU���,����Y-�\0t�>c���YCZYg�y##��O�����\0���{���UG�U���T�����8��]�g\'��S��/�̕r���\n���Û,�0�wdK�6�b�E���\0�q���(3XN�g�i9\")�-�������7���s�w�䗒�Q\\�?���Y��	��U��=6?<+O��ćH�Kر�t��ě4�$<�qnH�F�7���؁cp7��P�MC?ܣ��*�<��T��5̀\Z{bF��!��&���mLF�����5�2�YAb.\0� �����HQ�ÀEﹰ���3[\rT��������Z�ۦ�c~�<<���\n�R��,N��K����ahr�zeg���a��a���\"��J�O�u=��&��\\Ǔ\Z41�l��3rM��aAI�켽\"U�5)\0{o�#�#�B����9ڦ������%n>xg�d�YN��L*#���>G�$T��SLd{X������E�䎶8��M%��.i,������Չ$�//[���{��ǃ���RI?���;j�!�������\0���,�B��','320 King St','NYC','NJ','07083'),(5,'New Tester','test','bcbe3365e6ac95ea2c0343a2395834dd','1993-04-01','M','����\0JFIF\0,,\0\0��	Phttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\"/> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>��\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(��\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0d\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0	��\08\0\0\0\0\0\0!1\"AQaq2B���#��$Rb������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0 \0\0\0\0\0\0\0\0\0\0\0!\"1AQ��\0\0\0?\0�R���\0�)@x�h�yR9�&�+Q��p���׺���]�|Yմ�dSi���J�$*q��0ē�\0\"��X��J�ϳ�G:���3! �� �� �ҽ֕����7ۊ9F�pR%\0~���-I��y&�ZK�ة���)J�JR�R���()JJR�R���(l��T���Ӿ���{;�9�P����\n\0r�{Ⳮ�_ܒ^��\r����N{z���~{ԧ�Sm��P����c�m$��Y�a�\0q�nªM@�k6�X2����ݸ���T[���a,���X�jA���nd�����p�U}j����n�=�ۡj��>i��^M����_�J���t�H��0�>z՘���B��L�R���()JJR�R���()J|���z�%�XP�\Z��J�@��K����W5]�Ik��&�`�_/�$�w$����+�<P�v�7ej\Z��^P�+x۴��= ���	8 �s\\P�����r�f\r�Ԫ?��j����:|��/�}x_����{�ٛ6��������s�WDW����n�-n��HY dtϫ����|;�Ym�4{�Xu�����\"�x������q���Ǩ\\HfN�,�V��ۓ\0WW�PN3#�Ռ�{���#��F���\0�\0Ug$Q��\0	�TM��ЯnR��Z�..$�\"��7f�\0rjZ�GZ�()JJR�R���()Q{�T]@��f\n�G��R��cҀ��X��\0��z[:�ޑ��j}�ڶ��,�o�iD��O؞��q��SրΑ9�T1ճo�2��9濸3��ҙ�B]�s�ϿΡ���؎3:�H���Oo�ʲ�Ys��qR|~�P��������y�8����qR��R��y�l�����T���e�vZ}�*�,��v�3���&�+�݈�TQ���x��޹�r%r�蘵�d���R\n�g� �}3���a�TY�p/(>���X���\0a�,e�F?�?�F���!�\0 c���\0����|!�d�\n��*��%n]�\"����k��a֘緺���H��T��,��01�����0��[��)���c�\n�F8㟦qR}����؛�K���o&�4֎}I�2�\\����3[]qV܆��v�V��`w���D�O��ӌ�Gj�Qڭ��6I��)J�JR�S5�X�Mj��}h�n�[��,�uEn��:�##��ʩ��z%1V�+f��>\"��PwaU*��q�H��Y��SrI/�\0\n1�x��X�e��݋-�L�;�k�Q<�v#�p1�A9�f}T��i�4OJ��F�F��t\'mKR�3Q* 2H��P[��T?��<iZ΃>��loZI%����*\0@���\'=8��mۋKS��uv��Y� ���g�����h��u��u��ĥ��lĲ�2�������k�tE�(~5���kZ�wZ�����$��0NQ��}�P�]\\XL�Y�88�P�\05ӻR8�&�y�m�W�k۬\0���ls�����\'�T��PX-�i]�D\n�$��<���Y���%���E�H�mBk˙.��B�������\rl\rc}�i�O\n��=D�<��S�P�������D�&�����ۤ�e�Y	ȦY}(���L��w��![\0�f�\"^�]�����,���J��D^k	a�ۀ\'*�$���]1�x\0����W�#�$:`t�����`�kmԼ�W���-�L�R��[ �r�<@㚶a�e�}#�6��=������R7�������򬷖�\Z�KYbb\Z)�uda�PEt����iڥ����Y4�R��YpW��#��)�=���Қ��u\rOq��~u��=a\\*�Ą���NJ�sQ����؟�*W���9�]�u4;j��Ƀ�������z�����_4X��{J���K4�q�\'��Y��5=�<3�6]�����K��i�����n2Y�8�pG�c�*��Z+y�}�eY�<em[sZi7��[�4�/ܷ�H�}���[��\Z��y��\rek\r�^b��!F��2A8�,�I=�]!��,��Ά9�5gB�=,@$c۟j��گ�z�s:q��Ҕ���?��߁Z��ZִڊM{k��mncX��Vb��#$��61�,ZW)*���9{D��t=��4��F3�Fi�bJ�����1�JQ$� �ol��ے�mi�x����&�y��(?�@�EUڦ��u�h��ReQ`�Kr��8��c<����[;N�p{縆�����ݔ:�e�0p3�x\"�6��Z.ں���772��u��zB�W�;�O~k>|7���#Fщm�٧h[R���Xf�Ҋ��8ex�$�-�\n�x���ڷ[�͕��=&���,��\r�1����5��\0��f<�J!��ɑA��Њխ����.\\Gsn����>zW��.Ml�Ƒ\"�j��0��\0��iH�)@)JP\nR�5݅��Cyk�+����9���VM)@)JP\nR���\0�)@)JP\nR���\0�)@)JP\nR�����','1000 Morris Ave.','Union','NJ','07083');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers_Midterm`
--

DROP TABLE IF EXISTS `Customers_Midterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers_Midterm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers_Midterm`
--

LOCK TABLES `Customers_Midterm` WRITE;
/*!40000 ALTER TABLE `Customers_Midterm` DISABLE KEYS */;
INSERT INTO `Customers_Midterm` VALUES (1,'Sam1','1 Test drive Union NJ 07083'),(2,'Sam2','2 Test drive Union NJ 07083'),(3,'Sam3','3 Test drive Union NJ 07083'),(4,'BJ1','1 Park Ave Edison NJ 99999'),(5,'BJ2','2 Park Ave Edison NJ 99999'),(6,'BJ3','3 Park Ave Edison NJ 99999'),(7,'Judy1','1 West St Newark NJ 11111'),(8,'Judy2','2 West St Newark NJ 22222');
/*!40000 ALTER TABLE `Customers_Midterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers_demo`
--

DROP TABLE IF EXISTS `Customers_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers_demo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` float NOT NULL,
  `zipcode` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `zipcode` (`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers_demo`
--

LOCK TABLES `Customers_demo` WRITE;
/*!40000 ALTER TABLE `Customers_demo` DISABLE KEYS */;
INSERT INTO `Customers_demo` VALUES (1,'Austin',1000.6,'07522'),(2,'test',1000.6,'07522'),(3,'Mary',1000.6,'07522'),(4,'Sam',1000.6,'07522');
/*!40000 ALTER TABLE `Customers_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `deptNo` int(11) NOT NULL,
  `deptName` varchar(50) DEFAULT NULL,
  `mgrEmpNo` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`deptNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `E_ID` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Dept` varchar(20) DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  `L_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`E_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Austin','IT',50000,1),(2,'Mary','HR',45000,3),(3,'Sam','IT',53000,2),(4,'Andrew','Sales',42000,1);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FCourses`
--

DROP TABLE IF EXISTS `FCourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FCourses` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `credits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FCourses`
--

LOCK TABLES `FCourses` WRITE;
/*!40000 ALTER TABLE `FCourses` DISABLE KEYS */;
INSERT INTO `FCourses` VALUES (2231,'Java',4),(2232,'Structure',4),(3500,'Web',3),(3740,'Database',3);
/*!40000 ALTER TABLE `FCourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FPrices`
--

DROP TABLE IF EXISTS `FPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FPrices` (
  `year` int(11) NOT NULL,
  `credit_price` int(11) NOT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FPrices`
--

LOCK TABLES `FPrices` WRITE;
/*!40000 ALTER TABLE `FPrices` DISABLE KEYS */;
INSERT INTO `FPrices` VALUES (2011,100),(2012,110),(2013,120),(2014,130),(2015,140);
/*!40000 ALTER TABLE `FPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FStudent_Course`
--

DROP TABLE IF EXISTS `FStudent_Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FStudent_Course` (
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FStudent_Course`
--

LOCK TABLES `FStudent_Course` WRITE;
/*!40000 ALTER TABLE `FStudent_Course` DISABLE KEYS */;
INSERT INTO `FStudent_Course` VALUES (101,3740,2014),(102,2231,2012),(103,2232,2013),(104,3740,2013),(102,2231,2013),(101,2232,2013);
/*!40000 ALTER TABLE `FStudent_Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FStudents`
--

DROP TABLE IF EXISTS `FStudents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FStudents` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FStudents`
--

LOCK TABLES `FStudents` WRITE;
/*!40000 ALTER TABLE `FStudents` DISABLE KEYS */;
INSERT INTO `FStudents` VALUES (101,'Grant','07080'),(102,'Mary','07083'),(103,'Sam','07080'),(104,'Brian','07082');
/*!40000 ALTER TABLE `FStudents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guest`
--

DROP TABLE IF EXISTS `Guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Guest` (
  `guestno` decimal(5,0) NOT NULL DEFAULT 0,
  `guestname` varchar(20) DEFAULT NULL,
  `guestaddress` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`guestno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guest`
--

LOCK TABLES `Guest` WRITE;
/*!40000 ALTER TABLE `Guest` DISABLE KEYS */;
INSERT INTO `Guest` VALUES (10001,'John Kay','56 High St, London'),(10002,'Mike Ritchie','18 Tain St, London'),(10003,'Mary Tregear','5 Tarbot Rd, Aberdeen'),(10004,'Joe Keogh','2 Fergus Dr, Aberdeen'),(10005,'Carol Farrel','6 Achray St, Glasgow'),(10006,'Tina Murphy','63 Well St, Glasgow'),(10007,'Tony Shaw','12 Park Pl, Glasgow');
/*!40000 ALTER TABLE `Guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `hotelno` varchar(10) NOT NULL DEFAULT '',
  `hotelname` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`hotelno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES ('ch01','Omni Shoreham','London'),('ch02','Phoenix Park','London'),('dc01','Latham','Berlin'),('fb01','Grosvenor','London'),('fb02','Watergate','Paris');
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `L_ID` int(11) NOT NULL,
  `Building` varchar(20) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Room` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`L_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'Willis',4,'406K'),(2,'UC',1,NULL),(3,'Admin',2,NULL),(4,'Willis',2,NULL),(5,'Admin',1,NULL);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Money2_demo`
--

DROP TABLE IF EXISTS `Money2_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Money2_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `type` char(1) NOT NULL,
  `amount` float NOT NULL,
  `mydatetime` datetime NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  CONSTRAINT `Money2_demo_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Customers` (`id`),
  CONSTRAINT `Money2_demo_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `Sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=752 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Money2_demo`
--

LOCK TABLES `Money2_demo` WRITE;
/*!40000 ALTER TABLE `Money2_demo` DISABLE KEYS */;
INSERT INTO `Money2_demo` VALUES (648,'test1',3,'D',200,'2022-11-15 13:10:03',1,'testing ith'),(671,'ghjk4',3,'D',560,'2022-11-15 18:31:03',2,'delete and edit'),(678,'ge',4,'D',200,'2022-11-12 22:21:35',2,''),(681,'nfn',4,'D',10,'2022-11-12 22:41:40',2,''),(684,'sfd',4,'D',10,'2022-11-12 22:54:37',3,''),(687,'vfdv',4,'W',30,'2022-11-18 00:09:20',3,'hello'),(690,'684',4,'D',13,'2022-11-13 14:08:32',1,''),(691,'678',4,'W',111,'2022-11-13 15:11:34',1,''),(707,'101',3,'W',10,'2022-11-18 08:12:23',3,'e'),(711,'qqwr',2,'W',1,'2022-12-10 17:27:10',2,'tttttt'),(722,'ggg',2,'D',100,'2022-11-21 22:32:48',4,'vd'),(726,'hr',2,'D',64,'2022-11-22 16:24:58',3,'Knicks'),(727,'hr4',2,'D',400,'2022-11-21 23:52:35',3,''),(739,'1111',2,'D',1000,'2022-11-22 13:21:07',4,'tutoring direct deposit'),(742,'yerrrrr',1,'W',3,'2022-11-23 20:58:10',2,'hahahahaha'),(743,'r',1,'D',3,'2022-11-23 20:58:10',2,'yoooo'),(744,'44444',3,'D',10000,'2022-11-23 08:19:07',3,'insurance check'),(746,'n',1,'D',1000000,'2022-11-29 14:35:04',1,'test'),(747,'srggw',2,'D',222222,'2022-12-10 17:27:32',1,'ff'),(748,'005',1,'D',100,'2022-12-12 13:32:13',3,'new note'),(749,'huang',1,'D',120,'2022-12-12 16:53:42',2,'sleep'),(750,'953187',1,'D',10000,'2022-12-13 14:19:49',3,'helo'),(751,'051236',1,'W',10000,'2022-12-13 14:20:34',1,'helo');
/*!40000 ALTER TABLE `Money2_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Money_demo`
--

DROP TABLE IF EXISTS `Money_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Money_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `type` char(1) NOT NULL,
  `amount` float NOT NULL,
  `mydatetime` datetime NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `cid` (`cid`),
  CONSTRAINT `Money_demo_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Money_demo`
--

LOCK TABLES `Money_demo` WRITE;
/*!40000 ALTER TABLE `Money_demo` DISABLE KEYS */;
INSERT INTO `Money_demo` VALUES (1,'xy001',1,2,'D',4000,'2020-08-08 22:50:28','Manually inserted'),(2,'xy002',1,1,'W',2000,'2020-08-08 22:50:33','Manually inserted'),(3,'xy003',2,2,'D',3000,'2020-08-08 22:50:22','Manually inserted'),(4,'xy004',2,4,'W',1000,'2020-08-08 22:50:39','Manually inserted');
/*!40000 ALTER TABLE `Money_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `id` int(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'a@xyz.com'),(2,'b@ccc.com'),(3,'a@xyz.com');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `P_Id` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `V_Id` int(11) NOT NULL,
  PRIMARY KEY (`P_Id`),
  KEY `V_Id` (`V_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (2001,'iPod',200,11,1002),(2002,'chair',25,13,1001),(2003,'table',30,7,1001),(2004,'Bell',10,9,1003);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products_Midterm`
--

DROP TABLE IF EXISTS `Products_Midterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products_Midterm` (
  `id` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `sell_Price` float DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products_Midterm`
--

LOCK TABLES `Products_Midterm` WRITE;
/*!40000 ALTER TABLE `Products_Midterm` DISABLE KEYS */;
INSERT INTO `Products_Midterm` VALUES (2001,'iPod',200,100,10),(2002,'chair',60,30,12),(2003,'chair',90,50,8),(2004,'TV',400,250,12),(2005,'book1',20,10,7),(2006,'book2',25,15,12),(2007,'toy1',15,5,22),(2008,'toy2',25,15,12);
/*!40000 ALTER TABLE `Products_Midterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products_Order`
--

DROP TABLE IF EXISTS `Products_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products_Order` (
  `Product_ID` int(11) DEFAULT NULL,
  `Product_name` varchar(200) DEFAULT NULL,
  `Product_price` float DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_address` varchar(100) DEFAULT NULL,
  `customer_zipcode` varchar(15) DEFAULT NULL,
  `customer_state` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products_Order`
--

LOCK TABLES `Products_Order` WRITE;
/*!40000 ALTER TABLE `Products_Order` DISABLE KEYS */;
INSERT INTO `Products_Order` VALUES (1,'iPod',100,1,'Austin','1000 Morris Ave, Union','07083','NJ'),(1,'computer',400,1,'Austin','1000 Morris Ave, Union','07083','NJ'),(1,'iPhone',300,10,'Mary','1000 Central Ave, Newark','07101','CA'),(1,'pen',3,10,'Mary','1000 Central Ave, Newark','07101','CA'),(1,'chair',30,1,'Mary','1000 Central Ave, Newark','07101','CA'),(1,'Camera',140,1,'John','1000 Morris Ave, Union','07083','NJ'),(1,'iPad',200,1,'Sam','100 Union Ave, Edison','07101','TX'),(1,'battery',8,10,'Sam','100 Union Ave, Edison','07101','TX'),(1,'desk',20,2,'Simon','1000 Morris Ave, Union','00000','NJ'),(1,'monitor',100,1,'Simon','1000 Morris Ave, Union','00000','NJ');
/*!40000 ALTER TABLE `Products_Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products_demo`
--

DROP TABLE IF EXISTS `Products_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sell_price` float NOT NULL,
  `cost` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products_demo`
--

LOCK TABLES `Products_demo` WRITE;
/*!40000 ALTER TABLE `Products_demo` DISABLE KEYS */;
INSERT INTO `Products_demo` VALUES (3,'p1','game 225',200,100,21,7,1002),(5,'p3','5 new2',5,2,71,9,1004),(6,'p4','game',120,100,808,9,1003),(7,'p5','product 59a4',50,14,3,9,1002),(8,'ipad','ipad air 2',600,400,32,3,1002),(9,'car','Honda civic',200,100,7,3,1004),(58,'test3','new test',400,100,50,3,1001),(59,'cat','cat',20.9,16,5,7,1002),(60,'cars','cars',24,22,3,3,1002),(61,'nissan','car',50,24,1,9,1002),(62,'test','test3',200,100,5,3,1002),(63,'truck','nissan new',50,45,5,3,1001),(64,'iPhone','iPhone 7',905,400,5,3,1006),(65,'p6','PS4',200,150,10,3,1001),(66,'toy','fun',20,15,1,3,1003),(67,'123','123',123,121,12,3,1001),(68,'adsdf','letters',4,3,7,7,1001),(69,'xbox','game',888,300,10,9,1001),(70,'galaxy','phone',650,400,2,3,1002),(71,'toys','toy',20,15,1,3,1001),(72,'car toy','toyh',20,15,3,3,1001),(73,'as','as',23,2,20,10,1005),(74,'dress','pink new update',22,20,4,3,1001),(75,'P8','l',75,45,35,3,1003),(76,'as1234','asas',2,1,1,3,1001),(77,'PS4','game console',400,100,57,3,1001),(78,'test10','this is a test',40,6,4,3,1001),(79,'apple','fruit',3,1,15,3,1007),(80,'funko pop','collectible ',14.99,12.99,3,7,1001),(81,'test11','2k2k',5.9,3.2,8,7,1002),(82,'s2s','w2',23,21,13,3,1001),(83,'ogn','ngo',5,2,29,7,1003),(84,'test4','test4',29,8,28,3,1003),(85,'tv','watch tv',100,45,1,3,1001),(86,'tv8','watch tv',200,120,3,3,1001),(87,'tv9','watch tv',250,100,8,3,1001),(88,'book7','read',10,5,6,3,1001),(89,'book4','read',10,4,1,3,1001),(90,'book3','read',10,5,2,3,1001),(91,'ipod','36gb',360,350,1,3,1002),(92,'p9','test',40,30,40,9,1001),(93,'pencil #3','yellow #3 pencil',1.5,1,11,10,1006),(94,'guitar','musical instrument',100,50,3,3,1001),(95,'guitar1','musical instrument',123,90,3,3,1001),(96,'flash drive','8 gb',20,15,12,10,1002),(97,'test_panda','this',100,99,2,3,1002),(98,'test_panda2','Zeebers',888,883,90,3,1002),(99,'pen','blue ink',9,4,87,7,1001),(100,'macbook pro','laptop',15000,14000,3,3,1008),(101,'piano','Grand',19,8,90,9,1003),(102,'inconspicuous apple','magical',9000.01,3.59,100,7,1008),(103,'gum','gum',20,19.99,8,7,1004),(104,'Beats','headphones',250,175,2,7,1002),(105,'test2','test#2',20,9,2,7,1009),(106,'Test08','test',9,8,9,7,1001),(107,'12','123',22,4,1,3,1001),(108,'Xbox360','video game console',150,50,2,3,1001),(109,'car 2','jeep6',600,250,1,3,1001),(110,'xx','xxxxx',222,30,2,7,1002),(111,'Xbox One','Video game console test',150,50,2,10,1006),(112,'test test ','9wqn',999,99.9,88,7,1001),(113,'a','2',6,5,1,10,1001),(114,'jiji22','djaio 123hi9',29.99,19.99,123,7,1007),(115,'aa','2',5,4,1,7,1001),(116,'car 3','honda',800,600,1,3,1001),(117,'car 4','sdfg',800,10,17,10,1001),(118,'tv2','sony',250,22,3,3,1004),(119,'drone','p[ppp',1000,50,9,9,1001),(120,' ',' f',1000,50,5,10,1001),(121,'null',' mm',1000,50,5,3,1001),(122,'toy10','flying ',100,50,10,10,1001),(123,'zhuge','sb',55,5,1,10,1001),(124,'maaaaaaa','as',4,1,3,3,1001),(125,'ff','ff',66,5,55,3,1001),(126,'111','a',1111,111,111,10,1001),(127,'5','7',68,46,2,9,1001),(128,'gc','test',334,56,4,9,1001),(129,'1','1',2,1,1,3,1001),(130,'andreww','test44',9999,6324,11,7,1001),(131,'pad','44',60,50,10,7,1001),(132,'qwe','a44',50,13,10,7,1001),(133,'test087','test',2,1,3,3,1001),(134,'Megaphone','ddddddd',100,50,2,7,1002),(135,'3','3',33,3,3,3,1001),(136,'lightsaber','red',20000,1000,1,7,1001),(137,'1ws','1',2,1,1,7,1001),(138,'test33','poop',6,1,8,7,1001),(139,'test333','new test 2',6,1,8,10,1001),(140,'Pancreas','Organs',99,88,9,7,1011),(141,'tttt','pppppp',60,7,3,10,1001),(142,'asdf','asdf',8,7,9,10,1001),(143,'hhhh','a',10,7,2,10,1006),(144,'tt','e',8,6,5,10,1006),(145,'aaaa','d',0.02,0.01,5,7,1001),(146,'aaaaa','d',0.02,0.01,23,7,1001);
/*!40000 ALTER TABLE `Products_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products_final`
--

DROP TABLE IF EXISTS `Products_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products_final` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sell_price` float DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products_final`
--

LOCK TABLES `Products_final` WRITE;
/*!40000 ALTER TABLE `Products_final` DISABLE KEYS */;
INSERT INTO `Products_final` VALUES (1,'iPad','Apple iPad 3',300,200,3,1,1002),(2,'iPhone','Apple iPhone 6',500,300,5,1,1002),(3,'camera','Sony camera',200,100,3,2,1004),(4,'TV1',' LED TV 32 inches',300,200,4,3,1004),(5,'TV2','LED TV 60 inches',700,400,2,2,1003),(6,'Book','Database textbook',100,40,30,3,1003),(7,'PC','Dell Computer',450,300,3,3,1005);
/*!40000 ALTER TABLE `Products_final` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `projNo` varchar(24) NOT NULL,
  `projName` varchar(40) DEFAULT NULL,
  `deptNo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`projNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews_Midterm`
--

DROP TABLE IF EXISTS `Reviews_Midterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reviews_Midterm` (
  `p_id` int(11) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `date` date NOT NULL,
  `c_id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`,`c_id`),
  KEY `c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews_Midterm`
--

LOCK TABLES `Reviews_Midterm` WRITE;
/*!40000 ALTER TABLE `Reviews_Midterm` DISABLE KEYS */;
INSERT INTO `Reviews_Midterm` VALUES (2005,'the best book',10,'2015-01-01',1),(2005,'just ok',5,'2013-01-01',2),(2005,'not bad',7,'2013-01-01',3),(2007,'not worth',2,'2014-11-01',2),(2007,'ok',5,'2014-12-01',3),(2007,'not safe',1,'2014-11-01',4),(2008,'',5,'2014-11-01',1),(2008,'good product',8,'2015-02-01',2),(2008,'like it',7,'2013-11-01',3),(2008,'ok',5,'2015-02-11',4);
/*!40000 ALTER TABLE `Reviews_Midterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `roomno` decimal(5,0) NOT NULL DEFAULT 0,
  `hotelno` varchar(10) NOT NULL DEFAULT '',
  `type` varchar(10) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`roomno`,`hotelno`),
  KEY `hotelno` (`hotelno`),
  CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`hotelno`) REFERENCES `Hotel` (`hotelno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (501,'fb01','single',10.00),(601,'fb01','double',10.00),(701,'ch02','single',10.00),(701,'fb01','family',39.00),(801,'ch02','double',15.00),(901,'dc01','single',18.00),(1001,'ch01','single',29.99),(1001,'dc01','double',30.00),(1001,'fb02','single',58.00),(1101,'ch01','family',59.99),(1101,'dc01','family',35.00),(1101,'fb02','double',86.00),(2222,'ch02','new',86.00);
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales_Midterm`
--

DROP TABLE IF EXISTS `Sales_Midterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sales_Midterm` (
  `id` int(11) NOT NULL DEFAULT 0,
  `p_id` int(11) DEFAULT NULL,
  `QTY` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `Sales_Midterm_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `Customers_Midterm` (`id`),
  CONSTRAINT `Sales_Midterm_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `Products_Midterm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales_Midterm`
--

LOCK TABLES `Sales_Midterm` WRITE;
/*!40000 ALTER TABLE `Sales_Midterm` DISABLE KEYS */;
INSERT INTO `Sales_Midterm` VALUES (1,2001,2,1),(2,2008,1,4),(3,2004,3,4),(4,2005,NULL,7);
/*!40000 ALTER TABLE `Sales_Midterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sources`
--

DROP TABLE IF EXISTS `Sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sources` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sources`
--

LOCK TABLES `Sources` WRITE;
/*!40000 ALTER TABLE `Sources` DISABLE KEYS */;
INSERT INTO `Sources` VALUES (1,'ATM'),(2,'Online'),(3,'Branch'),(4,'Wired'),(5,'New11'),(6,'Mobile');
/*!40000 ALTER TABLE `Sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `staffNo` varchar(5) NOT NULL,
  `fName` varchar(15) NOT NULL,
  `lName` varchar(15) NOT NULL,
  `position` varchar(25) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `branchNo` varchar(8) DEFAULT NULL,
  `managerNo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`staffNo`),
  UNIQUE KEY `staff_name_index` (`lName`,`fName`),
  KEY `staff_DOB_index` (`DOB`),
  KEY `branchNo` (`branchNo`),
  KEY `managerNo` (`managerNo`),
  CONSTRAINT `Staff_ibfk_1` FOREIGN KEY (`branchNo`) REFERENCES `Branch` (`branchNo`),
  CONSTRAINT `Staff_ibfk_2` FOREIGN KEY (`managerNo`) REFERENCES `Staff` (`staffNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('SA9','Mary','Howe','Assistant','F','1970-02-19',9000.00,'B007','SG14'),('SG14','David','Ford','Supervisor','M','1958-03-24',18000.00,'B003','SG5'),('SG37','Ann','Beech','Assistant','F','1960-11-10',12000.00,'B003','SL21'),('SG5','Susan','Brand','Manager','F','1940-06-03',24000.00,'B003','SG14'),('SL21','John','White','Manager','M','1945-10-01',30000.00,'B005','XYZ1'),('SL41','Julie','Lee','Assistant','F','1965-06-13',9000.00,'B005','XYZ1'),('XYZ1','Huang','Austin','CEO','M','1970-01-01',40000.00,'B002',NULL);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stores`
--

DROP TABLE IF EXISTS `Stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stores` (
  `sid` int(11) NOT NULL DEFAULT 0,
  `Name` varchar(200) DEFAULT NULL,
  `Zipcode` varchar(12) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stores`
--

LOCK TABLES `Stores` WRITE;
/*!40000 ALTER TABLE `Stores` DISABLE KEYS */;
INSERT INTO `Stores` VALUES (1002,'ABC','07811','CA','San Francisco','699 Argulello Blvd',37.75991900,-122.43502800),(1003,'Store1','07083','NJ','Union','1000 Morris Ave.',40.68121200,-74.23543200),(1005,'Store3','18104','PA','Allentown','100 Main st',40.59057700,-75.54250100),(1007,'VVV','09911','CA',NULL,NULL,NULL,NULL),(1008,'Storenew','60644','IL','Chicago','210 N Central Ave.',41.88437000,-87.76554000),(1011,'Store5','02129','MA','Boston','9 Main St.',NULL,NULL);
/*!40000 ALTER TABLE `Stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stores2`
--

DROP TABLE IF EXISTS `Stores2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stores2` (
  `sid` int(11) NOT NULL DEFAULT 0,
  `Name` varchar(200) DEFAULT NULL,
  `Zipcode` varchar(12) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stores2`
--

LOCK TABLES `Stores2` WRITE;
/*!40000 ALTER TABLE `Stores2` DISABLE KEYS */;
INSERT INTO `Stores2` VALUES (1002,'ABC','07811','CA',NULL,NULL,NULL,NULL),(1003,'Store1','07083','NJ','Union','1000 Morris Ave.',40.68121200,-74.23543200),(1005,'QQQ','07073','NJ',NULL,NULL,NULL,NULL),(1007,'VVV','09911','CA',NULL,NULL,NULL,NULL),(1008,'Store2','60644','IL','Chicago','210 N Central Ave.',41.88437000,-87.76554000),(1009,'Store3','90013','IL','Los Angeles','6 S Central Ave.',34.04425300,-118.23933300),(1010,'Store4','98101','WA','Seattle','111 Pike St.',47.60898300,-122.33930600),(1011,'Store5','02129','MA','Boston','9 Main St.',42.37254500,-71.06181400);
/*!40000 ALTER TABLE `Stores2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_demo`
--

DROP TABLE IF EXISTS `Student_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_demo` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `zipcode` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_demo`
--

LOCK TABLES `Student_demo` WRITE;
/*!40000 ALTER TABLE `Student_demo` DISABLE KEYS */;
INSERT INTO `Student_demo` VALUES (1001,'Austin','07083'),(1002,'Grant','07021'),(1003,'Mary','07083'),(1004,'Sam','07029');
/*!40000 ALTER TABLE `Student_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Employee`
--

DROP TABLE IF EXISTS `T_Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Employee` (
  `E_ID` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Dept` varchar(20) DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  `L_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`E_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Employee`
--

LOCK TABLES `T_Employee` WRITE;
/*!40000 ALTER TABLE `T_Employee` DISABLE KEYS */;
INSERT INTO `T_Employee` VALUES (1,'Austin','IT',50000,1),(2,'Mary','HR',45000,3),(3,'Sam','IT',53000,2),(4,'Andrew','Sales',42000,1);
/*!40000 ALTER TABLE `T_Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Location`
--

DROP TABLE IF EXISTS `T_Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Location` (
  `L_ID` int(11) NOT NULL,
  `Building` varchar(20) DEFAULT NULL,
  `Floor` int(11) DEFAULT NULL,
  `Room` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`L_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Location`
--

LOCK TABLES `T_Location` WRITE;
/*!40000 ALTER TABLE `T_Location` DISABLE KEYS */;
INSERT INTO `T_Location` VALUES (1,'Willis',4,'406K'),(2,'UC',1,NULL),(3,'Admin',2,NULL),(4,'Willis',2,NULL),(5,'Admin',1,NULL);
/*!40000 ALTER TABLE `T_Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Products`
--

DROP TABLE IF EXISTS `T_Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Products` (
  `P_Id` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `V_Id` int(11) NOT NULL,
  PRIMARY KEY (`P_Id`),
  KEY `V_Id` (`V_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Products`
--

LOCK TABLES `T_Products` WRITE;
/*!40000 ALTER TABLE `T_Products` DISABLE KEYS */;
INSERT INTO `T_Products` VALUES (2001,'iPod',200,11,1002),(2002,'chair',25,13,1001),(2003,'table',30,7,1001),(2004,'Bell',10,9,1003);
/*!40000 ALTER TABLE `T_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_Vendors`
--

DROP TABLE IF EXISTS `T_Vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_Vendors` (
  `V_Id` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Zipcode` varchar(12) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  PRIMARY KEY (`V_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_Vendors`
--

LOCK TABLES `T_Vendors` WRITE;
/*!40000 ALTER TABLE `T_Vendors` DISABLE KEYS */;
INSERT INTO `T_Vendors` VALUES (1001,'James','07101','NJ'),(1002,'Grant','07811','CA'),(1003,'Wendy','07083','NJ'),(1004,'Sam','07811','NY'),(1005,'Austin','12345','TX');
/*!40000 ALTER TABLE `T_Vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test`
--

DROP TABLE IF EXISTS `Test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Test` (
  `id` int(11) NOT NULL,
  `pricef` float NOT NULL,
  `pricen` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test`
--

LOCK TABLES `Test` WRITE;
/*!40000 ALTER TABLE `Test` DISABLE KEYS */;
INSERT INTO `Test` VALUES (1,0.1,0.10),(2,5,5.00),(3,4,5.00);
/*!40000 ALTER TABLE `Test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test2`
--

DROP TABLE IF EXISTS `Test2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Test2` (
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test2`
--

LOCK TABLES `Test2` WRITE;
/*!40000 ALTER TABLE `Test2` DISABLE KEYS */;
INSERT INTO `Test2` VALUES (3),(NULL),(3);
/*!40000 ALTER TABLE `Test2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test3`
--

DROP TABLE IF EXISTS `Test3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Test3` (
  `A` int(11) DEFAULT NULL,
  `B` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test3`
--

LOCK TABLES `Test3` WRITE;
/*!40000 ALTER TABLE `Test3` DISABLE KEYS */;
INSERT INTO `Test3` VALUES (1,1,1),(2,2,1),(3,1,2),(2,1,2),(2,2,3);
/*!40000 ALTER TABLE `Test3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test4`
--

DROP TABLE IF EXISTS `Test4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Test4` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test4`
--

LOCK TABLES `Test4` WRITE;
/*!40000 ALTER TABLE `Test4` DISABLE KEYS */;
INSERT INTO `Test4` VALUES (1,NULL),(2,'Mar');
/*!40000 ALTER TABLE `Test4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `zipcode` varchar(15) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'test','test','tester','Tester','CPS3740','1000 Morris Ave.','07083','NJ'),(2,'kean','kean','teacher','Huang','Austin','1000 Morris Ave.','07083','NJ'),(3,'panda','test','tester','Smith','Timothy','200 Union Ave.','07101','CA'),(4,'tiger','xyz123','staff','Tester','CPS3740','1000 Morris Ave.','07083','NJ'),(7,'lion','test','Staff','XYZ','CCC','33 James St','07331','NJ'),(9,'fish','test','Staff','Tester','New','99 Main St.','01011','NY'),(10,'cat','test','Staff','New2','Tester2','99 Morris Ave.','12345','NJ');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendors`
--

DROP TABLE IF EXISTS `Vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendors` (
  `V_Id` int(11) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Zipcode` varchar(12) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`V_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendors`
--

LOCK TABLES `Vendors` WRITE;
/*!40000 ALTER TABLE `Vendors` DISABLE KEYS */;
INSERT INTO `Vendors` VALUES (1001,'XXX','07101','NJ',NULL,NULL,NULL,NULL),(1002,'ABC','07811','CA',NULL,NULL,NULL,NULL),(1003,'CCC','07083','NJ','Union','1000 Morris Ave.',40.68121200,-74.23543200),(1004,'YYY','07073','NJ',NULL,NULL,NULL,NULL),(1005,'QQQ','07073','NJ',NULL,NULL,NULL,NULL),(1006,'MMM','07811','NY',NULL,NULL,NULL,NULL),(1007,'VVV','09911','CA',NULL,NULL,NULL,NULL),(1008,'New1','60644','IL','Chicago','210 N Central Ave.',41.88437000,-87.76554000),(1009,'New2','90013','IL','Los Angeles','6 S Central Ave.',34.04425300,-118.23933300),(1010,'New3','98101','WA','Seattle','111 Pike St.',47.60898300,-122.33930600),(1011,'Test new','02129','MA','Boston','9 Main St.',42.37254500,-71.06181400);
/*!40000 ALTER TABLE `Vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Weather`
--

DROP TABLE IF EXISTS `Weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Weather` (
  `Id` int(11) DEFAULT NULL,
  `RecordDate` date DEFAULT NULL,
  `Temperature` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Weather`
--

LOCK TABLES `Weather` WRITE;
/*!40000 ALTER TABLE `Weather` DISABLE KEYS */;
INSERT INTO `Weather` VALUES (1,'2015-01-01',10),(2,'2015-01-02',25),(3,'2015-01-03',20),(4,'2015-01-04',30);
/*!40000 ALTER TABLE `Weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorksOn`
--

DROP TABLE IF EXISTS `WorksOn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorksOn` (
  `empNo` int(11) NOT NULL,
  `projNo` varchar(10) NOT NULL DEFAULT '',
  `dateWorked` varchar(255) NOT NULL DEFAULT '',
  `hoursWorked` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`empNo`,`projNo`,`dateWorked`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorksOn`
--

LOCK TABLES `WorksOn` WRITE;
/*!40000 ALTER TABLE `WorksOn` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorksOn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zipcode`
--

DROP TABLE IF EXISTS `Zipcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zipcode` (
  `zipcode` varchar(12) NOT NULL DEFAULT '',
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zipcode`
--

LOCK TABLES `Zipcode` WRITE;
/*!40000 ALTER TABLE `Zipcode` DISABLE KEYS */;
INSERT INTO `Zipcode` VALUES ('07001','AVENEL','NJ'),('07005','BOONTON','NJ'),('07029','HARRISON','NJ'),('07041','MILLBURN','NJ'),('07044','VERONA','NJ'),('07065','RAHWAY','NJ'),('07066','CLARK','NJ'),('07083','UNION','NJ'),('07110','NUTLEY','NJ'),('07184','NEWARK','NJ'),('07205','HILLSIDE','NJ'),('07208','ELIZABETH','NJ'),('07522','PATERSON','NJ');
/*!40000 ALTER TABLE `Zipcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_Products_demo`
--

DROP TABLE IF EXISTS `audit_Products_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_Products_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cost` float NOT NULL,
  `access_time` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_Products_demo`
--

LOCK TABLES `audit_Products_demo` WRITE;
/*!40000 ALTER TABLE `audit_Products_demo` DISABLE KEYS */;
INSERT INTO `audit_Products_demo` VALUES (1,1,40,'2016-04-19 14:22:22','after insert'),(2,1,50,'2016-04-19 14:31:52','beforer insert'),(3,1,50,'2016-04-19 14:31:52','after insert'),(4,1,120,'2016-04-19 14:36:02','before delete'),(6,4,1200,'2016-04-19 23:04:22','beforer insert'),(7,4,1200,'2016-04-19 23:04:22','after insert'),(8,7,30,'2016-05-14 19:06:22','beforer insert'),(9,7,30,'2016-05-14 19:06:22','after insert'),(10,7,500,'2017-03-07 01:18:03','before delete'),(11,7,200,'2017-03-07 01:18:03','before delete'),(12,7,100,'2017-03-07 01:18:03','before delete'),(13,3,300,'2017-03-07 01:18:03','before delete'),(14,7,306,'2017-03-07 01:18:03','before delete'),(15,3,300,'2017-03-07 01:18:03','before delete'),(16,3,300,'2017-03-07 01:18:03','before delete'),(17,6,566,'2017-03-07 01:18:03','before delete'),(18,7,1200,'2017-03-07 01:18:03','before delete'),(19,3,10,'2017-03-07 01:18:03','before delete'),(20,3,30,'2017-03-07 01:18:03','before delete'),(21,3,300,'2017-03-07 01:18:03','before delete'),(22,3,500,'2017-03-07 01:18:03','before delete'),(23,3,400,'2017-03-07 01:18:03','before delete'),(24,3,120,'2017-03-07 01:18:03','before delete'),(25,3,2000,'2017-03-07 01:18:03','before delete'),(26,4,30,'2017-03-07 01:18:03','before delete'),(27,3,40,'2017-03-07 01:18:03','before delete'),(28,1,2,'2017-03-07 01:18:03','before delete'),(29,1,4,'2017-03-07 01:18:03','before delete'),(30,4,100,'2017-03-07 01:18:03','before delete'),(31,1,60,'2017-03-07 01:18:03','before delete'),(32,4,30,'2017-03-07 01:18:03','before delete'),(33,4,150,'2017-03-07 01:18:03','before delete'),(34,4,300,'2017-03-07 01:18:03','before delete'),(35,4,1,'2017-03-07 01:18:03','before delete'),(36,4,400,'2017-03-07 01:18:03','before delete'),(37,3,2,'2017-03-07 01:18:03','before delete'),(38,4,10,'2017-03-07 01:18:03','before delete'),(39,1,400,'2017-03-07 01:18:03','before delete'),(40,4,20,'2017-03-07 01:18:03','before delete'),(41,3,600,'2017-03-07 01:18:03','before delete'),(42,3,600,'2017-03-07 01:18:03','before delete'),(43,3,600,'2017-03-07 01:18:03','before delete'),(44,3,400,'2017-03-07 01:18:03','before delete'),(45,5,300,'2017-03-07 01:18:03','before delete'),(46,1,300,'2017-03-07 01:18:03','before delete'),(47,5,30,'2017-03-07 01:18:03','before delete'),(48,1,40,'2017-03-07 01:18:03','before delete'),(49,1,40,'2017-03-07 01:18:03','before delete'),(50,5,20,'2017-03-07 01:18:03','before delete'),(51,7,1200,'2017-03-07 01:18:03','before delete'),(52,7,30,'2017-03-07 01:18:03','before delete'),(53,7,500,'2017-03-07 01:34:21','before delete'),(54,7,200,'2017-03-07 01:34:21','before delete'),(55,7,100,'2017-03-07 01:34:21','before delete'),(56,3,300,'2017-03-07 01:34:21','before delete'),(57,7,306,'2017-03-07 01:34:21','before delete'),(58,3,300,'2017-03-07 01:34:21','before delete'),(59,3,300,'2017-03-07 01:34:21','before delete'),(60,6,566,'2017-03-07 01:34:21','before delete'),(61,7,1200,'2017-03-07 01:34:21','before delete'),(62,3,10,'2017-03-07 01:34:21','before delete'),(63,3,30,'2017-03-07 01:34:21','before delete'),(64,3,300,'2017-03-07 01:34:21','before delete'),(65,3,500,'2017-03-07 01:34:21','before delete'),(66,3,400,'2017-03-07 01:34:21','before delete'),(67,3,120,'2017-03-07 01:34:21','before delete'),(68,3,2000,'2017-03-07 01:34:21','before delete'),(69,4,30,'2017-03-07 01:34:21','before delete'),(70,3,40,'2017-03-07 01:34:21','before delete'),(71,1,2,'2017-03-07 01:34:21','before delete'),(72,1,4,'2017-03-07 01:34:21','before delete'),(73,4,100,'2017-03-07 01:34:21','before delete'),(74,1,60,'2017-03-07 01:34:21','before delete'),(75,4,30,'2017-03-07 01:34:21','before delete'),(76,4,150,'2017-03-07 01:34:21','before delete'),(77,4,300,'2017-03-07 01:34:21','before delete'),(78,4,1,'2017-03-07 01:34:21','before delete'),(79,4,400,'2017-03-07 01:34:21','before delete'),(80,3,2,'2017-03-07 01:34:21','before delete'),(81,4,10,'2017-03-07 01:34:21','before delete'),(82,1,400,'2017-03-07 01:34:21','before delete'),(83,4,20,'2017-03-07 01:34:21','before delete'),(84,3,600,'2017-03-07 01:34:21','before delete'),(85,3,600,'2017-03-07 01:34:21','before delete'),(86,3,600,'2017-03-07 01:34:21','before delete'),(87,3,400,'2017-03-07 01:34:21','before delete'),(88,5,300,'2017-03-07 01:34:21','before delete'),(89,1,300,'2017-03-07 01:34:21','before delete'),(90,5,30,'2017-03-07 01:34:21','before delete'),(91,1,40,'2017-03-07 01:34:21','before delete'),(92,1,40,'2017-03-07 01:34:21','before delete'),(93,5,20,'2017-03-07 01:34:21','before delete'),(94,7,1200,'2017-03-07 01:34:21','before delete'),(95,7,30,'2017-03-07 01:34:21','before delete'),(96,3,1000,'2017-03-24 18:20:34','beforer insert'),(97,3,1000,'2017-03-24 18:20:34','after insert'),(98,7,12,'2017-04-08 12:06:41','beforer insert'),(99,7,12,'2017-04-08 12:06:41','after insert'),(100,7,22,'2017-04-18 13:49:57','beforer insert'),(101,7,22,'2017-04-18 13:49:57','after insert'),(102,3,20,'2017-04-18 21:34:45','beforer insert'),(103,3,20,'2017-04-18 21:34:45','after insert'),(104,7,100,'2017-04-19 13:57:11','beforer insert'),(105,7,100,'2017-04-19 13:57:11','after insert'),(106,3,30,'2017-04-19 15:06:30','beforer insert'),(107,3,30,'2017-04-19 15:06:30','after insert'),(108,3,400,'2017-04-22 16:42:31','beforer insert'),(109,3,400,'2017-04-22 16:42:31','after insert'),(110,3,2000,'2017-04-22 17:21:28','beforer insert'),(111,3,2000,'2017-04-22 17:21:28','after insert'),(112,7,15,'2017-04-22 20:27:11','beforer insert'),(113,7,15,'2017-04-22 20:27:11','after insert'),(114,3,121,'2017-04-23 16:13:27','beforer insert'),(115,3,121,'2017-04-23 16:13:27','after insert'),(116,7,3,'2017-04-23 16:53:19','beforer insert'),(117,7,3,'2017-04-23 16:53:19','after insert'),(118,3,300,'2017-04-24 12:30:02','beforer insert'),(119,3,300,'2017-04-24 12:30:02','after insert'),(120,7,400,'2017-04-24 13:17:03','beforer insert'),(121,7,400,'2017-04-24 13:17:03','after insert'),(122,7,15,'2017-04-25 19:17:01','beforer insert'),(123,7,15,'2017-04-25 19:17:01','after insert'),(124,7,15,'2017-04-25 19:17:14','beforer insert'),(125,7,15,'2017-04-25 19:17:14','after insert'),(126,3,2,'2017-04-26 00:07:52','beforer insert'),(127,3,2,'2017-04-26 00:07:52','after insert'),(128,7,20,'2017-04-26 11:19:51','beforer insert'),(129,7,20,'2017-04-26 11:19:51','after insert'),(130,7,50,'2017-04-27 23:16:00','beforer insert'),(131,7,50,'2017-04-27 23:16:00','after insert'),(132,7,1,'2017-05-02 09:44:02','beforer insert'),(133,7,1,'2017-05-02 09:44:02','after insert'),(134,3,1000,'2017-05-13 23:55:25','beforer insert'),(135,3,1000,'2017-05-13 23:55:25','after insert'),(136,3,6,'2018-03-06 14:12:58','beforer insert'),(137,3,6,'2018-03-06 14:12:58','after insert'),(138,3,1,'2018-03-09 09:31:45','beforer insert'),(139,3,1,'2018-03-09 09:31:45','after insert'),(140,7,12.99,'2018-03-10 15:05:13','beforer insert'),(141,7,12.99,'2018-03-10 15:05:13','after insert'),(142,3,3.2,'2018-03-12 15:23:09','beforer insert'),(143,3,3.2,'2018-03-12 15:23:09','after insert'),(144,3,21,'2018-03-12 15:52:43','beforer insert'),(145,3,21,'2018-03-12 15:52:43','after insert'),(146,3,2,'2018-03-12 16:11:27','beforer insert'),(147,3,2,'2018-03-12 16:11:27','after insert'),(148,3,8,'2018-03-12 18:24:01','beforer insert'),(149,3,8,'2018-03-12 18:24:01','after insert'),(150,3,45,'2018-03-13 11:41:08','beforer insert'),(151,3,45,'2018-03-13 11:41:08','after insert'),(152,3,120,'2018-03-23 13:08:11','beforer insert'),(153,3,120,'2018-03-23 13:08:11','after insert'),(154,3,100,'2018-03-26 14:32:50','beforer insert'),(155,3,100,'2018-03-26 14:32:50','after insert'),(156,3,5,'2018-03-26 14:55:13','beforer insert'),(157,3,5,'2018-03-26 14:55:13','after insert'),(158,3,4,'2018-03-28 11:05:49','beforer insert'),(159,3,4,'2018-03-28 11:05:49','after insert'),(160,3,5,'2018-03-28 14:50:22','beforer insert'),(161,3,5,'2018-03-28 14:50:22','after insert'),(162,3,350,'2018-03-31 10:16:39','beforer insert'),(163,3,350,'2018-03-31 10:16:39','after insert'),(164,9,30,'2018-04-04 12:02:04','beforer insert'),(165,9,30,'2018-04-04 12:02:04','after insert'),(166,9,1,'2018-04-04 14:14:41','beforer insert'),(167,9,1,'2018-04-04 14:14:41','after insert'),(168,3,5000,'2018-04-05 18:19:28','beforer insert'),(169,3,5000,'2018-04-05 18:19:28','after insert'),(170,3,900,'2018-04-05 18:28:00','beforer insert'),(171,3,900,'2018-04-05 18:28:00','after insert'),(172,3,15,'2018-04-06 10:39:18','beforer insert'),(173,3,15,'2018-04-06 10:39:18','after insert'),(174,3,99,'2018-04-08 21:02:26','beforer insert'),(175,3,99,'2018-04-08 21:02:26','after insert'),(176,3,883,'2018-04-08 22:09:53','beforer insert'),(177,3,883,'2018-04-08 22:09:53','after insert'),(178,3,3,'2018-04-10 11:05:24','beforer insert'),(179,3,3,'2018-04-10 11:05:24','after insert'),(180,3,14000,'2018-04-10 20:43:10','beforer insert'),(181,3,14000,'2018-04-10 20:43:10','after insert'),(182,3,8,'2018-04-10 21:34:50','beforer insert'),(183,3,8,'2018-04-10 21:34:50','after insert'),(184,7,3.5,'2018-04-11 06:48:27','beforer insert'),(185,7,3.5,'2018-04-11 06:48:27','after insert'),(186,3,19.99,'2018-04-11 16:18:36','beforer insert'),(187,3,19.99,'2018-04-11 16:18:36','after insert'),(188,3,200,'2018-04-11 17:11:26','beforer insert'),(189,3,200,'2018-04-11 17:11:26','after insert'),(190,7,10,'2018-04-11 18:42:06','beforer insert'),(191,7,10,'2018-04-11 18:42:06','after insert'),(192,7,8,'2018-04-11 22:55:45','beforer insert'),(193,7,8,'2018-04-11 22:55:45','after insert'),(194,3,4,'2018-04-11 23:15:16','beforer insert'),(195,3,4,'2018-04-11 23:15:16','after insert'),(196,3,50,'2018-04-12 01:06:28','beforer insert'),(197,3,50,'2018-04-12 01:06:28','after insert'),(198,3,250,'2018-04-12 12:12:47','beforer insert'),(199,3,250,'2018-04-12 12:12:47','after insert'),(200,10,11,'2018-04-12 19:51:17','beforer insert'),(201,10,11,'2018-04-12 19:51:17','after insert'),(202,3,50,'2018-04-12 20:20:05','beforer insert'),(203,3,50,'2018-04-12 20:20:05','after insert'),(204,3,99.9,'2018-04-12 20:32:08','beforer insert'),(205,3,99.9,'2018-04-12 20:32:08','after insert'),(206,10,5,'2018-04-12 21:41:30','beforer insert'),(207,10,5,'2018-04-12 21:41:30','after insert'),(208,7,19.99,'2018-04-12 22:56:03','beforer insert'),(209,7,19.99,'2018-04-12 22:56:03','after insert'),(210,7,5,'2018-04-12 23:14:51','beforer insert'),(211,7,5,'2018-04-12 23:14:51','after insert'),(212,3,600,'2018-04-13 00:26:49','beforer insert'),(213,3,600,'2018-04-13 00:26:49','after insert'),(214,3,200,'2018-04-13 00:54:36','beforer insert'),(215,3,200,'2018-04-13 00:54:36','after insert'),(216,3,100,'2018-04-13 04:05:29','beforer insert'),(217,3,100,'2018-04-13 04:05:29','after insert'),(218,10,50,'2018-04-13 04:58:54','beforer insert'),(219,10,50,'2018-04-13 04:58:54','after insert'),(220,10,50,'2018-04-13 05:58:24','beforer insert'),(221,10,50,'2018-04-13 05:58:24','after insert'),(222,10,50,'2018-04-13 05:58:43','beforer insert'),(223,10,50,'2018-04-13 05:58:43','after insert'),(224,10,50,'2018-04-13 12:44:57','beforer insert'),(225,10,50,'2018-04-13 12:44:57','after insert'),(226,9,3,'2018-04-13 17:59:24','beforer insert'),(227,9,3,'2018-04-13 17:59:24','after insert'),(228,3,1,'2018-04-13 18:39:24','beforer insert'),(229,3,1,'2018-04-13 18:39:24','after insert'),(230,3,5,'2018-04-14 00:25:05','beforer insert'),(231,3,5,'2018-04-14 00:25:05','after insert'),(232,7,111,'2018-04-14 01:11:38','beforer insert'),(233,7,111,'2018-04-14 01:11:38','after insert'),(234,9,46,'2018-04-14 01:13:43','beforer insert'),(235,9,46,'2018-04-14 01:13:43','after insert'),(236,9,56,'2018-04-14 02:28:31','beforer insert'),(237,9,56,'2018-04-14 02:28:31','after insert'),(238,3,1,'2018-04-14 02:45:17','beforer insert'),(239,3,1,'2018-04-14 02:45:17','after insert'),(240,9,6324,'2018-04-14 09:43:25','beforer insert'),(241,9,6324,'2018-04-14 09:43:25','after insert'),(242,3,50,'2018-04-14 13:30:02','beforer insert'),(243,3,50,'2018-04-14 13:30:02','after insert'),(244,3,13,'2018-04-14 14:03:03','beforer insert'),(245,3,13,'2018-04-14 14:03:03','after insert'),(246,3,1,'2018-04-14 20:10:53','beforer insert'),(247,3,1,'2018-04-14 20:10:53','after insert'),(248,3,50,'2018-04-14 21:12:23','beforer insert'),(249,3,50,'2018-04-14 21:12:23','after insert'),(250,3,3,'2018-04-14 21:15:04','beforer insert'),(251,3,3,'2018-04-14 21:15:04','after insert'),(252,3,1000,'2018-04-14 21:30:16','beforer insert'),(253,3,1000,'2018-04-14 21:30:16','after insert'),(254,7,1,'2018-04-15 21:21:56','beforer insert'),(255,7,1,'2018-04-15 21:21:56','after insert'),(256,10,1,'2018-04-21 23:05:27','beforer insert'),(257,10,1,'2018-04-21 23:05:27','after insert'),(258,10,1,'2018-04-21 23:06:23','beforer insert'),(259,10,1,'2018-04-21 23:06:23','after insert'),(260,7,45,'2018-04-24 12:46:16','beforer insert'),(261,7,45,'2018-04-24 12:46:16','after insert'),(262,10,7,'2018-05-06 00:39:08','beforer insert'),(263,10,7,'2018-05-06 00:39:08','after insert'),(264,10,7,'2018-05-11 21:35:32','beforer insert'),(265,10,7,'2018-05-11 21:35:32','after insert'),(266,10,7,'2018-05-11 23:04:48','beforer insert'),(267,10,7,'2018-05-11 23:04:48','after insert'),(268,10,6,'2018-05-11 23:12:00','beforer insert'),(269,10,6,'2018-05-11 23:12:00','after insert'),(270,10,0.01,'2018-05-12 02:29:58','beforer insert'),(271,10,0.01,'2018-05-12 02:29:58','after insert'),(272,10,0.01,'2018-05-12 02:31:27','beforer insert'),(273,10,0.01,'2018-05-12 02:31:27','after insert');
/*!40000 ALTER TABLE `audit_Products_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t2`
--

DROP TABLE IF EXISTS `t2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2` (
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t2`
--

LOCK TABLES `t2` WRITE;
/*!40000 ALTER TABLE `t2` DISABLE KEYS */;
/*!40000 ALTER TABLE `t2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-06  1:34:54
