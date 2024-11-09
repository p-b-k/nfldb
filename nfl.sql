/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nfl
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `Byes`
--

DROP TABLE IF EXISTS `Byes`;
/*!50001 DROP VIEW IF EXISTS `Byes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Byes` AS SELECT
 1 AS `week`,
  1 AS `team` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Participants`
--

DROP TABLE IF EXISTS `Participants`;
/*!50001 DROP VIEW IF EXISTS `Participants`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Participants` AS SELECT
 1 AS `Week`,
  1 AS `Team`,
  1 AS `Home?`,
  1 AS `Versus` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Record`
--

DROP TABLE IF EXISTS `Record`;
/*!50001 DROP VIEW IF EXISTS `Record`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Record` AS SELECT
 1 AS `week`,
  1 AS `team_conference`,
  1 AS `team_division`,
  1 AS `team`,
  1 AS `oponent_conference`,
  1 AS `oponent_division`,
  1 AS `oponent`,
  1 AS `at_home`,
  1 AS `in_conference`,
  1 AS `in_division`,
  1 AS `q1_for`,
  1 AS `q2_for`,
  1 AS `q3_for`,
  1 AS `q4_for`,
  1 AS `ot_for`,
  1 AS `q1_against`,
  1 AS `q2_against`,
  1 AS `q3_against`,
  1 AS `q4_against`,
  1 AS `ot_against`,
  1 AS `q1_net`,
  1 AS `q2_net`,
  1 AS `q3_net`,
  1 AS `q4_net`,
  1 AS `game_for`,
  1 AS `game_against`,
  1 AS `game_net`,
  1 AS `won_game`,
  1 AS `lost_game` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Sched49ers`
--

DROP TABLE IF EXISTS `Sched49ers`;
/*!50001 DROP VIEW IF EXISTS `Sched49ers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Sched49ers` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedBears`
--

DROP TABLE IF EXISTS `SchedBears`;
/*!50001 DROP VIEW IF EXISTS `SchedBears`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedBears` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedBengals`
--

DROP TABLE IF EXISTS `SchedBengals`;
/*!50001 DROP VIEW IF EXISTS `SchedBengals`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedBengals` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedBills`
--

DROP TABLE IF EXISTS `SchedBills`;
/*!50001 DROP VIEW IF EXISTS `SchedBills`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedBills` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedBroncos`
--

DROP TABLE IF EXISTS `SchedBroncos`;
/*!50001 DROP VIEW IF EXISTS `SchedBroncos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedBroncos` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedBrowns`
--

DROP TABLE IF EXISTS `SchedBrowns`;
/*!50001 DROP VIEW IF EXISTS `SchedBrowns`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedBrowns` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedBuccaneers`
--

DROP TABLE IF EXISTS `SchedBuccaneers`;
/*!50001 DROP VIEW IF EXISTS `SchedBuccaneers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedBuccaneers` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedCardinals`
--

DROP TABLE IF EXISTS `SchedCardinals`;
/*!50001 DROP VIEW IF EXISTS `SchedCardinals`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedCardinals` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedChargers`
--

DROP TABLE IF EXISTS `SchedChargers`;
/*!50001 DROP VIEW IF EXISTS `SchedChargers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedChargers` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedChiefs`
--

DROP TABLE IF EXISTS `SchedChiefs`;
/*!50001 DROP VIEW IF EXISTS `SchedChiefs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedChiefs` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedColts`
--

DROP TABLE IF EXISTS `SchedColts`;
/*!50001 DROP VIEW IF EXISTS `SchedColts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedColts` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedCommanders`
--

DROP TABLE IF EXISTS `SchedCommanders`;
/*!50001 DROP VIEW IF EXISTS `SchedCommanders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedCommanders` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedCowboys`
--

DROP TABLE IF EXISTS `SchedCowboys`;
/*!50001 DROP VIEW IF EXISTS `SchedCowboys`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedCowboys` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedDolphins`
--

DROP TABLE IF EXISTS `SchedDolphins`;
/*!50001 DROP VIEW IF EXISTS `SchedDolphins`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedDolphins` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedEagles`
--

DROP TABLE IF EXISTS `SchedEagles`;
/*!50001 DROP VIEW IF EXISTS `SchedEagles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedEagles` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedFalcons`
--

DROP TABLE IF EXISTS `SchedFalcons`;
/*!50001 DROP VIEW IF EXISTS `SchedFalcons`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedFalcons` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedGiants`
--

DROP TABLE IF EXISTS `SchedGiants`;
/*!50001 DROP VIEW IF EXISTS `SchedGiants`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedGiants` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedJaguars`
--

DROP TABLE IF EXISTS `SchedJaguars`;
/*!50001 DROP VIEW IF EXISTS `SchedJaguars`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedJaguars` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedJets`
--

DROP TABLE IF EXISTS `SchedJets`;
/*!50001 DROP VIEW IF EXISTS `SchedJets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedJets` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedLions`
--

DROP TABLE IF EXISTS `SchedLions`;
/*!50001 DROP VIEW IF EXISTS `SchedLions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedLions` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedPackers`
--

DROP TABLE IF EXISTS `SchedPackers`;
/*!50001 DROP VIEW IF EXISTS `SchedPackers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedPackers` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedPanthers`
--

DROP TABLE IF EXISTS `SchedPanthers`;
/*!50001 DROP VIEW IF EXISTS `SchedPanthers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedPanthers` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedPatriots`
--

DROP TABLE IF EXISTS `SchedPatriots`;
/*!50001 DROP VIEW IF EXISTS `SchedPatriots`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedPatriots` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedRaiders`
--

DROP TABLE IF EXISTS `SchedRaiders`;
/*!50001 DROP VIEW IF EXISTS `SchedRaiders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedRaiders` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedRams`
--

DROP TABLE IF EXISTS `SchedRams`;
/*!50001 DROP VIEW IF EXISTS `SchedRams`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedRams` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedRavens`
--

DROP TABLE IF EXISTS `SchedRavens`;
/*!50001 DROP VIEW IF EXISTS `SchedRavens`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedRavens` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedSaints`
--

DROP TABLE IF EXISTS `SchedSaints`;
/*!50001 DROP VIEW IF EXISTS `SchedSaints`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedSaints` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedSeahawks`
--

DROP TABLE IF EXISTS `SchedSeahawks`;
/*!50001 DROP VIEW IF EXISTS `SchedSeahawks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedSeahawks` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedSteelers`
--

DROP TABLE IF EXISTS `SchedSteelers`;
/*!50001 DROP VIEW IF EXISTS `SchedSteelers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedSteelers` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedTexans`
--

DROP TABLE IF EXISTS `SchedTexans`;
/*!50001 DROP VIEW IF EXISTS `SchedTexans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedTexans` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedTitans`
--

DROP TABLE IF EXISTS `SchedTitans`;
/*!50001 DROP VIEW IF EXISTS `SchedTitans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedTitans` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SchedVikings`
--

DROP TABLE IF EXISTS `SchedVikings`;
/*!50001 DROP VIEW IF EXISTS `SchedVikings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `SchedVikings` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!50001 DROP VIEW IF EXISTS `Schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Schedule` AS SELECT
 1 AS `week`,
  1 AS `team`,
  1 AS `versus`,
  1 AS `at_home`,
  1 AS `inter_conference`,
  1 AS `in_division`,
  1 AS `won_game`,
  1 AS `lost_game`,
  1 AS `pts_for`,
  1 AS `pts_against` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Stats`
--

DROP TABLE IF EXISTS `Stats`;
/*!50001 DROP VIEW IF EXISTS `Stats`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Stats` AS SELECT
 1 AS `conference`,
  1 AS `division`,
  1 AS `team`,
  1 AS `played`,
  1 AS `pts_for`,
  1 AS `pts_against`,
  1 AS `pts_net`,
  1 AS `win`,
  1 AS `lose`,
  1 AS `pct`,
  1 AS `pct_conf`,
  1 AS `pct_div` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `StrengthOfSched`
--

DROP TABLE IF EXISTS `StrengthOfSched`;
/*!50001 DROP VIEW IF EXISTS `StrengthOfSched`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `StrengthOfSched` AS SELECT
 1 AS `conference`,
  1 AS `division`,
  1 AS `team`,
  1 AS `strength`,
  1 AS `op_diff`,
  1 AS `op_rat`,
  1 AS `pct`,
  1 AS `wpct`,
  1 AS `wpct2` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Week01`
--

DROP TABLE IF EXISTS `Week01`;
/*!50001 DROP VIEW IF EXISTS `Week01`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Week01` AS SELECT
 1 AS `week`,
  1 AS `team_conference`,
  1 AS `team_division`,
  1 AS `team`,
  1 AS `oponent_conference`,
  1 AS `oponent_division`,
  1 AS `oponent`,
  1 AS `at_home`,
  1 AS `in_conference`,
  1 AS `in_division`,
  1 AS `q1_for`,
  1 AS `q2_for`,
  1 AS `q3_for`,
  1 AS `q4_for`,
  1 AS `ot_for`,
  1 AS `q1_against`,
  1 AS `q2_against`,
  1 AS `q3_against`,
  1 AS `q4_against`,
  1 AS `ot_against`,
  1 AS `q1_net`,
  1 AS `q2_net`,
  1 AS `q3_net`,
  1 AS `q4_net`,
  1 AS `game_for`,
  1 AS `game_against`,
  1 AS `game_net`,
  1 AS `won_game` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Week02`
--

DROP TABLE IF EXISTS `Week02`;
/*!50001 DROP VIEW IF EXISTS `Week02`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Week02` AS SELECT
 1 AS `week`,
  1 AS `team_conference`,
  1 AS `team_division`,
  1 AS `team`,
  1 AS `oponent_conference`,
  1 AS `oponent_division`,
  1 AS `oponent`,
  1 AS `at_home`,
  1 AS `in_conference`,
  1 AS `in_division`,
  1 AS `q1_for`,
  1 AS `q2_for`,
  1 AS `q3_for`,
  1 AS `q4_for`,
  1 AS `ot_for`,
  1 AS `q1_against`,
  1 AS `q2_against`,
  1 AS `q3_against`,
  1 AS `q4_against`,
  1 AS `ot_against`,
  1 AS `q1_net`,
  1 AS `q2_net`,
  1 AS `q3_net`,
  1 AS `q4_net`,
  1 AS `game_for`,
  1 AS `game_against`,
  1 AS `game_net`,
  1 AS `won_game` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Week03`
--

DROP TABLE IF EXISTS `Week03`;
/*!50001 DROP VIEW IF EXISTS `Week03`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Week03` AS SELECT
 1 AS `week`,
  1 AS `team_conference`,
  1 AS `team_division`,
  1 AS `team`,
  1 AS `oponent_conference`,
  1 AS `oponent_division`,
  1 AS `oponent`,
  1 AS `at_home`,
  1 AS `in_conference`,
  1 AS `in_division`,
  1 AS `q1_for`,
  1 AS `q2_for`,
  1 AS `q3_for`,
  1 AS `q4_for`,
  1 AS `ot_for`,
  1 AS `q1_against`,
  1 AS `q2_against`,
  1 AS `q3_against`,
  1 AS `q4_against`,
  1 AS `ot_against`,
  1 AS `q1_net`,
  1 AS `q2_net`,
  1 AS `q3_net`,
  1 AS `q4_net`,
  1 AS `game_for`,
  1 AS `game_against`,
  1 AS `game_net`,
  1 AS `won_game` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Week04`
--

DROP TABLE IF EXISTS `Week04`;
/*!50001 DROP VIEW IF EXISTS `Week04`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Week04` AS SELECT
 1 AS `week`,
  1 AS `team_conference`,
  1 AS `team_division`,
  1 AS `team`,
  1 AS `oponent_conference`,
  1 AS `oponent_division`,
  1 AS `oponent`,
  1 AS `at_home`,
  1 AS `in_conference`,
  1 AS `in_division`,
  1 AS `q1_for`,
  1 AS `q2_for`,
  1 AS `q3_for`,
  1 AS `q4_for`,
  1 AS `ot_for`,
  1 AS `q1_against`,
  1 AS `q2_against`,
  1 AS `q3_against`,
  1 AS `q4_against`,
  1 AS `ot_against`,
  1 AS `q1_net`,
  1 AS `q2_net`,
  1 AS `q3_net`,
  1 AS `q4_net`,
  1 AS `game_for`,
  1 AS `game_against`,
  1 AS `game_net`,
  1 AS `won_game` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Week05`
--

DROP TABLE IF EXISTS `Week05`;
/*!50001 DROP VIEW IF EXISTS `Week05`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Week05` AS SELECT
 1 AS `week`,
  1 AS `team_conference`,
  1 AS `team_division`,
  1 AS `team`,
  1 AS `oponent_conference`,
  1 AS `oponent_division`,
  1 AS `oponent`,
  1 AS `at_home`,
  1 AS `in_conference`,
  1 AS `in_division`,
  1 AS `q1_for`,
  1 AS `q2_for`,
  1 AS `q3_for`,
  1 AS `q4_for`,
  1 AS `ot_for`,
  1 AS `q1_against`,
  1 AS `q2_against`,
  1 AS `q3_against`,
  1 AS `q4_against`,
  1 AS `ot_against`,
  1 AS `q1_net`,
  1 AS `q2_net`,
  1 AS `q3_net`,
  1 AS `q4_net`,
  1 AS `game_for`,
  1 AS `game_against`,
  1 AS `game_net`,
  1 AS `won_game` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Week06`
--

DROP TABLE IF EXISTS `Week06`;
/*!50001 DROP VIEW IF EXISTS `Week06`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Week06` AS SELECT
 1 AS `week`,
  1 AS `team_conference`,
  1 AS `team_division`,
  1 AS `team`,
  1 AS `oponent_conference`,
  1 AS `oponent_division`,
  1 AS `oponent`,
  1 AS `at_home`,
  1 AS `in_conference`,
  1 AS `in_division`,
  1 AS `q1_for`,
  1 AS `q2_for`,
  1 AS `q3_for`,
  1 AS `q4_for`,
  1 AS `ot_for`,
  1 AS `q1_against`,
  1 AS `q2_against`,
  1 AS `q3_against`,
  1 AS `q4_against`,
  1 AS `ot_against`,
  1 AS `q1_net`,
  1 AS `q2_net`,
  1 AS `q3_net`,
  1 AS `q4_net`,
  1 AS `game_for`,
  1 AS `game_against`,
  1 AS `game_net`,
  1 AS `won_game` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Week07`
--

DROP TABLE IF EXISTS `Week07`;
/*!50001 DROP VIEW IF EXISTS `Week07`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Week07` AS SELECT
 1 AS `week`,
  1 AS `team_conference`,
  1 AS `team_division`,
  1 AS `team`,
  1 AS `oponent_conference`,
  1 AS `oponent_division`,
  1 AS `oponent`,
  1 AS `at_home`,
  1 AS `in_conference`,
  1 AS `in_division`,
  1 AS `q1_for`,
  1 AS `q2_for`,
  1 AS `q3_for`,
  1 AS `q4_for`,
  1 AS `ot_for`,
  1 AS `q1_against`,
  1 AS `q2_against`,
  1 AS `q3_against`,
  1 AS `q4_against`,
  1 AS `ot_against`,
  1 AS `q1_net`,
  1 AS `q2_net`,
  1 AS `q3_net`,
  1 AS `q4_net`,
  1 AS `game_for`,
  1 AS `game_against`,
  1 AS `game_net`,
  1 AS `won_game` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `conference`
--

DROP TABLE IF EXISTS `conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conference` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(128) NOT NULL,
  `tag` char(3) DEFAULT NULL,
  PRIMARY KEY (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conference`
--

LOCK TABLES `conference` WRITE;
/*!40000 ALTER TABLE `conference` DISABLE KEYS */;
INSERT INTO `conference` VALUES
(1,'American Football Conference','afc'),
(2,'National Football Conference','nfc');
/*!40000 ALTER TABLE `conference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(128) NOT NULL,
  `conf` int(11) NOT NULL,
  PRIMARY KEY (`pkey`),
  KEY `conf` (`conf`),
  CONSTRAINT `division_ibfk_1` FOREIGN KEY (`conf`) REFERENCES `conference` (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES
(1,'East',1),
(2,'West',1),
(3,'North',1),
(4,'South',1),
(5,'East',2),
(6,'West',2),
(7,'North',2),
(8,'South',2);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `home` int(11) NOT NULL,
  `away` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `season` int(11) NOT NULL,
  PRIMARY KEY (`pkey`),
  UNIQUE KEY `u_game_swa` (`season`,`week`,`away`),
  UNIQUE KEY `u_game_swh` (`season`,`week`,`home`),
  KEY `home` (`home`),
  KEY `away` (`away`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`home`) REFERENCES `team` (`pkey`),
  CONSTRAINT `game_ibfk_2` FOREIGN KEY (`away`) REFERENCES `team` (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES
(1,6,9,1,'2024-09-05 20:40:00',2024),
(2,17,27,1,'2024-09-06 20:15:00',2024),
(3,29,12,1,'2024-09-08 13:00:00',2024),
(4,1,21,1,'2024-09-08 13:00:00',2024),
(5,25,16,1,'2024-09-08 13:00:00',2024),
(6,10,3,1,'2024-09-08 13:00:00',2024),
(7,14,13,1,'2024-09-08 13:00:00',2024),
(8,2,15,1,'2024-09-08 13:00:00',2024),
(9,30,31,1,'2024-09-08 13:00:00',2024),
(10,18,28,1,'2024-09-08 13:00:00',2024),
(11,8,7,1,'2024-09-08 16:05:00',2024),
(12,24,5,1,'2024-09-08 16:05:00',2024),
(13,11,19,1,'2024-09-08 16:25:00',2024),
(14,32,20,1,'2024-09-08 16:25:00',2024),
(15,26,22,1,'2024-09-08 20:20:00',2024),
(16,23,4,1,'2024-09-09 20:15:00',2024),
(17,2,1,2,'2024-09-12 20:15:00',2024),
(18,9,7,2,'2024-09-22 13:00:00',2024),
(19,31,8,2,'2024-09-22 13:00:00',2024),
(20,19,30,2,'2024-09-22 13:00:00',2024),
(21,26,32,2,'2024-09-22 13:00:00',2024),
(22,27,14,2,'2024-09-22 13:00:00',2024),
(23,15,11,2,'2024-09-22 13:00:00',2024),
(24,28,23,2,'2024-09-22 13:00:00',2024),
(25,3,24,2,'2024-09-22 13:00:00',2024),
(26,16,4,2,'2024-09-22 13:00:00',2024),
(27,20,18,2,'2024-09-22 13:00:00',2024),
(28,21,22,2,'2024-09-15 16:05:00',2024),
(29,5,12,2,'2024-09-15 16:25:00',2024),
(30,6,10,2,'2024-09-15 16:25:00',2024),
(31,13,25,2,'2024-09-15 20:20:00',2024),
(32,17,29,2,'2024-09-16 20:15:00',2024),
(33,4,3,3,'2024-09-19 20:15:00',2024),
(34,11,18,3,'2024-10-06 13:00:00',2024),
(35,14,25,3,'2024-10-06 13:00:00',2024),
(36,28,13,3,'2024-10-06 13:00:00',2024),
(37,30,17,3,'2024-10-06 13:00:00',2024),
(38,12,8,3,'2024-10-06 13:00:00',2024),
(39,32,5,3,'2024-10-06 13:00:00',2024),
(40,16,27,3,'2024-10-06 13:00:00',2024),
(41,7,31,3,'2024-10-06 13:00:00',2024),
(42,24,2,3,'2024-10-06 13:00:00',2024),
(43,21,26,3,'2024-10-06 13:00:00',2024),
(44,19,9,3,'2024-10-06 13:00:00',2024),
(45,22,23,3,'2024-10-06 13:00:00',2024),
(46,29,6,3,'2024-09-22 20:20:00',2024),
(47,1,15,3,'2024-09-23 19:30:00',2024),
(48,10,20,3,'2024-09-23 20:15:00',2024),
(49,18,19,4,'2024-10-20 13:00:00',2024),
(50,29,30,4,'2024-10-20 13:00:00',2024),
(51,31,10,4,'2024-10-20 13:00:00',2024),
(52,25,22,4,'2024-10-20 13:00:00',2024),
(53,27,28,4,'2024-10-20 13:00:00',2024),
(54,13,15,4,'2024-10-20 13:00:00',2024),
(55,14,12,4,'2024-10-20 13:00:00',2024),
(56,4,5,4,'2024-10-20 13:00:00',2024),
(57,32,17,4,'2024-10-20 13:00:00',2024),
(58,21,20,4,'2024-10-20 13:00:00',2024),
(59,23,3,4,'2024-10-20 13:00:00',2024),
(60,8,6,4,'2024-10-20 13:00:00',2024),
(61,7,11,4,'2024-10-20 13:00:00',2024),
(62,9,1,4,'2024-10-20 13:00:00',2024),
(63,2,16,4,'2024-10-20 13:00:00',2024),
(64,26,24,4,'2024-10-20 13:00:00',2024),
(65,29,32,5,'2024-11-03 13:00:00',2024),
(66,28,4,5,'2024-11-03 13:00:00',2024),
(67,25,31,5,'2024-11-03 13:00:00',2024),
(68,10,9,5,'2024-11-03 13:00:00',2024),
(69,13,1,5,'2024-11-03 13:00:00',2024),
(70,15,14,5,'2024-11-03 13:00:00',2024),
(71,3,2,5,'2024-11-03 13:00:00',2024),
(72,20,11,5,'2024-11-03 13:00:00',2024),
(73,5,7,5,'2024-11-03 13:00:00',2024),
(74,23,21,5,'2024-11-03 13:00:00',2024),
(75,22,27,5,'2024-11-03 13:00:00',2024),
(76,24,18,5,'2024-11-03 13:00:00',2024),
(77,12,19,5,'2024-11-03 13:00:00',2024),
(78,6,30,5,'2024-11-03 13:00:00',2024),
(79,24,23,6,'2024-11-17 13:00:00',2024),
(80,25,15,6,'2024-11-17 13:00:00',2024),
(81,9,20,6,'2024-11-17 13:00:00',2024),
(82,27,21,6,'2024-11-17 13:00:00',2024),
(83,3,13,6,'2024-11-17 13:00:00',2024),
(84,30,32,6,'2024-11-17 13:00:00',2024),
(85,17,11,6,'2024-11-17 13:00:00',2024),
(86,16,14,6,'2024-11-17 13:00:00',2024),
(87,5,8,6,'2024-11-17 13:00:00',2024),
(88,7,12,6,'2024-11-17 13:00:00',2024),
(89,31,29,6,'2024-11-17 13:00:00',2024),
(90,19,26,6,'2024-11-17 13:00:00',2024),
(91,18,10,6,'2024-11-17 13:00:00',2024),
(92,4,1,6,'2024-11-17 13:00:00',2024),
(93,30,5,7,'2024-12-01 13:00:00',2024),
(94,15,3,7,'2024-12-01 13:00:00',2024),
(95,29,24,7,'2024-12-01 13:00:00',2024),
(96,1,16,7,'2024-12-01 13:00:00',2024),
(97,11,10,7,'2024-12-01 13:00:00',2024),
(98,27,13,7,'2024-12-01 13:00:00',2024),
(99,14,2,7,'2024-12-01 13:00:00',2024),
(100,28,26,7,'2024-12-01 13:00:00',2024),
(101,18,17,7,'2024-12-01 13:00:00',2024),
(102,20,31,7,'2024-12-01 13:00:00',2024),
(103,23,6,7,'2024-12-01 13:00:00',2024),
(104,12,4,7,'2024-12-01 13:00:00',2024),
(105,32,9,7,'2024-12-01 13:00:00',2024),
(106,21,8,7,'2024-12-01 13:00:00',2024),
(107,22,28,8,'2024-12-15 13:00:00',2024),
(108,11,9,8,'2024-12-15 13:00:00',2024),
(109,26,16,8,'2024-12-15 13:00:00',2024),
(110,13,14,8,'2024-12-15 13:00:00',2024),
(111,15,27,8,'2024-12-15 13:00:00',2024),
(112,2,21,8,'2024-12-15 13:00:00',2024),
(113,3,4,8,'2024-12-15 13:00:00',2024),
(114,32,29,8,'2024-12-15 13:00:00',2024),
(115,10,17,8,'2024-12-15 13:00:00',2024),
(116,8,30,8,'2024-12-15 13:00:00',2024),
(117,24,1,8,'2024-12-15 13:00:00',2024),
(118,20,25,8,'2024-12-15 13:00:00',2024),
(119,5,31,8,'2024-12-15 13:00:00',2024),
(120,7,6,8,'2024-12-15 13:00:00',2024),
(121,23,19,8,'2024-12-15 13:00:00',2024),
(122,12,18,8,'2024-12-15 13:00:00',2024),
(123,22,7,7,'2024-12-01 13:00:00',2024),
(124,4,13,9,'2024-12-29 13:00:00',2024),
(125,31,30,9,'2024-12-29 13:00:00',2024),
(126,18,20,9,'2024-12-29 13:00:00',2024),
(127,1,2,9,'2024-12-29 13:00:00',2024),
(128,11,8,9,'2024-12-29 13:00:00',2024),
(129,16,3,9,'2024-12-29 13:00:00',2024),
(130,29,19,9,'2024-12-29 13:00:00',2024),
(131,10,7,9,'2024-12-29 13:00:00',2024),
(132,9,5,9,'2024-12-29 13:00:00',2024),
(133,21,25,9,'2024-12-29 13:00:00',2024),
(134,17,15,9,'2024-12-29 13:00:00',2024),
(135,24,22,9,'2024-12-29 13:00:00',2024),
(136,27,26,9,'2024-12-29 13:00:00',2024),
(137,28,14,9,'2024-12-29 13:00:00',2024),
(138,6,32,9,'2024-12-29 13:00:00',2024),
(139,9,10,10,'2025-01-12 13:00:00',2024),
(140,31,18,10,'2025-01-12 13:00:00',2024),
(141,25,3,10,'2025-01-12 13:00:00',2024),
(142,32,23,10,'2025-01-12 13:00:00',2024),
(143,6,5,10,'2025-01-12 13:00:00',2024),
(144,14,1,10,'2025-01-12 13:00:00',2024),
(145,20,12,10,'2025-01-12 13:00:00',2024),
(146,15,28,10,'2025-01-12 13:00:00',2024),
(147,30,29,10,'2025-01-12 13:00:00',2024),
(148,8,16,10,'2025-01-12 13:00:00',2024),
(149,21,4,10,'2025-01-12 13:00:00',2024),
(150,19,17,10,'2025-01-12 13:00:00',2024),
(151,13,26,10,'2025-01-12 13:00:00',2024),
(152,22,2,10,'2025-01-12 13:00:00',2024),
(153,17,20,11,'2025-01-26 13:00:00',2024),
(154,2,7,11,'2025-01-26 13:00:00',2024),
(155,30,11,11,'2025-01-26 13:00:00',2024),
(156,16,28,11,'2025-01-26 13:00:00',2024),
(157,25,27,11,'2025-01-26 13:00:00',2024),
(158,26,15,11,'2025-01-26 13:00:00',2024),
(159,3,22,11,'2025-01-26 13:00:00',2024),
(160,12,9,11,'2025-01-26 13:00:00',2024),
(161,23,24,11,'2025-01-26 13:00:00',2024),
(162,5,29,11,'2025-01-26 13:00:00',2024),
(163,1,6,11,'2025-01-26 13:00:00',2024),
(164,8,10,11,'2025-01-26 13:00:00',2024),
(165,4,14,11,'2025-01-26 13:00:00',2024),
(166,19,13,11,'2025-01-26 13:00:00',2024),
(167,11,12,12,'2025-02-09 13:00:00',2024),
(168,13,16,12,'2025-02-09 13:00:00',2024),
(169,25,28,12,'2025-02-09 13:00:00',2024),
(170,20,19,12,'2025-02-09 13:00:00',2024),
(171,2,3,12,'2025-02-09 13:00:00',2024),
(172,31,6,12,'2025-02-09 13:00:00',2024),
(173,18,32,12,'2025-02-09 13:00:00',2024),
(174,14,26,12,'2025-02-09 13:00:00',2024),
(175,7,5,12,'2025-02-09 13:00:00',2024),
(176,24,21,12,'2025-02-09 13:00:00',2024),
(177,27,23,12,'2025-02-09 13:00:00',2024),
(178,22,17,12,'2025-02-09 13:00:00',2024),
(179,8,9,12,'2025-02-09 13:00:00',2024),
(180,26,25,13,'2025-02-23 13:00:00',2024),
(181,19,18,13,'2025-02-23 13:00:00',2024),
(182,27,2,13,'2025-02-23 13:00:00',2024),
(183,6,7,13,'2025-02-23 13:00:00',2024),
(184,15,13,13,'2025-02-23 13:00:00',2024),
(185,3,14,13,'2025-02-23 13:00:00',2024),
(186,29,8,13,'2025-02-23 13:00:00',2024),
(187,4,24,13,'2025-02-23 13:00:00',2024),
(188,20,16,13,'2025-02-23 13:00:00',2024),
(189,10,12,13,'2025-02-23 13:00:00',2024),
(190,28,21,13,'2025-02-23 13:00:00',2024),
(191,30,22,13,'2025-02-23 13:00:00',2024),
(192,31,32,13,'2025-02-23 13:00:00',2024),
(193,9,17,13,'2025-02-23 13:00:00',2024),
(194,1,23,13,'2025-02-23 13:00:00',2024),
(195,5,11,13,'2025-02-23 13:00:00',2024),
(196,26,27,14,'2025-03-09 13:00:00',2024),
(197,12,11,14,'2025-03-09 13:00:00',2024),
(198,18,30,14,'2025-03-09 13:00:00',2024),
(199,2,4,14,'2025-03-09 13:00:00',2024),
(200,16,15,14,'2025-03-09 13:00:00',2024),
(202,28,29,14,'2025-03-09 13:00:00',2024),
(203,17,31,14,'2025-03-09 13:00:00',2024),
(204,32,7,14,'2025-03-09 13:00:00',2024),
(205,21,24,14,'2025-03-09 13:00:00',2024),
(206,23,25,14,'2025-03-09 13:00:00',2024),
(207,22,1,14,'2025-03-09 13:00:00',2024),
(208,6,8,14,'2025-03-09 13:00:00',2024),
(209,19,10,14,'2025-03-09 13:00:00',2024),
(210,23,22,15,'2025-03-23 13:00:00',2024),
(211,30,20,15,'2025-03-23 13:00:00',2024),
(212,11,6,15,'2025-03-23 13:00:00',2024),
(213,16,10,15,'2025-03-23 13:00:00',2024),
(214,13,2,15,'2025-03-23 13:00:00',2024),
(215,18,9,15,'2025-03-23 13:00:00',2024),
(216,15,4,15,'2025-03-23 13:00:00',2024),
(217,31,19,15,'2025-03-23 13:00:00',2024),
(218,8,32,15,'2025-03-23 13:00:00',2024),
(219,5,14,15,'2025-03-23 13:00:00',2024),
(220,21,3,15,'2025-03-23 13:00:00',2024),
(221,26,1,15,'2025-03-23 13:00:00',2024),
(222,17,12,15,'2025-03-23 13:00:00',2024),
(223,24,27,15,'2025-03-23 13:00:00',2024),
(224,28,25,15,'2025-03-23 13:00:00',2024),
(225,7,29,15,'2025-03-23 13:00:00',2024),
(226,10,11,16,'2025-04-06 13:00:00',2024),
(227,6,13,16,'2025-04-06 13:00:00',2024),
(228,9,12,16,'2025-04-06 13:00:00',2024),
(229,1,3,16,'2025-04-06 13:00:00',2024),
(230,29,18,16,'2025-04-06 13:00:00',2024),
(231,25,26,16,'2025-04-06 13:00:00',2024),
(232,31,21,16,'2025-04-06 13:00:00',2024),
(233,4,22,16,'2025-04-06 13:00:00',2024),
(234,20,17,16,'2025-04-06 13:00:00',2024),
(235,14,16,16,'2025-04-06 13:00:00',2024),
(236,8,5,16,'2025-04-06 13:00:00',2024),
(237,24,28,16,'2025-04-06 13:00:00',2024),
(238,7,15,16,'2025-04-06 13:00:00',2024),
(239,2,23,16,'2025-04-06 13:00:00',2024),
(241,19,32,16,'2025-04-06 13:00:00',2024),
(242,27,30,16,'2025-04-06 13:00:00',2024),
(243,12,6,17,'2025-04-20 13:00:00',2024),
(244,13,9,17,'2025-04-20 13:00:00',2024),
(245,25,24,17,'2025-04-20 13:00:00',2024),
(246,20,29,17,'2025-04-20 13:00:00',2024),
(247,3,8,17,'2025-04-20 13:00:00',2024),
(248,10,5,17,'2025-04-20 13:00:00',2024),
(249,18,14,17,'2025-04-20 13:00:00',2024),
(250,22,21,17,'2025-04-20 13:00:00',2024),
(251,32,31,17,'2025-04-20 13:00:00',2024),
(252,1,4,17,'2025-04-20 13:00:00',2024),
(253,28,27,17,'2025-04-20 13:00:00',2024),
(254,30,7,17,'2025-04-20 13:00:00',2024),
(255,15,16,17,'2025-04-20 13:00:00',2024),
(256,17,19,17,'2025-04-20 13:00:00',2024),
(257,11,2,17,'2025-04-20 13:00:00',2024),
(258,23,26,17,'2025-04-20 13:00:00',2024),
(259,9,11,18,'2025-05-04 13:00:00',2024),
(260,7,8,18,'2025-05-04 13:00:00',2024),
(261,12,10,18,'2025-05-04 13:00:00',2024),
(262,21,23,18,'2025-05-04 13:00:00',2024),
(263,29,31,18,'2025-05-04 13:00:00',2024),
(264,5,6,18,'2025-05-04 13:00:00',2024),
(265,22,24,18,'2025-05-04 13:00:00',2024),
(266,16,13,18,'2025-05-04 13:00:00',2024),
(267,17,18,18,'2025-05-04 13:00:00',2024),
(268,14,15,18,'2025-05-04 13:00:00',2024),
(269,26,28,18,'2025-05-04 13:00:00',2024),
(270,19,20,18,'2025-05-04 13:00:00',2024),
(271,27,25,18,'2025-05-04 13:00:00',2024),
(272,4,2,18,'2025-05-04 13:00:00',2024),
(273,32,30,18,'2025-05-04 13:00:00',2024),
(274,3,1,18,'2025-05-04 13:00:00',2024);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `game` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`pkey`),
  UNIQUE KEY `u_score_on_game_team_quarter` (`game`,`team`,`quarter`),
  KEY `team` (`team`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`game`) REFERENCES `game` (`pkey`),
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`team`) REFERENCES `team` (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=1209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES
(3,2,1,17,0),
(4,2,2,17,17),
(5,2,3,17,14),
(6,2,4,17,3),
(7,2,1,27,6),
(8,2,2,27,13),
(9,2,3,27,7),
(10,2,4,27,3),
(11,32,1,17,0),
(12,32,2,17,7),
(13,32,3,17,3),
(14,32,4,17,11),
(15,32,1,29,0),
(16,32,2,29,6),
(17,32,3,29,9),
(18,32,4,29,7),
(19,37,1,17,0),
(20,37,2,17,0),
(21,37,3,17,0),
(22,37,4,17,15),
(23,37,1,30,3),
(24,37,2,30,0),
(25,37,3,30,0),
(26,37,4,30,9),
(27,57,1,17,0),
(28,57,2,17,7),
(29,57,3,17,9),
(30,57,4,17,0),
(31,57,1,32,14),
(32,57,2,32,10),
(33,57,3,32,6),
(34,57,4,32,3),
(35,85,1,17,0),
(36,85,2,17,10),
(37,85,3,17,3),
(38,85,4,17,7),
(39,85,1,11,0),
(40,85,2,11,10),
(41,85,3,11,0),
(42,85,4,11,6),
(43,101,1,17,0),
(44,101,2,17,14),
(45,101,3,17,7),
(46,101,4,17,7),
(47,101,1,18,0),
(48,101,2,18,3),
(49,101,3,18,0),
(50,101,4,18,0),
(51,10,1,18,3),
(52,10,2,18,0),
(53,10,3,18,3),
(54,10,4,18,0),
(55,10,1,28,7),
(56,10,2,28,7),
(57,10,3,28,14),
(58,10,4,28,0),
(59,27,1,18,6),
(60,27,2,18,6),
(61,27,3,18,0),
(62,27,4,18,6),
(63,27,1,20,3),
(64,27,2,20,6),
(65,27,3,20,6),
(66,27,4,20,6),
(67,34,1,18,7),
(68,34,2,18,14),
(69,34,3,18,0),
(70,34,4,18,0),
(71,34,1,11,7),
(72,34,2,11,0),
(73,34,3,11,0),
(74,34,4,11,8),
(75,49,1,18,3),
(76,49,2,18,6),
(77,49,3,18,3),
(78,49,4,18,3),
(79,49,1,19,7),
(80,49,2,19,7),
(81,49,3,19,3),
(82,49,4,19,3),
(83,76,1,18,0),
(84,76,2,18,10),
(85,76,3,18,10),
(86,76,4,18,9),
(87,76,1,24,7),
(88,76,2,24,3),
(89,76,3,24,3),
(90,76,4,24,7),
(91,91,1,18,0),
(92,91,2,18,0),
(93,91,3,18,7),
(94,91,4,18,0),
(95,91,1,10,7),
(96,91,2,10,0),
(97,91,3,10,3),
(98,91,4,10,7),
(99,14,1,20,0),
(100,14,2,20,7),
(101,14,3,20,7),
(102,14,4,20,6),
(103,14,1,32,6),
(104,14,2,32,10),
(105,14,3,32,7),
(106,14,4,32,14),
(107,48,1,20,7),
(108,48,2,20,14),
(109,48,3,20,7),
(110,48,4,20,10),
(111,48,1,10,7),
(112,48,2,10,6),
(113,48,3,10,7),
(114,48,4,10,13),
(115,58,1,20,7),
(116,58,2,20,10),
(117,58,3,20,10),
(118,58,4,20,15),
(119,58,1,21,7),
(120,58,2,21,0),
(121,58,3,21,7),
(122,58,4,21,0),
(123,72,1,20,7),
(124,72,2,20,17),
(125,72,3,20,10),
(126,72,4,20,0),
(127,72,1,11,0),
(128,72,2,11,3),
(129,72,3,11,3),
(130,72,4,11,7),
(131,81,1,9,3),
(132,81,2,9,14),
(133,81,3,9,10),
(134,81,4,9,3),
(135,102,1,20,10),
(136,102,2,20,17),
(137,102,3,20,10),
(138,102,4,20,3),
(139,102,1,31,0),
(140,102,2,31,0),
(141,102,3,31,0),
(142,102,4,31,7),
(143,13,1,19,7),
(144,13,2,19,13),
(145,13,3,19,10),
(146,13,4,19,3),
(147,13,1,11,3),
(148,13,2,11,0),
(149,13,3,11,7),
(150,13,4,11,7),
(151,20,1,19,3),
(152,20,2,19,13),
(153,20,3,19,3),
(154,20,4,19,0),
(155,20,1,30,14),
(156,20,2,30,21),
(157,20,3,30,6),
(158,20,4,30,3),
(159,44,1,19,3),
(160,44,2,19,3),
(161,44,3,19,0),
(162,44,4,19,19),
(163,44,1,9,14),
(164,44,2,9,7),
(165,44,3,9,7),
(166,44,4,9,0),
(167,77,1,19,3),
(168,77,2,19,3),
(169,77,3,19,0),
(170,77,4,19,14),
(171,77,1,12,3),
(172,77,2,12,0),
(173,77,3,12,7),
(174,77,4,12,7),
(175,90,1,19,3),
(176,90,2,19,3),
(177,90,3,19,3),
(178,90,4,19,0),
(179,90,1,26,7),
(180,90,2,26,20),
(181,90,3,26,10),
(182,90,4,26,10),
(183,12,1,24,3),
(184,12,2,24,6),
(185,12,3,24,10),
(186,12,4,24,7),
(187,12,1,5,3),
(188,12,2,5,10),
(189,12,3,5,0),
(190,12,4,5,7),
(191,25,1,24,7),
(192,25,2,24,10),
(193,25,3,24,0),
(194,25,4,24,3),
(195,25,1,3,7),
(196,25,2,3,6),
(197,25,3,3,0),
(198,25,4,3,7),
(199,42,1,24,17),
(200,42,2,24,0),
(201,42,3,24,0),
(202,42,4,24,7),
(203,42,1,2,3),
(204,42,2,2,0),
(205,42,3,2,0),
(206,42,4,2,0),
(207,64,1,24,0),
(208,64,2,24,7),
(209,64,3,24,13),
(210,64,4,24,9),
(211,64,1,26,7),
(212,64,2,26,14),
(213,64,3,26,14),
(214,64,4,26,7),
(215,95,1,24,3),
(216,95,2,24,14),
(217,95,3,24,7),
(218,95,4,24,10),
(219,95,1,29,0),
(220,95,2,29,7),
(221,95,3,29,7),
(222,95,4,29,0),
(223,4,1,21,7),
(224,4,2,21,10),
(225,4,3,21,0),
(226,4,4,21,11),
(227,4,1,1,0),
(228,4,2,1,10),
(229,4,3,1,14),
(230,4,4,1,10),
(231,28,1,21,14),
(232,28,2,21,10),
(233,28,3,21,10),
(234,28,4,21,7),
(235,28,1,22,0),
(236,28,2,22,3),
(237,28,3,22,7),
(238,28,4,22,0),
(239,43,1,21,7),
(240,43,2,21,3),
(241,43,3,21,0),
(242,43,4,21,3),
(243,43,1,26,7),
(244,43,2,26,13),
(245,43,3,26,0),
(246,43,4,26,0),
(247,74,1,21,7),
(248,74,2,21,3),
(249,74,3,21,3),
(250,74,4,21,11),
(251,74,1,23,10),
(252,74,2,23,13),
(253,74,3,23,0),
(254,74,4,23,0),
(255,82,1,21,0),
(256,82,2,21,10),
(257,82,3,21,3),
(258,82,4,21,0),
(259,82,1,27,7),
(260,82,2,27,17),
(261,82,3,27,7),
(262,82,4,27,3),
(263,106,1,21,0),
(264,106,2,21,7),
(265,106,3,21,0),
(266,106,4,21,10),
(267,106,1,8,0),
(268,106,2,8,6),
(269,106,3,8,3),
(270,106,4,8,6),
(271,15,1,22,3),
(272,15,2,22,0),
(273,15,3,22,7),
(274,15,4,22,10),
(275,15,1,26,0),
(276,15,2,26,10),
(277,15,3,26,7),
(278,15,4,26,3),
(279,45,1,22,0),
(280,45,2,22,7),
(281,45,3,22,7),
(282,45,4,22,13),
(283,45,1,23,14),
(284,45,2,23,0),
(285,45,3,23,7),
(286,45,4,23,3),
(287,52,1,22,3),
(288,52,2,22,3),
(289,52,3,22,3),
(290,52,4,22,9),
(291,52,1,25,0),
(292,52,2,25,10),
(293,52,3,25,7),
(294,52,4,25,7),
(295,123,1,22,0),
(296,123,2,22,14),
(297,123,3,22,6),
(298,123,4,22,0),
(299,123,1,7,0),
(300,123,2,7,6),
(301,123,3,7,3),
(302,123,4,7,6),
(303,16,1,23,3),
(304,16,2,23,13),
(305,16,3,23,10),
(306,16,4,23,6),
(307,16,1,4,7),
(308,16,2,4,0),
(309,16,3,4,6),
(310,16,4,4,6),
(311,24,1,23,0),
(312,24,2,23,7),
(313,24,3,23,0),
(314,24,4,23,10),
(315,24,1,28,3),
(316,24,2,28,10),
(317,24,3,28,7),
(318,24,4,28,3),
(319,59,1,23,6),
(320,59,2,23,14),
(321,59,3,23,7),
(322,59,4,23,3),
(323,59,1,3,0),
(324,59,2,3,3),
(325,59,3,3,7),
(326,59,4,3,3),
(327,103,1,23,3),
(328,103,2,23,3),
(329,103,3,23,6),
(330,103,4,23,6),
(331,103,1,6,0),
(332,103,2,6,14),
(333,103,3,6,0),
(334,103,4,6,14),
(335,21,1,32,6),
(336,21,2,32,7),
(337,21,3,32,7),
(338,21,4,32,0),
(339,21,1,26,3),
(340,21,2,26,3),
(341,21,3,26,10),
(342,21,4,26,0),
(343,100,1,26,0),
(344,100,2,26,21),
(345,100,3,26,7),
(346,100,4,26,3),
(347,100,1,28,10),
(348,100,2,28,0),
(349,100,3,28,7),
(350,100,4,28,12),
(351,36,1,28,14),
(352,36,2,28,0),
(353,36,3,28,7),
(354,36,4,28,13),
(355,36,1,13,0),
(356,36,2,13,0),
(357,36,3,13,7),
(358,36,4,13,0),
(359,53,1,28,14),
(360,53,2,28,14),
(361,53,3,28,0),
(362,53,4,28,3),
(363,53,1,27,0),
(364,53,2,27,7),
(365,53,3,27,0),
(366,53,4,27,22),
(367,66,1,28,10),
(368,66,2,28,7),
(369,66,3,28,0),
(370,66,4,28,6),
(371,66,1,4,0),
(372,66,2,4,7),
(373,66,3,4,3),
(374,66,4,4,7),
(375,22,1,27,10),
(376,22,2,27,0),
(377,22,3,27,3),
(378,22,4,27,3),
(379,22,1,14,0),
(380,22,2,14,0),
(381,22,3,14,3),
(382,22,4,14,7),
(383,40,1,27,17),
(384,40,2,27,3),
(385,40,3,27,7),
(386,40,4,27,3),
(387,40,1,16,7),
(388,40,2,16,0),
(389,40,3,16,7),
(390,40,4,16,0),
(391,98,1,27,0),
(392,98,2,27,14),
(393,98,3,27,7),
(394,98,4,27,3),
(395,98,1,13,3),
(396,98,2,13,16),
(397,98,3,13,0),
(398,98,4,13,3),
(407,5,1,25,0),
(408,5,2,25,3),
(409,5,3,25,7),
(410,5,4,25,14),
(411,5,1,16,7),
(412,5,2,16,10),
(413,5,3,16,0),
(414,5,4,16,0),
(415,31,1,25,3),
(416,31,2,25,7),
(417,31,3,25,0),
(418,31,4,25,3),
(419,31,1,13,3),
(420,31,2,13,13),
(421,31,3,13,0),
(422,31,4,13,3),
(423,35,1,25,0),
(424,35,2,25,0),
(425,35,3,25,3),
(426,35,4,25,13),
(427,35,1,14,0),
(428,35,2,14,7),
(429,35,3,14,7),
(430,35,4,14,7),
(431,67,1,25,7),
(432,67,2,25,20),
(433,67,3,25,3),
(434,67,4,25,6),
(435,67,1,31,7),
(436,67,2,31,0),
(437,67,3,31,3),
(438,67,4,31,0),
(439,80,1,15,3),
(440,80,2,15,0),
(441,80,3,15,7),
(442,80,4,15,6),
(443,3,1,29,3),
(444,3,2,29,7),
(445,3,3,29,0),
(446,3,4,29,0),
(447,3,1,12,3),
(448,3,2,12,6),
(449,3,3,12,6),
(450,3,4,12,3),
(451,50,1,29,7),
(452,50,2,29,10),
(453,50,3,29,3),
(454,50,4,29,6),
(455,50,1,30,7),
(456,50,2,30,7),
(457,50,3,30,3),
(458,50,4,30,7),
(459,65,1,29,7),
(460,65,2,29,10),
(461,65,3,29,3),
(462,65,4,29,10),
(463,65,1,32,10),
(464,65,2,32,14),
(465,65,3,32,3),
(466,65,4,32,3),
(467,84,1,32,17),
(468,84,2,32,7),
(469,84,3,32,7),
(470,84,4,32,20),
(471,84,1,30,0),
(472,84,2,30,27),
(473,84,3,30,0),
(474,84,4,30,0),
(475,105,1,32,10),
(476,105,2,32,0),
(477,105,3,32,0),
(478,105,4,32,21),
(479,105,1,9,0),
(480,105,2,9,17),
(481,105,3,9,17),
(482,105,4,9,7),
(483,9,1,30,17),
(484,9,2,30,13),
(485,9,3,30,7),
(486,9,4,30,10),
(487,9,1,31,0),
(488,9,2,31,3),
(489,9,3,31,7),
(490,9,4,31,0),
(491,78,1,30,0),
(492,78,2,30,7),
(493,78,3,30,0),
(494,78,4,30,6),
(495,78,1,6,7),
(496,78,2,6,9),
(497,78,3,6,0),
(498,78,4,6,10),
(499,93,1,30,0),
(500,93,2,30,3),
(501,93,3,30,0),
(502,93,4,30,7),
(503,93,1,5,3),
(504,93,2,5,13),
(505,93,3,5,10),
(506,93,4,5,7),
(507,19,1,31,0),
(508,19,2,31,0),
(509,19,3,31,3),
(510,19,4,31,0),
(511,19,1,8,6),
(512,19,2,8,14),
(513,19,3,8,3),
(514,19,4,8,3),
(515,41,1,31,7),
(516,41,2,31,14),
(517,41,3,31,6),
(518,41,4,31,9),
(519,41,1,7,7),
(520,41,2,7,0),
(521,41,3,7,0),
(522,41,4,7,15),
(523,51,1,31,0),
(524,51,2,31,14),
(525,51,3,31,7),
(526,51,4,31,3),
(527,51,1,10,7),
(528,51,2,10,14),
(529,51,3,10,10),
(530,51,4,10,3),
(531,89,1,29,7),
(532,89,2,29,15),
(533,89,3,29,6),
(534,89,4,29,10),
(535,89,1,31,7),
(536,89,2,31,10),
(537,89,3,31,3),
(538,89,4,31,0),
(539,17,1,1,7),
(540,17,2,1,17),
(541,17,3,1,7),
(542,17,4,1,0),
(543,17,1,2,7),
(544,17,2,2,3),
(545,17,3,2,0),
(546,17,4,2,0),
(547,47,1,1,13),
(548,47,2,1,21),
(549,47,3,1,3),
(550,47,4,1,10),
(551,47,1,15,0),
(552,47,2,15,3),
(553,47,3,15,7),
(554,47,4,15,0),
(555,62,1,1,3),
(556,62,2,1,0),
(557,62,3,1,7),
(558,62,4,1,0),
(559,62,1,9,7),
(560,62,2,9,14),
(561,62,3,9,7),
(562,62,4,9,7),
(563,69,1,1,3),
(564,69,2,1,0),
(565,69,3,1,14),
(566,69,4,1,3),
(567,69,1,13,14),
(568,69,2,13,3),
(569,69,3,13,3),
(570,69,4,13,3),
(571,92,1,1,7),
(572,92,2,1,13),
(573,92,3,1,0),
(574,92,4,1,3),
(575,92,1,4,10),
(576,92,2,4,7),
(577,92,3,4,3),
(578,92,4,4,0),
(579,96,1,1,0),
(580,96,2,1,7),
(581,96,3,1,10),
(582,96,4,1,17),
(583,96,1,16,3),
(584,96,2,16,7),
(585,96,3,16,0),
(586,96,4,16,0),
(587,8,1,2,0),
(588,8,2,2,7),
(589,8,3,2,7),
(590,8,4,2,6),
(591,8,1,15,7),
(592,8,2,15,10),
(593,8,3,15,0),
(594,8,4,15,0),
(595,63,1,2,0),
(596,63,2,2,3),
(597,63,3,2,3),
(598,63,4,2,6),
(599,63,1,16,0),
(600,63,2,16,9),
(601,63,3,16,10),
(602,63,4,16,12),
(611,99,1,2,7),
(612,99,2,2,3),
(613,99,3,2,0),
(614,99,4,2,0),
(615,99,1,14,0),
(616,99,2,14,3),
(617,99,3,14,7),
(618,99,4,14,6),
(619,26,1,4,0),
(620,26,2,4,7),
(621,26,3,4,10),
(622,26,4,4,7),
(623,26,1,16,7),
(624,26,2,16,3),
(625,26,3,16,7),
(626,26,4,16,0),
(627,33,1,4,7),
(628,33,2,4,7),
(629,33,3,4,7),
(630,33,4,4,3),
(631,33,1,3,0),
(632,33,2,3,3),
(633,33,3,3,0),
(634,33,4,3,0),
(635,104,1,4,7),
(636,104,2,4,8),
(637,104,3,4,0),
(638,104,4,4,0),
(639,104,1,12,3),
(640,104,2,12,10),
(641,104,3,12,10),
(642,104,4,12,14),
(643,6,1,3,0),
(644,6,2,3,10),
(645,6,3,3,3),
(646,6,4,3,3),
(647,6,1,10,0),
(648,6,2,10,0),
(649,6,3,10,7),
(650,6,4,10,3),
(651,83,1,3,0),
(652,83,2,3,7),
(653,83,3,3,7),
(654,83,4,3,7),
(655,83,1,13,14),
(656,83,2,13,0),
(657,83,3,13,13),
(658,83,4,13,14),
(659,94,1,3,7),
(660,94,2,3,3),
(661,94,3,3,0),
(662,94,4,3,6),
(663,94,1,15,0),
(664,94,2,15,22),
(665,94,3,15,3),
(666,94,4,15,7),
(667,1,1,6,7),
(668,1,2,6,6),
(669,1,3,6,7),
(670,1,4,6,7),
(671,1,1,9,7),
(672,1,2,9,3),
(673,1,3,9,0),
(674,1,4,9,10),
(675,30,1,6,3),
(676,30,2,6,7),
(677,30,3,6,7),
(678,30,4,6,9),
(679,30,1,10,3),
(680,30,2,10,13),
(681,30,3,10,6),
(682,30,4,10,3),
(683,60,1,6,0),
(684,60,2,6,7),
(685,60,3,6,3),
(686,60,4,6,7),
(687,60,1,8,10),
(688,60,2,8,0),
(689,60,3,8,0),
(690,60,4,8,0),
(691,29,1,5,0),
(692,29,2,5,0),
(693,29,3,5,0),
(694,29,4,5,6),
(695,29,1,12,7),
(696,29,2,12,3),
(697,29,3,12,3),
(698,29,4,12,0),
(699,39,1,5,14),
(700,39,2,5,6),
(701,39,3,5,0),
(702,39,4,5,6),
(703,56,1,5,0),
(704,56,2,5,0),
(705,56,3,5,7),
(706,56,4,5,3),
(707,56,1,4,0),
(708,56,2,4,6),
(709,56,3,4,0),
(710,56,4,4,3),
(711,73,1,5,0),
(712,73,2,5,13),
(713,73,3,5,7),
(714,73,4,5,14),
(715,73,1,7,10),
(716,73,2,7,0),
(717,73,3,7,0),
(718,73,4,7,8),
(719,87,1,5,0),
(720,87,2,5,0),
(721,87,3,5,0),
(722,87,4,5,16),
(723,87,1,8,10),
(724,87,2,8,10),
(725,87,3,8,3),
(726,87,4,8,0),
(727,11,1,8,3),
(728,11,2,8,3),
(729,11,3,8,3),
(730,11,4,8,13),
(731,11,1,7,7),
(732,11,2,7,0),
(733,11,3,7,0),
(734,11,4,7,3),
(735,38,1,8,7),
(736,38,2,8,3),
(737,38,3,8,0),
(738,38,4,8,0),
(739,38,1,12,0),
(740,38,2,12,7),
(741,38,3,12,3),
(742,38,4,12,10),
(743,18,1,7,0),
(744,18,2,7,6),
(745,18,3,7,7),
(746,18,4,7,13),
(747,18,1,9,3),
(748,18,2,9,6),
(749,18,3,9,7),
(750,18,4,9,7),
(751,88,1,7,7),
(752,88,2,7,0),
(753,88,3,7,0),
(754,88,4,7,6),
(755,88,1,12,3),
(756,88,2,12,9),
(757,88,3,12,10),
(758,88,4,12,10),
(759,68,1,9,7),
(760,68,2,9,7),
(761,68,3,9,7),
(762,68,4,9,17),
(763,68,1,10,0),
(764,68,2,10,17),
(765,68,3,10,7),
(766,68,4,10,14),
(767,55,1,12,0),
(768,55,2,12,3),
(769,55,3,12,7),
(770,55,4,12,14),
(771,55,1,14,14),
(772,55,2,14,3),
(773,55,3,14,0),
(774,55,4,14,10),
(775,97,1,11,0),
(776,97,2,11,6),
(777,97,3,11,0),
(778,97,4,11,8),
(779,97,1,10,7),
(780,97,2,10,0),
(781,97,3,10,14),
(782,97,4,10,0),
(783,23,1,11,7),
(784,23,2,11,6),
(785,23,3,11,3),
(786,23,4,11,2),
(787,23,1,15,0),
(788,23,2,15,3),
(789,23,3,15,7),
(790,23,4,15,3),
(791,61,1,11,10),
(792,61,2,11,0),
(793,61,3,11,0),
(794,61,4,11,6),
(795,61,1,7,0),
(796,61,2,7,10),
(797,61,3,7,10),
(798,61,4,7,0),
(799,7,1,13,6),
(800,7,2,13,6),
(801,7,3,13,3),
(802,7,4,13,14),
(803,7,1,14,7),
(804,7,2,14,0),
(805,7,3,14,6),
(806,7,4,14,14),
(807,54,1,13,7),
(808,54,2,13,10),
(809,54,3,13,0),
(810,54,4,13,7),
(811,54,1,15,10),
(812,54,2,15,3),
(813,54,3,15,7),
(814,54,4,15,0),
(815,86,1,14,7),
(816,86,2,14,3),
(817,86,3,14,0),
(818,86,4,14,10),
(819,86,1,16,7),
(820,86,2,16,3),
(821,86,3,16,7),
(822,86,4,16,0),
(823,70,1,14,7),
(824,70,2,14,3),
(825,70,3,14,0),
(826,70,4,14,24),
(827,70,1,15,0),
(828,70,2,15,13),
(829,70,3,15,7),
(830,70,4,15,17),
(831,107,1,28,14),
(832,107,2,28,0),
(833,107,3,28,3),
(834,107,4,28,3),
(835,107,1,22,7),
(836,107,2,22,7),
(837,107,3,22,7),
(838,107,4,22,9),
(839,111,1,27,0),
(840,111,2,27,13),
(841,111,3,27,7),
(842,111,4,27,10),
(843,111,1,15,0),
(844,111,2,15,10),
(845,111,3,15,7),
(846,111,4,15,10),
(847,112,1,21,0),
(848,112,2,21,7),
(849,112,3,21,11),
(850,112,4,21,10),
(851,112,1,2,10),
(852,112,2,2,3),
(853,112,3,2,7),
(854,112,4,2,7),
(855,113,1,4,6),
(856,113,2,4,7),
(857,113,3,4,3),
(858,113,4,4,6),
(859,113,1,3,7),
(860,113,2,3,0),
(861,113,3,3,7),
(862,113,4,3,11),
(863,108,1,9,0),
(864,108,2,9,10),
(865,108,3,9,7),
(866,108,4,9,7),
(867,108,1,11,3),
(868,108,2,11,3),
(869,108,3,11,14),
(870,108,4,11,9),
(871,115,1,10,7),
(872,115,2,10,3),
(873,115,3,10,7),
(874,115,4,10,0),
(875,115,1,17,0),
(876,115,2,17,10),
(877,115,3,17,14),
(878,115,4,17,13),
(879,110,1,14,10),
(880,110,2,14,0),
(881,110,3,14,3),
(882,110,4,14,7),
(883,110,1,13,3),
(884,110,2,13,14),
(885,110,3,13,3),
(886,110,4,13,3),
(887,109,1,16,7),
(888,109,2,16,7),
(889,109,3,16,0),
(890,109,4,16,0),
(891,109,1,26,14),
(892,109,2,26,21),
(893,109,3,26,17),
(894,109,4,26,0),
(895,114,1,29,7),
(896,114,2,29,17),
(897,114,3,29,7),
(898,114,4,29,0),
(899,114,1,32,7),
(900,114,2,32,10),
(901,114,3,32,0),
(902,114,4,32,9),
(903,116,1,8,0),
(904,116,2,8,9),
(905,116,3,8,7),
(906,116,4,8,10),
(907,116,1,30,2),
(908,116,2,30,3),
(909,116,3,30,3),
(910,116,4,30,0),
(911,117,1,1,7),
(912,117,2,1,7),
(913,117,3,1,10),
(914,117,4,1,7),
(915,117,1,24,0),
(916,117,2,24,3),
(917,117,3,24,0),
(918,117,4,24,7),
(919,79,1,23,3),
(920,79,2,23,13),
(921,79,3,23,7),
(922,79,4,23,13),
(923,79,1,24,0),
(924,79,2,24,3),
(925,79,3,24,14),
(926,79,4,24,7),
(927,118,1,20,6),
(928,118,2,20,3),
(929,118,3,20,3),
(930,118,4,20,6),
(931,118,1,25,0),
(932,118,2,25,0),
(933,118,3,25,7),
(934,118,4,25,8),
(935,120,1,6,7),
(936,120,2,6,10),
(937,120,3,6,0),
(938,120,4,6,10),
(939,120,1,7,7),
(940,120,2,7,3),
(941,120,3,7,3),
(942,120,4,7,7),
(943,119,1,31,7),
(944,119,2,31,0),
(945,119,3,31,0),
(946,119,4,31,7),
(947,119,1,5,0),
(948,119,2,5,21),
(949,119,3,5,7),
(950,119,4,5,0),
(951,121,1,19,0),
(952,121,2,19,10),
(953,121,3,19,0),
(954,121,4,19,14),
(955,121,1,23,3),
(956,121,2,23,3),
(957,121,3,23,21),
(958,121,4,23,3),
(959,122,1,18,3),
(960,122,2,18,6),
(961,122,3,18,0),
(962,122,4,18,9),
(963,122,1,12,6),
(964,122,2,12,3),
(965,122,3,12,7),
(966,122,4,12,10),
(967,81,1,20,3),
(968,81,2,20,7),
(969,81,3,20,3),
(970,81,4,20,10),
(971,80,1,25,0),
(972,80,2,25,14),
(973,80,3,25,7),
(974,80,4,25,14),
(975,39,1,32,0),
(976,39,2,32,7),
(977,39,3,32,0),
(978,39,4,32,0),
(1031,15,5,26,6),
(1032,15,5,22,0),
(1033,25,5,3,0),
(1034,25,5,24,3),
(1035,65,5,32,0),
(1036,65,5,29,6),
(1037,68,5,9,3),
(1038,68,5,10,0),
(1039,46,1,6,0),
(1040,46,2,6,13),
(1041,46,3,6,9),
(1042,46,4,6,0),
(1043,46,1,29,7),
(1044,46,2,29,7),
(1045,46,3,29,0),
(1046,46,4,29,3),
(1047,71,1,2,3),
(1048,71,2,2,0),
(1049,71,3,2,6),
(1050,71,4,2,6),
(1051,71,1,3,7),
(1052,71,2,3,0),
(1053,71,3,3,3),
(1054,71,4,3,0),
(1055,75,1,27,7),
(1056,75,2,27,3),
(1057,75,3,27,14),
(1058,75,4,27,0),
(1059,75,1,22,0),
(1060,75,2,22,13),
(1061,75,3,22,0),
(1062,75,4,22,6),
(1079,124,1,13,0),
(1080,124,2,13,7),
(1081,124,3,13,3),
(1082,124,4,13,3),
(1084,124,1,4,0),
(1085,124,2,4,0),
(1086,124,3,4,7),
(1087,124,4,4,14),
(1088,137,1,14,0),
(1089,137,2,14,7),
(1090,137,3,14,0),
(1091,137,4,14,6),
(1093,137,1,28,0),
(1094,137,2,28,0),
(1095,137,3,28,14),
(1096,137,4,28,7),
(1098,126,1,20,7),
(1099,126,2,20,14),
(1100,126,3,20,3),
(1101,126,4,20,3),
(1102,126,1,18,0),
(1103,126,2,18,7),
(1104,126,3,18,3),
(1105,126,4,18,12),
(1106,127,1,2,3),
(1107,127,2,2,7),
(1108,127,3,2,3),
(1109,127,4,2,14),
(1110,127,1,1,3),
(1111,127,2,1,3),
(1112,127,3,1,14),
(1113,127,4,1,10),
(1114,128,1,8,7),
(1115,128,2,8,13),
(1116,128,3,8,0),
(1117,128,4,8,7),
(1118,128,1,11,0),
(1119,128,2,11,3),
(1120,128,3,11,0),
(1121,128,4,11,7),
(1122,129,1,3,0),
(1123,129,2,3,3),
(1124,129,3,3,7),
(1125,129,4,3,7),
(1126,129,1,16,7),
(1127,129,2,16,0),
(1128,129,3,16,3),
(1129,129,4,16,7),
(1130,129,5,3,0),
(1131,129,5,16,3),
(1132,130,1,19,3),
(1133,130,2,19,7),
(1134,130,3,19,3),
(1135,130,4,19,8),
(1136,130,1,29,7),
(1137,130,2,29,7),
(1138,130,3,29,7),
(1139,130,4,29,6),
(1140,131,1,7,7),
(1141,131,2,7,3),
(1142,131,3,7,0),
(1143,131,4,7,14),
(1144,131,1,10,7),
(1145,131,2,10,10),
(1146,131,3,10,14),
(1147,131,4,10,10),
(1148,132,1,5,0),
(1149,132,2,5,10),
(1150,132,3,5,0),
(1151,132,4,5,0),
(1152,132,1,9,7),
(1153,132,2,9,17),
(1154,132,3,9,14),
(1155,132,4,9,3),
(1156,133,1,25,0),
(1157,133,2,25,9),
(1158,133,3,25,0),
(1159,133,4,25,0),
(1160,133,1,21,7),
(1161,133,2,21,14),
(1162,133,3,21,3),
(1163,133,4,21,5),
(1164,134,1,15,0),
(1165,134,2,15,0),
(1166,134,3,15,16),
(1167,134,4,15,7),
(1168,134,1,17,7),
(1169,134,2,17,9),
(1170,134,3,17,6),
(1171,134,4,17,6),
(1172,135,1,22,0),
(1173,135,2,22,3),
(1174,135,3,22,10),
(1175,135,4,22,7),
(1176,135,1,24,0),
(1177,135,2,24,13),
(1178,135,3,24,0),
(1179,135,4,24,7),
(1180,135,5,24,0),
(1181,135,5,22,6),
(1182,136,1,26,0),
(1183,136,2,26,17),
(1184,136,3,26,7),
(1185,136,4,26,0),
(1186,136,1,27,3),
(1187,136,2,27,0),
(1188,136,3,27,3),
(1189,136,4,27,8),
(1191,138,1,32,0),
(1192,138,2,32,7),
(1193,138,3,32,10),
(1194,138,4,32,7),
(1195,138,1,6,3),
(1196,138,2,6,7),
(1197,138,3,6,0),
(1198,138,4,6,14),
(1199,138,5,6,6),
(1200,138,5,32,0),
(1201,125,1,30,6),
(1202,125,2,30,7),
(1203,125,3,30,3),
(1204,125,4,30,6),
(1205,125,1,31,0),
(1206,125,2,31,10),
(1207,125,3,31,7),
(1208,125,4,31,6);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `season`
--

DROP TABLE IF EXISTS `season`;
/*!50001 DROP VIEW IF EXISTS `season`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `season` AS SELECT
 1 AS `week`,
  1 AS `visitor`,
  1 AS `host` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `name` char(128) NOT NULL,
  `int_val` int(11) DEFAULT NULL,
  `string_val` char(128) DEFAULT NULL,
  `time_val` datetime DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
('current_week',9,NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `pkey` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(128) DEFAULT NULL,
  `dvsn` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkey`),
  UNIQUE KEY `name` (`name`),
  KEY `dvsn` (`dvsn`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`dvsn`) REFERENCES `division` (`pkey`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES
(1,'Bills',1),
(2,'Dolphins',1),
(3,'Patriots',1),
(4,'Jets',1),
(5,'Broncos',2),
(6,'Chiefs',2),
(7,'Raiders',2),
(8,'Chargers',2),
(9,'Ravens',3),
(10,'Bengals',3),
(11,'Browns',3),
(12,'Steelers',3),
(13,'Texans',4),
(14,'Colts',4),
(15,'Jaguars',4),
(16,'Titans',4),
(17,'Eagles',5),
(18,'Giants',5),
(19,'Cowboys',5),
(20,'Commanders',5),
(21,'Cardinals',6),
(22,'Rams',6),
(23,'49ers',6),
(24,'Seahawks',6),
(25,'Bears',7),
(26,'Lions',7),
(27,'Packers',7),
(28,'Vikings',7),
(29,'Falcons',8),
(30,'Saints',8),
(31,'Panthers',8),
(32,'Buccaneers',8);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Byes`
--

/*!50001 DROP VIEW IF EXISTS `Byes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Byes` AS select `w`.`week` AS `week`,`t`.`name` AS `team` from ((select distinct `game`.`week` AS `week` from `game`) `w` join `team` `t`) where !((`w`.`week`,`t`.`name`) in (select `Record`.`week`,`Record`.`team` from `Record`)) order by `w`.`week` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Participants`
--

/*!50001 DROP VIEW IF EXISTS `Participants`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Participants` AS select 1 AS `Week`,1 AS `Team`,1 AS `Home?`,1 AS `Versus` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Record`
--

/*!50001 DROP VIEW IF EXISTS `Record`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Record` AS select `g`.`week` AS `week`,ucase(`tc`.`tag`) AS `team_conference`,`td`.`name` AS `team_division`,`t`.`name` AS `team`,ucase(`oc`.`tag`) AS `oponent_conference`,`od`.`name` AS `oponent_division`,`o`.`name` AS `oponent`,1 AS `at_home`,if(`tc`.`tag` = `oc`.`tag`,1,0) AS `in_conference`,if(`tc`.`tag` = `oc`.`tag` and `td`.`name` = `od`.`name`,1,0) AS `in_division`,`q1t`.`amount` AS `q1_for`,`q2t`.`amount` AS `q2_for`,`q3t`.`amount` AS `q3_for`,`q4t`.`amount` AS `q4_for`,`ott`.`amount` AS `ot_for`,`q1o`.`amount` AS `q1_against`,`q2o`.`amount` AS `q2_against`,`q3o`.`amount` AS `q3_against`,`q4o`.`amount` AS `q4_against`,`oto`.`amount` AS `ot_against`,`q1t`.`amount` - `q1o`.`amount` AS `q1_net`,`q2t`.`amount` - `q2o`.`amount` AS `q2_net`,`q3t`.`amount` - `q3o`.`amount` AS `q3_net`,`q4t`.`amount` - `q4o`.`amount` AS `q4_net`,`q1t`.`amount` + `q2t`.`amount` + `q3t`.`amount` + `q4t`.`amount` + if(`ott`.`amount` is null,0,`ott`.`amount`) AS `game_for`,`q1o`.`amount` + `q2o`.`amount` + `q3o`.`amount` + `q4o`.`amount` + if(`oto`.`amount` is null,0,`oto`.`amount`) AS `game_against`,`q1t`.`amount` + `q2t`.`amount` + `q3t`.`amount` + `q4t`.`amount` + if(`ott`.`amount` is null,0,`ott`.`amount`) - (`q1o`.`amount` + `q2o`.`amount` + `q3o`.`amount` + `q4o`.`amount` + if(`oto`.`amount` is null,0,`oto`.`amount`)) AS `game_net`,if(`q1t`.`amount` + `q2t`.`amount` + `q3t`.`amount` + `q4t`.`amount` + if(`ott`.`amount` is null,0,`ott`.`amount`) > `q1o`.`amount` + `q2o`.`amount` + `q3o`.`amount` + `q4o`.`amount` + if(`oto`.`amount` is null,0,`oto`.`amount`),1,0) AS `won_game`,if(`q1t`.`amount` + `q2t`.`amount` + `q3t`.`amount` + `q4t`.`amount` + if(`ott`.`amount` is null,0,`ott`.`amount`) < `q1o`.`amount` + `q2o`.`amount` + `q3o`.`amount` + `q4o`.`amount` + if(`oto`.`amount` is null,0,`oto`.`amount`),1,0) AS `lost_game` from ((((((((((((((((`game` `g` join `team` `t` on(`g`.`home` = `t`.`pkey`)) join `team` `o` on(`g`.`away` = `o`.`pkey`)) join `division` `td` on(`t`.`dvsn` = `td`.`pkey`)) join `conference` `tc` on(`td`.`conf` = `tc`.`pkey`)) join `division` `od` on(`o`.`dvsn` = `od`.`pkey`)) join `conference` `oc` on(`od`.`conf` = `oc`.`pkey`)) left join `score` `q1t` on(`q1t`.`team` = `t`.`pkey` and `q1t`.`quarter` = 1 and `q1t`.`game` = `g`.`pkey`)) left join `score` `q2t` on(`q2t`.`team` = `t`.`pkey` and `q2t`.`quarter` = 2 and `q2t`.`game` = `g`.`pkey`)) left join `score` `q3t` on(`q3t`.`team` = `t`.`pkey` and `q3t`.`quarter` = 3 and `q3t`.`game` = `g`.`pkey`)) left join `score` `q4t` on(`q4t`.`team` = `t`.`pkey` and `q4t`.`quarter` = 4 and `q4t`.`game` = `g`.`pkey`)) left join `score` `ott` on(`ott`.`team` = `t`.`pkey` and `ott`.`quarter` = 5 and `ott`.`game` = `g`.`pkey`)) left join `score` `q1o` on(`q1o`.`team` = `o`.`pkey` and `q1o`.`quarter` = 1 and `q1o`.`game` = `g`.`pkey`)) left join `score` `q2o` on(`q2o`.`team` = `o`.`pkey` and `q2o`.`quarter` = 2 and `q2o`.`game` = `g`.`pkey`)) left join `score` `q3o` on(`q3o`.`team` = `o`.`pkey` and `q3o`.`quarter` = 3 and `q3o`.`game` = `g`.`pkey`)) left join `score` `q4o` on(`q4o`.`team` = `o`.`pkey` and `q4o`.`quarter` = 4 and `q4o`.`game` = `g`.`pkey`)) left join `score` `oto` on(`oto`.`team` = `o`.`pkey` and `oto`.`quarter` = 5 and `oto`.`game` = `g`.`pkey`)) union select `g`.`week` AS `week`,ucase(`tc`.`tag`) AS `team_conference`,`td`.`name` AS `team_division`,`t`.`name` AS `team`,ucase(`oc`.`tag`) AS `oponent_conference`,`od`.`name` AS `oponent_division`,`o`.`name` AS `oponent`,0 AS `at_home`,if(`tc`.`tag` = `oc`.`tag`,1,0) AS `in_conference`,if(`tc`.`tag` = `oc`.`tag` and `td`.`name` = `od`.`name`,1,0) AS `in_division`,`q1t`.`amount` AS `q1_for`,`q2t`.`amount` AS `q2_for`,`q3t`.`amount` AS `q3_for`,`q4t`.`amount` AS `q4_for`,`ott`.`amount` AS `ot_for`,`q1o`.`amount` AS `q1_against`,`q2o`.`amount` AS `q2_against`,`q3o`.`amount` AS `q3_against`,`q4o`.`amount` AS `q4_against`,`oto`.`amount` AS `ot_against`,`q1t`.`amount` - `q1o`.`amount` AS `q1_net`,`q2t`.`amount` - `q2o`.`amount` AS `q2_net`,`q3t`.`amount` - `q3o`.`amount` AS `q3_net`,`q4t`.`amount` - `q4o`.`amount` AS `q4_net`,`q1t`.`amount` + `q2t`.`amount` + `q3t`.`amount` + `q4t`.`amount` + if(`ott`.`amount` is null,0,`ott`.`amount`) AS `game_for`,`q1o`.`amount` + `q2o`.`amount` + `q3o`.`amount` + `q4o`.`amount` + if(`oto`.`amount` is null,0,`oto`.`amount`) AS `game_against`,`q1t`.`amount` + `q2t`.`amount` + `q3t`.`amount` + `q4t`.`amount` + if(`ott`.`amount` is null,0,`ott`.`amount`) - (`q1o`.`amount` + `q2o`.`amount` + `q3o`.`amount` + `q4o`.`amount` + if(`oto`.`amount` is null,0,`oto`.`amount`)) AS `game_net`,if(`q1t`.`amount` + `q2t`.`amount` + `q3t`.`amount` + `q4t`.`amount` + if(`ott`.`amount` is null,0,`ott`.`amount`) > `q1o`.`amount` + `q2o`.`amount` + `q3o`.`amount` + `q4o`.`amount` + if(`oto`.`amount` is null,0,`oto`.`amount`),1,0) AS `won_game`,if(`q1t`.`amount` + `q2t`.`amount` + `q3t`.`amount` + `q4t`.`amount` + if(`ott`.`amount` is null,0,`ott`.`amount`) < `q1o`.`amount` + `q2o`.`amount` + `q3o`.`amount` + `q4o`.`amount` + if(`oto`.`amount` is null,0,`oto`.`amount`),1,0) AS `lost_game` from ((((((((((((((((`game` `g` join `team` `t` on(`g`.`away` = `t`.`pkey`)) join `team` `o` on(`g`.`home` = `o`.`pkey`)) join `division` `td` on(`t`.`dvsn` = `td`.`pkey`)) join `conference` `tc` on(`td`.`conf` = `tc`.`pkey`)) join `division` `od` on(`o`.`dvsn` = `od`.`pkey`)) join `conference` `oc` on(`od`.`conf` = `oc`.`pkey`)) left join `score` `q1t` on(`q1t`.`team` = `t`.`pkey` and `q1t`.`quarter` = 1 and `q1t`.`game` = `g`.`pkey`)) left join `score` `q2t` on(`q2t`.`team` = `t`.`pkey` and `q2t`.`quarter` = 2 and `q2t`.`game` = `g`.`pkey`)) left join `score` `q3t` on(`q3t`.`team` = `t`.`pkey` and `q3t`.`quarter` = 3 and `q3t`.`game` = `g`.`pkey`)) left join `score` `q4t` on(`q4t`.`team` = `t`.`pkey` and `q4t`.`quarter` = 4 and `q4t`.`game` = `g`.`pkey`)) left join `score` `ott` on(`ott`.`team` = `t`.`pkey` and `ott`.`quarter` = 5 and `ott`.`game` = `g`.`pkey`)) left join `score` `q1o` on(`q1o`.`team` = `o`.`pkey` and `q1o`.`quarter` = 1 and `q1o`.`game` = `g`.`pkey`)) left join `score` `q2o` on(`q2o`.`team` = `o`.`pkey` and `q2o`.`quarter` = 2 and `q2o`.`game` = `g`.`pkey`)) left join `score` `q3o` on(`q3o`.`team` = `o`.`pkey` and `q3o`.`quarter` = 3 and `q3o`.`game` = `g`.`pkey`)) left join `score` `q4o` on(`q4o`.`team` = `o`.`pkey` and `q4o`.`quarter` = 4 and `q4o`.`game` = `g`.`pkey`)) left join `score` `oto` on(`oto`.`team` = `o`.`pkey` and `oto`.`quarter` = 5 and `oto`.`game` = `g`.`pkey`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Sched49ers`
--

/*!50001 DROP VIEW IF EXISTS `Sched49ers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Sched49ers` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = '49ers' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedBears`
--

/*!50001 DROP VIEW IF EXISTS `SchedBears`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedBears` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Bears' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedBengals`
--

/*!50001 DROP VIEW IF EXISTS `SchedBengals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedBengals` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Bengals' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedBills`
--

/*!50001 DROP VIEW IF EXISTS `SchedBills`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedBills` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Bills' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedBroncos`
--

/*!50001 DROP VIEW IF EXISTS `SchedBroncos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedBroncos` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Broncos' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedBrowns`
--

/*!50001 DROP VIEW IF EXISTS `SchedBrowns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedBrowns` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Browns' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedBuccaneers`
--

/*!50001 DROP VIEW IF EXISTS `SchedBuccaneers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedBuccaneers` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Buccaneers' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedCardinals`
--

/*!50001 DROP VIEW IF EXISTS `SchedCardinals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedCardinals` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Cardinals' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedChargers`
--

/*!50001 DROP VIEW IF EXISTS `SchedChargers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedChargers` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Chargers' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedChiefs`
--

/*!50001 DROP VIEW IF EXISTS `SchedChiefs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedChiefs` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Chiefs' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedColts`
--

/*!50001 DROP VIEW IF EXISTS `SchedColts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedColts` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Colts' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedCommanders`
--

/*!50001 DROP VIEW IF EXISTS `SchedCommanders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedCommanders` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Commanders' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedCowboys`
--

/*!50001 DROP VIEW IF EXISTS `SchedCowboys`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedCowboys` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Cowboys' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedDolphins`
--

/*!50001 DROP VIEW IF EXISTS `SchedDolphins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedDolphins` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Dolphins' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedEagles`
--

/*!50001 DROP VIEW IF EXISTS `SchedEagles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedEagles` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Eagles' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedFalcons`
--

/*!50001 DROP VIEW IF EXISTS `SchedFalcons`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedFalcons` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Falcons' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedGiants`
--

/*!50001 DROP VIEW IF EXISTS `SchedGiants`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedGiants` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Giants' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedJaguars`
--

/*!50001 DROP VIEW IF EXISTS `SchedJaguars`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedJaguars` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Jaguars' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedJets`
--

/*!50001 DROP VIEW IF EXISTS `SchedJets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedJets` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Jets' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedLions`
--

/*!50001 DROP VIEW IF EXISTS `SchedLions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedLions` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Lions' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedPackers`
--

/*!50001 DROP VIEW IF EXISTS `SchedPackers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedPackers` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Packers' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedPanthers`
--

/*!50001 DROP VIEW IF EXISTS `SchedPanthers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedPanthers` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Panthers' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedPatriots`
--

/*!50001 DROP VIEW IF EXISTS `SchedPatriots`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedPatriots` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Patriots' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedRaiders`
--

/*!50001 DROP VIEW IF EXISTS `SchedRaiders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedRaiders` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Raiders' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedRams`
--

/*!50001 DROP VIEW IF EXISTS `SchedRams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedRams` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Rams' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedRavens`
--

/*!50001 DROP VIEW IF EXISTS `SchedRavens`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedRavens` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Ravens' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedSaints`
--

/*!50001 DROP VIEW IF EXISTS `SchedSaints`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedSaints` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Saints' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedSeahawks`
--

/*!50001 DROP VIEW IF EXISTS `SchedSeahawks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedSeahawks` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Seahawks' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedSteelers`
--

/*!50001 DROP VIEW IF EXISTS `SchedSteelers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedSteelers` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Steelers' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedTexans`
--

/*!50001 DROP VIEW IF EXISTS `SchedTexans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedTexans` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Texans' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedTitans`
--

/*!50001 DROP VIEW IF EXISTS `SchedTitans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedTitans` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Titans' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SchedVikings`
--

/*!50001 DROP VIEW IF EXISTS `SchedVikings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SchedVikings` AS select `Schedule`.`week` AS `week`,`Schedule`.`team` AS `team`,`Schedule`.`versus` AS `versus`,`Schedule`.`at_home` AS `at_home`,`Schedule`.`inter_conference` AS `inter_conference`,`Schedule`.`in_division` AS `in_division`,`Schedule`.`won_game` AS `won_game`,`Schedule`.`lost_game` AS `lost_game`,`Schedule`.`pts_for` AS `pts_for`,`Schedule`.`pts_against` AS `pts_against` from `Schedule` where `Schedule`.`team` = 'Vikings' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Schedule`
--

/*!50001 DROP VIEW IF EXISTS `Schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Schedule` AS select `Record`.`week` AS `week`,`Record`.`team` AS `team`,`Record`.`oponent` AS `versus`,if(`Record`.`at_home` = 1,'Yes','') AS `at_home`,if(`Record`.`in_conference` = 1,'','Yes') AS `inter_conference`,if(`Record`.`in_division` = 1,'Yes','') AS `in_division`,if(`Record`.`won_game` is null,'TBD',if(`Record`.`won_game` = 1,'Yes','')) AS `won_game`,if(`Record`.`lost_game` is null,'TBD',if(`Record`.`lost_game` = 1,'Yes','')) AS `lost_game`,if(`Record`.`game_for` is null,'',cast(`Record`.`game_for` as char charset utf8mb3)) AS `pts_for`,if(`Record`.`game_against` is null,'',cast(`Record`.`game_against` as char charset utf8mb3)) AS `pts_against` from `Record` union select `Byes`.`week` AS `week`,`Byes`.`team` AS `team`,'(( BYE ))' AS `versus`,'' AS `at_home`,'' AS `inter_conference`,'' AS `in_division`,'***' AS `won_game`,'***' AS `lost_game`,'***' AS `pts_for`,'***' AS `pts_against` from `Byes` order by `week` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Stats`
--

/*!50001 DROP VIEW IF EXISTS `Stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Stats` AS select `r`.`team_conference` AS `conference`,`r`.`team_division` AS `division`,`r`.`team` AS `team`,count(`r`.`game_for`) AS `played`,sum(`r`.`game_for`) AS `pts_for`,sum(`r`.`game_against`) AS `pts_against`,sum(`r`.`game_net`) AS `pts_net`,sum(`r`.`won_game`) AS `win`,count(`r`.`game_for`) - sum(`r`.`won_game`) AS `lose`,sum(`r`.`won_game`) / count(`r`.`game_for`) AS `pct`,sum(`r`.`in_conference` * `r`.`won_game`) / sum(`r`.`in_conference`) AS `pct_conf`,sum(`r`.`in_division` * `r`.`won_game`) / sum(`r`.`in_division`) AS `pct_div` from `Record` `r` group by `r`.`team_conference`,`r`.`team_division`,`r`.`team` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `StrengthOfSched`
--

/*!50001 DROP VIEW IF EXISTS `StrengthOfSched`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `StrengthOfSched` AS select `r`.`team_conference` AS `conference`,`r`.`team_division` AS `division`,`r`.`team` AS `team`,sum(`s`.`pct`) / count(`s`.`pct`) AS `strength`,`o`.`for` - `o`.`against` AS `op_diff`,`o`.`for` / `o`.`against` AS `op_rat`,`p`.`pct` AS `pct`,`p`.`pct` * (sum(`s`.`pct`) / count(`s`.`pct`)) AS `wpct`,`p`.`pct` * (`o`.`for` / `o`.`against`) AS `wpct2` from (((`Record` `r` join (select `Record`.`team` AS `team`,sum(`Record`.`game_for`) AS `for`,sum(`Record`.`game_against`) AS `against` from `Record` group by `Record`.`team`) `o` on(`o`.`team` = `r`.`team`)) join `Stats` `s` on(`r`.`oponent` = `s`.`team`)) join `Stats` `p` on(`r`.`team` = `p`.`team`)) where `r`.`week` <= (select `settings`.`int_val` from `settings` where `settings`.`name` = 'current_week') group by `r`.`team` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Week01`
--

/*!50001 DROP VIEW IF EXISTS `Week01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Week01` AS select `Record`.`week` AS `week`,`Record`.`team_conference` AS `team_conference`,`Record`.`team_division` AS `team_division`,`Record`.`team` AS `team`,`Record`.`oponent_conference` AS `oponent_conference`,`Record`.`oponent_division` AS `oponent_division`,`Record`.`oponent` AS `oponent`,`Record`.`at_home` AS `at_home`,`Record`.`in_conference` AS `in_conference`,`Record`.`in_division` AS `in_division`,`Record`.`q1_for` AS `q1_for`,`Record`.`q2_for` AS `q2_for`,`Record`.`q3_for` AS `q3_for`,`Record`.`q4_for` AS `q4_for`,`Record`.`ot_for` AS `ot_for`,`Record`.`q1_against` AS `q1_against`,`Record`.`q2_against` AS `q2_against`,`Record`.`q3_against` AS `q3_against`,`Record`.`q4_against` AS `q4_against`,`Record`.`ot_against` AS `ot_against`,`Record`.`q1_net` AS `q1_net`,`Record`.`q2_net` AS `q2_net`,`Record`.`q3_net` AS `q3_net`,`Record`.`q4_net` AS `q4_net`,`Record`.`game_for` AS `game_for`,`Record`.`game_against` AS `game_against`,`Record`.`game_net` AS `game_net`,`Record`.`won_game` AS `won_game` from `Record` where `Record`.`week` <= 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Week02`
--

/*!50001 DROP VIEW IF EXISTS `Week02`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Week02` AS select `Record`.`week` AS `week`,`Record`.`team_conference` AS `team_conference`,`Record`.`team_division` AS `team_division`,`Record`.`team` AS `team`,`Record`.`oponent_conference` AS `oponent_conference`,`Record`.`oponent_division` AS `oponent_division`,`Record`.`oponent` AS `oponent`,`Record`.`at_home` AS `at_home`,`Record`.`in_conference` AS `in_conference`,`Record`.`in_division` AS `in_division`,`Record`.`q1_for` AS `q1_for`,`Record`.`q2_for` AS `q2_for`,`Record`.`q3_for` AS `q3_for`,`Record`.`q4_for` AS `q4_for`,`Record`.`ot_for` AS `ot_for`,`Record`.`q1_against` AS `q1_against`,`Record`.`q2_against` AS `q2_against`,`Record`.`q3_against` AS `q3_against`,`Record`.`q4_against` AS `q4_against`,`Record`.`ot_against` AS `ot_against`,`Record`.`q1_net` AS `q1_net`,`Record`.`q2_net` AS `q2_net`,`Record`.`q3_net` AS `q3_net`,`Record`.`q4_net` AS `q4_net`,`Record`.`game_for` AS `game_for`,`Record`.`game_against` AS `game_against`,`Record`.`game_net` AS `game_net`,`Record`.`won_game` AS `won_game` from `Record` where `Record`.`week` <= 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Week03`
--

/*!50001 DROP VIEW IF EXISTS `Week03`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Week03` AS select `Record`.`week` AS `week`,`Record`.`team_conference` AS `team_conference`,`Record`.`team_division` AS `team_division`,`Record`.`team` AS `team`,`Record`.`oponent_conference` AS `oponent_conference`,`Record`.`oponent_division` AS `oponent_division`,`Record`.`oponent` AS `oponent`,`Record`.`at_home` AS `at_home`,`Record`.`in_conference` AS `in_conference`,`Record`.`in_division` AS `in_division`,`Record`.`q1_for` AS `q1_for`,`Record`.`q2_for` AS `q2_for`,`Record`.`q3_for` AS `q3_for`,`Record`.`q4_for` AS `q4_for`,`Record`.`ot_for` AS `ot_for`,`Record`.`q1_against` AS `q1_against`,`Record`.`q2_against` AS `q2_against`,`Record`.`q3_against` AS `q3_against`,`Record`.`q4_against` AS `q4_against`,`Record`.`ot_against` AS `ot_against`,`Record`.`q1_net` AS `q1_net`,`Record`.`q2_net` AS `q2_net`,`Record`.`q3_net` AS `q3_net`,`Record`.`q4_net` AS `q4_net`,`Record`.`game_for` AS `game_for`,`Record`.`game_against` AS `game_against`,`Record`.`game_net` AS `game_net`,`Record`.`won_game` AS `won_game` from `Record` where `Record`.`week` <= 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Week04`
--

/*!50001 DROP VIEW IF EXISTS `Week04`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Week04` AS select `Record`.`week` AS `week`,`Record`.`team_conference` AS `team_conference`,`Record`.`team_division` AS `team_division`,`Record`.`team` AS `team`,`Record`.`oponent_conference` AS `oponent_conference`,`Record`.`oponent_division` AS `oponent_division`,`Record`.`oponent` AS `oponent`,`Record`.`at_home` AS `at_home`,`Record`.`in_conference` AS `in_conference`,`Record`.`in_division` AS `in_division`,`Record`.`q1_for` AS `q1_for`,`Record`.`q2_for` AS `q2_for`,`Record`.`q3_for` AS `q3_for`,`Record`.`q4_for` AS `q4_for`,`Record`.`ot_for` AS `ot_for`,`Record`.`q1_against` AS `q1_against`,`Record`.`q2_against` AS `q2_against`,`Record`.`q3_against` AS `q3_against`,`Record`.`q4_against` AS `q4_against`,`Record`.`ot_against` AS `ot_against`,`Record`.`q1_net` AS `q1_net`,`Record`.`q2_net` AS `q2_net`,`Record`.`q3_net` AS `q3_net`,`Record`.`q4_net` AS `q4_net`,`Record`.`game_for` AS `game_for`,`Record`.`game_against` AS `game_against`,`Record`.`game_net` AS `game_net`,`Record`.`won_game` AS `won_game` from `Record` where `Record`.`week` <= 4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Week05`
--

/*!50001 DROP VIEW IF EXISTS `Week05`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Week05` AS select `Record`.`week` AS `week`,`Record`.`team_conference` AS `team_conference`,`Record`.`team_division` AS `team_division`,`Record`.`team` AS `team`,`Record`.`oponent_conference` AS `oponent_conference`,`Record`.`oponent_division` AS `oponent_division`,`Record`.`oponent` AS `oponent`,`Record`.`at_home` AS `at_home`,`Record`.`in_conference` AS `in_conference`,`Record`.`in_division` AS `in_division`,`Record`.`q1_for` AS `q1_for`,`Record`.`q2_for` AS `q2_for`,`Record`.`q3_for` AS `q3_for`,`Record`.`q4_for` AS `q4_for`,`Record`.`ot_for` AS `ot_for`,`Record`.`q1_against` AS `q1_against`,`Record`.`q2_against` AS `q2_against`,`Record`.`q3_against` AS `q3_against`,`Record`.`q4_against` AS `q4_against`,`Record`.`ot_against` AS `ot_against`,`Record`.`q1_net` AS `q1_net`,`Record`.`q2_net` AS `q2_net`,`Record`.`q3_net` AS `q3_net`,`Record`.`q4_net` AS `q4_net`,`Record`.`game_for` AS `game_for`,`Record`.`game_against` AS `game_against`,`Record`.`game_net` AS `game_net`,`Record`.`won_game` AS `won_game` from `Record` where `Record`.`week` <= 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Week06`
--

/*!50001 DROP VIEW IF EXISTS `Week06`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Week06` AS select `Record`.`week` AS `week`,`Record`.`team_conference` AS `team_conference`,`Record`.`team_division` AS `team_division`,`Record`.`team` AS `team`,`Record`.`oponent_conference` AS `oponent_conference`,`Record`.`oponent_division` AS `oponent_division`,`Record`.`oponent` AS `oponent`,`Record`.`at_home` AS `at_home`,`Record`.`in_conference` AS `in_conference`,`Record`.`in_division` AS `in_division`,`Record`.`q1_for` AS `q1_for`,`Record`.`q2_for` AS `q2_for`,`Record`.`q3_for` AS `q3_for`,`Record`.`q4_for` AS `q4_for`,`Record`.`ot_for` AS `ot_for`,`Record`.`q1_against` AS `q1_against`,`Record`.`q2_against` AS `q2_against`,`Record`.`q3_against` AS `q3_against`,`Record`.`q4_against` AS `q4_against`,`Record`.`ot_against` AS `ot_against`,`Record`.`q1_net` AS `q1_net`,`Record`.`q2_net` AS `q2_net`,`Record`.`q3_net` AS `q3_net`,`Record`.`q4_net` AS `q4_net`,`Record`.`game_for` AS `game_for`,`Record`.`game_against` AS `game_against`,`Record`.`game_net` AS `game_net`,`Record`.`won_game` AS `won_game` from `Record` where `Record`.`week` <= 6 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Week07`
--

/*!50001 DROP VIEW IF EXISTS `Week07`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Week07` AS select `Record`.`week` AS `week`,`Record`.`team_conference` AS `team_conference`,`Record`.`team_division` AS `team_division`,`Record`.`team` AS `team`,`Record`.`oponent_conference` AS `oponent_conference`,`Record`.`oponent_division` AS `oponent_division`,`Record`.`oponent` AS `oponent`,`Record`.`at_home` AS `at_home`,`Record`.`in_conference` AS `in_conference`,`Record`.`in_division` AS `in_division`,`Record`.`q1_for` AS `q1_for`,`Record`.`q2_for` AS `q2_for`,`Record`.`q3_for` AS `q3_for`,`Record`.`q4_for` AS `q4_for`,`Record`.`ot_for` AS `ot_for`,`Record`.`q1_against` AS `q1_against`,`Record`.`q2_against` AS `q2_against`,`Record`.`q3_against` AS `q3_against`,`Record`.`q4_against` AS `q4_against`,`Record`.`ot_against` AS `ot_against`,`Record`.`q1_net` AS `q1_net`,`Record`.`q2_net` AS `q2_net`,`Record`.`q3_net` AS `q3_net`,`Record`.`q4_net` AS `q4_net`,`Record`.`game_for` AS `game_for`,`Record`.`game_against` AS `game_against`,`Record`.`game_net` AS `game_net`,`Record`.`won_game` AS `won_game` from `Record` where `Record`.`week` <= 7 */;
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
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pbk`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `season` AS select `g`.`week` AS `week`,`a`.`name` AS `visitor`,`h`.`name` AS `host` from ((`game` `g` join `team` `a` on(`a`.`pkey` = `g`.`away`)) join `team` `h` on(`h`.`pkey` = `g`.`home`)) */;
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

-- Dump completed on 2024-11-09  9:39:47
