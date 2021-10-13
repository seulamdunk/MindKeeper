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
-- Table structure for table `mindtalk`
--

DROP TABLE IF EXISTS `mindtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mindtalk` (
  `talk_num` int NOT NULL AUTO_INCREMENT,
  `talk_cnt` int DEFAULT NULL,
  `talk_con` varchar(255) DEFAULT NULL,
  `talk_date` datetime(6) DEFAULT NULL,
  `customer_num` int DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`talk_num`),
  KEY `FKdwfiw3brkj6i4d50exkjndshk` (`customer_num`),
  CONSTRAINT `FKdwfiw3brkj6i4d50exkjndshk` FOREIGN KEY (`customer_num`) REFERENCES `customer` (`customer_num`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mindtalk`
--

LOCK TABLES `mindtalk` WRITE;
/*!40000 ALTER TABLE `mindtalk` DISABLE KEYS */;
INSERT INTO `mindtalk` VALUES (3,0,'cc','2021-10-06 14:49:14.572208',1,'#cc#dd#aa#bb#ee#ff#gg'),(5,0,'tt','2021-10-06 16:36:41.599285',1,'#tt#tt#tt#tt#tt#tt#tt#tt#tt#tt#tt'),(6,0,'ㅎㅇㅎㅇ','2021-10-07 17:51:18.366000',10,'#ㅇㅇ'),(7,0,'test','2021-10-08 00:10:24.583000',11,'#test'),(8,0,'마음톡톡 언젠간 상용화 되겠죠???','2021-10-08 16:33:04.464000',3,''),(9,0,'마음톡톡 언젠간 상용화 되겠죠???','2021-10-08 16:33:17.545000',3,''),(10,0,'인사드립니다.','2021-10-08 16:36:34.896000',10,'#초보자'),(11,0,'테스트','2021-10-11 18:10:00.762223',1,'#테스트1');
/*!40000 ALTER TABLE `mindtalk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 15:33:38
