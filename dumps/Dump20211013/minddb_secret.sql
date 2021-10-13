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
-- Table structure for table `secret`
--

DROP TABLE IF EXISTS `secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secret` (
  `secret_num` bigint NOT NULL AUTO_INCREMENT,
  `secret_date` datetime(6) DEFAULT NULL,
  `customer_num` bigint DEFAULT NULL,
  `secret_con` varchar(255) DEFAULT NULL,
  `secret_img` varchar(255) DEFAULT NULL,
  `secret_title` varchar(255) DEFAULT NULL,
  `jindan_con` varchar(255) DEFAULT NULL,
  `jindan_con_num` bigint DEFAULT NULL,
  PRIMARY KEY (`secret_num`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret`
--

LOCK TABLES `secret` WRITE;
/*!40000 ALTER TABLE `secret` DISABLE KEYS */;
INSERT INTO `secret` VALUES (22,'2021-10-03 00:00:00.000000',2,'안녕 하이얀 우리 봄날의 climax 아 얼마나 기쁜 일이야 Ooh ooh Love resembles misty dream 뜬구름처럼 Ooh ooh Love resembles misty dream 뜬구름처럼 너도 언젠가 날 잊게 될까','../images/secretDiary/1.jpg','라일락','긍정',95),(23,'2021-10-04 00:00:00.000000',2,'\'뭐해?\'라는 두 글자에\n\'네가 보고 싶어\' 나의 속마음을 담아\n이모티콘 하나하나 속에\n달라지는 내 미묘한 심리를 알까','../images/secretDiary/2.jpg','Blueming','긍정',57),(24,'2021-10-05 00:00:00.000000',2,'하루하루 조금씩 나아질 거야 \n그대가 지켜보니 \n힘을 내야지 행복해져야지 \n뒤뜰에 핀 꽃들처럼 ',NULL,'비밀의화원','부정',45),(25,'2021-10-06 00:00:00.000000',2,'이른 아침 작은 새들 노랫소리 들려오면 \n언제나 그랬듯 아쉽게 잠을 깬다 \n창문 하나 햇살 가득 눈부시게 비쳐오고 \n서늘한 냉기에 재채기할까 말까',NULL,'가을 아침','긍정',93),(26,'2021-10-07 00:00:00.000000',2,'이른 아침 작은 새들 노랫소리 들려오면 \n언제나 그랬듯 아쉽게 잠을 깬다 \n창문 하나 햇살 가득 눈부시게 비쳐오고 \n서늘한 냉기에 재채기할까 말까',NULL,'가을 아침','긍정',88),(27,'2021-10-08 00:00:00.000000',3,'행복하네요',NULL,'작성 잘 될까...','긍정',71),(28,'2021-10-09 00:00:00.000000',2,'안녕 하이얀 우리 봄날의 climax 아 얼마나 기쁜 일이야 Ooh ooh Love resembles misty dream 뜬구름처럼 Ooh ooh Love resembles misty dream 뜬구름처럼 너도 언젠가 날 잊게 될까\n\n',NULL,'라일락','긍정',65),(29,'2021-10-10 00:00:00.000000',2,'안녕 하이얀 우리 봄날의 climax 아 얼마나 기쁜 일이야 Ooh ooh Love resembles misty dream 뜬구름처럼 Ooh ooh Love resembles misty dream 뜬구름처럼 너도 언젠가 날 잊게 될까\n\n',NULL,'라일락','긍정',95),(30,'2021-10-11 00:00:00.000000',2,'오늘 하루도 화이팅',NULL,'테스트','긍정',99);
/*!40000 ALTER TABLE `secret` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 15:33:34
