-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 180.67.197.229    Database: minddb
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_num` int NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `customerid` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_nick` varchar(255) DEFAULT NULL,
  `customerpw` varchar(255) DEFAULT NULL,
  `delete_date` datetime(6) DEFAULT NULL,
  `identity_num` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `profile_con` varchar(255) DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_num`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'2021-10-01 18:02:00.324095','guest01','홍길동','닉네임01','{bcrypt}$2a$10$qUBd9tBfLnCJdLr54RdI5.82ZDCcbc6bFzeUgR1bdbCpg0z.x6Twm',NULL,'','',NULL,'../img/profile/guest01_person_3.jpg'),(2,'2021-10-02 16:28:05.205669','asdf','송중기','송중기','{bcrypt}$2a$10$JmAamdRToL21ckeMN8iAwOBX6r6PLcsNVyYH.b3q4pGUbAiqs.oPe',NULL,'1234211','010-1234-5678',NULL,NULL),(3,'2021-10-03 18:08:17.912000','noname','게시글','게시글확인','{bcrypt}$2a$10$BPYnMkRiugabb.YbRm2y6uf6XWt9ecojijKMYCUqqKlAMJ94IO2Ii',NULL,'1234211','010-1234-1234',NULL,NULL),(4,'2021-10-05 10:08:16.908213','guest02','guest','guest02','{bcrypt}$2a$10$oOsnENncEwFjXTLuhMW49O2TeuvdIVFqDvg5zqUQEEJfnts9EhQ1u',NULL,'9000001','',NULL,NULL),(5,'2021-10-05 10:08:35.161570','guest03','guest','guest03','{bcrypt}$2a$10$zS.TmpnnLWVmhnC6cpphTeVWAxH9d1srunxjFPQy7TiZWEN2WZSBm',NULL,'0700001','',NULL,NULL),(6,'2021-10-05 11:55:12.768371','guest04','guest04','guest04','{bcrypt}$2a$10$inwdjaFK6Iuw6w.OAR4.BOQvfL7VUC0Gje1KOCej7lf3QwL3hhWiG',NULL,'7000001','',NULL,NULL),(7,'2021-10-05 11:55:56.004982','guest05','guest05','guest05','{bcrypt}$2a$10$plOPnBJ1qNnIjFPMkyUQKuQ6/F.Kvhmf2ZUY8mVSHbaz9Iuq775EG',NULL,'8000001','',NULL,NULL),(8,'2021-10-05 11:56:29.953533','guest06','guest06','guest06','{bcrypt}$2a$10$DipvKx1QfazuUNbQhw0Fwu.MP81sPj.0945s/iWmPT0aT5UHLR4P6',NULL,'0000001','',NULL,NULL),(9,'2021-10-06 14:44:04.508017','guest07','guest07','guest07','{bcrypt}$2a$10$UptQ/5vHWShufxyADKrtvOkRcMuaMcKu3AVEhSJniyEoh/tCpPT6q',NULL,'1980001','',NULL,NULL),(10,'2021-10-06 21:28:18.655000','tester2','tester2','tester2','{bcrypt}$2a$10$7J5clzpl8DWmRI9yfZPIO.94mjaNEvm2tOyLPC4.Dnz0a7Lnxehoi',NULL,'8603021','010-1111-1113',NULL,'../img/profile/박명.jpg'),(11,'2021-10-08 00:08:43.614000','testerman30','testerman30','testerman30','{bcrypt}$2a$10$VTRyb7pkTPnDXT7.rJlKt.h69VgJQv5TVfQ1vd9PNtbuFuqLN1sMu',NULL,'19851','011-2222-2222',NULL,NULL),(12,'2021-10-08 12:23:09.362000','tester3','tester3','tester3','{bcrypt}$2a$10$DSfg1g86oJLqHiDrp6E6QunxCMx0yMNx1Fk69LvtwcbFLflX.g8LK',NULL,'2012123','010-2222-3333',NULL,NULL),(17,'2021-10-11 17:56:20.409000','guest11','guest11','guest11','{bcrypt}$2a$10$8Z46IbbAmpmyJlVqgkN37uxAWT16nhLsmIfcQdg3denL8LSt25hyS',NULL,'9001011','010-0000-0000',NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 15:33:33
