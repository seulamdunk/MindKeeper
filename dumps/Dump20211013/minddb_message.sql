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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `message_num` int NOT NULL,
  `message_con` varchar(255) DEFAULT NULL,
  `message_date` datetime(6) DEFAULT NULL,
  `chat_room` int NOT NULL,
  `customer` int NOT NULL,
  PRIMARY KEY (`message_num`),
  KEY `FK3ydah2qgeg9o0gl4wnbf4i13y` (`chat_room`),
  KEY `FK92es2ag872acq7hs0vdjfn4me` (`customer`),
  CONSTRAINT `FK3ydah2qgeg9o0gl4wnbf4i13y` FOREIGN KEY (`chat_room`) REFERENCES `chat_room` (`room_name_num`),
  CONSTRAINT `FK92es2ag872acq7hs0vdjfn4me` FOREIGN KEY (`customer`) REFERENCES `customer` (`customer_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (73,'ㅎㅇㅎㅇ','2021-10-08 14:52:09.948000',70,10),(74,'ㅎㅇㅎㅇ','2021-10-08 14:52:09.941000',70,10),(75,'ㅗ로','2021-10-08 15:01:05.439000',70,12),(76,'안녕','2021-10-08 15:14:49.329000',70,10),(77,'dz','2021-10-08 15:15:24.094000',70,12),(78,'dz','2021-10-08 15:15:24.108000',70,12),(96,'ㅎㅇㅎㅇ','2021-10-09 20:51:41.026000',70,10),(206,'ㅎㅇㅎㅇ','2021-10-11 14:46:47.174000',70,10),(217,'안녕하세요','2021-10-11 18:31:37.919000',211,1),(227,'안보여요?','2021-10-12 11:45:37.865328',224,10);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
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
