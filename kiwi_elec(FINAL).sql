CREATE DATABASE  IF NOT EXISTS `kiwi_electronics` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kiwi_electronics`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: kiwi_electronics
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `Cart_ID` int NOT NULL AUTO_INCREMENT,
  `Session` varchar(100) NOT NULL,
  `Account_ID` int NOT NULL,
  `Item_ID` int NOT NULL,
  `Quantity` int NOT NULL DEFAULT '1',
  `Price` decimal(10,0) NOT NULL,
  `Timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Item_Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Cart_ID`,`Session`),
  KEY `Product` (`Item_ID`),
  KEY `User_cart` (`Account_ID`),
  CONSTRAINT `Product` FOREIGN KEY (`Item_ID`) REFERENCES `product` (`Item_ID`),
  CONSTRAINT `User_cart` FOREIGN KEY (`Account_ID`) REFERENCES `user_account` (`Account_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (30,'0929e657-18c6-41a9-8e11-dee75132e4d4',1006,1,1,150,'2023-07-30 12:46:36','kiwiphone3'),(31,'0929e657-18c6-41a9-8e11-dee75132e4d4',1006,1,1,150,'2023-07-30 12:46:37','kiwiphone3'),(32,'0929e657-18c6-41a9-8e11-dee75132e4d4',1006,2,1,200,'2023-07-30 12:46:38','testingProduct'),(33,'0929e657-18c6-41a9-8e11-dee75132e4d4',1006,2,1,200,'2023-07-30 12:46:38','testingProduct'),(34,'96184e9f-9779-43ef-889d-164600ff4074',1006,2,1,200,'2023-07-30 12:52:24','testingProduct'),(35,'96184e9f-9779-43ef-889d-164600ff4074',1006,2,1,200,'2023-07-30 12:52:24','testingProduct'),(36,'96184e9f-9779-43ef-889d-164600ff4074',1006,2,1,200,'2023-07-30 12:52:24','testingProduct'),(37,'7127d86c-bff9-418e-83a4-6c57690805d9',1006,1,1,150,'2023-07-30 12:53:58','kiwiphone3'),(38,'7127d86c-bff9-418e-83a4-6c57690805d9',1006,1,1,150,'2023-07-30 12:53:58','kiwiphone3'),(39,'7127d86c-bff9-418e-83a4-6c57690805d9',1006,1,1,150,'2023-07-30 12:53:58','kiwiphone3'),(40,'fd85a7af-89f2-4268-b8d3-9a5f494942df',1006,2,1,200,'2023-07-30 12:56:45','testingProduct'),(211,'f39c2a90-a9b9-49b8-9960-1637773c64d6',1006,4,1,499,'2023-08-03 00:35:30','Ki-Phone-4'),(212,'f39c2a90-a9b9-49b8-9960-1637773c64d6',1006,4,1,499,'2023-08-03 00:35:31','Ki-Phone-4'),(213,'f39c2a90-a9b9-49b8-9960-1637773c64d6',1006,2,1,499,'2023-08-03 00:47:41','Ki-Phone-2'),(214,'f39c2a90-a9b9-49b8-9960-1637773c64d6',1006,2,1,499,'2023-08-03 00:47:42','Ki-Phone-2'),(215,'6bab76ab-81e8-4aed-bab0-c96cb7cd89d2',1006,4,1,499,'2023-08-03 01:01:52','Ki-Phone-4'),(216,'6bab76ab-81e8-4aed-bab0-c96cb7cd89d2',1006,4,1,499,'2023-08-03 01:01:53','Ki-Phone-4'),(217,'9fb007b6-b6ea-4da6-b675-bf5313b47fe4',1006,3,1,499,'2023-08-03 01:02:05','Ki-Phone-3'),(218,'9fb007b6-b6ea-4da6-b675-bf5313b47fe4',1006,4,1,499,'2023-08-03 01:10:47','Ki-Phone-4'),(219,'9fb007b6-b6ea-4da6-b675-bf5313b47fe4',1006,4,1,499,'2023-08-03 01:10:47','Ki-Phone-4'),(220,'9fb007b6-b6ea-4da6-b675-bf5313b47fe4',1006,2,1,499,'2023-08-03 01:12:59','Ki-Phone-2'),(221,'9fb007b6-b6ea-4da6-b675-bf5313b47fe4',1006,8,1,599,'2023-08-03 01:13:01','Ki-Tablet-4'),(226,'e82f770d-db85-442a-9623-c43b5f38e99a',1006,4,1,499,'2023-08-03 01:42:13','Ki-Phone-4'),(227,'e82f770d-db85-442a-9623-c43b5f38e99a',1006,2,1,499,'2023-08-03 01:42:14','Ki-Phone-2'),(228,'e82f770d-db85-442a-9623-c43b5f38e99a',1006,6,1,599,'2023-08-03 01:42:15','Ki-Tablet-2'),(229,'e82f770d-db85-442a-9623-c43b5f38e99a',1006,1,1,499,'2023-08-03 01:42:16','Ki-Phone-1'),(230,'e82f770d-db85-442a-9623-c43b5f38e99a',1006,2,1,499,'2023-08-03 01:42:17','Ki-Phone-2'),(231,'badc9626-79fa-4a4c-88a7-4c7495d5bf59',1006,4,1,499,'2023-08-03 02:24:22','Ki-Phone-4'),(232,'badc9626-79fa-4a4c-88a7-4c7495d5bf59',1006,4,1,499,'2023-08-03 02:24:22','Ki-Phone-4'),(233,'badc9626-79fa-4a4c-88a7-4c7495d5bf59',1006,10,1,99,'2023-08-03 02:24:24','Ki-Watch-2'),(234,'badc9626-79fa-4a4c-88a7-4c7495d5bf59',1006,10,1,99,'2023-08-03 02:24:24','Ki-Watch-2'),(235,'2fb5b454-49cf-4bcc-bf22-7eaf9f5dabd5',1006,10,1,99,'2023-08-03 02:28:19','Ki-Watch-2'),(236,'2fb5b454-49cf-4bcc-bf22-7eaf9f5dabd5',1006,12,1,99,'2023-08-03 02:28:20','Ki-Watch-4'),(237,'2fb5b454-49cf-4bcc-bf22-7eaf9f5dabd5',1006,12,1,99,'2023-08-03 02:28:22','Ki-Watch-4'),(238,'2fb5b454-49cf-4bcc-bf22-7eaf9f5dabd5',1006,7,1,599,'2023-08-03 02:28:25','Ki-Tablet-3'),(239,'2fb5b454-49cf-4bcc-bf22-7eaf9f5dabd5',1006,2,1,499,'2023-08-03 02:28:27','Ki-Phone-2'),(240,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,4,1,499,'2023-08-03 02:31:50','Ki-Phone-4'),(241,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,12,1,99,'2023-08-03 02:31:51','Ki-Watch-4'),(242,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,12,1,99,'2023-08-03 02:31:53','Ki-Watch-4'),(243,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,12,1,99,'2023-08-03 02:31:54','Ki-Watch-4'),(244,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,2,1,499,'2023-08-03 02:33:08','Ki-Phone-2'),(245,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,2,1,499,'2023-08-03 02:33:09','Ki-Phone-2'),(246,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,2,1,499,'2023-08-03 02:33:09','Ki-Phone-2'),(247,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,2,1,499,'2023-08-03 02:42:09','Ki-Phone-2'),(248,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,1,1,499,'2023-08-03 02:42:09','Ki-Phone-1'),(249,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,1,1,499,'2023-08-03 02:42:09','Ki-Phone-1'),(250,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,1,1,499,'2023-08-03 02:42:10','Ki-Phone-1'),(251,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,3,1,499,'2023-08-03 02:47:47','Ki-Phone-3'),(252,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,2,1,499,'2023-08-03 02:47:51','Ki-Phone-2'),(253,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,2,1,499,'2023-08-03 02:47:51','Ki-Phone-2'),(254,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,1,1,499,'2023-08-03 02:47:52','Ki-Phone-1'),(255,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,4,1,499,'2023-08-03 03:25:11','Ki-Phone-4'),(256,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,5,1,599,'2023-08-03 03:25:12','Ki-Tablet-1'),(257,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,5,1,599,'2023-08-03 03:25:12','Ki-Tablet-1'),(258,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,2,1,499,'2023-08-03 03:26:54','Ki-Phone-2'),(259,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,5,1,599,'2023-08-03 03:26:55','Ki-Tablet-1'),(260,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,4,1,499,'2023-08-03 03:26:56','Ki-Phone-4'),(261,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,4,1,499,'2023-08-03 03:26:56','Ki-Phone-4'),(262,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,2,1,499,'2023-08-03 03:29:05','Ki-Phone-2'),(263,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,1,1,499,'2023-08-03 03:29:06','Ki-Phone-1'),(264,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,1,1,499,'2023-08-03 03:29:06','Ki-Phone-1'),(265,'a1e9dee0-81e7-43bb-8c7c-7616d7472f2c',1006,4,1,499,'2023-08-03 03:29:38','Ki-Phone-4'),(266,'a1e9dee0-81e7-43bb-8c7c-7616d7472f2c',1006,5,1,599,'2023-08-03 03:29:38','Ki-Tablet-1'),(267,'a1e9dee0-81e7-43bb-8c7c-7616d7472f2c',1006,2,1,499,'2023-08-03 03:30:58','Ki-Phone-2'),(268,'a1e9dee0-81e7-43bb-8c7c-7616d7472f2c',1006,1,1,499,'2023-08-03 03:30:59','Ki-Phone-1'),(269,'a1e9dee0-81e7-43bb-8c7c-7616d7472f2c',1006,1,1,499,'2023-08-03 03:30:59','Ki-Phone-1');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_inventory_add` AFTER INSERT ON `cart` FOR EACH ROW begin
update product
set Qty_in_Stock = Qty_in_Stock - NEW.Quantity
where Item_ID = NEW.Item_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_inventory_delete` AFTER DELETE ON `cart` FOR EACH ROW begin
update product
set Qty_in_Stock = Qty_in_Stock + OLD.Quantity
where Item_ID = OLD.Item_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout` (
  `checkout_id` int NOT NULL AUTO_INCREMENT,
  `Session` varchar(100) NOT NULL,
  `account_id` int NOT NULL,
  `cart_total` double NOT NULL,
  `shipping_name` varchar(60) NOT NULL,
  `shipping_street` varchar(100) NOT NULL,
  `shipping_region` varchar(45) NOT NULL,
  `final_total` double NOT NULL,
  PRIMARY KEY (`checkout_id`,`Session`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT INTO `checkout` VALUES (1,'',1006,400,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',433),(2,'',1006,600,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',649.5),(3,'363cb35f-941a-465b-b229-c6211a411ea9',1006,600,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',649.5),(4,'3a946361-9557-4131-a8ab-cba21031b367',1006,600,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',649.5),(5,'e5f31b0d-46e9-4ccf-93a5-eb234dd6c642',1006,1000,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',1082.5),(6,'96124dc0-48f4-4668-acb5-d6b47f32ac09',1006,750,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',811.875),(7,'4d626991-d431-481b-b4ca-0cabfe34d687',1006,900,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',974.25),(8,'35c67894-549f-4cbb-bacf-b890cdd8ad50',1006,850,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',920.125),(9,'2a50c438-f817-456b-9067-d1c2b8543e39',1006,1050,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',1136.625),(10,'36199174-4e85-46d1-8b84-4fa0a1e0f134',1006,850,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',920.125),(11,'7f6ec1ad-719d-404f-8039-568b2ab12a77',1006,400,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',433),(12,'ab07676c-d432-49b7-953a-77051d675c78',1006,700,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',757.75),(13,'ef0750fc-ac0d-4a64-a6a2-722d7fa94355',1006,850,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',920.125),(14,'d7fe5fa2-5aab-4866-90fd-90c74d4a0d72',1006,850,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',920.125),(15,'5d64aae2-1ce7-4cd9-bd3a-956083ee75d0',1006,700,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',757.75),(16,'bcb3b2e2-0b64-4aa8-900f-b6d2fb22f783',1006,550,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',595.38),(17,'bbf89c54-4143-44bf-bfbb-3e15a621336d',1006,750,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',811.88),(18,'340d4858-c12b-452a-af0e-6e71bf60fca9',1006,700,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',757.75),(19,'c0e9cbd2-bd0f-43e7-9145-d7aaf04444f8',1007,3693,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',3997.67),(20,'995ade7b-fba8-419e-95c4-e02be26f0d89',1007,998,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',1080.34),(21,'995ade7b-fba8-419e-95c4-e02be26f0d89',1007,698,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',755.58),(22,'995ade7b-fba8-419e-95c4-e02be26f0d89',1007,998,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',1080.34),(23,'995ade7b-fba8-419e-95c4-e02be26f0d89',1007,797,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',862.75),(24,'995ade7b-fba8-419e-95c4-e02be26f0d89',1007,1596,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',1727.67),(25,'995ade7b-fba8-419e-95c4-e02be26f0d89',1007,1795,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',1943.09),(26,'995ade7b-fba8-419e-95c4-e02be26f0d89',1007,4491,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',4861.51),(27,'995ade7b-fba8-419e-95c4-e02be26f0d89',1007,499,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',540.17),(28,'18169188-7f4f-4034-bb3c-9638a21621a7',1007,1996,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',2160.67),(29,'18169188-7f4f-4034-bb3c-9638a21621a7',1007,2994,'Kevin De Hoyos','Monopoly','Austin, Texas, 78045',3241),(30,'f39c2a90-a9b9-49b8-9960-1637773c64d6',1006,1996,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',2160.67),(31,'6bab76ab-81e8-4aed-bab0-c96cb7cd89d2',1006,998,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',1080.34),(32,'9fb007b6-b6ea-4da6-b675-bf5313b47fe4',1006,1497,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',1620.5),(33,'9fb007b6-b6ea-4da6-b675-bf5313b47fe4',1006,2595,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',2809.09),(34,'e82f770d-db85-442a-9623-c43b5f38e99a',1006,2595,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',2809.09),(35,'badc9626-79fa-4a4c-88a7-4c7495d5bf59',1006,1196,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',1294.67),(36,'badc9626-79fa-4a4c-88a7-4c7495d5bf59',1006,1196,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',1294.67),(37,'2fb5b454-49cf-4bcc-bf22-7eaf9f5dabd5',1006,1395,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',1510.09),(38,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,796,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',861.67),(39,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,2293,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',2482.17),(40,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,2293,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',2482.17),(41,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,4289,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',4642.84),(42,'d6592595-b47d-4bf9-8106-3ad339c1d2c1',1006,6285,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',6803.51),(43,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,1697,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',1837),(44,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,3793,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',4105.92),(45,'37941f64-f3ec-41d3-9ca5-0dfdc076eb55',1006,5290,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',5726.42),(46,'a1e9dee0-81e7-43bb-8c7c-7616d7472f2c',1006,1098,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',1188.58),(47,'a1e9dee0-81e7-43bb-8c7c-7616d7472f2c',1006,2595,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',2809.09),(48,'b60db824-afbf-4baf-85c6-6146119ffa69',1006,0,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',0),(49,'b60db824-afbf-4baf-85c6-6146119ffa69',1006,0,'Meagan Mueller','7777 Cloud Rd','Austin, Texas, 78749',0);
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` varchar(45) NOT NULL,
  `value` int DEFAULT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES ('001',10,'TENOFF'),('002',50,'CHRISTMAS');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Item_ID` int NOT NULL AUTO_INCREMENT,
  `Item_Name` varchar(100) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `Description` text NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Qty_in_Stock` int NOT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Item_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Ki-Phone-1','Phone','Black',499,991,'https://live.staticflickr.com/65535/53074566253_5428038ee9_n.jpg'),(2,'Ki-Phone-2','Phone','Silver',499,985,'https://live.staticflickr.com/65535/53074566253_5428038ee9_n.jpg'),(3,'Ki-Phone-3','Phone','Gold',499,0,'https://live.staticflickr.com/65535/53074566253_5428038ee9_n.jpg'),(4,'Ki-Phone-4','Phone','Green',499,986,'https://live.staticflickr.com/65535/53074566253_5428038ee9_n.jpg'),(5,'Ki-Tablet-1','Tablet','Black',599,996,'https://live.staticflickr.com/65535/53074485985_c5202fddc6_n.jpg'),(6,'Ki-Tablet-2','Tablet','Silver',599,999,'https://live.staticflickr.com/65535/53074485985_c5202fddc6_n.jpg'),(7,'Ki-Tablet-3','Tablet','Gold',599,999,'https://live.staticflickr.com/65535/53074485985_c5202fddc6_n.jpg'),(8,'Ki-Tablet-4','Tablet','Green',599,999,'https://live.staticflickr.com/65535/53074485985_c5202fddc6_n.jpg'),(9,'Ki-Watch-1','Watch','Black',99,0,'https://live.staticflickr.com/65535/53074088021_19f0040d21_n.jpg'),(10,'Ki-Watch-2','Watch','Silver',99,997,'https://live.staticflickr.com/65535/53074088021_19f0040d21_n.jpg'),(11,'Ki-Watch-3','Watch','Gold',99,0,'https://live.staticflickr.com/65535/53074088021_19f0040d21_n.jpg'),(12,'Ki-Watch-4','Watch','Green',99,995,'https://live.staticflickr.com/65535/53074088021_19f0040d21_n.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `Account_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Phone_Number` varchar(20) NOT NULL,
  `Ship_Street` varchar(255) NOT NULL,
  `Ship_City` varchar(100) NOT NULL,
  `Ship_State` varchar(100) NOT NULL,
  `Ship_zip` varchar(20) NOT NULL,
  `Bill_Street` varchar(255) NOT NULL,
  `Bill_City` varchar(100) NOT NULL,
  `Bill_State` varchar(100) NOT NULL,
  `Bill_zip` varchar(20) NOT NULL,
  PRIMARY KEY (`Account_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1000,'John','Saxton','john.saxton@gmail.com','johnsax230','574-732-0384','584 Southhampton Ct.','North Tonawanda','NY','14120','584 Southhampton Ct.','North Tonawanda','NY','14120'),(1001,'Madeline','Pilton','maddy.pilton@gmail.com','maddyPils21','574-678-6512','203 Linda Ct.','Merrick','NY','11566','203 Linda Ct.','Merrick','NY','11566'),(1002,'Marisa','Baruch','marisa.baruch22@gamil.com','maruch3028','981-676-1397','20 Marshall Ave.','Winowa','MN','55987','20 Marshall Ave.','Winowa','MN','55987'),(1003,'Radomil','Andris','radisAndil@gmail.com','Radis3081','623-355-9380','260 Pineknoll Dr.','Webster','NY','14580','260 Pineknoll Dr.','Webster','NY','14580'),(1004,'Alice ','Hadrian','aliceHadrian@gmail.com','AliceH20','943-748-8477','43 Old Ashley Ln.','Kokomo','IN','46901','43 Old Ashley Ln.','Kokomo','IN','46901'),(1005,'Suresh','Killian','surKillian430@gmail.com','Killian06498','252-235-6865','95 East Jennings Ave.','Stevens Point','WI','54481','95 East Jennings Ave.','Stevens Point','WI','54481'),(1006,'Meagan','Mueller','meaganbmueller@gmail.com','rosebud560','5127504252','7777 Cloud Rd','Austin','Texas','78749','7777 Cloud Rd','Austin','Texas','78749'),(1007,'Kevin','De Hoyos','kevindehoyos66066@gmail.com','2135064#Kevin','8302135074','Monopoly','Austin','Texas','78045','Monopoly','Austin','Texas','78045'),(1008,'Kevin','De Hoyos','kevindehoyos66066@gmail.com','2135064#Kevin','8302135074','Monopoly','Austin','Texas','78045','Monopoly','Austin','Texas','78045'),(1009,'Meagan','Mueller','meaganbmueller@gmail.com','rosebud560','5122222222','7777 Cloud Dr','Austin','Tx','78759','7777 Cloud Dr','Austin','Tx','78759');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kiwi_electronics'
--

--
-- Dumping routines for database 'kiwi_electronics'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-03  9:16:08
