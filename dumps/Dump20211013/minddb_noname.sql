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
-- Table structure for table `noname`
--

DROP TABLE IF EXISTS `noname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noname` (
  `no_name_num` int NOT NULL AUTO_INCREMENT,
  `no_name_con` varchar(255) DEFAULT NULL,
  `no_name_count` int DEFAULT '0',
  `no_name_date` datetime DEFAULT NULL,
  `no_name_title` varchar(255) DEFAULT NULL,
  `customer_num` int DEFAULT NULL,
  `no_name_updatedate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`no_name_num`),
  KEY `FKt0s7v28fjsw3cpkx4fph8mioj` (`customer_num`),
  CONSTRAINT `FKt0s7v28fjsw3cpkx4fph8mioj` FOREIGN KEY (`customer_num`) REFERENCES `customer` (`customer_num`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noname`
--

LOCK TABLES `noname` WRITE;
/*!40000 ALTER TABLE `noname` DISABLE KEYS */;
INSERT INTO `noname` VALUES (8,'<p>ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㄴㅁㅇ</p>',0,'2021-10-05 17:05:31','ㅁㄴㅇㅁㄴㅇㄴㅁㅇ',3,NULL),(9,'<p>2번째도 저장되겠지?</p>',20,'2021-10-05 17:08:52','아마두 갈거야',3,NULL),(12,'<p>sadasdasdsadasdasdasdadsasd</p>',0,'2021-10-05 20:04:30','asdsadsadasd123123123',3,NULL),(13,'<p>집에 가고 싶어요</p>',1,'2021-10-05 20:04:51','아마두 갈거야',3,NULL),(14,'수정 완료!!!!',30,'2021-10-05 20:52:49','최종 상태보기 글(수정)',3,NULL),(18,'같은 조원이 매일 저를 힘들게 압력을 줍니다 .어떻게 해야하조',0,'2021-10-08 15:30:29','조원이 압력을 많이 줍니다.',1,NULL),(19,'ㅈㄱㄴ',0,'2021-10-08 15:31:11','화장실 가는 것도 통제하는 팀원 어떻게 해야하나요',1,NULL),(20,'ㅈㄱㄴ',0,'2021-10-08 15:31:48','다이어트 너무 힘들어요 ㅠㅠ',1,NULL),(21,'ㅈㄱㄴ',0,'2021-10-08 15:33:10','주말 근무 강요하는 팀원 어떻게 해야합니까? 도와주세요',1,NULL),(22,'ㅋㅋㅋㅋ',0,'2021-10-08 15:33:41','다시작성버튼 수정하기로 바꿔주세요...',1,NULL),(24,'디저트가 너무 먹고싶네요..',0,'2021-10-08 15:36:02','디저트가 너무 먹고싶네요..',1,NULL),(27,'none으로 들어간거는 어떻게 삭제해요?',0,'2021-10-08 15:38:23','none으로 들어간거는 어떻게 삭제해요?',1,NULL),(28,'ㅈㄱㄴ',0,'2021-10-08 16:34:18','커밋을 이상하게 하는 팀원이 있어요',1,NULL),(46,'<p>ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ</p>3333ㄹㅇㄴㄹㅇㄴㅇㄴㄹㅇㄴㄹㅇㄴ',0,'2021-10-08 21:35:51','최종 상태보기 글(수정) 오늘 날짜 이제 들어감',3,NULL),(47,'<p>ㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ ㅜㅜ</p>ㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ',0,'2021-10-08 21:35:35','날짜는 왜 안들어가니???ㅠㅠ',3,NULL),(48,'<p>ㅁㄴㅇ</p>',0,'2021-10-08 21:36:28','정말 연속으로 작성해보기(수정됨)',3,NULL),(49,'<p>ㄴㅁㅇㅁㄴㅇ</p>',0,'2021-10-08 21:37:05','데이터 용 게시판 글쓰기',3,NULL),(50,'<p>ㅁㄴㅇㅁㄴㅇㅁ</p>',0,'2021-10-08 21:37:30','현재 시간 9시 37분 혼자 남아서 하는중',3,NULL),(51,'<p>ㅁㅇㅁㄴㅇㅇㅁ</p>',0,'2021-10-08 21:37:40','얼마나 한걸까?',3,NULL),(52,'',0,'2021-10-08 21:37:50','도대체 얼마나 더 해야할까?',3,NULL),(53,'<p>ㅁㄴㅇㅁㅇㅁㅇㄴ</p>',0,'2021-10-08 21:38:02','끝나기는 할까요???',3,NULL),(54,'<p>ㅁㅇㅁㄴㅇㅁㄴ</p>',0,'2021-10-09 16:01:37','오늘도 화이팅!!!',3,NULL),(55,'<p>ㄱ</p>',0,'2021-10-11 10:58:53','익명상담게시판',4,NULL),(57,'<p>내용</p>',0,'2021-10-11 18:50:55','제목',3,NULL);
/*!40000 ALTER TABLE `noname` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-13 15:33:35
