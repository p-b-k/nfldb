-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: nfl
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conference` (
  `pkey` int NOT NULL AUTO_INCREMENT,
  `name` char(128) NOT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES (1,'American Football Conference'),(2,'National Football Conference');
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `pkey` int NOT NULL AUTO_INCREMENT,
  `name` char(128) NOT NULL,
  `conf` int NOT NULL,
  PRIMARY KEY (`pkey`),
  KEY `conf` (`conf`),
  CONSTRAINT `division_ibfk_1` FOREIGN KEY (`conf`) REFERENCES `conference` (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'East',1),(2,'West',1),(3,'North',1),(4,'South',1),(5,'East',2),(6,'West',2),(7,'North',2),(8,'South',2);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `pkey` int NOT NULL AUTO_INCREMENT,
  `home` int NOT NULL,
  `away` int NOT NULL,
  `week` int NOT NULL,
  PRIMARY KEY (`pkey`),
  KEY `home` (`home`),
  KEY `away` (`away`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`home`) REFERENCES `team` (`pkey`),
  CONSTRAINT `game_ibfk_2` FOREIGN KEY (`away`) REFERENCES `team` (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,6,9,1),(2,17,27,1),(3,29,12,1),(4,1,21,1),(5,25,16,1),(6,10,3,1),(7,14,13,1),(8,2,15,1),(9,30,31,1),(10,18,28,1),(11,8,7,1),(12,24,5,1),(13,11,19,1),(14,32,20,1),(15,26,22,1),(16,23,4,1),(17,2,1,2),(18,9,7,2),(19,31,8,2),(20,19,30,2),(21,26,32,2),(22,27,14,2),(23,15,11,2),(24,28,23,2),(25,3,24,2),(26,16,4,2),(27,20,18,2),(28,21,22,2),(29,5,12,2),(30,6,10,2),(31,13,25,2),(32,17,29,2),(33,4,3,3),(34,11,18,3),(35,14,25,3),(36,28,13,3),(37,30,17,3),(38,12,8,3),(39,32,5,3),(40,16,27,3),(41,7,31,3),(42,24,2,3),(43,21,26,3),(44,19,9,3),(45,22,23,3),(46,29,6,3),(47,1,15,3),(48,10,20,3),(49,18,19,4),(50,29,30,4),(51,31,10,4),(52,25,22,4),(53,27,28,4),(54,13,15,4),(55,14,12,4),(56,4,5,4),(57,32,17,4),(58,21,20,4),(59,23,3,4),(60,8,6,4),(61,7,11,4),(62,9,1,4),(63,2,16,4),(64,26,24,4),(65,29,32,5),(66,28,4,5),(67,25,31,5),(68,10,9,5),(69,13,1,5),(70,15,14,5),(71,3,2,5),(72,20,11,5),(73,5,7,5),(74,23,21,5),(75,22,27,5),(76,24,18,5),(77,12,19,5),(78,6,30,5),(79,24,23,6),(80,25,15,6),(81,9,20,6),(82,27,21,6),(83,3,13,6),(84,30,32,6),(85,17,11,6),(86,16,14,6),(87,5,8,6),(88,7,12,6),(89,31,29,6),(90,19,26,6),(91,18,10,6),(92,4,1,6),(93,30,5,7),(94,15,3,7),(95,29,24,7),(96,1,16,7),(97,11,10,7),(98,27,13,7),(99,14,2,7),(100,28,26,7),(101,18,17,7),(102,20,31,7),(103,23,6,7),(104,12,4,7),(105,32,9,7),(106,21,8,7),(107,22,28,8),(108,11,9,8),(109,26,16,8),(110,13,14,8),(111,15,27,8),(112,2,21,8),(113,3,4,8),(114,32,29,8),(115,10,17,8),(116,8,30,8),(117,24,1,8),(118,20,25,8),(119,5,31,8),(120,7,6,8),(121,23,19,8),(122,12,18,8);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!50001 DROP VIEW IF EXISTS `participants`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `participants` AS SELECT 
 1 AS `Week`,
 1 AS `Team`,
 1 AS `Home?`,
 1 AS `Versus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `pkey` int NOT NULL AUTO_INCREMENT,
  `quarter` int DEFAULT NULL,
  `week` int DEFAULT NULL,
  `team` int DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `season`
--

DROP TABLE IF EXISTS `season`;
/*!50001 DROP VIEW IF EXISTS `season`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `season` AS SELECT 
 1 AS `week`,
 1 AS `visitor`,
 1 AS `host`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `pkey` int NOT NULL AUTO_INCREMENT,
  `name` char(128) DEFAULT NULL,
  `dvsn` int DEFAULT NULL,
  PRIMARY KEY (`pkey`),
  UNIQUE KEY `name` (`name`),
  KEY `dvsn` (`dvsn`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`dvsn`) REFERENCES `division` (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Bills',1),(2,'Dolphins',1),(3,'Patriots',1),(4,'Jets',1),(5,'Broncos',2),(6,'Chiefs',2),(7,'Raiders',2),(8,'Chargers',2),(9,'Ravens',3),(10,'Bengals',3),(11,'Browns',3),(12,'Steelers',3),(13,'Texans',4),(14,'Colts',4),(15,'Jaguars',4),(16,'Titans',4),(17,'Eagles',5),(18,'Giants',5),(19,'Cowboys',5),(20,'Commanders',5),(21,'Cardinals',6),(22,'Rams',6),(23,'49ers',6),(24,'Seahawks',6),(25,'Bears',7),(26,'Lions',7),(27,'Packers',7),(28,'Vikings',7),(29,'Falcons',8),(30,'Saints',8),(31,'Panthers',8),(32,'Buccaneers',8);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `participants`
--

/*!50001 DROP VIEW IF EXISTS `participants`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `participants` AS select `g`.`week` AS `Week`,`t`.`name` AS `Team`,'Yes' AS `Home?`,`o`.`name` AS `Versus` from ((`game` `g` join `team` `t` on((`g`.`home` = `t`.`pkey`))) join `team` `o` on((`o`.`pkey` = `g`.`away`))) union select `g`.`week` AS `Week`,`t`.`name` AS `Team`,'No' AS `Home?`,`o`.`name` AS `Versus` from ((`game` `g` join `team` `t` on((`g`.`away` = `t`.`pkey`))) join `team` `o` on((`o`.`pkey` = `g`.`home`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `season`
--

/*!50001 DROP VIEW IF EXISTS `season`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `season` AS select `g`.`week` AS `week`,`a`.`name` AS `visitor`,`h`.`name` AS `host` from ((`game` `g` join `team` `a` on((`a`.`pkey` = `g`.`away`))) join `team` `h` on((`h`.`pkey` = `g`.`home`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26 14:28:47
