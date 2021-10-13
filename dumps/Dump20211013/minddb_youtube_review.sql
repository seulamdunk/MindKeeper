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
-- Table structure for table `youtube_review`
--

DROP TABLE IF EXISTS `youtube_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `youtube_review` (
  `youtube_review_num` int NOT NULL AUTO_INCREMENT,
  `youtube_review_con` varchar(255) DEFAULT NULL,
  `youtube_review_date` datetime DEFAULT NULL,
  `customer_num` int NOT NULL,
  `youtube_num` int NOT NULL,
  PRIMARY KEY (`youtube_review_num`),
  KEY `FK5yixyqn0ei6vs4go75dbxdlbq` (`customer_num`),
  KEY `FKp5mnavcb3bu8w8jf3r0pk9eux` (`youtube_num`),
  CONSTRAINT `FK5yixyqn0ei6vs4go75dbxdlbq` FOREIGN KEY (`customer_num`) REFERENCES `customer` (`customer_num`),
  CONSTRAINT `FKp5mnavcb3bu8w8jf3r0pk9eux` FOREIGN KEY (`youtube_num`) REFERENCES `youtube` (`youtube_Num`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `youtube_review`
--

LOCK TABLES `youtube_review` WRITE;
/*!40000 ALTER TABLE `youtube_review` DISABLE KEYS */;
INSERT INTO `youtube_review` VALUES (1,'test','2021-10-10 15:54:14',10,2966),(2,'test2','2021-10-10 15:54:32',10,2966),(3,'test3','2021-10-10 15:54:37',10,2966),(4,'test4','2021-10-10 15:55:38',10,2966),(5,'test5','2021-10-10 15:57:57',10,2966),(6,'test6','2021-10-10 15:58:59',10,2966),(7,'test1','2021-10-10 16:16:41',10,4182),(8,'test1','2021-10-10 16:19:27',10,4182),(9,'test','2021-10-10 16:33:01',10,2771),(10,'ㅋㅋㅋㅋㅋㅋㅋㅋㅋ','2021-10-10 18:19:54',10,3016),(11,'ㅎㅇㅎㅇ','2021-10-10 22:27:53',10,3049),(12,'ㅎㅇㅎㅇ','2021-10-11 05:03:24',10,3682),(19,'안녕하세요','2021-10-11 18:39:18',1,3391);
/*!40000 ALTER TABLE `youtube_review` ENABLE KEYS */;
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
