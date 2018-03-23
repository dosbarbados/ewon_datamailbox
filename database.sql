-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datamailbox_transactions`
--

DROP TABLE IF EXISTS `datamailbox_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datamailbox_transactions` (
  `account` varchar(55) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datamailbox_transactions`
--

LOCK TABLES `datamailbox_transactions` WRITE;
/*!40000 ALTER TABLE `datamailbox_transactions` DISABLE KEYS */;
INSERT INTO `datamailbox_transactions` VALUES ('elmap',694);
/*!40000 ALTER TABLE `datamailbox_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ewon_list`
--

DROP TABLE IF EXISTS `ewon_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ewon_list` (
  `id` int(11) NOT NULL COMMENT 'Ewon ID from datamailbox',
  `name` varchar(45) DEFAULT NULL COMMENT 'Ewon name',
  `last_sync_utc` timestamp NULL DEFAULT NULL COMMENT 'Last ewon synchronization timestamp in UTC',
  `inserted_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date/time when a row was inserted (local DB time)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ewon_list`
--

LOCK TABLES `ewon_list` WRITE;
/*!40000 ALTER TABLE `ewon_list` DISABLE KEYS */;
INSERT INTO `ewon_list` VALUES (551089,'eWON_6','2018-03-23 18:07:47','2018-03-23 17:42:38');
/*!40000 ALTER TABLE `ewon_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL COMMENT 'Time of sampling',
  `quality` varchar(45) DEFAULT NULL COMMENT 'Quality of data',
  `value` float DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,1,'2018-03-23 18:14:13','ok',1),(2,496092,'2018-03-23 18:14:13','None',1.1),(3,496092,'2018-03-23 18:14:43','None',1.1),(4,496092,'2018-03-23 18:15:13','None',1.1),(5,496092,'2018-03-23 18:15:43','None',1.1),(6,496092,'2018-03-23 18:16:13','None',1.1),(7,496092,'2018-03-23 18:16:43','None',1.1),(8,496092,'2018-03-23 18:17:13','None',1.1),(9,496092,'2018-03-23 18:17:43','None',1.1),(10,496092,'2018-03-23 18:18:13','None',1.1),(11,496092,'2018-03-23 18:18:43','None',1.1),(12,496092,'2018-03-23 18:19:14','None',1.1),(13,496092,'2018-03-23 18:19:43','None',1.1),(14,496092,'2018-03-23 18:20:13','None',1.1),(15,496092,'2018-03-23 18:20:43','None',1.1),(16,496092,'2018-03-23 18:21:13','None',1.1),(17,496092,'2018-03-23 18:21:43','None',1.1),(18,496092,'2018-03-23 18:22:13','None',1.1),(19,496092,'2018-03-23 18:22:43','None',1.1),(20,496092,'2018-03-23 18:23:13','None',1.1),(21,496092,'2018-03-23 18:23:43','None',1.1),(22,496092,'2018-03-23 18:24:13','None',1.1),(23,496092,'2018-03-23 18:24:43','None',1.1),(24,496092,'2018-03-23 18:25:13','None',1.1),(25,496092,'2018-03-23 18:25:43','None',1.1),(26,496092,'2018-03-23 18:26:13','None',1.1),(27,496092,'2018-03-23 18:26:43','None',1.1),(28,496092,'2018-03-23 18:27:13','None',1.1),(29,496092,'2018-03-23 18:27:43','None',1.1),(30,496092,'2018-03-23 18:28:13','None',1.1),(31,496092,'2018-03-23 18:28:43','None',1.1),(32,496092,'2018-03-23 18:29:13','None',1.1),(33,496092,'2018-03-23 18:29:43','None',1.1),(34,496092,'2018-03-23 18:30:13','None',1.1),(35,496092,'2018-03-23 18:30:43','None',1.1),(36,496092,'2018-03-23 18:31:13','None',1.1),(37,496092,'2018-03-23 18:31:43','None',1.1),(38,496092,'2018-03-23 18:32:13','None',1.1),(39,496092,'2018-03-23 18:32:43','None',1.1),(40,496092,'2018-03-23 18:33:13','None',1.1),(41,496092,'2018-03-23 18:33:43','None',1.1),(42,496092,'2018-03-23 18:34:13','None',1.1),(43,496092,'2018-03-23 18:34:43','None',1.1),(44,496092,'2018-03-23 18:35:13','None',1.1),(45,496092,'2018-03-23 18:35:43','None',1.1),(46,496092,'2018-03-23 18:36:13','None',1.1),(47,496092,'2018-03-23 18:36:43','None',1.1),(48,496092,'2018-03-23 18:37:13','None',1.1),(49,496092,'2018-03-23 18:37:43','None',1.1),(50,496092,'2018-03-23 18:38:13','None',1.1),(51,496092,'2018-03-23 18:38:43','None',1.1),(52,496092,'2018-03-23 18:39:13','None',1.1),(53,496092,'2018-03-23 18:39:43','None',1.1),(54,496092,'2018-03-23 18:40:13','None',1.1),(55,496092,'2018-03-23 18:40:43','None',1.1),(56,496092,'2018-03-23 18:41:13','None',1.1),(57,496092,'2018-03-23 18:41:43','None',1.1),(58,496092,'2018-03-23 18:42:13','None',1.1),(59,496092,'2018-03-23 18:42:43','None',1.1),(60,496092,'2018-03-23 18:43:13','None',1.1),(61,496092,'2018-03-23 18:43:43','None',1.1),(62,496659,'2018-03-23 18:49:13','initialGood',6.6),(63,496092,'2018-03-23 18:44:13','None',1.1),(64,496092,'2018-03-23 18:44:43','None',1.1),(65,496092,'2018-03-23 18:45:13','None',1.1),(66,496092,'2018-03-23 18:45:43','None',1.1),(67,496092,'2018-03-23 18:46:13','None',1.1),(68,496092,'2018-03-23 18:46:43','None',1.1),(69,496092,'2018-03-23 18:47:13','None',1.1),(70,496092,'2018-03-23 18:47:43','None',1.1),(71,496092,'2018-03-23 18:48:13','None',1.1),(72,496092,'2018-03-23 18:48:44','None',1.1),(73,496092,'2018-03-23 18:49:13','None',1.1),(74,496659,'2018-03-23 18:49:43','None',6.6),(75,496659,'2018-03-23 18:50:13','None',6.6),(76,496659,'2018-03-23 18:50:43','None',6.6),(77,496659,'2018-03-23 18:51:13','None',6.6),(78,496659,'2018-03-23 18:51:43','None',6.6),(79,496659,'2018-03-23 18:52:13','None',6.6),(80,496092,'2018-03-23 18:49:43','None',1.1),(81,496092,'2018-03-23 18:50:13','None',1.1),(82,496092,'2018-03-23 18:50:43','None',1.1),(83,496092,'2018-03-23 18:51:13','None',1.1),(84,496092,'2018-03-23 18:51:43','None',1.1),(85,496092,'2018-03-23 18:52:13','None',1.1),(86,496659,'2018-03-23 18:52:43','None',6.6),(87,496659,'2018-03-23 18:53:13','None',6.6),(88,496659,'2018-03-23 18:53:43','None',6.6),(89,496659,'2018-03-23 18:54:13','None',6.6),(90,496092,'2018-03-23 18:52:43','None',1.1),(91,496092,'2018-03-23 18:53:13','None',1.1),(92,496092,'2018-03-23 18:53:43','None',1.1),(93,496092,'2018-03-23 18:54:13','None',1.1),(94,496659,'2018-03-23 18:54:43','None',6.6),(95,496659,'2018-03-23 18:55:13','None',6.6),(96,496659,'2018-03-23 18:55:43','None',6.6),(97,496659,'2018-03-23 18:56:13','None',6.6),(98,496659,'2018-03-23 18:56:43','None',6.6),(99,496659,'2018-03-23 18:57:13','None',6.6),(100,496659,'2018-03-23 18:57:43','None',6.6),(101,496659,'2018-03-23 18:58:13','None',6.6),(102,496659,'2018-03-23 18:58:43','None',6.6),(103,496659,'2018-03-23 18:59:13','None',6.6),(104,496659,'2018-03-23 18:59:43','None',6.6),(105,496659,'2018-03-23 19:00:13','None',6.6),(106,496092,'2018-03-23 18:54:43','None',1.1),(107,496092,'2018-03-23 18:55:13','None',1.1),(108,496092,'2018-03-23 18:55:43','None',1.1),(109,496092,'2018-03-23 18:56:13','None',1.1),(110,496092,'2018-03-23 18:56:43','None',1.1),(111,496092,'2018-03-23 18:57:13','None',1.1),(112,496092,'2018-03-23 18:57:43','None',1.1),(113,496092,'2018-03-23 18:58:13','None',1.1),(114,496092,'2018-03-23 18:58:43','None',1.1),(115,496092,'2018-03-23 18:59:13','None',1.1),(116,496092,'2018-03-23 18:59:43','None',1.1),(117,496092,'2018-03-23 19:00:13','None',1.1),(118,496092,'2018-03-23 19:00:43','None',1.1),(119,496092,'2018-03-23 19:01:13','None',1.1),(120,496092,'2018-03-23 19:01:43','None',1.1),(121,496092,'2018-03-23 19:02:13','None',1.1),(122,496092,'2018-03-23 19:02:43','None',1.1),(123,496092,'2018-03-23 19:03:13','None',1.1),(124,496659,'2018-03-23 19:00:43','None',6.6),(125,496659,'2018-03-23 19:01:13','None',6.6),(126,496659,'2018-03-23 19:01:43','None',6.6),(127,496659,'2018-03-23 19:02:13','None',6.6),(128,496659,'2018-03-23 19:02:43','None',6.6),(129,496659,'2018-03-23 19:03:13','None',6.6),(130,496092,'2018-03-23 19:03:43','None',1.1),(131,496092,'2018-03-23 19:04:13','None',1.1),(132,496659,'2018-03-23 19:03:43','None',6.6),(133,496659,'2018-03-23 19:04:13','None',6.6),(134,496659,'2018-03-23 19:04:43','None',6.6),(135,496659,'2018-03-23 19:05:13','None',6.6),(136,496659,'2018-03-23 19:05:43','None',6.6),(137,496659,'2018-03-23 19:06:13','None',6.6),(138,496659,'2018-03-23 19:06:43','None',6.6),(139,496659,'2018-03-23 19:07:13','None',6.6),(140,496659,'2018-03-23 19:07:43','None',6.6),(141,496092,'2018-03-23 19:04:43','None',1.1),(142,496092,'2018-03-23 19:05:13','None',1.1),(143,496092,'2018-03-23 19:05:43','None',1.1),(144,496092,'2018-03-23 19:06:13','None',1.1),(145,496092,'2018-03-23 19:06:43','None',1.1),(146,496092,'2018-03-23 19:07:13','None',1.1),(147,496092,'2018-03-23 19:07:43','None',1.1);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_list`
--

DROP TABLE IF EXISTS `tag_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_list` (
  `id` int(11) NOT NULL,
  `ewon_id` int(11) DEFAULT NULL COMMENT 'ID of parent Ewon',
  `name` varchar(45) DEFAULT NULL COMMENT 'Tag name',
  `type` varchar(45) DEFAULT NULL COMMENT 'Tag type',
  `description` varchar(45) DEFAULT NULL COMMENT 'Tag description',
  `alarm_hint` varchar(45) DEFAULT NULL COMMENT 'Tag alarm hint',
  `ewon_tag_id` varchar(45) DEFAULT NULL COMMENT 'Tag ID inside Ewon',
  `inserted_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_list`
--

LOCK TABLES `tag_list` WRITE;
/*!40000 ALTER TABLE `tag_list` DISABLE KEYS */;
INSERT INTO `tag_list` VALUES (496092,551089,'testVal','Float','','','2','2018-03-23 18:14:13'),(496659,551089,'testVal2','Float','testtest','','3','2018-03-23 18:49:17');
/*!40000 ALTER TABLE `tag_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-23 22:31:32
