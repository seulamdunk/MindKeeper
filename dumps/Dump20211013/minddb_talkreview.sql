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
-- Table structure for table `talkreview`
--

DROP TABLE IF EXISTS `talkreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talkreview` (
  `talk_review_num` int NOT NULL AUTO_INCREMENT,
  `tr_order` int DEFAULT NULL,
  `group_num` int NOT NULL,
  `talk_review_cnt` int NOT NULL,
  `talk_review_con` varchar(255) DEFAULT NULL,
  `talk_review_date` datetime(6) DEFAULT NULL,
  `tk_class` int DEFAULT NULL,
  `customer_num` int DEFAULT NULL,
  `talk_num` int DEFAULT NULL,
  PRIMARY KEY (`talk_review_num`),
  KEY `FK1e3htc3iq4iko5eevj8ary7sd` (`customer_num`),
  KEY `FK7uan7rlduea8koe3lpqqvc2e0` (`talk_num`),
  CONSTRAINT `FK1e3htc3iq4iko5eevj8ary7sd` FOREIGN KEY (`customer_num`) REFERENCES `customer` (`customer_num`),
  CONSTRAINT `FK7uan7rlduea8koe3lpqqvc2e0` FOREIGN KEY (`talk_num`) REFERENCES `mindtalk` (`talk_num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talkreview`
--

LOCK TABLES `talkreview` WRITE;
/*!40000 ALTER TABLE `talkreview` DISABLE KEYS */;
INSERT INTO `talkreview` VALUES (5,0,5,0,'그럴리가요','2021-10-10 01:15:43.514000',0,10,9),(6,0,5,0,'절대 없음','2021-10-10 01:17:09.623000',1,10,9),(8,0,8,0,'안녕하세요','2021-10-11 18:19:48.952000',0,1,10),(9,0,8,0,'테스트','2021-10-11 18:19:54.635000',1,1,10);
/*!40000 ALTER TABLE `talkreview` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 15:33:37
