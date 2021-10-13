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
-- Table structure for table `no_name_reply`
--

DROP TABLE IF EXISTS `no_name_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_name_reply` (
  `no_name_reply_num` int NOT NULL AUTO_INCREMENT,
  `no_name_reply_con` varchar(255) DEFAULT NULL,
  `no_name_reply_date` datetime DEFAULT NULL,
  `customer_num` int DEFAULT NULL,
  `no_name_num` int DEFAULT NULL,
  PRIMARY KEY (`no_name_reply_num`),
  KEY `FKas4lp3t5ey2wtmpqk4ajo5j59` (`customer_num`),
  KEY `FKnkq55auvkyk4gddlcons5hgrq` (`no_name_num`),
  CONSTRAINT `FKas4lp3t5ey2wtmpqk4ajo5j59` FOREIGN KEY (`customer_num`) REFERENCES `customer` (`customer_num`),
  CONSTRAINT `FKnkq55auvkyk4gddlcons5hgrq` FOREIGN KEY (`no_name_num`) REFERENCES `noname` (`no_name_num`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_name_reply`
--

LOCK TABLES `no_name_reply` WRITE;
/*!40000 ALTER TABLE `no_name_reply` DISABLE KEYS */;
INSERT INTO `no_name_reply` VALUES (1,'ㅁㄴㅇㅁㄴㅇㅁㄴㅇ','2021-10-10 17:08:17',3,49),(3,'asdasdasdasd','2021-10-11 10:14:47',3,54),(5,'테스트','2021-10-11 18:54:55',3,52),(6,'테스트2\\n','2021-10-11 18:55:06',3,52),(8,'테스트','2021-10-11 18:56:42',3,57);
/*!40000 ALTER TABLE `no_name_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 15:33:36
