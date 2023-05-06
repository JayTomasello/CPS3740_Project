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
INSERT INTO `Customers` VALUES (1,'Mary1 Lee','huang','123','2000-01-01','M','ÿØÿà\0JFIF\0,,\0\0ÿáÿExif\0\0II*\0\0\0\0\0\0\0\0\0’\0\0\0\0\0\0\0®\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0¹\0\0\0\0\0\0\0Á\0\0\0(\0\0\0\0\0\0\01\0\"\0\0\0É\0\0\02\0\0\0\0ë\0\0\0;\0\0\0\0ÿ\0\0\0˜‚\0\0\0\0\r\0\0i‡\0\0\0\0\0\0X\0\0RICOH IMAGING COMPANY, LTD.\0PENTAX K-3\0,\0\0\0\0\0,\0\0\0\0\0Adobe Photoshop CC 2015 (Windows)\02018:06:05 17:53:43\0THOMAS_SHAHAN\0THOMAS_SHAHAN\0\0!\0š‚\0\0\0\0®\0\0‚\0\0\0\0¶\0\0\"ˆ\0\0\0\0\0\0\0\'ˆ\0\0\0\0\0\00ˆ\0\0\0\0\0\0\01ˆ\0\0\0\0\0\0\0\0\0\0\00221\0\0\0\0¾\0\0\0\0\0\0Ò\0\0’\n\0\0\0\0æ\0\0’\0\0\0\0î\0\0’\n\0\0\0\0ö\0\0’\0\0\0\0\0\0\0	’\0\0\0\0\0\0\0\n’\0\0\0\0ş\0\0 \0\0\0\0\0\0\0 \0\0\0\0–\0\0\0 \0\0\0\0”\0\0\0¢\0\0\0\0\0\0¢\0\0\0\0\0\0¢\0\0\0\0\0\0\0¢\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0¤\0\0\0\0†\0\0¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\0\0	¤\0\0\0\0\0\0\0\0\n¤\0\0\0\0\0\0\0\0¤\0\0\0\0\0\0\02¤\0\0\0\0\0\04¤\0!\0\0\06\0\0\0\0\0\0\0\0\0 \0\0\0G\0\0\0\n\0\0\02018:05:23 02:45:13\02018:05:23 02:45:13\0H¹o\0@B\0VLV\0@B\0\0\0\0\0\n\0\0\0e\0\0d\0\0\0· \0\0€\0\0· \0\0€\0\0&\0\0\n\0\0\0¸\0\0\n\0\0\0(\0\0\0\n\0\0\0:\0\0\0\n\0\0\0smc PENTAX-DA 55-300mm F4-5.8 ED\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0¦\0\0\0\0\0\0®\0\0(\0\0\0\0\0\0\0\0\0\0\0¶\0\0\0\0\0\0A\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0\0\0\0ÿØÿà\0JFIF\0,,\0\0ÿÛ\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÛ\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0j\0k\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\07\0\0\0\0\0\0!1A\"Qaq‘#2¡±$BÁÑğñ3RÒÿÄ\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0)\0	\0\0\0\0\0\0\0\0!1AQ\"#$2BRaÁÿÚ\0\0\0?\09Åâmg)äuİO¥3ğ±Ãh#‘ƒ²’OCKº}È¹/)b1¿jÆñL™Z2U[vùÖ6nŸ¼´Lbº‚*U.o ·O`üªoÆüqc\nÉ\nÍÍ&?F)kR×o&‰ã³‡6Ş´7ƒø?úŞ¶eÕÚf´CÏ7/ê#o¯íYX>ÄüÇ&mzıË®–\n\ZïÆ³lìh>£¦‰±,@g¯µQõ{=9\'˜ğ¾—¦Ä¿+Ï}(,Ü ã”6B™ÛéÖˆğ†£ushöÚ¥ÂW¼Ì?Ã	\"ë°ÁbI#æw¯¥\\T p\'õHtöó1),Î;XÚÙJÍÊÑ°oB+éø¸CJ‘Á-§Ï2†Ào2{ò¶æj}ÄZ4:o´.€2şô—,›\"Lø8ì™7ƒI”…`¬¤Ñ\\:”|íT¦²Ôr(­öºRµÔE×jW{WtÜD@şÜ»hã”u6úÆæ(ñ2œtÍZµuÒÁ‰@@c­*Ëhš„>@n¢¼Ê[KU{’ÅD\'ØW†İ3Ò›n¸Nxe2 &2sJá}~så?½T¬=ÈÊerÂ8íîÛ§‹c2Ø–^‹¿Ò—o5f¶»\0õ:U\"}_G%‰DÚ£|Êƒf=-Ô‰,Ğ¡Y/\nÍR4-M…Ò¦K<xòäcìG^”Dáyô»×/1õÖ›ì.†›r¬ n@fôŞ½„«‘x‹[B	ŸÄûy´ø|Bdø~cÎ#;‚GZŸp½ ÔÛR¸I–µY]ãæÛ~cƒ·§_Jú;ñÓƒ¥Õô½ÒËœáÊFÛg¸÷¨á¶Ÿzui¬ÖÇÄ‰×–T\n}ÆçêvªĞµi§|¨‰ô7àgõ)øR1{4·Vìù¶‘“—ÉŒgØ{ø¢Ï}ªÛÍ\n1ğÔÇœls±ïÖ˜86æÛ†ôK=+ÆOrä°Ûşf¿jÜ@«)[ˆâdo2±Èî=ÕÇ!’‹ËˆäÔâ;åozÂŞğLêbè;Óğ×õÛŸGs\'ë‹>lõÀõÿ\0ºk¦­™æl2õ®jN\"ŒÌ|\r¨øMp.³9ö5„VñÙƒÔPM>w“Tll™ÛŞš$²’âOéì(q¯hùŒÃU~æ”º†lª€G¥bÖ³TdÖ§°K|2±çïŠÕñN6ÍP\rî0eº\n’Î)¸–(eı%³Z¼h-ZljªBà\n€ÆÆ}z	™°¼ÙÈ«†«\nY¨wØ\rª\\#d~wâ+J¹Ù­FË ÜúRëYI4ŒãŞ™cº†xóÌÕª\'‰KFV¸‚\0¢SNq—,ø1ì£œüıj¯Ú>òàéj‘–UÁ?3NšèIôf’ q&)ZõÚãGº–AçT;Qå<”rş˜RÅ}yİÄÁdˆ«1fÆwìO}¶ùÑ>+ºÍ²;ó+å;‘Üg~Şâ—tîI7*d¸çÀÛäw9?.¿*¬Ş•·–W–2²)+ÜoŒıNFÿ\0zJ²‘³)¼©LÒÉ;³HÄ±ÁÇRÏC“ë¿J)ÆºGÆX%íüÍÌè½Yöã½O´®M	¯„Í‰buL7†äƒœtvêj·¤J’ÛÅ’¾A àõÇËïD´ã‹EæÄnK¬tä†HåQƒœ\Zlˆª[vÀÚ³â\r)¬uUä\\[ÍçPœî¿ÇŞ‡ê¼É*’6©]8™ŸÛâ5Ü]‹‹¶]æÅt|zt¥†ñ!¾y]º†º¹JyH9S›@TRå[ÃÎs‘CõM~âÜ„Y_\nsŠ6êUJòòĞSI3¡e9Í1ror<´!]n!}Á;U-&gº„J6z\ZƒiV/o¨Ä\nó\0Ûâ¯\\14\nİ=k¹<1Ø˜FuÙ#¾O³Fr{ƒ\\ú­‘²°ÕŒÂ0o^ø£Q¤`´ÒË‰K¿ÈR½Ö¡5ÿ\0áíö¡4œòOpÏ±Ø(ò€Ş•ÜIjIš])jş¤õã[˜•¹£xüÃ#*b2~·½rŞ$¶`(	!8Âäî;ÿ\0ßn”W¹ßJÙùycòäsdc#ïëN\Z¶\Z=ı¤:…¤wsJÀÈ]˜Ô˜Ïî~”IÔºêa£›‹K[›u‹;^¤Ï±$‘òôì*·Â×­-´ÒHÍq’„~ ¦Fùõ®[½O‚X/täÿ\0ëÏÈ|Ü‡ß?íŞº´‹n_\raÆÌ{€§ßíJèÔÑ¡•†£?F«¢É\"·2\',‹œl3ƒüÔöòõ\'V\0äöª&£áÿ\0ijAƒKi$w‘¿ĞTA/³Ìs¸èhó¡j\"ggÉÛj›õ)g_ËÉc¹Å+Íex%aÈzúS†“©+Íá»š;ğ±·›½#—9&Äæ—K6\\‘Ú†ŞZq‚»úS»ˆ¼2ñõ¥-b^k¼¯NôÜc•ƒ!9t½&—Çq€{SÍ…œvÑ)QÍ)Ã{àÄª„fˆ®´\r¯ùHÅ\Zµ\niĞxèÆgRHxNù—åü¥$úõş*{s«6—øy¼àƒu1(}wÛ¶ß±¦¨Rë‡íÒBD^$’O ; Û¦@Ç¯Î¤üu®BöWW1B˜X£_òF:ô Õ÷D×éÇáƒ94UŠûYS;¬†Ù|gÈv8+ÍÓ¾ÿ\0CZŞúKBG%™˜ä0ê?àô®nsi¤Mv¾I®änb|¤ª€ò~õËosâLŞ@w#-ïÛÔ4²w(õ-|¯‹„[¶%˜çm—í¾~{QË}‹ ±“Ï§Şe ÍÈ@İsÜc?j—Èÿ\0\nĞÜÚ&¹X¸9¨8÷#§Óêó¨5tI$1I5­ØÜõå(vzãí^f7äBQF¥Š€µár5ƒjáFsÔ`mœ÷¯D“@®8÷¯ x–uş“unO<†3×¢ÇŞ¢º½²¼Œª03Ò—Ôå–dõ€¶A^¢ı®³à_®FGr)Â=~>Eåc´ªº\Z4àôAt2TÇ:˜ğ`\rÅã.¢£å•÷%°ñXEÔî£šRçåIpëòËPMo³½(„±ËUãÃOÈ™^>˜/˜â@lo·zßyâY%ÊÀíd‚êÇ\\¦¸ô4F°Õ5[°Ÿd‹Ëâ#JìAî{œ{\n’ëaz5s$—4‘’ çÊ¤¹@ÆÃÚ©àÜî^˜d7*\\gÄSCÃöÚT/ÊN\'¸Ç\\œr®{c\0ïß”¯£h\Zè’TUKxãæÜòŒg9úô¤»KûÍRK«»‰<V‘ù¼ã&FÎzú}iŠÓY×)-c2Gù(ÊzGojYB*Lx“›O²İyJ¶\0É­œ7™bÈ\nwÜF}kˆdmElmf–5š+ÈˆÎO ÏjéÓÅÕŒsCb\Zìx¡D¾FJ`ôÎı@ûÒµó»ño$Iü(!Ê\\sÛ=Sõû|©»‚tç»š÷¥Ÿ6m±‚Fş„\0}êi¦ÚkÓÎLÖ±@§;´½½p:œUgƒo Ğ¡I/gi¥]•aP=OïB8ŞÌ`\rZşòÂÛÆ5 Ô“¹\'Ü’ML¸ÃIkoÎ·ÎE97é„åš_~‚j<O£±%¼òäç>\">âƒ61“f¤JÆÉŠ6V—7HS°ØâŠGo:FªË’(”\\a¢Æ¼–ÖQ69c×æúVÅZqb~ìejPÀ\0¢D÷Òk^b4\\Kb&ƒDÓà ÿ\0’ÖmÅ—JKZÛÛÄÀä·Lg×8È¥+_üÇé[ˆ	Ê	Ü\r¨Î|Ÿ2ş^\'n»ÅšµÕ¬‚î{‰cÍyPÃÓÚ§\rm’E%ÀGŒ¦4#\n\0æ`?aó§Ë…Aú}=©_B†0ïˆÓi\\(Ûjf,ÍDÅº@ŒzDºD–ecæÈJsŒ¶1ì@ÏozÂKiµ‘5Ì0ÂÅ*}1şõÙhª±§*·aò­·ŒÉ	(JœÁÅ#&v:†1¹í–™m¥Bg#«¿Öˆ-ÒÄÆ Œ›Ëşù®Yw†Û;äïš«ÎFvÍ%Ic¸^!‹má›£ñ‡ô®?ëW7…HÁæ ¾IûPĞ9m_—mûW:3xgs×Öš§üÂ—úÌUUS¾W¯î(dzìD8iflì\0ÇO½ºfóŒœsg¯¹¯db$õ¢ñ¨Ü8ÚÄP£øSr¶r9Æ?A%ÖïŞFeJ“±Àÿ\0æ†İ³¥‰÷ö4»<²	œ	úš~!qlgÿÙ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿá+whttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.6-c067 79.157747, 2015/03/30-23:40:42        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:aux=\"http://ns.adobe.com/exif/1.0/aux/\" xmlns:exifEX=\"http://cipa.jp/exif/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:stRef=\"http://ns.adobe.com/xap/1.0/sType/ResourceRef#\" xmlns:crs=\"http://ns.adobe.com/camera-raw-settings/1.0/\" dc:format=\"image/jpeg\" xmp:CreatorTool=\"PENTAX K-3 Ver. 1.11\" xmp:ModifyDate=\"2018-06-05T17:53:43-05:00\" xmp:CreateDate=\"2018-05-23T02:45:13\" xmp:Rating=\"0\" xmp:MetadataDate=\"2018-06-05T17:53:43-05:00\" aux:LensInfo=\"550/10 3000/10 40/10 58/10\" aux:Lens=\"smc PENTAX-DA 55-300mm F4-5.8 ED\" aux:LensID=\"7 236\" aux:ApproximateFocusDistance=\"400/100\" aux:LateralChromaticAberrationCorrectionAlreadyApplied=\"True\" exifEX:LensModel=\"smc PENTAX-DA 55-300mm F4-5.8 ED\" photoshop:DateCreated=\"2018-05-23T02:45:13\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"adobe:docid:photoshop:4758b914-6913-11e8-84da-e8c88cc3520f\" xmpMM:OriginalDocumentID=\"5684ABE1786A5D55095E4B0F2AD94CCE\" xmpMM:InstanceID=\"xmp.iid:ae01f1b7-b777-404f-a7e9-9b4d667bb66e\" crs:Version=\"10.3\" crs:ProcessVersion=\"10.0\" crs:WhiteBalance=\"Auto\" crs:AutoWhiteVersion=\"134348800\" crs:Temperature=\"6250\" crs:Tint=\"+30\" crs:Saturation=\"+18\" crs:Sharpness=\"106\" crs:LuminanceSmoothing=\"14\" crs:ColorNoiseReduction=\"25\" crs:VignetteAmount=\"0\" crs:ShadowTint=\"0\" crs:RedHue=\"0\" crs:RedSaturation=\"0\" crs:GreenHue=\"0\" crs:GreenSaturation=\"0\" crs:BlueHue=\"0\" crs:BlueSaturation=\"0\" crs:Vibrance=\"+12\" crs:HueAdjustmentRed=\"0\" crs:HueAdjustmentOrange=\"0\" crs:HueAdjustmentYellow=\"0\" crs:HueAdjustmentGreen=\"0\" crs:HueAdjustmentAqua=\"0\" crs:HueAdjustmentBlue=\"0\" crs:HueAdjustmentPurple=\"0\" crs:HueAdjustmentMagenta=\"0\" crs:SaturationAdjustmentRed=\"0\" crs:SaturationAdjustmentOrange=\"0\" crs:SaturationAdjustmentYellow=\"0\" crs:SaturationAdjustmentGreen=\"0\" crs:SaturationAdjustmentAqua=\"0\" crs:SaturationAdjustmentBlue=\"0\" crs:SaturationAdjustmentPurple=\"0\" crs:SaturationAdjustmentMagenta=\"0\" crs:LuminanceAdjustmentRed=\"0\" crs:LuminanceAdjustmentOrange=\"0\" crs:LuminanceAdjustmentYellow=\"0\" crs:LuminanceAdjustmentGreen=\"0\" crs:LuminanceAdjustmentAqua=\"0\" crs:LuminanceAdjustmentBlue=\"0\" crs:LuminanceAdjustmentPurple=\"0\" crs:LuminanceAdjustmentMagenta=\"0\" crs:SplitToningShadowHue=\"0\" crs:SplitToningShadowSaturation=\"0\" crs:SplitToningHighlightHue=\"0\" crs:SplitToningHighlightSaturation=\"0\" crs:SplitToningBalance=\"0\" crs:ParametricShadows=\"0\" crs:ParametricDarks=\"0\" crs:ParametricLights=\"0\" crs:ParametricHighlights=\"0\" crs:ParametricShadowSplit=\"25\" crs:ParametricMidtoneSplit=\"50\" crs:ParametricHighlightSplit=\"75\" crs:SharpenRadius=\"+1.0\" crs:SharpenDetail=\"25\" crs:SharpenEdgeMasking=\"41\" crs:PostCropVignetteAmount=\"-41\" crs:PostCropVignetteMidpoint=\"41\" crs:PostCropVignetteFeather=\"100\" crs:PostCropVignetteRoundness=\"0\" crs:PostCropVignetteStyle=\"1\" crs:PostCropVignetteHighlightContrast=\"0\" crs:GrainAmount=\"0\" crs:LuminanceNoiseReductionDetail=\"65\" crs:ColorNoiseReductionDetail=\"50\" crs:LuminanceNoiseReductionContrast=\"24\" crs:ColorNoiseReductionSmoothness=\"50\" crs:LensProfileEnable=\"0\" crs:LensManualDistortionAmount=\"0\" crs:PerspectiveVertical=\"0\" crs:PerspectiveHorizontal=\"0\" crs:PerspectiveRotate=\"0.0\" crs:PerspectiveScale=\"100\" crs:PerspectiveAspect=\"0\" crs:PerspectiveUpright=\"0\" crs:PerspectiveX=\"0.00\" crs:PerspectiveY=\"0.00\" crs:AutoLateralCA=\"1\" crs:Exposure2012=\"+3.55\" crs:Contrast2012=\"0\" crs:Highlights2012=\"-100\" crs:Shadows2012=\"0\" crs:Whites2012=\"0\" crs:Blacks2012=\"0\" crs:Clarity2012=\"0\" crs:DefringePurpleAmount=\"0\" crs:DefringePurpleHueLo=\"30\" crs:DefringePurpleHueHi=\"70\" crs:DefringeGreenAmount=\"0\" crs:DefringeGreenHueLo=\"40\" crs:DefringeGreenHueHi=\"60\" crs:Dehaze=\"+7\" crs:ToneMapStrength=\"0\" crs:ConvertToGrayscale=\"False\" crs:OverrideLookVignette=\"False\" crs:ToneCurveName=\"Medium Contrast\" crs:ToneCurveName2012=\"Linear\" crs:CameraProfile=\"Adobe Standard\" crs:CameraProfileDigest=\"60AC1A2E4B4616A5F94860B8586E09F4\" crs:LensProfileSetup=\"LensDefaults\" crs:LensProfileName=\"Adobe (smc PENTAX-DA 55-300mm F4-5.8 ED)\" crs:LensProfileFilename=\"PENTAX (smc PENTAX-DA 55-300mm F4-5.8 ED) - RAW.lcp\" crs:LensProfileDigest=\"66A57B210D74DD4D8A50AB84E129F65C\" crs:LensProfileDistortionScale=\"100\" crs:LensProfileChromaticAberrationScale=\"100\" crs:LensProfileVignettingScale=\"100\" crs:UprightVersion=\"151388160\" crs:UprightCenterMode=\"0\" crs:UprightCenterNormX=\"0.5\" crs:UprightCenterNormY=\"0.5\" crs:UprightFocalMode=\"0\" crs:UprightFocalLength35mm=\"35\" crs:UprightPreview=\"False\" crs:UprightTransformCount=\"6\" crs:UprightFourSegmentsCount=\"0\" crs:HasSettings=\"True\" crs:HasCrop=\"False\" crs:AlreadyApplied=\"True\" crs:RawFileName=\"_IMG6732.DNG\"> <dc:creator> <rdf:Seq> <rdf:li>THOMAS_SHAHAN</rdf:li> </rdf:Seq> </dc:creator> <dc:rights> <rdf:Alt> <rdf:li xml:lang=\"x-default\">THOMAS_SHAHAN</rdf:li> </rdf:Alt> </dc:rights> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>adobe:docid:photoshop:9d690368-3c25-11e8-ad1a-c81afb47333e</rdf:li> <rdf:li>xmp.did:847a961b-d5ad-0c4a-821a-29a1760dbd3b</rdf:li> <rdf:li>xmp.did:9c44662a-8045-4e48-ae8f-6e12befe9a6a</rdf:li> <rdf:li>xmp.did:facb6500-2e88-f84d-9215-aa99c7e4a43f</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"derived\" stEvt:parameters=\"converted from image/dng to image/tiff\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:847a961b-d5ad-0c4a-821a-29a1760dbd3b\" stEvt:when=\"2018-06-05T17:47:43-05:00\" stEvt:softwareAgent=\"Adobe Photoshop Camera Raw 10.3 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:609b3307-1de3-c74c-ad87-1395c95593d6\" stEvt:when=\"2018-06-05T17:53:43-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2015 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"converted\" stEvt:parameters=\"from image/tiff to image/jpeg\"/> <rdf:li stEvt:action=\"derived\" stEvt:parameters=\"converted from image/tiff to image/jpeg\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:ae01f1b7-b777-404f-a7e9-9b4d667bb66e\" stEvt:when=\"2018-06-05T17:53:43-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CC 2015 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> <xmpMM:DerivedFrom stRef:instanceID=\"xmp.iid:609b3307-1de3-c74c-ad87-1395c95593d6\" stRef:documentID=\"xmp.did:847a961b-d5ad-0c4a-821a-29a1760dbd3b\" stRef:originalDocumentID=\"5684ABE1786A5D55095E4B0F2AD94CCE\"/> <crs:ToneCurve> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>32, 22</rdf:li> <rdf:li>64, 56</rdf:li> <rdf:li>128, 128</rdf:li> <rdf:li>192, 196</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurve> <crs:ToneCurveRed> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurveRed> <crs:ToneCurveGreen> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurveGreen> <crs:ToneCurveBlue> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurveBlue> <crs:ToneCurvePV2012> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012> <crs:ToneCurvePV2012Red> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Red> <crs:ToneCurvePV2012Green> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Green> <crs:ToneCurvePV2012Blue> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Blue> <crs:Look> <rdf:Description crs:Name=\"Adobe Color\" crs:Amount=\"1.000000\" crs:UUID=\"B952C231111CD8E0ECCF14B86BAA7077\" crs:SupportsAmount=\"false\" crs:SupportsMonochrome=\"false\" crs:SupportsOutputReferred=\"false\" crs:Copyright=\"Â© 2018 Adobe Systems, Inc.\"> <crs:Group> <rdf:Alt> <rdf:li xml:lang=\"x-default\">Profiles</rdf:li> </rdf:Alt> </crs:Group> <crs:Parameters> <rdf:Description crs:Version=\"10.3\" crs:ProcessVersion=\"10.0\" crs:ConvertToGrayscale=\"False\" crs:CameraProfile=\"Adobe Standard\" crs:LookTable=\"E1095149FDB39D7A057BAB208837E2E1\"> <crs:ToneCurvePV2012> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>22, 16</rdf:li> <rdf:li>40, 35</rdf:li> <rdf:li>127, 127</rdf:li> <rdf:li>224, 230</rdf:li> <rdf:li>240, 246</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012> <crs:ToneCurvePV2012Red> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Red> <crs:ToneCurvePV2012Green> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Green> <crs:ToneCurvePV2012Blue> <rdf:Seq> <rdf:li>0, 0</rdf:li> <rdf:li>255, 255</rdf:li> </rdf:Seq> </crs:ToneCurvePV2012Blue> </rdf:Description> </crs:Parameters> </rdf:Description> </crs:Look> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿíPhotoshop 3.0\08BIM\0\0\0\0\0PZ\0%G\0\0a\0P\0\rTHOMAS_SHAHAN7\020180523<\0024513+0000t\0\rTHOMAS_SHAHAN8BIM%\0\0\0\0\0*\"¥í–ğÕ‘\'ö-áœ±>8BIM:\0\0\0\0\0å\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0P\0r\0o\0o\0f\0 \0S\0e\0t\0u\0p\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@oà\0\0\0\0\0\0\0\0\0Grn doub@oà\0\0\0\0\0\0\0\0\0Bl  doub@oà\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@rÀ\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIMí\0\0\0\0\0,\0\0\0\0,\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿè\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0A\0\0\0\0\0\0\0\0\0\0\0\0\0ı\0\0€\0\0\0\0v\0e\0r\0v\0e\0t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€\0\0ı\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0ı\0\0\0\0Rghtlong\0\0€\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0ı\0\0\0\0Rghtlong\0\0€\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ğ\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0]\0\0\0\0\0\0 \0\0\0j\0\0à\0\0ÆÀ\0\0A\0\0ÿØÿí\0Adobe_CM\0ÿî\0Adobe\0d€\0\0\0ÿÛ\0„\0			\n\r\r\rÿÀ\0\0j\0 \"\0ÿİ\0\0\nÿÄ?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚ÑC%’Sğáñcs5¢²ƒ&D“TdEÂ£t6ÒUâeò³„ÃÓuãóF\'”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö7GWgw‡—§·Ç×ç÷\05\0!1AQaq\"2‘¡±B#ÁRÑğ3$bár‚’CScs4ñ%¢²ƒ&5ÂÒD“T£dEU6teâò³„ÃÓuãóF”¤…´•ÄÔäô¥µÅÕåõVfv†–¦¶ÆÖæö\'7GWgw‡—§·ÇÿÚ\0\0\0?\0£×lÅc6°€îÀ.m¯µ¯®#ò*ÌÈºñê¸¸ËVœ+-h\n8š†¢Òâ›\\íÜ{ò3ZGï[ğCe_giévUK®¯,\\Ùiü%EÃdêúv{.`©†I\'²6ve¸,mÅÿ\0£i÷Ğ¸^×®¦ÆûwÆ¦C“Ô,êX»Kv±âO?5 Í­Û=NÊº¶#éÜ,\0‚<¡Òş©Q]ûï›gèïDºYƒy©ï—HİÄ.ÙtìÜÒ‡eŸÏdÌá&5~gÒ[‡¬}_Æ›*©­{-€W7•„ÏD ·ï[]sëN%Óî6‘ôF£ï\\¨êş»çmİØñòR|<ä–/P\"\'XqvXe£W\"úƒCAíÂ Âá;£^¦OO{˜2=7±§ü#˜æ°öúnnÕDáåİ\"ª‹£’8ûÕë¦)ßo±²9­¾ŸŸ^6¬ı¬ô–m8V¹Ûvû‡![oL³‡7à2ñYaª\nòıkí¶ÙÇÚ<\0áenyp<	\0¢ÕÒ­uÛj\Z\n5ı\"¯pt9;ĞÑ€–»êåeo.Ñäİ•MÕj´ri}Oı(‚„XÂ5J\"ú¢FSE´´Z¨sâ%Ofçh\'Tk­mt–Æ¡:Ö“OÿĞá¨ Zãâº|W±µ47æVKq][:¾hi‡™Q5Ì¬ºl¤<‡?…rŠ±]í!®…•oQk_±½øVpXü‡‚5#”Éhº2ê3^3¢<!J«Èµ­©‡kŒt\nMÃÙ$´5jkDò8ø„	µÂg½2ËÇ- Ú>˜ ’<]Ù®´šê%¤c•·iãt{(\\ö3we†¸ƒH¯9vØ¤èÿ\0WëËê@æÃ±ÃKíÜO¸Ì\'_¤­õ>¥KßiÅ¾ƒCU>¥÷5£}u¾Æş‘Û]úJı?úâÜé¸ÍsVØ}Œs ñkš*ä>»a:Ëí,mµ¸UŸEà¯­‘ûéğ”„c¦äà»wnôŸ­tZ*wÖ<×Ùôƒrq,{]¤3è¾û=\rË«£§ád±¶z4zW‚úòq	ôİßu1µİôı5ä}¹XİBË¨{¶VÇÓ]eÀŸL¾Û)lîúlŞ÷¯[ú“ÓMÜ6]9;\ZócYêÃ›S-3¿c\Zİïüû„]-~•o1•Œ0ú¥Øïl9±¡¸Ü…Ş(£<‡4iİlõ~c³İ™ØHŸƒw,Œ¼Æbí©ÃÜO\n¬…Hz52q\rôÛcŒ{É€t@êV–ÚÖíÜÁôœ9\nMµí¬ÚîHĞ)Ræ^$ëâ™râ\Zhº–‘\Z4/éMÌ`‘-<îY×tÔÒØ˜ãÍo¿#Ğ;\Z%¾–²æ™2§âì¼€wİä+Ä}&óÉ(¹Íi™•Õæô–\\	f’>k%˜á8—6üL 2D“®¡aÆAÿÑÅ½ísa£â¨Z	 Äğ³uÖº’ñ %µ¸ßt:‡ß‘/àpWYŒÑ†Àà$F°°0vÕkgOÑ–>†ñ<:ê¶İ,f»&°à$s÷¬®ªK½:OS¤õ\nƒ\0·OŠ£×ìkáÍ\'à¸Wn¿Õl7dà/l;Ağ2º>>[¯¯Ùêp¿Š·Ğo¯\Z4ò®dMÍ½UÇ²”¬Q>\\,ö8CcÃÚÌÀÆ°‹ÖzE?Yú3Ø%·†ísˆH÷4¢ı9ä“=¡¶›ŒëZÒà÷µ;¸«êÇö#–_;èŸU²ğs­³>ñUm-ÜÓ¹ÏGµ FÅÛaõÊ[qpÙécTĞ\0Ğ\r·Ûô¾Š©Õ«eæÌZÑ0<JÊéöI,Á„>O£çµ4J\\TNÍºídu+±³ky-q\0†îBíÕÙùŸ£DÈéX}^¦fĞÆ×”È®}›»·şø7ıüø¹î¥™[İNÓ·zO’DÏ·ù?Í½¾¢ÛèÙ›+®§8ús«ptƒ¸¿Ós?·ú?Ñ¥`’È”£D9ıQÍe~m-·è¹§BpBI¥Å…¦|­şµÓÙGP¨E¡“hÆ~|ÿ\0¦§ş_ñk?ƒy-§˜QÊ&:¡Æc+ef+7‘ v*“ÀŸ`U«–N†||+«±²îúêŒ~RJ¦LlcéşÜªaØì­ÀAs¸ù­&åÑöbæèx+Ê¶Ü¤ks¿D xj«ÄIwf2 ÿÒ\rı5‚´óNÌ:ÃtÖ[–çØÖ“ÈĞ+€45½÷T&šeËÈÂpÕºª6AkK\\8ZuÙCØ$Ià¨?§ˆ“vè«¶‹rNù\r şÎy¼íQ›ŠÒ×‡x(×O¦âxòCˆV¨­OWO®3€×È,\0Wğ~°Ñs}Ï\0$|W#Ôc\r•›I¹–‚IbxOF	ÈÙôÖe‡»s8h§ë7.·á;›„1ŞAgô:ÏÙÚdí\Z• Üy¹›>‘\">\'EíÕš3 ‚ÇTï°dÔı\0yĞ•Îãäú5]XúvËº¸}&»Ù·ı}ë«ê94_Òóó1çcíí·÷ı1¶ËYüÿ\0Ap[²Ç6`DÉÿ\0ªşÂq\ry7´İE®/­‡İ]®În¿úŸKÚâ¶ú~yº¾Ÿm®ĞM`µŸÍdNİªŸNé]IÕ°YEOx\'«E`İùcön­Şß[ÓW™ÒEÎõšYef^ÃÎæ}¿Èüõ¬tĞõ_\Z=^»é\'p‘;€çIúk:ì6a\\æ0ş‰Ã}c»ZIı¿¨æíGéÎ{,«™\0“Éåšşoæı$/­\'ĞÖ´À¨Â{ò-où»œ}P¾±bÊ\0ÕÇêk¹ùy¬l‹ÍB\ZKKx¡Èkˆßá¡	]Ó¨¾°{ó>*0HĞ°\Z7N¿©¹§f÷5İ‚TºÖÚÛ=äë!t8˜ÔTİ§‘?r­v3]{MM]$ôÖf´5²ÿ\0ÿÓÁv[‰liR·z6K2?Dâ73‰óX9İ7\'‘l{{¥Ò26K^ÿ\0£Â†Æá®qÈ=]½3m‚Ö£’\nm}uJ$òeVß¬5}­ÓtÁxÛì7Ÿ£Øy&ÏmVÊ<#GQ˜åÍİÁ=Ğ­Ã&{¸pVÆ9¤Ô„yò‘Æ˜ÓËÉEF\"÷A±ŒĞZUGtßVĞ%½ÖçPÚÆ¢<Pq]]M.#BµK¡US¦ÑuDFiYp§+\"uª§‘ÙÎö7ò¬ú3XjĞqâ«ä;&şšj«Üì¬ŸN°;íĞ­cÓÅX#¦¬¸¨Î yµ†cÔİ¯t»×-\0“3\rÙü…Êccı£9æ1êÛ}î<í¬ş©ÿ\0†³Ùÿ\0n­»™ÏOÛñpA`pÿ\0	cìŒ—ÆYôà¶,îifùO>ì»dşmtşş•«“¤\0pkj¥czƒ³A µÄ‰&\0üç;÷½«·õ¿icı«Á£yü\r®åÖ×`r˜Ó%¯xoIĞ€º“Ô.éy-¡ÎŞÖ.l‘´èh;¾œµ\0EQØ§Åêz.EY´>Êƒ™m$¶Æ<{oÓ­ÿ\0›íú_ÔT~¼\\[Óàhãnïˆmhİ)ÂŸ¬ï¢~Ï}åAh{šöXÖÿ\0ÛH?Z«eÌÆ­Úœv>oƒ·üÖ¤4ü‹2}Æ©åŸ’İ£R -.™œÓP—nıå•c¥¬Óû”q12k‚Ó\0˜PX˜&ëV¬	g¡{ÅÚÃ*XÍ4¸ñÌ•S‹ê´9Æg•¼1ë¾°Še€\'Z¢ÿ\0ÿÔ·Õ_Kğ`D|ásŒÂ.Ò8ãà­76»Ø\\] A#²¬ÌàÜ“XÖuÉ@6aË##c¢;°\rRHÔj´úgUk[èğşÊ½«tò²Yx¢òá¬D\ZîÃS‘îô/ê±ä4À<|V¿OÎ¶ÆÍ¹+ˆ»¬î{ZŞÇU©‹Ö¢¸o%	ÂÆŒ±Ã\'¡Ï{ÕQõHhÊ€Í}¶nyĞpœŒìæQ¸²­®²ë\0•ÖÓe–~ïæì÷ÿ\0„zP\0êØ MfFÆLÿ\0,¾µö^]Uÿ\0?”^kwvS—¾¿øL—6Ú\Zÿ\0Ì«Ö\\÷Qú×Mÿ\0c¥ÿ\0cÅk¤ÑQÈs_—{÷zö?è5ö}Ÿöf¿«eu‹osXĞÑ±Æ€\"º±ñØÑ·èşã¸@Ô-Ç‡†\\Dı¬ÆÉÏ.m,sšÆ—?h“HyÏû.=8­±€3ê?ş©¯å2§áâc¶§\\I\0¹æ¿ôsô•e¿á^®[—~=;êÆxhÖ™÷9ÎnïİşºmjÏ{·:].¶ÊˆåÎîÁ£ó‡Òúp´ò^Û..`×vîG‰gîÏö&7P¶¬PÚØëŸ.ô¨!»[SxúOk÷oú\nşêW¸‡kãÅ¥µ7OŞÜïSş‚iƒØôKíkë½:İX-Ôì&Öÿ\0ÂØßSgî1Zê¸oÉy1¸Î¼”zfV.&»ïgªğ‹Cœ‘í£µî¥ÓËõÌH¬˜üBD\\jüwcÉ	JC°ğywÑ{ª{uiûÂ=\rx{e¾Ó¬ø-;nèO»Ö²ëD’E`qñqRwQè„@˜Ó@Ğ?¨F\Z½€ó[ì[€o\0¢³3Ó ö\n³úçLh\r¯Ûµİ?­£{:×M\0¹øqälq?e­jw·¥qŒrìÿ\0ÿÕæëè}]ƒLœ6¶$Íòcş´ËŒNúìßRÅä6÷éÿ\0lV²«úMş‘ş§²²ï¢¥sı”ÁàÚWn»bàØ6»«m 3çŸ;.©\0ô¿«ÕH»¨æXî}”VÁşsŸzËwş„r9ãæÿ\0›ô¾ø^?ëh.œ)‡·ú.éÿ\0UŞuÇÎÚëæ²ÊÕı] E}5Ïğu¹¼ŸìÔêš²1şæñß”Zùw?HñÂi÷|?æ²oö¦dšzv3dÜÇX>^»ÜgÖæ¶Æc²Œ_Q¥ôi­›šy­ğÇnc¿qSo›Àã•&rxù¨ÿ\0]ãôÿ\0ĞSèğpnÇª÷z„zU>Ñµ#x6’Öú¿Ëô«³!íú³Ó­jtÆôfQÖ8í±íÒK7‡>Çİîª•³şùÅ™OôÛÿ\0˜şxsôyĞÿ\0‡ÿ\0Iı…µ‹Ã›äı~JIqôX8X8dä<îxÇ¥ão£PÓhú;ßüíŸç+8ØTTï`q=ş—(§èŸ¥ıT?9¼ğ~—ÚUçî^¬‘®‰ıpÈ-i:´ü’\rZÆ41î?¼6ÿ\0T³îàsßú©7ù±ÿ\0}áÒãmÏÚOvãk¶VÒDUî¦Í\\Ë\\5_Êç5T·èŸ¥Çou[Ãéqü;\'uÓğÙÛê5>\Zë¤\0£Iğö½\'ª¼3eO­àö“1òUónú}Õ >ŸÒ?GéÑÜZÓm†õlÆ˜¦{A?ù’{:®{¾«áUÌÿ\0Àããİÿ\0×¹î¤<7Ño«ÅÿÙ\08BIM!\0\0\0\0\0]\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0C\0 \02\00\01\05\0\0\0\08BIM\0\0\0\0\0\0\0\0ÿÛ\0C\0			\n\n\n\n\n\n	\n\n\nÿÛ\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿÀ\0\0”\0–\0ÿÄ\0\0\0\0\0\0\0\0\0\0	\0\nÿÄ\0:\0\0\0\0!1\"AQa	2q‘#B¡ğ±Á$3RáñÑÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0:\0\0\0\0\0!1Ağ\"Qaq‘¡±ÁÑ2áñ#’4Bbr‚²ÒÿÚ\0\0\0?\0bı\\kº^qiê›M½wÄí“	È|Új®ÖNêí=¥ %÷Òf×¶}-¥©š:jY\0…$“±\0ä>>|ÿ\0…Û†³øÓ6Hä±8ZƒÊItôö\Zex¬!ßhîqÿ\0®>1_Â˜éâ.œÅe««Óö\"µòGÒ$äòãæ<Rš\n‹íb«99TNiófŠŠĞÕwx‚Ä\ZNàp‚›ºª¨E¯~JcCÊÏßV^§ôİ=îj$¹ÄjdfîNAøyøœíÇêoñÅ%P¥à„¢¦º(Ür€•œÔ›TĞËCR‚\\îÀ,[áÛ¶{~|}†8Ú\nÕ“ ç39c ¦–¾Ü0fécbÈù9Àÿ\0Ëüúğ@k­a²zs&[ì†óZ„(¥¸Ò<„ïY¨¾¯o—Ğñç¦ ˜°B¬ê*˜Ñğ…²ì;*’ g#Qûşüiuò“O+Ë°º¬¶u¨Ef;•Û¹AŒ¯Ëã‘úç‹˜mºæ‚³PèÉ„Z‚N¡#ä#Çlÿ\0¿×9íZÊrŞò± .—:Pjd‘ğ}Š|öÁÇùÛŠ¿qga\'hşFê.«–uvŠ¸ë©UÔäØ>Ÿ—×ëóíÅß¹ «à‘®r¶ĞèGr w·Ùúe±½ãVïòğ;~_SÀ.•¤Ù¥<†A…ÁQ§õ–˜ÒUQ¾Ìş ›ƒ}O’<Ÿ§çÀÏke=åØéåŒ6UıCGQqqá‘Jå³ß¶sŸÇÿ\0™úpl&8Îuaö*?øDÈ YAÚÇ#\0Ç¿üÿ\0÷†1€ğ³ò9àÙ|Wé\n7˜¿Iö0Ñ©=üc#‹û+l¸ÒâV³Ú©á¿Ci\0DL„ÛØcéû™ÆG²\0Ù«éÑTÄ…[Õ:z÷h½G[¤_5À·Ëåßæ8œ´±ÔE¡âá/©¨.wwt[åß«•¾Ù\'İ‘šİƒ¸r?_ófê?KÑê9NhßÛ°WVµõËa¦¶Í§êDÔñÊÇòÿ\0~>aú¯ü_UÅ4ÎE|±˜rÏŸX^µ/üÆ¸µ‹BUUÅF·¼R:;ãÇËôãMş<ÿ\0QşšˆÉTĞùˆbø¤óv—#\n¥È¿Cş¨ıY¥V©ÒZváq´Áp’…nÕ°N´•S‡‰4¨–!\Z9yà%hän¨Ø²²º´Óğ±m0€-m¶·-¾|ÂYNÊŠ²OşQõçíïà0Q\"×ö~ó“‰i_PçÑš:¦íp¨¥¥Ó—;­EMÒ“Í²	ÕÆW\r±Ô©)&·…IÙë‘íoÈÇå0£¡®\r¾È³ÈK¾ˆyå]S¤4ÿ\0ÚKw½CGQX´¶ı.w\ZB(ç–>«4*•’U^¯â}Œ@7Š*m7í¾D|2²–v6Öú¯>v}‹Üİ«³ÔêW_m\ZöÍISU¦”±UŒô²âEpûr‘‰vî$·´©¡¬2BCı7õ²\n²›´!²¶ÊƒOö_Ú­V}ú’Ó5E[äÈdŒÆTùøŒ‚?,û»üsš}\\Í}Á@»…C¦ä!-w¥¸4†µÍ+Ó”•\\ÀØœÿ\0ùÇo¯5®Ñº´Â9mdNµúm´RÒô¾ãÜÄ·Ç·ŒöïÛûc€ÿ\0|\\mtDğ5‘õ£äíLĞŠpŠ¹%°@Î	Æ,ğS%ÔXùõv–îÅÈãºº*»—VFdbƒ.ŞvŞ1“ÜñUUCƒ;©•‘ò¦KúrÓ¶ËA÷d2•şhÛı]»ñ¼ñDNv÷[ÚXØÅ÷CbòƒO%d°-cc8ü~_íÃ¤ÔJ0iµÜŠ\rOQY§iŒs`’ `6<àöÁ»}8‰àê	]tL{\r·@:j•$Æ†ªŠc*¾Ì8*OqßóïãéÃjY]nòÇT0´©®²–A	€ÉØ…ñ¯Ëşx`ÉE»Ê¨¡Ú#Pê«†´†8¢û¥ˆQ¥“ßâ1ƒày?2ìõ\0Z(êj%˜\0,>hålÑI•„õFt÷îñõÿ\0?^va¡4dZ[”ºkİI+«î1 E+!T‰Gy\'îxès¬W ®m7CjíEQ¯idŒöj–-)ò~yñğı±ñàZ‰YB6N0ÇG`w^zkÒÕF°ÕVèg—\Z¨àZ“–§/\"{Ó¦Ã,\0#†Á\npÈ-l•mˆÈYºéÍA\rúäŸfóº«Ò7¦Gåw(5=²‚’÷l{•2PÕu?„Q¼î€Ó¡ö`*’äÉ0vmİÙú’ı\n®¾\ZX¹·ûßpŸğªQ+ùuùIW3áô}w ^azæº›Wİ­s;5\r[AW]\rDqŠLÊ*c•ÃSlÌu.\'Wö!¨¤©IÈßŸ§Är±LİÀéuñTKúÊû¹|Ç«yÍïâ&hcMKzŠ)¦¢:Šw¦#¨ş^wû[\\æ*†ˆßBcsEÀ;ı|}ı¶T¹³3ïÖ?¥¡>†y­ègŸ—êš/FŞ¡µ}†º{I¦¡ÑzšDéSÄgxÅ0“©÷£Ó;ádb#t\0‘\n ƒM4²Z	lï¾v¾ÃÏÒä¢ê#„:hõ7Ç­“YdÒ÷İa÷­7ÍëU=UŞ.•47Úo»É.Ïj$¥¶«ÄìÉ¸Ÿò÷ìW9êŒò–N.y?_¡*d/Ëñ×áf¯­-uå?ÓzÓ­GA>j­/ÖŞ%¦‘˜Dé\"œ:®c9\0‚\'ˆÑ:‰îa³Ë¯¬}\\Æ	ìá…ı¦ká¹ÑDvîö{K|ãø~İ¸Ï¸áSÄÀu3C¢Y«>ó\"à;c3‘úËüÎ›]!iÕ.¢¬:JĞÛuBu$\nn‹ÿ\0ÓÁıåÅrO¢áÉ½‚@QQ-%ªIi˜FX•8üÿ\0Û€Ä£‰hÄØÁºW/Z›SRkiêo0<–ùtCà>%¿líÃT*2ä8ÄÎ›;+,\\®ƒVÛŞ­àR$Bcu_†3úÿ\0ó\\Ö„Ş9»f]T5‡£[EÕZùEFDà6ï`÷Ã¿ïôã¥á€¹¨*ª=Yæ‡ºƒÓAÒ3[²và«3dÓ¹ã¢¤ 9“S¡¦­[Â¦Ã®	ïç/ËF–+»BŞ÷‚\'Gq¦¨³…§ï˜ÃÆíÿ\0ÎÜÚ]¸N0{JÇªm?5>®ZÉ¡•Qd8\'\nW\0‘òí´|¾8]3€}ÊÌq^Ò:\\ˆTLÚb“Q5L¡°w8ùñÛòùã…õºŞ\0h@Ç3ïtÛò»–P\\*éÙ*éâ*Uâj‡DOlgaØ‘ä~8Æx–ŠGT\\xíñÈÇ¦SÇibNƒÕ*â¸ËÃNé¨á†ãe¥t†šßM\n#Å±ò;™$%!C!l‚*§NÏv‚7´òÀÜ?ob²C×Í™¹a«ØóÛTö‹µœÑBô¿Ê s/LF¯ø\\\rÌƒ\nNCnG‡İE`r:¿¨GÊá¡‚—OM}=Î/SzS•’_iél}\n„zŠ‹LPÓÇ9 û´$hŒûÉKo2ÌZFËHç5=7hÛHrE¯ı¢M%CLÃ@:o{oõÏ¿Ó	¢ä—(ù»cõmÒ>¤î·mg.¡£Û¦İ4ÂŠ¡\'IˆÇµ‡A`!ò«€\0U\n©ŸHúwfÀ´àüN2}=¯¹$¾xğEìEˆñÛ;zŸäoômËSª©!Ií¨&„Ç-DÓSI±™‚™|7`rªHÏÃ\nydkídš¡Œ‰›î‘ï´¯”õ¼Æ×ÔZŠÉSUu\r[mPxÚIÖX®ü ñ#S¯Me+\"\"ÌrÁ_+ÇêYHğçëñCî±üjÓw£·ßÛïâ|Ez@Ë§aŠFÑF™@R{vÎ;g„ÑM–¬”°Ô´÷Â‘ÔÚçOĞV¢Ç8RŠ7¨ş“ÿ\0Ï÷âNa ¡û].\\v}P.·š6\"Œ¤™9#Î?¿÷à\n˜$•¤”—®Ö°VMü/®ÂNàœ‚¼÷ã/Qì–Ö]‘Òh\\¢-WÇië)AÊá‹œà|¼~¿\ZÓ2´t|8ÈĞJí´İ-z.1@HĞ÷Êéú¯\Zxeî¦¬gí¹)\nmqm¸î3å%AâN›H²%²5Şkê·NZïQ,•Q°\'rœãçùqV«ì»Øµû¡–¦æ|t•ÆkKR6–\0nïß\0ş\\^e\0,™/swº&òY¬´úÓÒ\'Qâ&PA$ƒÛ¶~Xúqèæhi.À	ÿ\0	=¥8¿,*ï¬.Is«DE`Ó²ÔšWËÆ€î+ÜgÉğqñíÂ*ş3C»Î°ÙOŠR6H¯m—Ó+«¤¸S\\uN½Yx˜Gì<ş~?S“ Ó(#¡­N>Ó4Všš\ZÚy%‚ª\"-$e2€0ÉˆSŸÅíùùÏ²¶`ÿ\01° oÅ‚?Ú´¶†ç·.\'ÑQÁCUvµÓ¤4·Rzs×J±¨‘Õ<˜òÌ»`p{•Ô¾(xŒ!±Úäs·‡Éi¸]wdà/p1ëçe‰Ÿm·*¹ éi)ÚÃlv¯’:˜Å‰ãW]¬er°\\•!›\'\"NûU/s!ª-x±ŞßÚÔUê}8sr\nHı%Vè.^sšÑ¨.U·)&PÔğÖÒÈñ¤3L¡RC$yuh‰;\nm`ñ¡4=«‹î0…­e¼V¶ıœÜ–û¿Ú9MÏ}j¶ÜãÔ\ZDÉ¨kzóFÖyNÕH¡k+ïÜÂÊD¡µA§ˆTD_~H¸âsu…º÷[1nÔ\ZoEéôiº}T…CC\nÁÆ6¨ñÀ÷ñô<Ğ@Ë”ªH¥öA`kŞHjºCw–à‹j¨©ûÅ²xázº$VÁaøål…¶fºXSÄcáõğ(ü‹ïŸï(±Ãå“ù€|úü ß?ùp—FÏ¬täğVÒ¥:Î\'¥p@VÆÖÁrå—$d\rÃ\'Ü¤åê8-E+5³¼ßáæq.^ÃŒ¬ïºiî`ßy³=Z:„…e\0h=ÀñØc·Ä%ì¡¥šùãø{ÅIo$ÁZôU^›Óˆ’Ò²ˆÓ¹\n2<öøöÿ\08[¡ç)ëaìâ²j]nÖ­l-«<ŒÅò†OÀşŞ|‘ùğd”¢FŞÉtoh™tmç©`K–ÂX\0gë ÿ\0ŸEOØî·“FÈ.6º²].¡\'Y]#ª$“ã\'÷ıø¿÷!˜ZÚ‚áunĞÚ«NÉYw`Äv)·pÎ|ÿ\0íÅ­•Ò’ÆÍ$f÷VZ-`i!ÕÇAcíÁ¢É…=}Û”»sŞçGy–\ZYš Æ„÷\'=ˆ?ŸŒ`YøäÒlS3öMòöıxzê»ôR¼U	\"r\0^êöı>¼0Ükõ/eUû6ö.´| &Û-	Ô<–±^ôÜ”i´Ç‚»{p’¾’zÚW\rG<Ó—isr–û×§¡5U}\r­#İ&â{Gè8Ù~’’x)Ä3ºöÙ%”¸€¸5MâÛi§4±°éŒ÷$y\'·“$nm‚QRàßEÙÉlWë%t§‚Z:É‘â5ñ!Y°à†Oc6,„n !ŞÇ†\\.¦8¥Ã{uíÖTi*–ä|•ã×ï¡­ë[“—µJµ}d|FÇŞ»¢3§eÈÆì7†0$ÜÅø[Üÿ\0ÜÓğßÀ­ß\r¯i²~G%úoìqÕÚ_’Rk+å™¥¨d¬¨†A©M¸D*ûrw`ûÈÜ;üFr.2ĞâÙn\rÓ¡HZ´As_”>tŠh^\\ÕIs©œE<•ÎwÆƒda¡W,CafBÙß$‡qÅÜE¢[F.yy\"a„¹½ã„Dä÷¨+¦­Ô?Á¯7\n+}ÖêÌ´UM1~•BLè)H\Z¢ÜwÆı‹nUc¨e—@íO^J©˜İD\rºë«¨mó.çlÕvë¶šªi\'¨ÓÑn·Å¨Â;µ<”Õ.~ï’F*ªS	ˆ‘¼±¹JXJ¬êx ío=ùgn°­¶iãÃo/×¦U6-1iÒb=Io4W\nÄ¢¯µÛ­2A¬’¦*i0û–=ŸÍ T¸ˆ,sÂÁYcT•C/{-qüÛĞòû¯UDÉcÆëâ‡>—yyÍ{u?7´\rÓo¼OD\'£˜i®hŞ‚6Å6†9\nd`­´¶ö³‰ğÆÕÄ_ïüöØ®áL”—Æ;üÇ]x¥·œZ½lÖì5´/I[Jíôó)GÔíd`FA\r‘ƒÜwÏÈÛ¢M.#’Ç×9Ìio0•F±ÕÕjx¨§›-!?!œö¾ßóàáTİ:BCK†MNæš^Ti£QC³«€yRqòøpµõNsìºèÚˆ\rA$BN„QíMÇ+Øü?n;/’ÊÉ¤9Ö‘5‘bsİqû|ñÿ\0#õáİ+\r²–NEô’©:\Zšš–\0Td\0ø™âéR$\'º†ş§¨¨hur‰zm8]I\0gúc…µ,{bu¼7Ñ\"z½IGe°Ûé­±\"@Ğ©Bƒ¾?çãßˆÍCYQÄŒi¸dÍ x¦Ú¯RS¥\nÀdÁ+Æâ’yc²nù°„ÜÑ¢[‹J)âfgøñ»¡áŒAÖJ&~§!÷J\\kë)‚ŞáÒÈ>>?çÃô=Ñ¸ºXË—ÒòuêS\ZVŞ¬»ÇØ‘…>{÷âYc\nÛÛ!1\Z˜´º—–­i¨¢†ZÙå’IëgKU¹Ìc\'\'h/Œ³\0vP\n›ŠYõÒ´ÈsçÏ¯o‚Òğøe0•V–*MA©b¹Ù`aŞz›à`ö·’¹íØgÏb{Àã	Ç)c5%ì_I#Ë\0)B×ÖGåö©•®—\Z·~‘[£Ó§I¢D(dwU”(_k®pXüG	©¡v«ÓGaˆ­Êè¬PWé‹ôÚŠ¾Şè¨áªÓ\rĞ™Œ—W“©NYa€¥XícYyI#ãO—Æ‡_T®n¤}Gj©oZ\nĞÔ×Û¥Q¦§~¬Š{¬[ˆˆBC¡‘Ë´°H‹+,b $oduÔ5¥¤^ÖmåÏ`ˆŠãÌ!§§YtÔÚÎÑ§ôûGV**\"«`)ê¨’\nÔe¨\ZŠƒÀâŸr†H\Z3C*G±Ø—wmí‘s±·=òUíısû_ç|-å&¹¨¤³PÚîš‰ë©¡•%³İ(àŒG,\n»¤2T*¬Å ‘L1¶k0-©`•İ˜a8å¿]²h»ÅÖÏ5MõıéÖßÍ\ZÆçV†¦^ìÔŠº®Ô%ª©æ:•E³îÑÆW{‡Æx{*A©Œw‡ò˜ñößÉc¸·¸K×Cúä•ë&Š·TZ^)èâN˜-j2~xÉî~Ÿn2æ¸j	ShÚÖiygSÒ¬4ò:í$>T½»øì>>HäÂóZæ«?0ïĞÛôä†“\"EŒaÛ¿0ëªå”i²\\%ÖÓ^.ÓQÔÕ\"1”†Ï€;ü>|i©{=Ik$}Š ZôıÆÓƒİ€	|`“ûñ]eDQ€\n>:bñ„²óöñ>ª½¥dq\ZC´.@ùü|vóóúñçFl³fRñtëú\Z¹Ôé}C%EX‘Tì÷QÅPğZYZd-ÉMøq,eî™º­cmÚ“%r³ÇİÛ‚Ã»¡73Ûšè3P\\¶õ‘çÎ8k 1€(j¾Uj¶–èT„Ë©<\\;KV¡«*vßGlŞby—Ü1@\0ÿ\0Ç˜r¯\rQ}`Yá·Z´2m”Ë(¡–jGF¨*Ã!ärã?‹¿o+ƒ’pI¬2’)AÚãß¯ÍÖ£ƒø‹iMFºş¦˜\\¨º	\n„4ò‚Ä8.Xûpr6±$ã\'ÜBçkfòÚÛ\':{İ&^¦jm4œÂ®K„“ÖAD^¢®*H£–Hi—®pY>Öe÷†`C†!Ã¢So[ßvoåEm¿JrÂõ¯¿Üõ\reªØRŒRêv6ùÄ2;Ô´2&!’Hé¢7Å*,A•B8‘Ó\\qÂ¤_V3d4¹ßµEîº·ÔÖOf’X­2Ó¤’TÈc¤¦¥¬IU ¨UX‹L²Àğ)–>mwqwwå¹õ\"Ã|Xßİ4ŞÇ\'çÕÂåô¿Yuæ5¢¾ÅËúAk¾Ù)ë–Ûk«0ÁWu/,QÔš‰%NÖé/C¢Y0Kğ\\M3sêvúòû«Ù±Í¬nQëŠšŞ}Ö[­:ÒÛQI­9JKazÊÚèé)Z¦`ÁÖ4‘ÓHĞ©= ƒ(X(c¶F¼ß6ôûxèp ö‚Â:üø¦¿JÆúÇMZíöíCO\r]­˜PÕu¤Š$D¨@Co\nÏÔ…\0†®‡ğJò-{;í×É\'™c¡vúë8Koª~RÔò»˜	zÓÖÚZK.¢ª¨jJ4 =Ñ˜Ì±m\n¤L€Ç·Äl™¶s|Z•´rëoñvG—ˆùûYek#0L\0È*+HÑmmZ¹¢bFÑ–??Ó…2÷¢ÕÍpS¹ãRó‚õu§§xá«,±ƒ°)óã #Wy(­¦$´Ûú“WÉs¬vd–F;X~]ÇÇş>\\kâ•ƒ	]<2Fû¢…—Ÿt:v?á•uÊ¡Fæ<ğ‡‰C,¯»¨¦kEŠCÔ¾SÇ+ !;Ã±Æ3ğü¸|öêrÅh³Q_–|ş©åµ½(®{ÌQ/°®|pe?tiV²¬Ó¶Ü”Ôş¿iê5D4z1S îäà7Ë·È×‚üaæaàœ°õy§/VA]%õwLœü¸RàØ+Û#7ÊºÓs<_éc¼E&Fñ°£ãóáuÜ§#ƒ›©K×êÉ(#K‹Ö1£Ø§ÿ\0ÎuC\ZË•q™¬+¶Ï¨é9Û¥î§¸ÓÏa-BM2Œ;«Dª¡Éì=ÅNÿ\0Ü^çñqE5Hªs¨È67 û~|·§\Z¼	­×$=åvš¨²s.È)’’wX£j€\n€Ëa˜á;†Ç»¸\'4ĞFèëÃ+­¤Î\rICõ›n¸[¹…Q\r=¢áNµUU•1Ò¼’âEÀBÑeÚH!·+m 3Šû£;{:·[¯l}è€*¹ÌîgŞ«9eC§4®¦ş)Ô¼R\Zë¥\r™éª¬®Bòn*â‚¨L³<±;í™L‹#±­{uŞß‡ÍFİÃ~~(eÍôæn¡°--5T÷hmv¨i)æ·Vµ@±ÒÆ*ˆİ•¦jJnÕE[§÷S§\0«j;(ÙcõÅş<¯É59Ø7ë¬ø(¿FüÜÖ¼©æ.ŒÖæû_In¢®š÷Ks¸ÍN*ÄñÇÅbHJ°ÊèªÌL+‘š2Ä6Ê)‰hÍÈ\"Ùõ¹ë°¸WGy\\~=uœ\\å8úQYùsêr¿U×ÃSl¤ÔöÊ\nç»ÓKO[\ZÕJ°³Æ…‹E$ÔòªÃ©©ˆ«d [;s@Ô1ıZøßËoesc.Œ×ºtt¨©ÿ\0úÕj¤«¡¸WMS>Ÿ’áKmƒs«‰=¹Â.àè¸GÜ	ÚÚŠgv×vûßçŒøYQ0Ù¹|¾ªõÌm\'mçŒ©åÖ©¶\ZG3ÏjVN•DI#DÄû›lŠ&\\er MÍ«iãâÆ`îsuœª¦kÙ¨Úßß·İ-4ÏIAj4Í0Î~î~cŒ!qé*\r``²s9c’	e«lÆKçÇ¾’ƒ‘Ğ^”¶<7·;ßéÃX*‰î’”ËAÂëMQÕK$òí}ÇqYG‘ì>œ¨Y(WFü\"…·VRÓ:WSØ€\n|ş¸<Ô0,ÇjĞlT3®µvêY%§+øF‡áóğıÓŠŒİQ#ƒîë«u–¡¦®iÚ7gw¼v?,yï§i_­©,±ë©ÎRóCV[®)Im­uY¤÷©$•ù`g¿ş¸ìñ€Âë&|?[^.p´Ñı]ëSiº!zgpJ‰9ñÆJ¢r$!jàÜI¬Ò¢²…W¢ˆtfş>\\PùÜábfqqÂğĞö›®šÖ°^íõÃ5<r,5&0\Z2ÊC7‘¸ì,0ÙóØgíó2¬<Zùğ¿?kø®ÒLøææ¯7NZ[57éïĞÏMÖëª¹R(Ox\"\'#~ğ’ã98ŒçúXmÙCª¥•[tVş­Î£ÓÍeß®Q[uç}ŞZ}5\rî–²†hé)òFæŒ{‘ˆ!r™ŞHP7à?O=TA¨qi¶S¶jl\"éq¥æİeÎÁ¦¦²_ª+k…B¥¹EIĞ‡¯ìKÓ°\'p”Å2®ğğÄË(öÓ¬u–½ˆ;œ‡ÜŸíL{n¬)©tş«Ó\\¿½\nK­ôtÔğÔÍQM2\nt©-ïÌ»’\"]	Yd.¯´$kê‹ÜóËû·¶7ÓÁÍ!¡§­ıÕ«Krˆê:\Z\Zzš ®1ËRµ•bI:+nÄ£ş]““ü°¬¹9éæ:şV	¬-ij&òË”ú…ot\Zıoi[ÂÒÍt«‚RµP‡şãÜ#Œ9·®Æ‹¦ÀI#7PÆçG3äx\0?{ù~<‘M`hó)ôÑzßP_!±ZµWĞ=e‘…ÚÚ§lĞÔÃ(–¦b©!˜»;hT”À!ô4µ³}âİ^è¢eœG¯¯ı¼/¦oÔZªÕEuW‡­E;İiÃ£Œ¥£ŒØê#û‚’7o‡5´ÎÔC·\"×øâÿ\0e˜©gfç3‘ßÛî|ÒÏ-U6æu÷DÒÇP«k¼Ï\n¥aÀW`3ØÀØç=Œ/§ì+$kNÄ¤Öé:B¢]õL\Z¦EÔ(\0ÌŠì;œö¿Îü+Î8A¾¨<YEİ9yOª6ÒGÒ`0eP{vøğD¾Wœu¡_2}.WËxëÒáŒaü\Z\' Y+«¥sİ…#,ÒÒÈ°ILv@ÃcéÁ=ûá`îñº®j­ —ùO(›“ÛóÏùãj{MÊ›qBcr6¢¦ “@8Äy|?,ŸWt5ÚŠ‹ãÅUtş¹Øõ\r+D« 2¯S`ÃãëßóúpÚIÚøˆDS¶ÌZYé&ën¥²[¢åcHÚİ³şgŒ´”ÅÒİ\r	­¤®Šá\r:ÆTêvéLµjRzfÓj¡©«ÕW¨ÚKe’K…z$eÌ«ÏH\0w>DŸ‡ğš&ÔÕ‚ïâÜŸÂ>‚˜ÔL\0KèUjiosÃZƒ]sºU­kTIC2À®ddö¬ñ\Z££+Æ®î”›ßkØr‚ÚÌdc–ÿ\0•š¾¶kèSV_PÅLµt•Ìjé¥t§ŒFDR6Ö‚n¬n\"ëm)2´±°QØ®H4ºRHÏ¾}:Ârâİ	eÒZ¢*‡Ò¼ª°ÖÌ—Z­BñURİ(€5;j¾ñ\n2Äí¼—÷¢Î×N˜éxÓ¼‚æì¹­¢Í)¶Ò\\ß¶z9® ²i]1gÔºšK­5|ú®¾Ğ“VÍS!ÚÏ#GI¸÷=0ŒÛ—»!¥ìiÜ4°z‘ùºäºˆµÏ[­\r—FòSÕo\"0ôş—·[u%%:ÖKr°ÑÁN•Õ#Nb”Æà3H¯¼±!”Ì3¡&Cø§¤âTÂV46Mğ-__qî‡¦¬¨¤ŸAuÚ|seA§Òr±>”41G\\·ijî45KÍFi™\ZdÂ–i6±îÅz‘ü•sÆ3ö&&äXîG¥ÓØê‰;¢…°WÔ^)ët»ô¡¦^—ı0‚xM+†\n…ZSÑ!¨¨R bÃ¸wG	dszóù­2±Í—_ ˜ÎPVZlöÕµÓèŒ’Ëts…W•cyQ4…™`ìÌ¤?áï·AÃšè£ŸãÃ<¾)5{LÔFß>ü·ÂÏ/´QĞØ=_ku¤Tèô†Xé×\0I54S9>rKHİğ<÷Ïñ:6Ë\\çv_2âµ&\Zç3k[èz£X:ÑÃWLÊ¬/ŸêÏÏåÂ©(\ZÁ„ıŞ«:ê–¼ËkR¢´1/ÿ\0k#Ú>§ùà	£c2Ô•eÆÅé-±^)CpH*?~üú›İ£´(u|åÄÓĞ²<A‘I=¼òÏéÃèêXì/˜JÛà*õG.Z	ºÔîNÀs¸Ÿáà—°HÌ.FÇ…xÒTO”õ2m$“ß>éÂçÂQmg2kGr2®í©>÷M	èuc³Ï|ïÃZYß(\r±³SÓIÉMÕÚi¢®53&1ŸÅù\nn˜¶vG}:òPÀ>ùSµTmÉn¨~À©oSÚ¢‡@z3Ô¨dªÅNsf`Î½ü•|aOvĞŞ¢$–Áõßı|<ì6?§¢.ppKGÙcÌ*]3Ê­wj¹È´t	O<ÑôåÛ½ |Tn—¦®_l”j}Î™–0}È\Zğ‰û\'_ëéo²wZg½u„‡ú¤æ«Rëû–£[p£ûÅÂ±®”õğ@ÀË$Ñˆİ×,Û$ÂÊÈ%p^B•­¡rbë–€ })rÖ)umóÔ=âİ£Òâ¾—FAMŸ½ÔN­šÉdC‰#‘c8BbaRîÌ3Jå;5ãËCê=ooÖ\Z²÷®®–ØBá,ÄËRá\ZU`#†HSŞÈÊûÌk¸‚…2‹Šš\\ÛºãrS™è_ÕCrŞÑ_§õl°ÃL”ÒÖ].o_t·Ñdšwy%©X\"I%;0C2¼d+ÕÜÏhjËÆƒÏíğBÉ³“²j¹Ï µ6¯Ñõ:Ï•š–İ¢Ó5UT Uz‘Òm6ûãçc\"äÈH!™o •ÍıÍ?ònmmüG¯‡·¡´“0;²`óğëŸ½ù//CœîÓ|äŠ§H^¨ëí•PÌ°ß­ÂR:Ï&ç‚±z„\r²0›goÄ	\0{xOÂå†q ãÆßŞÜú².­²EwÇÏnI¨Ğ–ÍC£5ô2Üb–C÷¡H %ˆqÔ1˜óıÇ,RBÎGrâ‹öµZFÃnO•¿Úy#©¦ö½íå¯1ğYIö£j»×v½†+G\r]tš5 ÒÂW`QàÔ$œäù#k®ï3×Ù|kõ®gxÿ\0Ûÿ\0Ô ¥F»¤{|/4E–àœø\'æOô§ÚÚÖ b˜®m1Ìk=&¬‰®5\\îeø€;vá$Úåi²eI 	ÑœĞŠ’Ô“%ix¤_h#¿	eÑò[¼i¸Ù\ZåÒRG0ŒSmG÷1	2ÊÉ€|ÕÍ:ì>³Ñ¶[E¦JØ“·-…ø×ĞZF&Š62è+|·Cw¸4±¸GNÒ(?úñW€ÇÀKê%ÎŠº²Zí–”‰€/w`<ğIUĞ-F\rv²‹>*ª‡b6œñ£lŒ‘–	ŒS7FJæÇ1(ôí‘ç¦¨e öúø\nf÷B² G U?×§3*©¹k¥t\\F”:ÜªR²—$s²ÉmøšP¶Y±µÉŒ·+I†8Z0F|sËŸA}Oôä6¡cìr9ïñY¹¨ôş“ı&ÏÊ7ëM®y“F×ìÉd3PÛ¡¤•¢ƒ\0ÆÏ)f†Y;„»³4a€÷kùÇÿ\09&¬ìçO<¯zbÃ_r°ÜPš‰mË\"¤†$œÔ÷¦Dmµ@É÷TJÆ`_¯ºœìÛp¶ºzé*Ij‹í-=ÕíDÕÑWÒË¶’²®V–t\'.Ñô·•\nI&EŒÿ\0Q<#ƒ¦$m²) ¶0ƒ:væ¿ÿ\0©èäHV•å©’ëKU3ÓÏ\0w}… p±\r½>¯õ¢\\âÎĞbzÂsğFMGÒÔ:jûoµİ¨íÏzG{m•^ib¥—8&C²Rm­±ª˜l]Â3ë½®¸åÌº\n`b9­ôeê¦åm¶éaÕÊ°CXÔô´×Û³Ê)Q¥0ÄÑ’¡—©\ZH‘ÂŸÌÙ°Æ¬Ş†°Iv8Şê‰â\0İC]tó’ßi¥¢£IÙ¦kf²ÒåZJ%§™C+BıIåy:±À ‹ì\nÅĞu7¼\\g¦¦?‰¸°áÆããòõòMà™µT ÀğğO…]êÏ{Õ¶Ù)íkÉ@²K%Á\\¹„ÚP/lgxİÍÛ»{êWµõÆHñëÇäwÊ[nŠùÀ<¼|ãÏ6°YOë—t:“Ôf³×45kQItÔ•sÃSNæXLÍ‚¬[Á#ÑğìÖÕ±Ù¾ÿ\0Òø¯£‰Höœ_öKNµ¢¨¶C÷HWpoF$İ‡Ä‡Ÿ2>}Q\\d¨²‘¹¦şG^oõW´®K•2\0c|€Ï\ZŠ8ÛÙê*W~«ÑsEs;VYìÉGS$¦<f5pr¿±úğ4ôÌİ6Š¦vÇk­\\ ÔÖ‹¥!ˆ¤g •#±À’Ç¥û {§d4æ½í(èeƒ¹VeGáÕQÇ.›®^Á#˜Cri§„wŞÅF÷Æ’hÄÑ›¢báÿ\0¸\Z¬¬õzÂH)£¤¢ªlœ\0 øã-\'\r•’]«•ÆÛ©=Í:›5CSÜ*^J}¹F\' öı¼şùü¸\"-p„ 9ñ	^—}eÖ·¨tıt²¥X5ÁâPÎĞ†ÃSåp3Û$´wâÈ¥.”·?ëÏÁxİHlsDÿ\0PĞ¨5	æÖ¿¡i:\r;n›Q«F®käšhmñş•ç–31¦äü(:™YÛT‰]üZ<÷…ö&ÖäáşÏİf§«/Q+ÍŞeİ¹£¬&†â×™Ú¶›.¤šIÖ?ú„DŠ‹Ê;ÈÊˆe3Êç“ÏÛË ¢&„±ÙéÓ^óëFiÇÓ•u6úKÅ+^«–³=Xh¥—ÆGhbtÜ«Œ’Ê4;Fµ¦ç*9Ò\0Qã:Êª\n»İU²î*ªà’¡VÛáŒ¬ì¥£hT¢«Óàª%q#ipÛuñDÈH9B«.¥¾]¯Æéq¿\\]®ÑTBépÅ<\Z¯ÎãnÕ`†ö¶Ş›[eÇc5œºÇrå³[¥µ\nÊk‡V†*Ãµ0W}åÏİcŞZ\n‡¨îùŒ/u!”ç½Ú,zë­Õ‚Úp½ù3v›—ÜĞ¬»İ+ç¢©¸U¼fyz1UĞÊÃ÷vêå\Z]‹2É•˜0‘_rËOnñm9·>ºIºæá47-ue×¼Àå.¿¶_ ‚¢Í¦ë¡‚9èSî‘/F’}²ÎÌŸÉ3ÇJûİ¢´lê…âÚº˜d{]&ãáµí·ÒèšhŸgóûîŸ\rEÌ\Z+uï\\Ò\'ğÚ´¢ÇQÔHªŞŠíA!UÛÂµ’R@.2æ`ØõJyX\rü=–nº¯öÜ<:ıã{uë¿ŠÏïQğÃPèaÆïÜ³‚	$÷ñõøüO/Z#ˆÛuó1OÚH—»Ş”¥¸Ô\0l.3àdöíããóıxùÁª•õz†È†Ñ´eG7*íItIåBî¥>ÏŸl(x¤•Š­Ğ\rYVËG(ì•§0@lå;níã·ù-w{MšŒ™¯L¯+u•ÊKZV\\˜†dÁÉìx?ˆHölŠX\\ıÂûæ¡µÕQiÕXŒ#*¡s¥šüÓPV²ß*iênbA3Ç‰rAÏÀÿ\0ûşÜ}\Z‘ÎØ­W¡\0d.i/ÔÔôVF>ÍÊQÀÇƒœŸ‡’ÌŞæµû…î)DÑ+±ï2IK#ÈCûv‰\\ş3ûÛÇÏŠ_LÇl°0\0M‚Ó<Â–}gMg¶QÕKWY!ZxiéI±$…\0ŸÂ7cè8QĞiZH$3†4•Ãö©z¼¸ê»Õ#ôeî…´¾Œ’\ny¥*±Ü/pR\"ËUÔÂEA‡‰#YX†Ê§yUuS#E hÀ°6öÛ®y_a Ôôí9°z¤ğÛgÖÕöûŸµÏOL)©ÿ\0ê(ª‹E%DŠ‹\"Æ;fe8í½HiŞ¨\n\'G‚stÁ ¼å^­Ÿµo*uúŸPi¶[•¬ÏPõJUª+FbTÚ9éØîvw<#dŒ·^.¬‡Cw—İ¹ß¯ÑõT³IXjmµ\nµuQNñ“PÊ*€•ÕÕ¥•LL6ÕÜ¥•0Kİ8å×ûQİøD^GÑW™¥Õ•t’UTÒSOM¾\ZˆöTâ›$à¤”ìî”\0€ôİ&R‚€/Öß-ü•ösE“KËú9qÊ:\Z˜¤z–h%h«kÄ¡æT¢\r,tğl1‘°¨uØOI\"\n„Bû nğë¯šè›ºº¦é*KErmAIªÊ]Ñ£ˆUISÖ£„OŞ£˜2ÏİËeA#hé§sÄbu›[­½Õ¬°İ7>–yC­/:‚ÇG§µm±énõVÊ$©w–j:7ˆ*±\"1fß da“™VD¶Š)ë™®ø>V8çéÖÊ÷Îa¦qğÿ\0c=];sòÆÏ¢ôT\\¾Ó×A\\Õ*«­êï$0Ç5Âº¢gw’Q\n…ŞcÇa…ğ£†ÜaúÃ`ˆàn|ÿ\0¥ón7S%E@m­nHÏD[îPÉèÛ‚¥Fsç?ç×Œ]o2>Î@AJònCÍUç—úÂ{U]<›w…·b¾AÏÃ·ÇãçéÆnN\ZIQ•l–^ö#]v™•©·t=½Mä&0ŒŸ1òïÁ44í‘Ö¾ÊM¤’ké\nÙ¢)ïÔ$7jgŒ†Q¹I‘Û¿ö<^èì¹sÓ’%—Ô=º–ÍĞJ”«…el|>|l+(^ç9¢i8q*®¸çõmâ®e¬VDşcøíŸÌü8·…ğ–Äu¹h#£cHÂö¤Ô”«@MDŠ¢Äãï‘ùøşü?-kE‚c{1eã mz—™zÂŸBé+Q¸\\kÕ)Õ\0\n†Gvv!QQUİİˆTUfb\0lqŒ{äh¹(zèŒ±¿9›ëÓ”~«/¼¯Ó*-m«­ë8¾Şê­\r=–ÑH6+ÏN¥Ã×I‰Uc= 1*ÁT<âu=ë>BmnCâGYø¥¦à¤?SÆ<yût|–³í ĞúoLÜ¹Å«4n¤æM®Y´•u’©iæ†¢I[ş¶®‰)ÅhA&c%6f3BÚSËÿ\0P4\r€ûı‘ñT±Ô6M7ëúùòKÃœ°óŠ:“¨ 5qÜLsÉT*£ZJõ;¢F©“ká½Û¤!½ †İÅ–¾¶ä¦ıu”ÜHÛÜ¦;Ò÷;}3rQÔÏp¹ÔÏ[§*‘ª(ÖÒıKÕ^äQO\"ˆÒ%r@gË°R\0ÚH,¦\rï¼ç\\˜¾xt3ç÷V«÷ªmê—›/×·E]JPQÔW¸~V‘¶–*zN	ØC;gÜ7fª†É#‹Ÿ”U#b0¾têš›o9k¨nõBXn¥5‘ÑuC¡aTf]«Oş\\t±Â^guHŞÓ%½4j+]¦nºîãÌ\Z­”{¨£¤©œË!¸µ=;M!‘QERÃ·N64ğ\rÊ›)d\rß•xæÀì¯ÚŸš6V–	j¤–—rÀ“Ûê^šYd„Ä•äK÷\ràØ}ˆÒu\rrpY*aÚ‰*ß¡ù›O]YEMsºGKDâ?ã³ÑU ‰\"ÈcO\në$J\"²\"VWŠ³&ç—.¾½Úîí–z¨\ZÂåmÔ•æê(æ¤‚††±.4óGÑY¦a0ª¯Okª¹faüÅXÊ®Gøm<½¯hña·5McÚ\"ÒÓúóLòéKQS-e<ˆé×r$*¤>àp>‡¿HL³8Œä¬Ğáe÷q9UÎ`éıcq¤j\rwš2 õRÙ#)ê¸ü¸\Z¢’±æí…ßöŸÂ¶(#„Úá.<Ûô…®9u–ç>š«¥Ü†T6ê€$#Äa’6\nÌObÛTc»ß„Ïà¼V¡ÎhŒ·˜¸\"şWµ¯ëaæ½WIÖ\rµÔÆ…ôKqÑ°Gnº‹$5j¡M4Ú‚‰œd‚½lç??ˆÓ~šã¾î`ü›ÿ\0é5¢Š…ïÿ\0kÌº¯~™ot…E8³²³1j\n3Ÿ1/\0â\\ØÄ~PõÔÔ“¸ßØşBéma{­¥…:¯&å\n™îsó=<çÇÏâ8Ôv&GX3mÈ­`äÿ\0;n\"–íOÊORµ[d¦¨¦°Îë8\'Ê¸ gõàŸÛÎÃ¤°ßĞ¯h7¹Â\"[=2ú¬Ô\Z*CêˆÃ¼µÊÖôQÊ‚öy¶«•í’p	ğ¶‚­íÕ¦ÃÌò&ëºã8{„pôéÉSéw•üÖç4èRŸVG¡ªìú#KRêª(æ­¨¬áyâ`´ØÂ¢ÈdB¡Ø“İ—ÃBø®÷Ød~Uœ8†Ë>Yd\'¬fÕêMw¨i´6•h-–øê?ÔÈ+¿®ÍP:œÕ,Æ,Gb);pÌ!.”¹û‹XŒî®‘úcÑåÎÿ\0T´j_\\-ö+]¾°†Š&§Š\Z.œÏÒl©ê•bÇ=5qÚM§?„æ1 ÙÇÈM²˜®Yrnë. ÒÙ’Ï·+ÍÚ:b’ŸËPÉí†5/€+e[=Üo¢]2:÷Â½s1e7QéÒÿ\0¤íÖÍQ|Ô‰d¦¨¥dš{“iadt=i‚÷¢7v]ÑñäÀ30^è~j}¯­åQ™ôµÂ;Õò	ÌTµtwZyCãz¢•÷«`{ÃI¼0ìªd¨{ğÜõâŠlxÎ:ğ_˜§ÖÖaEÌÈy{ îóÊ˜§ƒXY«*iÿ\0©äÊÅQ}ÎÄ“&şÃoŒîó¸£éšnËûuò]ÿ\0Œí…»Kzo÷VÈ}0ë}c¦kmº–šÃGEu»Ú®0SÚôà‚¥lƒØdbc‘©Ë„]ÌUC*#8û\0 3>¿Ò,pƒa©ØôSV?³ÏDÜn_uw7µmEÅ‚¸­Îzu˜mnà©Ã>ÏrÄ`“Å-ãr·f‘² p˜9“ïdxå ½5rŸ¥÷Í	KxXpáo•ÄdFW„½^\\ ¨vÇn@â§qZ‡?¸séo¢)”Í	€«õÇ«´]6í#¬hìôÌ€Em¶PŠb‘à\n\"BIËmÁïŸ›Å«.uî<×IIkX/7ûJ¹MK¾»XÜ é1IhäƒÚ¼ª“ßÈÎ2|pÎ/Ô€€Hµ½P2pê;ŞÊ«zûI?ÔuK0×åª)ƒtë*k¢gdÉ*…Ÿİß \0¹øw EÜCŠÌI×qàŠŠ\n6Á¶*}õ¿Ì˜¦{åO3®÷äztÒ\\ eƒ*6Ä1pÙ»d\0FIãÂ®¥Ø$üÿ\06Qq£º\0ëÑDZı|óUu®f™B…†#<k²#‘¸ƒœü¼cÆMU2:;d½” <—µÓÕİU¦š\'ºê+˜û•¡ªaîv¬£éØœöíÅš ›Ecğ…ç¶\";×÷?•ÑvûZ½IêK$”7­UYjJMM¬çúpT‘â;~øá”Ÿ©kõw:ğT7„P·ùwû@9¹_CGMnÕµŸte,±B%FŸïdP¥rH?Õó¯ã¼Mçù”YáÔ@ƒ§*‘¨ıSs¤Á,.`jAÜe–²å=B¯·$å¤Ş\0,@Á=»àx¿‹W¼åêŒ5	ù‹Í;ÍêÕQpÔ÷Šzºúx›l×å€\'œàŒ€OüñK**\'\\›x©66ÄÜ &¢§—ŸšœŞé(¢¶ÒŞ.¿tÓ–©b±Û©ÇıùUJ–A\Z«’¾ç©İ{±;¦ÈÈ€µ€ëËÏÖùY×1Ò¿{ÿ\0»õ…3éî¿”öë¥~ehÉ\r}Æ¾¦y™dv‚”·Ç¸¬’U\Zb S…På;p5L¯kIiä>}tT©C[bàšhùÑÉéõ¦–¹^õVû oâUétµˆ^ïJÒš¸aB˜£Ùö÷VpÖ8Ø+ÊU8\0IØƒ~Xñë>¢ÆÊñÏŸÅ\nõe‹Rsòÿ\01¹½ªhî\'¤?…½$”±SÓŒ²1…U7”qD!*:®\"^K\Z>¹õEÅH\Z.MÕ×OrŸDiû#Ü)ÒYª)©÷\r–$¿ËÆÛ‰\nàäÛ<gß[?i¤X_®e\ZØØ¿hû}¨Û‹ÚÒ¢E…+í’C#y9]ğFHÁÉ çÕM<Áİëÿ\0ê¸ù®a\0a~Òkià5VhtİäÓ´â1[QQI´lr\0 “•\nqàT}ÃıÂñ{ˆQZ÷š’RØÅ=›M\\+zJÉ:ÔUM9ï ÄÁ¿	í‘î89$ÈiÁyà×ˆQ|öiî’©u¼øÕIiD¶òš¹úQâid¬ÙßÃ{3İJöòp<v\0ÖQS‡jtâş_í%\\äwb>ë‚ÑÌ^bj\nô»jw¦Š‘›«EĞe	v$u$>ŸéÀù.shÛc\\I=l¸Ùj®B˜Ô¼êÒÓRÏn°kO2ue51?XÙ0O`H?Ì-ì$g}ÀŸ_è…i•»!¬æåª¡(&Öw‹…RÈFj\r*ıˆßü´PrÙìU‡·ère<Çm6Wû”4.ËíyÇËû5ZU•0“QÕ¨¦CœÃƒßC\0r[ëÄ[5CKœÓéÏê£.^tüÓÒ0Ù$¡¶ëº7|+ºVÈp1·kKÙ{îÊ¨øü³ÄCŞğ\\Â}\0ûë´7º}ÉBbó[\\Üï¢+72iØtıâ›STª£)9ö†rqÇiğ\0ãAHşènøÏÅ¨9Láøw²>iød–æÔôõ-kHÓKhŒ&9\r½[·Ç¶;şÜeÉ$å?h¹²¨·CZhke¨©VºpÕ<q±ÇÅTãéÀú‹A!Z2ÕûUs¬¯ªşÕèÀ€Ê:kéç$ü{€{ü@ùqÆ+óT’I¢ùm¢§\rˆ‹eNìÈÃ9|IğñÅ=¬ ^¾HKÅË–öÈıHÓÕÕÉ¿Š[ëd•$™En?„¡\"68$Oa‚AÕÅ[3xYÓ‚ÿ\0tºZv\Z±~`•{å×\"ysOc´Û\ZÒeH¡hÖIÊ»²¢¡˜Œ·á_?øŒc…r×TÈâç•|DĞ\ZÈ¯mÑ:v’xáK|Nii)é¡yàFX½Ä&YO`\0xPª\0&š²yA(¶ÆÆ+\"SÛ©¢\ZT*Ï@’#Êí íR\0óŒ|8“Ê_kù.àÙpò“]İu­kĞİ))¢ŒJC­ teÕ	a¸‚qşß.Ü_NØ\0 “ëoEXq¹\nÃGKqïp¬‹QÖÃ1±tÌlIaÜ²>Oõ|OÖÇbĞ}ÿ\0+ ›¡_0u]òŞÈÔµÎŒ%Xƒ¤Œ€Iİ• “ãÎGaÛ†Tös…Â{šË…i5×*Ú{ÅÎõ_Tä²˜êk×ñÏs@\'=¸!òÒ\0Ë­µÔf±¨††í\"Ãl£!™‡¦S’	AßÈ\0öÆNsœñÆHı\'+Äl¹¡¿H”ôòCn¦Ø0y8föäîúL\\A8P&Ä<¼ê*ªmOqÛK±z„ß2!]qq#Úã#¾Fx<0=€1qÔãê ¬ko¯¨6jû-Ñõz¿ã ø@O9=ø®røˆsEÔ¯b¤W˜ì÷ç´ÛìÔQ¤„¯S¦Å“³¹lëòøŸ¦%­\Z¼×Mƒ/èªº·W]$¾Aˆ \\ÖÂ¾ØÏ†}¤ıÆ;`äyùœé#ÈıO\'ÑQõö¯Ô\Zbâô¶:Ô†6–SOç;Ïõ)ñ“ûğï‡ÑSÔ4ö‚öó>^	uDò°÷Mº+ÿÙ','3 King St.','Union','NJ','07083'),(2,'Mary2 Lee','mary','22','1990-08-13','F','ÿØÿà\0JFIF\0,,\0\0ÿÛ\0C\0\n\n\n\r\rÿÛ\0C		\r\rÿÀ\0\0g\0–\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0=\0\0\0\0\0\0\0!1A\"Qaq‘¡Áğ2B#Rb±Ñáñ$3S‚’²ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\"\0\0\0\0\0\0\0\0\0!1\"2AQRÿÚ\0\0\0?\0’WåKHçß^I×Â›Q$Q†z$ƒÌUŸá#º!Å[·Â7>ªP\nQ	\ZÖ8À#]ÂÇçu]®ø\0­*É8Å´jZğ±c£<#ˆR¦ì.°½ ”ÒqÒA>gÊ°ÿ\0\rb<1‰*Ç·U»û¥[¥ÁÈ¤ófŠn6ÃÁÖJ†âyQ)NÒ\'ü>(Ân]dşbNdé¢‚† òôçR×{Ü—c§Wõµcn^\'´D)ÉÓûïÜkc€ôswŠ¼ØÊSn¤Nr;ö¢ŞĞ¦béºl-JDºA\0û/o[{NoJ»#\"@\0G)ªİ›èÇvĞÍŠZµ=È„è Š±w¡œ%ĞB‹‚—Î64La”‡”êUxxT¤ÚşõDÀ>ı(93°b]B‹–·@‚¤ö#NuA{Ñ•û¦ZWT‰2s9uñÔ×M«K†BI\'´tùT[¬%=ji ‚˜Ôí§õ÷­æÑÙ§9ÃW×Ø‘·bÙÇZŠPØ2¾àëåFŒ:·ÁnÅq¤7uˆÕ²c«a\\qWw!ËX4Uw	e™™i\rd!1?qU÷Ï+D¥ÔĞ\'1;­\"Ë›é}i=Ë7qE$\rchô®aéÇ†QÃ¼_×2Øi‹æúì @˜T|­t¿âÆì€â³$7£¹¨;ûSÛ!¦8}q•Õ-ôƒü 6~´T¾úkÎOqô¸TdŸZ`İİK6¢­H$h$øR¦Ì\nUÚ	xMxWÊ¾“ã_‰¡mF‹©8‡	†€­ßRğ= ~gÚ„ş•®èëˆ¿\0Æ²>äna.Ÿá?¥^’}	¥YQ	<fÒæİûge\0ƒ¦n~GıÖ³ƒ1o¹JUnµ”Ä¡dróÿ\0e±54¤èAĞŠ‡g|›}JT™şSäú‘èGíÛeŠ2ò\0Z@uI\0‰çş¾´Íö(€ùIQˆˆ_nÿ\0óC–ø€±j	T)´ï›XßÖ¥\"MÊR¾°	$ÈÔGöÖ|*Ø½%”pßaÎ%õ§!JÛòŞ´-[%iìïôşk	Ã/+8ÈI\nŸ÷ò÷­µƒêRĞt)P:ù\Z\ZbÇZl6syü¿­JU¢Ea! ÒFÃIş•íëyi(;LLsŠ}¢KS#»ë]†¢‚é†¬Èj”øıëY(Æœ*J‰\0‰$|¹oß[{Û\'.R„Ä$oŸ|«1ˆÚ)Â¤,gHÙguTóX>,Çğÿ\0XÍâbBFÂ„_´—~-Å–xjR0Ö;dÜr	=Š+ôÄKàÌ,ªÊÕW‹£+` ”´ê=ş^ş<¿ŠüUõëÏ\\.áÅ•,“™JY2Iñ$ÕC;b¬zô§&¾SíÚ8şr„È@G`LNÀISÌSŠ6Ì&\rÂÈ2¥JR™Ì sT¤Ì`£Íµ«÷d¦İ—PCh*#Ú•\'n¸=µ’¡:\0<€Ğl6¥]€—	#¶¥à™ú×•„î•®ÄEz(T²IúV`BKE «óA‚¬zíşªû\0Â¼¼J2 ‰fj•–ÊV#C;Ñ€pØR=³Ê@û4x5––a\r\"Ôi)ö¯S$Ã²5 U•³%K%q©å½LzØl¨Dğ5¨%Ş•BN+ÕúØ’S $iâFºúøïR0ë…¾%!Ó4öˆ3´	0®í£bj0Â˜%L©µ-Gg	ï\\³û\\t™Å|Œ\n×ÅƒZ\\‡KØ¸Bs²Ù9IFu#C´‡\0=•€q_ÁŸ£»xCIeAy¢Bœº¤“¤¾^íµÚˆöÎuªId’è1Ó”ı}EsìÏÇ7üyÑnbm!«Å±7\r6âWªVRT2i©BÎQLo é<5µ\'*\\pº™\0ÊDÿ\0ÉûŠ$&qâğÖ%J\0`s$oL3Z¥ÆíÜ}uÙÊ’ \n€æyëá“*\0¦O=b}ÿ\0­q7NcŒpßÚ8½…!sğŠÃ“¿d]Í¤<³zİÃiVWJĞ¤1²@×1:å‹Fxô|òqÜ;™Vä¤å?™3 3s­@w	A\0JÆäFõ:ÖéW-=9´‚B´5šOI‘>Ú·4›pt›Ãí\\`Î•¡O¸”ì”Ì×.cöËmOeaÆÛ3¶A&A ¨‰ØäìûC²k·1´´í‚’„¥\"\0å\\‹Ò.mk>……;D)K„‘áš štw®8áÊà)JI)lÊ&ƒĞk¹5«úµ½h€\nTÎ€Ì|£Úi”Û ¦IVnàŸóO3H‰lå	4ª{V™§P4«Ò×àÔ$}øMb@Uwø|\Z_‡™ğ®8ª·´í‰X\Zøÿ\0j(ğ}¯U†¤Àƒº¿ÄV*Ö×©pé3áD¹J¬‚R˜1JM‚^ËæêÀTiÈtıÃŸ»$ ÉuåP¦9Å5sr¤ ê|*f5×ÖÄU¥e¸$$˜åĞ@ÓÓI¬ôU„ñjâV,^¡°”eu€G|¬C¦çX¢\"®UÕ«¬RD˜\"=577m´R”©J¥\0òÿ\0pÈÉÅê!ôi„ÙpÂ,Ô¶¬Úl*İ–d3ê\0IVƒDzƒF>¹K¶ˆeĞ”¸L´†ÀJR›IşcÏóP²öø¼£æiŒL ¹itICa)‚±\'Ed5 ƒúI«NñçoÛÍyql‹ÆßRI9PHs0(’&R™Ò{S:V7Œ£ãs àåÀu²r©D¨-_ì@ßb“îkÅ¶cpá¸-6µæ™)í÷è5¬v=Ä¹nÑ«k…6«”åRA1 •ÏôÉîX;m{ÃŠQ-´JÂTtÓz4Ó\'”%é²a!,­(€rŸÓ™ğßıS7`\Z$NÛ}ëå½6Ãë=²ƒÚ0Ÿ9n}é›Ë•9˜À;v£\'*¯Ö•$‘¥ºcÃz²‡“l•…]ÙI>tr¼L¡J\nMHçC>•|1	€¹;Gf3œ®šqÀR9„\"}Âf£\"Ä€áµoá¹”y÷ÎôÚp¸Éöª@Ò…jVà\r9$¥*Ñ§9@ş´¨LÑ¡ØÔ\'ÀÓ£²THt#™ƒO«ñ¦£ÇëR|²ÿ\0]ø´ÿ\0Øfü^Ğ®Hñ&´¼;Š4JB„*NµÎé½½Ì\0‘\ZÕğÎ8õ«©ZÔ£—r~@xÖ|’}4¼zãÚ‘ÒÍ¤¼\"9ERâ½fb„ˆäÀ¯œ-ÄMâ–)RÚHÊ¡ã^±‹ 	Hˆóğ h•tÌıİúl”zÒ]O5¤}Ïø¨6|D•ß%M¸-,Tè`‘::ñŒ<ÊÏVÚåõ‰Ì½’ móÔò5’ø&±mIyH’òÎDö”IÓq¬ÄÄîš^áLbš6˜í÷Åbxjn	.[İ´\nÒv„‚¨Qtæ Fs„úCü>é×n-Ü¸ºréÄ-ş©Ä¥a:6•¥´‚JP±\'lêT	s	|¸‘náÌÜÊs€\0X0 Á$¼O=*‹:=MÍú1o[Rã{Ş¼d‚ ˆ˜‘¬o¦±Ad\\–Å¯‡eP|.ôt/ñ3|Eoas›‘oÔõŠs“N‡\"õ3®•²µ¾Nl©JA*„öNŞƒçA¾Œ0®²ø›«Ëë„¸Ëj-İ«3­öFd¨’døøùVÒÿ\0Šm,ØzâõÀË\r!\"c`I=šd61û{!òxNÆªônìqòğeY§bËÆv«–ÂÖœåCQ°4àî4w\Z(¹·A¶²uD´§*P“”À<À\'ÔNºQG»}áÚ	ä\'O¹¢Œ¹Ù[‡²Êé¥U’ Di˜kB^.KËK ‚\0ÔE^ı6ØkŠQ‘è%Ä·‹}å¼S$˜ÅS“ÆM¦ÑŸ]šI:Aï¤,€|Mâ”¢2 uğ¯Aó–b|jC­ÛÚ• éP4¥XaÍ¯ãÏÉ€=ª¸åÉ<‡¥iŸà‹Á=‚j½î¼Aÿ\0¦iOG¦Q+ºTv£Ò¤ØâW%r§‚9ÌT³Ã(: ûW´pó“³·uOO³SÂ,1€_Z‹—\nmWP„©TÄÇÔÑ6ã‰­ñe%Ö®Û\rÀÈd?>t…ëjB¤¦Ü¾´ösuÃÀÒœ-˜Ê‚d$ê”z“Ò™¸OVsl¤6ÛAÅÜ+«L«”3ÜNşCxÓ	ÄLâ8K\'²‡¶9Üa#^¨î˜ğ\0˜Ş;¶¦°®,ºÄñVı¢å$­Ç¡æ£å¥í,’â’†[/]>Á~İÂEÂAIé›´‘Èj;ŒKt”lô¼Xó^Š¾	â+\\wBĞ´ºôvœH… û˜?q[†xêÖĞ=×¸Û¶•”(\0²‚ŒÄ\"LF¾Î<i‚ã=68Ÿ…™sÀº\nzÈ´×T©?Ã˜DòĞúÀñ?L\\O©-Ú`7M¶\n`¨¨+ÜûVÂÅ(êm\\eÅÔß[5ñM=û”¶¡\næH’{„¡+Å­ñ=ıµ›\rõöVî¥A¿Ì¥¬œ¨ºˆSá ®—8ŠâÁv(Âo\Zk\"Y‘ú¢I?8¢ÏAX^\'vàÇ19m5Öe°ipVë›(×S ‚e0\re’ë°è‡Û£¦8‡J0Ë&ŞR[¹JËM„\0Fº¨\r5ßÎ(“l´aÖÃ:²”ÈÖ²¼7Š5afµ¬%¡\nÈd(ó¼\r¼üêŠûŠo1¥”¶ßR×y:š®„šè‡Ê“åƒ¼}Äoâ,|%¢T¹=¥\r#ÈĞÖã	Æ.ëQ9·Çq¢+LÀíDó¦Ÿl2ƒéTJ˜Ië%…ò®<ba›Â@Nh0\"*B-TÒò­\nØ“>›S	ß¥<•²©#NÒ•*µø4«B	çùiWA<>É•\'Ò™ÿ\0†-Ü)\";Å*UÇ\r¯ƒmT	Ê4ğ¦×ÀvË˜@\'MiR®4eŞí0døUMçDÖÏN¢FúR¥Y‰„¤ÑX†‘kp§Y|!`æÏìju¿b6Ö¸[Š(&Ä²B\0$ÀLh`(úÒ¥HŸUŸ¤WW•m_–K·àO†zí]t&åJS¨JR”¨™“\0i¹:wÓhèÚÉ³	e©ñıÅ*TÊê…”ï²ÎäÆèám,Ì¥Zá863†º‚İË¡”|‡ş>Ô©R­ñán9§È²¥õ6Ï]ü:\Z*BJgQéZ™on\0\ZR¥GUQ©dDÛl­–È“™(1ãM®á:¨“#•*Tâb®¥A~zyšh¸¤Ìè°<iR®0AÂ”jb4‘J•*ãÿÙ','333 Central St.','Newark','NJ','07029'),(3,'Tim Smith','tim','2020','1970-12-20','M','ÿØÿà\0JFIF\0,,\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0q\0–\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0B\0\n\0\0\0\0!1\"AQaq2‘¡±ğ#34rÁBRá$%5Cbs‚²ÑÃÒñÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0#\0\0\0\0\0\0\0\0\0\0!1A\"2BQqÿÚ\0\0\0?\0À¶×Ax®ñ^Kb¹--œW@W@\ZQ6WJµØZ@WÅ·íµ´·w	^Gè2ŞO\0{Óyµoì\n!¹Ôg€œàN?=´­Ò•	­¦ŠaÆİáÆrNiëí.ãOXÌ»HqÉBNÓşÇ_†G½]c³ïõûK‰mÚU	(bÉ?fØ\'çŒ#Rµ¨’óH¸ˆãpRzô#8ÏÌT¥™Å¤ÍqÀš“OÃ8ƒüynÖĞÍ¥XwxÂ•ÅQ-íŞk˜â\\îcŠÕÆœËŠ²‡5ñ|kLU™¬®jğjk132N¼àñŠ—Øm.Nşñ%TCné×ÿ\0u`Ô»\\ÙÛ¢¸Ú½Tgš‹¥*é),R1d-–uãùSWlkå®–Şä˜-AIÑö<¹äĞİjì[+à¸y”&ãö‹?Æ‹Åkµô1—‘Ş³gÏÊ»‘c¾º¼õÕíU< ¦0G½2V+`Û=óı_O³v†K8²2r>÷¯t³r5	a¶L±®ó»­zãJ‘£ìõÅı¼˜»½E\ZÈMŞ_,Ô‡µúœ¹\'|@\"‚‹?Ÿ5Eåˆı:¶šD-uŞ)YI\0‘ŒàÒ¡Ó\\YY¥³[÷BÚ¥I}àääñJ¦ßGO†\\9¯i5Ø^*tJ\0®ÅrT×¡MpÔv+Â)m®‚g ¥8êŞÖ{¹DVñ<²¨¤“çÒ¯\ZŒt;‰î¡k£w4]DD‡Ü3ÎxaƒIîÉèvÚN•Tşè,¡»¬…2«»¨İœ‘Œãb¡ö«´Z†‹§Úéº:È“…T¸¼ŠÜHÒu2~Ç ÉcâNE­µ^”ŒlüÓ#yRá§º–V241³&@ñn,@8ÜFFz\0qëP{ÇmFuQ+-¹Qâàg\0œ\0889ÿ\0İJìÚêÆÆ)5tu¹™Ì6;/L‘Ç>|úåSá°±úãHåD¿gxP\n†^r—Ù9ÇŸÆ±JNS{b´>Áš–œ©o¨­œiİÍ±@\'?ƒ~zúz¦¶–8’I0çŸÙ‘Ç·#‘úÁ&µ@Z…†#>w\'Áœ`¶}×8éÎ*šöıcöQ÷¹ÎP‚¬¾`p¾„qëÓÎ®³¸üiø^­çŞíf³–	ãŠ=Ä†:z:ªj:]æ¢™t’]ø:ùUYôé0.Ø8“Á’|$dÓÏõš‘§v“[±µëss\"íñ$‡\0œ^˜Ç<óÏŸZÃ<Zè’ƒ¾¨gEkKrÏ)Æ}\0Bél¯ Ø’Ø¬ƒ \'==è\r·h Ò…³\rB&!”©ñyÌTÛfú›ÃiŞ\0¯ºoç=pkL\Zk„¤ºKd‚-J(íCi\0(/½³çLß[Üê}¨‚fŸ¸³°Úæ,ó+bÛ]Ìñ‹™Ü¬7G»pÃ…™4Ö£{x½¢¾K=é4„Œ`b3IÏN3÷Ó·ÁRŠêë_×n¤úà¶…:+GÏÒ•ìv¥o£i—ú­¨•&‘`ƒfág¯–iR¤«£9W3\0•ĞOZp.h½Ÿg®oÃ5¼²w&ErÛC0RÅ<X%€pÎ<jM6ü•¤š6Ÿq\rìÖ†&ya/¸\"“Â‚Iø`ŸNj8\\ô®cajÁÙ\r9oµèZXŒ@{Ç\\pÄ}x#úõ\0Ğ¸mŒ²,Q#I+¶ÕU$˜­+²G Y–{ƒ„L¤Ç.£v×\'©#ÏÚº¥ü}Z¿Õá5õ»3Ã –y‚iU‰İĞÎIëÓş_Z3ea¨ZÙƒ«İ0sƒóõ??ºƒèöòÜÚÅw%¼åw~®Ë»Â	Ç°$òxù‰·ö²hoñµ”„‰á\0Æ§É@†çXgñçÙ5ÓÓ†XşØí´bİÛİI)ºÜ	rrx:t$ûútäÚuÔÃ½‰áÇ$½9ãŸÆ­–¶PËo\Zp2y§õÍoNìì	mŞ#^H¬Dy\0…>”#ñÚW\'HIfí%lÊõoõPË+Ä¡>Ñİ‚ŞÄsÓ¦p<†G4&Hšâ_¬M†V\'i‘wív°Ç®zçÈ„¾º]WS²à!TFcRsÔ)ÉÀ\'œyÌ)d.©jŒÀÆ™e\nXª†$’Hl`O3“€*ÒµÂ\'xín–ï0er2ÊÎrA9å‰#œz)Æ:°Öª’¶ÙPc¼9Ú­ÉÀgœùŸ^jWÖêH¤ÙzˆrY€ğ³8\0ØÀõã¥@šy>²$C¬‚[\'Üg×¦:Škg%cWvæ\r·ÈUâpÑºŒ0éƒøsÇô£1ko¨ê¶f;_õ±nñ¾WOø†|ª,B`•˜åUw#¾yòÀûÏåLé·H×a¾™p$))@NÙëì=ôülÎ2ÕøG6;WöM&[.Ë[ÊBKqlÌH81@ô»››«-fêæÙ£7.ˆ®AV\rŒ•YõX}OPØ4v¡KYˆÎh¾Òé”¶vy%–0cSXsî¯Nf8’µmNÈiÚm†ÌC“±Á#\' ç“œÒ¡ºŸ\r¶àéE„e]Î?ºr8÷¥I)teR‹{U³š¥ÓÜ[é†èE~Î-Ş’ÙÚ[#$œá¹è\rWBóO**T‰E¸»F‰¨éö6R˜­ï •e,N\rÄøNqØc“Œüè\\“Óî®Ì?Ú\rh7m\0 ‘Xäô;öÇ?U5Lš±Øk÷¶¶ö°ÉAlr½êø½@İ×/O…#Nø[xÉT‘¯vS²ú7gÓ½·µß>r.g!äÿ\0·\n9=9Ç\\Ô£ÚÓ¦ê’Zß$¤\"9D~$pTr½@aê:õ¬ú¤›´šlXÆĞ˜ÔÉ‚\0õ89?/¾£_}!ŞOˆş¥hñº6!·/9õàş¹W)U!VˆÚbÔm®ôîöÚUšFFÊ‘ìED¹š;ë«ÜÆs†C‘ËàMdú?hbx\Z;+¹¬œ.ãoÁS€\0ğF=9À\'Ë4jöãZŠÀÆnĞtÃrùâ#$u=>ìgùZ~Qå¦Z¿µm´Hû¹g7`ıVè	Â–\'üÊj‰}vúûb|tf‘pÁ´9#8;²<ÆAéŠ‘joÙUhr„Hè1‰rÃQ·• üy¦ØNòà©œ•\\ 2ä@téïÎ59ÅÎ4ø‚²¿AMq g”@²¤;yŞ©Ğ¸VR\0>xçËšb[y/.Únfhû¬&Aá³Æ|¹gŸºÓkØëÛ»¡;@\"QŸÙ$çÓÏx$õêjÅeÙëM-¿e22Írp=I¬oLÒ§eÓ²7¥{Ù™âÜå™¹\0çŒúHûúW“öEà„Jª©ÜJ·O‡Ãßÿ\0İR+@•ùPİiÙ-/})Ö?¶6¼1×…`»13ª\0Ç•ã«yò¥)ßÆK6ìyÁÏ?šë[túöÆ‡!—p§\0ÿ\0wË8òõö¨-)o…Jñ´¿s€Ÿ¯5éY+V°µy´†ŒH¯5ÔÈn3…^¼|¼êhoµ»h7É*ZFZ]«•B@ÓÏ¯ßQ´Û¶ŠÊË¹†>×ui27¶ò8ö\0Æ¤j×—³¼±}u/w½WjªãŒN\Zöâî	³Ëj¤Á°½*ßWei@uu\n„íOıu¥F5yí#Ò\"´¹ Ê®Ònûd.=ıy¥I$ì+ü3ÅJyW+ŒS€àÔï„T‡´îN\0ëŠl1ô®ÔŒs@]ÅÒLR!|9ÏpÎ9ôÿ\0Ö¹f\0ÓlØ¢³Dm5­ZÒ]ö÷÷(xö§Ï<cãCJí-Ğü«’¶}9Øk8µÇØŞŞÛ¤—2GËÈ„3\"Ù\'“×çFå°#CŒN<\nú1˜KØ-9BÆ;µ)„ãÌœŸsœŸsV©#ÜCœô«p¬n“+·Åa!<àã­yœ{®úLtèZ•-®ë’ÌG_N”IãÍ®0‚‘ÁÙ¢µt\n€‹ÆG\\tª~»xİ˜ Á}û‡„ÿ\0ŸëŠ³k×YÚ¸yÄlIÉ8Æ>kÕ{@Ó\\8¹VŞÁPL¡¼N@9à–#˜ö¬Yv]FŒTıê3âî~é–E-”’Eˆ8#§ôëïCn&– cIr1¿wQ\\Ìño§<ŠN=@>‡J—¢écR¾vÂ›kq¹ğ9#Ëæ§¥K\'&’4dÈ’°Í‚Éi†Î¤FXg*X>ñRõåÙ:.KÜ´ÎÎ„à\0t÷Èu¼¿}/[iwÆPªŒœàœñÅ×î?´{IeonÒ÷–0Xğ‹gaù×­âIw®Âzæ™¨mä1’€e‹¬$ûçò¥E»eu¨Y[Æ¶FHÙ%î¥y¼cG4©d•œ›£<ÚqNF„iÔ‰ä`ˆŒÌxFhœZ«…ÿ\0f]€Ç\0´,ù‘RHÇl°m®h±Züˆ¯õªŞm\"/æjlGZÄÉ–šÎ.2CÊr>àE6Œ\Z²“Í#h°}Èª\rÎ«dôÙê*}·Ñ•‰#¿Ô¦r»ªŸÇ4tÊ22ÀœWj¸­}>4>ëašğ¾3¸8ÿ\0ëPn¾‹íçR¸Œw¼„?â££V[şˆ5[ô^+è²+»mÜ3€FIz‘×ÔV™¸zõ¬_²İš½ìö¥#ÅqÀxö«º²°‚:Àt­&×Tİ\0[‡Ãáº3úûªŠ6ƒ×	—‡»“p=NsR†´VÀ÷¡“^Å0RYX0TõãüéË[ÖÒÆ9\n2¸éŠ\rrË]£=íä²<Gv$œ²ò\09Î	ôÀõVU4€Gx$e¢\n«c<¾×Aşu«öé#İÙ^59T1«ø†IÎzqéÏõ‹=êB¢1œÅ#mà’\0Ïg çÂ±g]TjÀø72›—¤hÒÈ¢8ËœäûO¿©5x±Ò…¥!æ¸ØŒã wŒ|¾ü+=½¹ku£fE]Éÿ\0po\\óŸ•E=¢¿gV’+œuçÔ“œÓüv£Ö9qvÚKkÍ2kkb³™ûÖb?vwd:ğ¨‹e¥w¡İ,f;ëÛàÍ 9*¡É\0ƒ\0Pk×İİÄ7E	%6PCçÎzSš~µß%œ-Ò;FŞ §=Høş¡N,†­{]©ZÇ,¶wIqw\\³ÀÊAàäóÇˆ\ZUM½¸ƒSÔ&-BpÀÛÀô÷¥]ïNª>ƒîÇ$,™oVÏ†)ĞÏd\'ò\\|¼ÍFÌn¡ÙU›É˜giôæœïT}™U}Y1ıjÄG$¼RëºXÀnã·ßşºÓñİ+È±¬lN<›=é„{PNdû\\Ÿ<ôù|¸Ä²wQª¨VF$g<ü¾?…‰‰+,¬\nÊdŒò®†FÖîÜŒà0.-áË™Šàã,ç’9óêëŠ\"!ÚŠ@…6:ñ“×ÿ\0x•°¤<’×<ã…ı~5Û-´Æ3âß×Ê£ä9 Ãc sÆAòùT€S»ıëNÂHé]gjW;I­\\©kéèæF{¢áˆHj…Æçñ\0¤à¤õ;*½¬Ô­¯åŠÑo*àÇ$ŒDJví$Ÿ	$àG “ZUÕ²Ëx¤¹9ÃÉùĞğ«Òå#Y>Ğ=Ùañ\'‘÷ÒO¿cÅ$°—TşÌÚì‰µ0Ğ\"2<c9N1†\0pH\0’¨¶Hí¼X­ä¸îcÜÄ:ìAœd¶\'¨ãôFûN[Ë“yŞÏû6nI\ns‘ŒsËÈ<ü*¿/b4Í“ÍŞÜï˜l‘Ú`X½@>>´µJ¢5_d@^ßL÷{\'h]$9*÷<ã¯õÏ¯°ª.·\0†õ®»áµÉeg¡q‚=q’*ÿ\0ş‰i00y-›ãüyÏëñMÙí5ñ²UÁôÉàqæy©hê›4£0xu%¼f<îgÉàgÓáïQ>®ÃvQˆ$c`ızÖœı™¶\0àˆ	ğğp9 ŒõëM\ZcñÅr@ÚÊ}üÀıq\\¢#3\nUÇ‡c¤mİş~ÕÔ«.Fäeé¸yúV‘.\r(Œ1†T±ÇÏó¡óöjİ‰!]„Œg\nH<1úõ¦Óúå*æBgŠŒa*¸§dí‹ø\ZX\0/!_zTjKÁn&ª½àÕå¿î¤ø­*U¤Î†ãıóüWÿ\0\Zhÿ\0ŸõúR¥HÇ&7ûÁè\ZnN‰ğ¥J€PcKşo‰üêUü?ä¥J¸\'—ıù—ó¦GCüÆ•*Hç÷2|Wó¨ÿ\0\rÅ¿ñ4©R}ô@°ßù\n`ÿ\07ó¯ä)R¥brßfÓù?ù¸½ş&/ƒR¥]0L¿ÃIüÇò4ÜîY?^”©UŒvoŞ5*T¨ ?OÿÙ','122 Main Ave.','Edison','NJ','07731'),(4,'Sarah Hoo','sarah','33','2020-11-23','F','ÿØÿà\0JFIF\0\0H\0H\0\0ÿÛ\0C\0\n\n\Z \"\"\ZÿÛ\0C\r\rÿÀ\0\0}\0–\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0>\0\0\0\0\0!1A\"Qaq‘#2B±R¡3brÑğá$4C‚²ÁñÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\04\0\0\0\0\0\0\0!1AQaq‘ğ\"¡±ÁÑá#2BñbÿÚ\0\0\0?\0»„š;à£öÂmFİpbáfÌe0ä…cTáV§eÇ%{a.”2Ét`L.ï†jİ0¨`b@P.I;†•+B|ßAˆøŒÙ<²ÒåYUNgS!äI6¶Û\0Y÷ê¾>”ÏxÑÄ“Å3I—#ÜKùE}7$ƒÜ|68·MFêv¸[Çè™4¦-O•‚Ôvr.ÃC™Q	DF¶—šg9u}/ŒO•ñChc­«‡şfª[)óXgÜ›\r\'¯¦?†<{L’°Ê£Q¦í\ZM®ÿ\0æëó8ôÔp›MPĞ{ÈUw ¼qæ~‹]DéP-ÒKŒ\rË$>ØÄ•¹~ÂÎ’×åõÔªÂ¢E:.;†aşYâÇelZ›;­e;‘<¦Aa±ØŞÖö:âfál•¹à”8|<Á*TK²Ë½x-ƒ$xlñÛFOö„ÌãKf™u-PQmHÆ&¿¹±ü,,‹Æ.ÎÂ,òKC1Ø¬Ëu¿³wúb´˜tñô¿‡«¯\n˜æŞ?}”Ìøáe‰Û¶P\nlÂ*)&xX]^28\'Û,lU¶GqpPt¥sÛ\nšV¦$Rtù%2Û¦\Z¤å(ÓÆW¶;¦¦¹Øc°ğTf\"•Y#;*qaˆ8w„¸[+@%Ş”Øi-\"ú`–£§\räpÇM·Ãr¯eQ~ Í²ŞË\'Ìó:…§¤‹bNåØôUKÀcå%e>y—EQ»Ì\nßPæØÊş.x/qr¾yQHüš[!Ğ}e7ş­à:E®\rïßó4Íø6·2™ÚRÃõ/KÛÊËŒçêˆ²Q¸æÌ3Õ¶>ı\r®ü¢İ`Äö©CQÃ€HIÆZñ™8ó?JjzÕ¨†¨òÅ5*I¦Ñ i5jopAÚÅ¯{ím<E|áN–\'öt>ŸßG<;L³e<F æ?İ+Ën¦&`,4óT…³i°Æô»¸³é§4Ó}Æ¿òZN!‡ŸHÏõ=Ş\n£Í*3\nØé\"®‘_“£}û:ôÆ½-z^ö\'b	ŞŞÃì\\E›­KUÓqï,.µ\r:THbIÓªGulª¨†Õn¤Ü¹rB°…0Å	:#x¨™`{0°\0\rPÀî›o¹¾Ê*hâD©Ff‡u5¹„q˜ÃÉk†µÅìH¾Ëp1ôpaœÓ¡·¯qğG‹‰R’Qq\\ïÀ4ùM#Càï¥´‚C:€Fç³ï\n¸oŒ©\"Ìrá<Óùã¬¢\nVA¿QÑ…Ï±ÆmQM]<Œ†Y%rQÁ=DÍ{G;¾ßßç‰Çq®sÀõaãW|²yGŞ “/aÎÔ(U`·ÜÚàÛœK…d‰î­Á&0Ë½¯ìâŞ—òG)q`æŠzægo†¾}Pn%àüã‚«ÁuSHH¡.úCíüáª›¢Ø‘º‚:_åèMñ¬a|“Än\ZæÆœê*¢H&[IZú[¸aëŒëÆWÁy»S™”]¢—r@±;õËâÿ\0ñc±»ÄË©fã·¼zïCñœ´í4Ç4nø)ïƒÜi6EÇI,ú¨*\\£!?¤ßkvôß\Z™Zö±ïŒMW÷IÄªàH‡Z‘kØ|ıœm^\rÎ¿á¬¶ºà¼‘\rv7±î0{§µ¥tAğù}§EïûıŸYwÃrÇ{úí…/å°Ç‚š\0Š¯\0jíÂÚTlìzÉ†KcÒ8CşØõ!úaö²P­FØ­|râWáÏë@•Î´‰ç³\0×Ô@î,4ŸõbqY]M–Ò½MeDtôè<Ï#Xtéîvè78Ê>;qòqÆoMA•»6QBbf	¥m‹Ú×ôs{l	#¨)4 ÛAº‚¦fÆË©Tã4u.«­,‡÷_°¶ıAÛú‡c\'öa˜ÇCœÅ)N\'TÕp	/ôP>\0w¾3D¹r,š•—–êJ£A]Àqr®=-¾ÛuÓf±dyª¤ˆ\\T«Àó…*,Ä÷†ìA¾\râòMÂ¯L\0p±Z.TYéœ0À¸8«üQÉéë¸/=†g=4\r[B@ux”¸ °îßß„\r`ìH¶\"IDµ+[—Ø0©‚XlââÎ…lG¦ı1Äø™´x­%Ês´<mñ­!–H®…bÚÊºyë¤šuC®Yä¨™€V‘,¾€i]6=F:–”ÔëT.”lç—S•eM=Ø^úd˜‡[{½ÃQ9§‡MMx1Êã=¦¢Zr/p°Xòí¾İOöÀ|Á©än}BÒ;HêÆzìÕªå`ˆ-H°ı·÷\"ØëíuÖUÍ±·×èS©æ5HÔÓTVNI†«<Iã¦ ç`v·ÂèÀ)ÓTTç*H_f15aRO@mÔãí4òH‚\n\'©vQwš‚\ZmÚ{î=Ø|pøI-9C=\\‘>‹¬sV}ÙôÛ²­×GK[sÛğûşTC°Ûâ>z)¿…|RüÄ\":¯¼şTš$§RìqiYu\0.I,FÄõÅßâ\nÓñS\"ùª¼È¤ÄÆcË©Ì…\nB4êtSÈ€°]Ë\\ŸBûo|hß\rx—ş¤á±C<‹-nZ¢6eH{y†Å½moÆô2RK?G¤‘šİ[øù¤Ágd¬ußÕÛ_µg:€Ô•2SËä‘¡ ÜÛ®5/€“5OÄ»”I+§sŠÄœ™r®\"¨™	Hd=—ôßûÜœjo¸yxG€²ÚwR*eNc)ê	ß|K¦c*Şë5À™¦ ‘µ®`h¥3L´ÂÇÌç¢ãÄsHì[~Ã¶*ó$/rXõ8vˆ¶¥7¶9ÖÄNÄ+Co•šØ}ÊĞÍF\"‹½*M\\v9¬@o\\v6ÁCÅ+¹Şø^*ã¯ÃâEµ†øc˜MM—De”Ú5ëõ·ó†:@Ğ\\í\0Oko T¯ŠYQÌjš\Z¸È§Š$ûº‡ÿ\0ä—b;…ú>7ÏÜqÀ•4UòÇåU\r\0`nl\0­ïÛ­Úı1­ó¼ª“;&®¢mrhãIÒ‚şQõú“Œáãm3e•°\nu’!J®ÊU¡ĞÚı6·nÿ\0e8k‹ª1Mø}) ãíiÒÚ÷w’1U…@ÈÓ6çM•9ÆÜO]áİTY\rºy+#Î¬¬õ\Z…˜µÇgüÖŞâûßg˜–¦¾ã™<[–,ŒÅäVÛXè}Û°¶ÅÙVw@­›å¹Î%^J9LBeµ˜²ô¹RT&ã¦Öåû8WŠÈs\0Ñèš¨[èHt\n¤ÅËŸrÄ÷ÆÒ˜Ôr™¤8c¦§©ïê6·vÈuG,SqĞv}–k ¾aüb3›Õß3áU†¢M…¯½ÏlH–Cä-mïˆ7\ZÏ44YüÔ²:OCÅ\"¦¢Êb¤\rÉ±¶Ö¹Ç>ãV™kÿ\0i\0E°r‘ßùXè\"š®ï¢=&EM=\"®Ä+0=\n›H5İÔãÄrÏL¦ŠÕbd#ğè)˜‹úÕF‚H$(Ö¶Åèx/6ÎåçU>¦¤é]YM,ÚÁ°IKîv»5ÈCUÃô´\"P´´í$%”OøxW½Î›òô…;-À\0¶ã¥CQn[H\'Å™#1^¼Ô.yá¨Šj%#²¤HÎˆ!¶–¿õlÄÜ÷Á:JZÈ)^nLĞŞp‹^âÌáµúØ[OlyÍJ&2²M£tT:½˜îî=|+AL†-=	FÜšZYª;ïş?•q|Ÿ_•D7O_$ÉP)æ¢eßó„˜ˆ¿î—Pgõ¹SéÒØ˜ğGËçV¤é-0eFxæ…SA;€ŒQí×lE¢e™ ¼l?ñ\r™Á¹b\"Œÿ\0¦ı°S,“›Vµ%ÚfW6ÈiGÆ[…¶ÿ\0¤wÄU2hİ‚í\"ÇŞ–79iÔ-A[”d|DÔ•õ¦`¬®¢öïqqñ¶\'ëWDJB•\n\0–¬¸6S=26ü²£IÒ.Oúƒq2ˆè Üúœ|ùÄTn¢‘´¼Âæ2ùA;Ïvİ«sO(•œË\0NèÁ›M´íğÂ‰9Ô	;‰À7µıï|/æITÛ0‰K*ëqk(§\0´İHiT:°=;	ÒÉ¡¹½±Øïƒ”]e]º10XœEüA3<ŸğùZOºÖYyv€T{m¾ûz`ğˆ©éa¨‰j h^ÊyXï¤ö8§[åÍˆØúù«09¬9Û*s\'á?Á³hê(³*•£mŠESÛb¤\0Tßã|Eül¢¦l·œ‘¯9 7¿kı:oÓ}TŒ²•u%¿×¿‹U’Ô ¥×e¾²EÈ[o¿ÈcŸğİ<µè«úzißÚ´un·#µg©©–¢¦Bº5+óO™oÓÌMûßåë¶/Ÿ³İ+GSœT²Eq˜”ê’ÄzícØ9öµ#4uz%N’²éˆ:‚W­Èõp{ôøhÿ\0(9|?SRÑ*MQPAµÁĞ\0Ğík›uØ‹ûvz¹\0‰d‹\rÊ¹Œ\'fUó†q\r.g•æ™#¶_X¬¦$ıs!7+ê~›‹6şR\rˆ›ÓSS;sg€Ln4k\'J}ôŞÄ’Nıqã‘ĞVÊñË:Äº4;(êİìvµ·ôë!ÆÓW\nªi@0ı:Ü÷tÛM|–Ÿ\ndb\'\0u¶ª¬¯c0Jx †˜§Šš\0aEĞö¶êª–Ø¢ö.	d<Ò(V‘™V4#üÂWE¶*TÖc{œŸ3¥¨¢jYêAi#$¬R«ıF§™£hŞÄù’EÔMÎÖgÂ¸HŒ\0™MJÖC½»d„|Üüq·áú9\ZëŸ_õ­”X…	¯¦–Z˜\r<lÚàÒÑcşe’Cµ}ÿ\0CU4²KH‚]UR¢Ù™åH=IåÇñ;‹tÇšZ8êªe«dJ¨T‘Í2©¹¹%ÙRûÚæâÃ§¯œÂ¦\Z‚°ZH\rùa£}=º±/Äê;ãorNˆ9Ót:„Öü™§°ÚM	;©ôÖÄ-Áì£\\‡-–IšYo$òË\Z¯ı‡şÑóÀÊ\n(j$VÌ9,/`fš7¸ìQao@\0øàg²iü’*E[7,Ü5Èßa…t®ÈÔÇHÛ•¢¼-Ì²Üö†·ğê¸ª$¤b²Â©¤¯½½=ñ;Õ¤€§aÚøÎßg9%£ãIDnÜªŠFævk0·òq¥³\nUŠÓ ²÷öÇ&ıBá©Û!«€æ\0£½h0lI²Æ#x·gzhF¢6$ü0R’› °»·\\!C¹C~ÑÓĞà“>øÀ¸%ï]?MİK‰Ôåş6¥U¯ÃAQ¤ØíÇQÎÄYÛpnqöXÈ;áêÂ±N©SboåÄwS¨—Ò¥%ëÂêS¦Dr­cfí·®ıOË×Ä\\Ö–Z¶Sµ‡ë\00ô\"Ç¦5=M4uTÒE!b’-ˆ÷ã×Ä~¨£¬•æS$&åfQş\'N£°íşøE„ÃM^ê–hÓ½mS,î%FY-}¤†©•X!1\0 —Øí}‡Ê×Æ«ğÿ\0\"Z\\É4…erlÌ…½ì vÆiü2\Z9Ñ\0¿-†›‚ï~¦û^ßLiî¥zn G°q¢-k_~˜3‰†–œ¶şºªì\'{]Læ–\n\Zg•°ƒ§¯¶ <S´™UUltÖh\"]]Ë\0	ïaq°›l	 bO™HRwsaˆnuN­”W(YLv<µ»~¡Ğşß]¶Ú»c–q\rS¤Æ)h‹³GvÜi½÷ò²5Cm;ßmuòTgqu<Âjƒ›R1!9º*£GöP>z¶;Û\0h«§®¨Ú®5ˆÙà¥gÅ’FøêÎ9Ì©BDÛói²çš™Æşe’¦PmşkÖÁ¬–bV—òãbª§ˆ{€‘éøßßzŒŠ0ØÚ³’ûNÔùÛò‡æi)“¡’MV6Ùt±­‡Ë¯S†iNçD“™wó,2Ä-ı-`©òàÖa<ä³,õç¨±CT.é7\n·¸÷ß9‘Ò^y–$œ(Ó¦„ƒ½îF­\'é‹l…YÄ¶aœ¾œÊDÄ)Oÿ\0N!	Ï\'6B¼Çó›0^İ/×|-[W>gRÒ<³2¹•®O¹í~×ÂğB=‚WñqÓ© å”*¦pïd+wìÿ\0?\Z1;„£7>aAË\ZJ‘pzßŸÙß#–ióÅ“ò€£¦İúÅü´M˜\0bnœ„B¥±*’ƒîîJ917ì=¾xôæA°ÁEHQw¶‹¯L¦¤Š•œ¸[a½•ùég›”,eÎ{c°d±@eß‹.™•q™Ô÷\'½K0Ü×ÃØJÉ¹µğ©£C½­†dñd\ZRå6>˜eY—CšÑÉIY\0–êP}Aìp}âEkX“„ˆ\n\r€øcÛ‹ ØÜ*‰<\"¨§¬jš%M%Í•EÜ~áo•Ço¦$|14ÑeĞÁ=ã1Xş«\r·ÿ\0ñh_Í¨mí…$¥‚°4qÌi|=0/¢š¶b\rÇıü+tõ-‰×!@fš72©# ¾fñÂr|Å\\Ç¥©ä[8B	*@Ùü§r:í‰ı_	eut,°Ú\Zãèoüàcp_R’R×+ÍO(¶¸X(>Ì¤|AúcÎ¬mlsÉge ŞıˆŸù¹e£K¬ËUH­S%Nb‘se%šSH±³ÜÜˆ˜sÔav},\"K$°Ò¨d%$7Ñ±ÅãÄ¾SÏÉ“NR[İUäe¸ìö?¾m_„Ü]Nd2dÕvSrÑ85»ìßïğÇX¤šlå·Caø>åœœH³íx*Ş­Ú¡šF{‚ñkcèuj¿×éUSU(NˆÅì ÿ\0{¾şØµ(¼3Îå]?„U­·³E¤ıHÆQø-ÄªeñSo¿Ş%Ó«é|eU<z—>Hª$ĞGC“ºîkÛr?Ÿù|N8/€kø£0š–9wYˆºÆ=}Ï¶.›À¸ xäÎ3è»ò)ÅöÕéğ\r%UH”™dÃ\n‹AlGQ‹faó^ƒ\r³³JRœ;’Qğ¦M[CeXÀÄnÇ×¡Õrìİ>x`*#WU”Ø—8+\"XJ¤‚ı°ÜêQ0\0Ğ/\"²7`…MıñâID$Ö81h¦#X>ø&M4”ÿ\0™»\rí| NÙ9†rëve7ŞöÇaµ<ĞÊ¤ µ±Ørj-U-‹ÆCj±èmÖØup®@¿©é‡¼W—}Ä@D•É·’Í·©ïú¿¶#”4C?Êgid’cH˜†SmWÛê+æRò×¬ÇˆòÚy•*X1N‡õ¢ş¾ØŒæ¼MQiécB/¢Ò\\\"ÿ\0˜·§OL9«Ê²õš*j¨$¬I§çÈ\r´7\\ŞÖÛ¾åCO4q=\ZK–½l«°=ß§÷ÃÈu®öAÚƒ8«š¦)¨¢šp¿ŸË“È_pll6½K½¯ÃŠ8‰oSÏ¤f‚•	ú.l\rÕw†ûŸ,šZU£«“,€òâ˜Y-È\0tİ>c×ĞÔYCZYgªy##—ËO¥·¹õÿ\0ó¹ç{¯ÅõUGıUŸ©‚TŠµüÂ8ô©]ïg\'åÓSÄ­/•Ì•r›ª‚\néøâÃ›,ƒ0¥wdKª6bÒEÍ÷ÿ\0qëğˆ(3XN©g§i9\")¤- òÙî§–Ö7ëòÂs‹wõä—’±Q\\·?¬¨¥Y§ 	ªöU“Ì=6?<+O›´Ä‡HâKØ±ötëôÄ›4áŠ$<ÁqnHäF€7¾æ÷Øcp7õ°PÁMC?Ü£Ø*¢<ãTšÃ5Í€\Z{bFÌÑ!Œª&õ¹mLF­öõÛ5Ã2„YAb.\0ß ©Š°ªšHQé…Ã€Eï¹°ÓŞø3[\rTª¢ ¤¦¥óZÀÛ¦Çc~¿<<¼‹Ù\nRÑÅ,Nì×KéÔÀúahrÊzeg¾¦ëa†´aëóºˆˆ\"¥´J°OĞu=»œ&õ‚\\Ç“\Z41Äl­»3rM½ºaAIì¼½\"UÊ5)\0{o…#…#—B±úÛá9Ú¦¥¿“•ô§%n>xg—dÍYNìÕL*#êú’>G×$T„ºSLd{XíĞßœ½ÒEÒä¶8‘å°M%¹’.i, ˜®¥ñÕ‰$±//[ µí{¶Çƒ¯²ñRI?—¡¶;j¨!‘Òè†ö¾ÿ\0ß‡‚,šBÿÙ','320 King St','NYC','NJ','07083'),(5,'New Tester','test','bcbe3365e6ac95ea2c0343a2395834dd','1993-04-01','M','ÿØÿà\0JFIF\0,,\0\0ÿá	Phttp://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\"/> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿÛ\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÛ\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0d\0–\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\08\0\0\0\0\0\0!1\"AQaq2B‘ğ#Á¡$Rb’±ÑÒÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0 \0\0\0\0\0\0\0\0\0\0\0!\"1AQÿÚ\0\0\0?\0êšR””¥\0¥)@xh¥yR9Ú&è+Q°àpÀıø×º¯ôİ]ì|YÕ´ÙdSi¨ªÀJÜ$*qÇª0Ä“ÿ\0\"ŒòXÄöJ¥Ï³ÄG:…ÕÔ3! û© ¨ Ò½Ö•áåô—7ÛŠ9F£pR%\0~¤Œ·-Iùy&·ZKÚØ©âôÅ)JéJR€R” ¥()JJR€R” ¥(lñÇT¾²ŞÓ¾šÂÖ{;«9ÒP³ÀÎ\n\0rô€{â³­ü_Ü’^Âï\rãÂ‘åN{z³Ÿ–~{Ô§ÚSm¼öPëñÌÅcm$‡Yˆaÿ\0qÏnÂªM@–k6ŠX2·–‡‚İ¸äç°íT[âı›a,’¶¶XşjA¾ÖÉnd»¶º·¸pîŠU}jş—œ±nã=ÛÛ¡jŠû>i–^M÷ úİ_î±J¤¸Œt«H¤’0®>zÕ˜ıõËB”¥L R” ¥()JJR€R” ¥()J|Øı±z¢%–XPÏ\Z‘’Jò@ø½KŸú½ûW5]ßIk¹Ô& `¶_/$œw$ÈÁ“Î+¢<Pİvû7ej\Z¬á^P†+xÛ´’°= àƒ	8 às\\Pºö¦¢Örf\r“Ôª?Ÿ¦jŒ³åÉ:|š—/Ñ}x_¬£øë{æÙ›6´‰”ä„äüsĞWDWçöÑÔn´-nÊıHY dtÏ«Àƒ|;×Ymß4{µXu”’Æà­\"©xÏ‹Œ²äñq‘ÉçÇ¨\\HfNë’,úV»öÛ“\0WWµPN3#ëÕŒ{ş³Û#úFÈïÿ\0ÿ\0Ug$QÅÿ\0	úTMåĞ¯nRŞÏZÓ..$á\"Šê7fú\0rjZºGZ¥()JJR€R” ¥()Q{ŸT]@½¾f\nÑGˆÉRÃÌcÒ€ìXÿ\0ªãz[:–Ş‘Ëßj}ŞÚ¶ã·Ò,¦o¸iDùë‚OØÜàqûã½SÖ€Î‘9ƒT1Õ³o2íµ9æ¿¸3´ÎÒ™B]²sêÏ¿Î¡öş‘Ø3:¤H ¹ÎOoçÊ²ÖYsËá¶qR|~™PµºÈ÷¨“ úyã8àŸ§ìqR‚á„R¼Ñyãl§ñÇïúT°še´vZ}¬*·,ŒÜvì3ÇÄÔ&©+ÛİˆúTQ–ÁîxÇíŸŞ¹Ír%ráè˜µÔd‚ÕäR\nŞg° œ}3šŠÖaTYíp/(>ÇôíX·²ÿ\0a,eÆF?ß?½Fé¬òÜ!\0 cÛçÿ\0ŠŸÒì|!¾d¸\n‚*ĞÙ%n]¼\"ŠÒïïkŞÖaÖ˜ç·ºòÄúHÉïT½«,—óª01ù¯ÒÀä0ÏÁ[®…)·¹Ìc­\n F8ãŸ¦qR}™ÅäÊØ›ãKŞ™³o&ù4Ö}IÎ2æ\\ûˆÎ3[]qVÜ†öçvèVÖÅ`w‘ÇçDİO¡ŒÓŒGjíQÚ­—³6IâÅ)J‘JR€S5ŒXüMj»«}hûnà[ŞÉ,·uEn¡Ù:¿##–öÊ©…ºz%1Võ+fåÔ>\"¼™PwaU*øq¨H‘éºYˆ³SrI/\0\n1ÎxïïXše–áİ‹-ÃLí; k‚Q<ÅÂv#p1A9Íf}T·¬iÓ4OJÒŞF¥F·¼t\'mKRŠ3Q* 2H™í”P[ßáT?Š¾<iZÎƒ>‘·loZI%ŒµÅÊ*\0@ş•É\'=8çÍmÛ‹ÂKSÓã…uvˆ‚YÕ ê“œgÌÃÒëÍhÉöu¹u© Ä¥ÜÅlÄ²ñ€2üüóô©ËËkÊtEÎ(~5²©˜kZüwZƒÙÊöë™$‰–0NQöÎ}ñP²]\\XLóYò88ÏPÿ\05Ó»R8¶&y§mÖWùkÛ¬\0Ì…•lsÜûÕ¸´\'T¸“PX-ãi]”D\nÆ$€£<œÏïYÓÄü%ìÔÖEåH‡mBkË™.°B†Àöéî ÷Æ\rl\rc}¨iO\nŒ©=D¸<ßSƒPË½»°ıDç&·¡ëÛ¤Ée¢Y	È¦Y}(«½LÇØwÀÉ![\0ãf¾\"^éš]õ„–ËÓ,œğJœàD^k	aĞÛ€\'*•$òÏé]1 x\0ÓÉæîW#‰$:`tåØ“œä`ñkmÔ¼ØW¯®•-¹LúRáÙ[ •rÃ<@ãš¶aûe’}#6üĞ=¨°·°–æR7’€¸ùƒüïò¬·–‚\ZúKYbb\Z)áudaóPEt†«à“iÚ¥¿ôµ´Y4İR’áYpWÈÇ#©¿)ï€=ëçìÒš®¤u\rOqËÏ~uµ´=a\\*†Ä„‚ÀNJ‚sQü«“ïØŸí*Wô¬ü9]×u4;j¿Éƒù‘¸‰”†¬zñœÇÕÚî_4X“ı{J³¹K4ØqÓ\'—Yç¾5=±<3Ó6]—İô«íK à°iò¤ıã¹ıÍn2Yå8pG¸cş*“ùZ+y“}çeY¶<em[sZi7Ú³[™4™/Ü·ÇHş}³ğÅ[ÕÍ\Zö¹y¢ï—\rek\rË^b… !Fê¶2A8ê,²I=ñ]!§Ë,öÒÎ†95gB½=,@$cÛŸjªÚ¯‡zŒs:qôûÒ”«Ìæ?”ÍßZ÷„ZÖ´ÚŠM{kœ‘mncX–Vb ¡#$Çó61Æ,ZW)*ìÎÍ9{D‹´t=Ùì4øÖF3®Fi‘bJÀ©à1íJQ$» Ûol‚İÛ’Ómi¿x¹şäïŸ&Ùy“Ü(?Î@îEUÚ¦ùÕu¦h¢‰ReQ`¾Kr—8Ààc<üªÊŞ[;Nİp{ç¸†âÉÙàİ”:†eõ0p3Æx\"°6—‡Z.Úº¸º·772ËæuÜôzB€W€;O~k>|7—²­#FÑ‰mÎÙ§h[RÖîå›XfµÒŠ©†8exå$÷-€\nxàóœçÚ·[¶Í•°†=&ÏËê,Ëä©\r1êÉÀ5·€\0Àâ•f<ñ­J!“¨É‘î™«AáæĞŠÕ­ÜÒç·.\\Gsn³ª“>zWé.MlñÆ‘\"¤j¨Š0ª£\0€ê•iH¥)@)JP\nR”5İ…¥áCykı+æÆ¤ç9ùûVM)@)JP\nR””¥\0¥)@)JP\nR””¥\0¥)@)JP\nR””¥ÿÙ','1000 Morris Ave.','Union','NJ','07083');
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
