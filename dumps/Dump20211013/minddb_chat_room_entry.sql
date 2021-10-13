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
-- Table structure for table `chat_room_entry`
--

DROP TABLE IF EXISTS `chat_room_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_room_entry` (
  `chat_room_enrty_num` int NOT NULL,
  `chat_room` int NOT NULL,
  `customer` int NOT NULL,
  PRIMARY KEY (`chat_room_enrty_num`),
  KEY `FKbttu7veg8exqkdmphqy331tgw` (`chat_room`),
  KEY `FK5lrde9ta22gr6mye603rulghp` (`customer`),
  CONSTRAINT `FK5lrde9ta22gr6mye603rulghp` FOREIGN KEY (`customer`) REFERENCES `customer` (`customer_num`),
  CONSTRAINT `FKbttu7veg8exqkdmphqy331tgw` FOREIGN KEY (`chat_room`) REFERENCES `chat_room` (`room_name_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room_entry`
--

LOCK TABLES `chat_room_entry` WRITE;
/*!40000 ALTER TABLE `chat_room_entry` DISABLE KEYS */;
INSERT INTO `chat_room_entry` VALUES (71,70,12),(72,70,10),(212,211,1),(213,211,10),(219,218,1),(220,218,11),(222,221,1),(223,221,11),(225,224,10),(226,224,1),(229,228,1),(230,228,10);
/*!40000 ALTER TABLE `chat_room_entry` ENABLE KEYS */;
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
