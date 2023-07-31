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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (14,'1099af8c-02bc-4616-8ab2-3696c33dcb8a',1006,1,1,150,'2023-07-29 18:44:15','kiwiphone3'),(15,'1099af8c-02bc-4616-8ab2-3696c33dcb8a',1006,2,1,200,'2023-07-29 18:44:16','testingProduct'),(16,'9f173e68-1a32-45a8-8024-b945b2360b33',1006,2,1,200,'2023-07-29 18:47:05','testingProduct'),(17,'68b1008b-0ff8-49ea-b56f-1cf5039827a6',1006,2,1,200,'2023-07-29 18:59:41','testingProduct'),(18,'68b1008b-0ff8-49ea-b56f-1cf5039827a6',1006,1,1,150,'2023-07-29 18:59:42','kiwiphone3'),(19,'68b1008b-0ff8-49ea-b56f-1cf5039827a6',1006,1,1,150,'2023-07-29 18:59:55','kiwiphone3'),(20,'71cd608d-9f8e-405a-9e23-bdd320c6be87',1006,2,1,200,'2023-07-29 19:30:58','testingProduct'),(21,'71cd608d-9f8e-405a-9e23-bdd320c6be87',1006,1,1,150,'2023-07-29 19:30:59','kiwiphone3'),(22,'71cd608d-9f8e-405a-9e23-bdd320c6be87',1006,1,1,150,'2023-07-29 19:31:14','kiwiphone3'),(23,'0e34603f-6002-4dbe-9293-1003348f490e',1006,2,1,200,'2023-07-29 19:31:25','testingProduct'),(24,'42c9cca0-956f-41b1-b96c-1fd187f724e5',1006,2,1,200,'2023-07-30 12:27:36','testingProduct'),(25,'42c9cca0-956f-41b1-b96c-1fd187f724e5',1006,1,1,150,'2023-07-30 12:27:38','kiwiphone3'),(26,'42c9cca0-956f-41b1-b96c-1fd187f724e5',1006,2,1,200,'2023-07-30 12:27:41','testingProduct'),(27,'42c9cca0-956f-41b1-b96c-1fd187f724e5',1006,1,1,150,'2023-07-30 12:27:42','kiwiphone3'),(28,'87792d5e-39b6-48d9-8dec-0617de7464f4',1006,1,1,150,'2023-07-30 12:28:14','kiwiphone3'),(29,'87792d5e-39b6-48d9-8dec-0617de7464f4',1006,1,1,150,'2023-07-30 12:28:15','kiwiphone3'),(30,'0929e657-18c6-41a9-8e11-dee75132e4d4',1006,1,1,150,'2023-07-30 12:46:36','kiwiphone3'),(31,'0929e657-18c6-41a9-8e11-dee75132e4d4',1006,1,1,150,'2023-07-30 12:46:37','kiwiphone3'),(32,'0929e657-18c6-41a9-8e11-dee75132e4d4',1006,2,1,200,'2023-07-30 12:46:38','testingProduct'),(33,'0929e657-18c6-41a9-8e11-dee75132e4d4',1006,2,1,200,'2023-07-30 12:46:38','testingProduct'),(34,'96184e9f-9779-43ef-889d-164600ff4074',1006,2,1,200,'2023-07-30 12:52:24','testingProduct'),(35,'96184e9f-9779-43ef-889d-164600ff4074',1006,2,1,200,'2023-07-30 12:52:24','testingProduct'),(36,'96184e9f-9779-43ef-889d-164600ff4074',1006,2,1,200,'2023-07-30 12:52:24','testingProduct'),(37,'7127d86c-bff9-418e-83a4-6c57690805d9',1006,1,1,150,'2023-07-30 12:53:58','kiwiphone3'),(38,'7127d86c-bff9-418e-83a4-6c57690805d9',1006,1,1,150,'2023-07-30 12:53:58','kiwiphone3'),(39,'7127d86c-bff9-418e-83a4-6c57690805d9',1006,1,1,150,'2023-07-30 12:53:58','kiwiphone3'),(40,'fd85a7af-89f2-4268-b8d3-9a5f494942df',1006,2,1,200,'2023-07-30 12:56:45','testingProduct'),(41,'fd85a7af-89f2-4268-b8d3-9a5f494942df',1006,2,1,200,'2023-07-30 12:56:45','testingProduct'),(42,'e27dfdd2-ed1d-46c3-b5e2-cd07904fd7ef',1006,2,1,200,'2023-07-30 12:57:16','testingProduct'),(43,'e27dfdd2-ed1d-46c3-b5e2-cd07904fd7ef',1006,2,1,200,'2023-07-30 12:57:16','testingProduct'),(44,'7876eb62-7417-4fee-8f47-c13ca5291cdb',1006,2,1,200,'2023-07-30 13:02:29','testingProduct'),(45,'7876eb62-7417-4fee-8f47-c13ca5291cdb',1006,2,1,200,'2023-07-30 13:02:29','testingProduct'),(46,'6f006fbc-e1ba-4dcc-b166-6bb60435c035',1006,2,1,200,'2023-07-30 13:03:18','testingProduct'),(47,'6f006fbc-e1ba-4dcc-b166-6bb60435c035',1006,2,1,200,'2023-07-30 13:03:18','testingProduct'),(48,'45500b2e-1963-483c-8eae-e3c1535e790e',1006,2,1,200,'2023-07-30 13:07:35','testingProduct'),(49,'45500b2e-1963-483c-8eae-e3c1535e790e',1006,2,1,200,'2023-07-30 13:07:35','testingProduct'),(50,'fd5e897d-85a2-4f16-8e85-c8dadd490aa5',1006,2,1,200,'2023-07-30 13:08:30','testingProduct'),(51,'fd5e897d-85a2-4f16-8e85-c8dadd490aa5',1006,2,1,200,'2023-07-30 13:08:30','testingProduct'),(52,'9a9c624e-087f-4413-aa82-5eb5d04e4da3',1006,1,1,150,'2023-07-30 13:09:05','kiwiphone3'),(53,'9a9c624e-087f-4413-aa82-5eb5d04e4da3',1006,1,1,150,'2023-07-30 13:09:05','kiwiphone3'),(54,'2b4a7a68-9bb8-4ea6-9a65-413993de9d00',1006,2,1,200,'2023-07-30 13:28:45','testingProduct'),(55,'2b4a7a68-9bb8-4ea6-9a65-413993de9d00',1006,1,1,150,'2023-07-30 13:28:47','kiwiphone3'),(56,'73ea2f54-8d29-4d13-975d-28cd350c2c5d',1006,1,1,150,'2023-07-30 13:37:09','kiwiphone3'),(57,'73ea2f54-8d29-4d13-975d-28cd350c2c5d',1006,1,1,150,'2023-07-30 13:37:10','kiwiphone3'),(58,'746972d4-52ad-4bc3-9d31-b4151513a5e6',1006,1,1,150,'2023-07-30 13:40:18','kiwiphone3'),(59,'746972d4-52ad-4bc3-9d31-b4151513a5e6',1006,1,1,150,'2023-07-30 13:40:19','kiwiphone3'),(60,'eee5cc1f-b353-4176-99c0-528c883e8d87',1006,2,1,200,'2023-07-30 13:40:54','testingProduct'),(61,'eee5cc1f-b353-4176-99c0-528c883e8d87',1006,1,1,150,'2023-07-30 13:40:55','kiwiphone3'),(62,'d74ce655-1f1c-4213-8804-9b74f1d7d111',1006,1,1,150,'2023-07-30 13:47:14','kiwiphone3'),(63,'d74ce655-1f1c-4213-8804-9b74f1d7d111',1006,1,1,150,'2023-07-30 13:47:15','kiwiphone3'),(64,'f9ff158e-c187-4914-a375-39c7ffafb810',1006,2,1,200,'2023-07-30 13:48:22','testingProduct'),(65,'f9ff158e-c187-4914-a375-39c7ffafb810',1006,1,1,150,'2023-07-30 13:48:23','kiwiphone3'),(66,'00ff7635-852e-489b-bf0b-b41c316eae9e',1006,1,1,150,'2023-07-30 16:43:28','kiwiphone3'),(67,'00ff7635-852e-489b-bf0b-b41c316eae9e',1006,2,1,200,'2023-07-30 16:43:29','testingProduct'),(68,'48be702d-9fc2-4107-b843-97b15d9ef877',1006,1,1,150,'2023-07-30 18:22:49','kiwiphone3'),(69,'48be702d-9fc2-4107-b843-97b15d9ef877',1006,2,1,200,'2023-07-30 18:22:50','testingProduct'),(70,'fc9b846d-d597-4ea4-8ef1-d3b6f80bb42c',1006,1,1,150,'2023-07-30 18:23:46','kiwiphone3'),(71,'fc9b846d-d597-4ea4-8ef1-d3b6f80bb42c',1006,1,1,150,'2023-07-30 18:23:46','kiwiphone3'),(72,'fd112523-4231-44de-be6f-938b4a05fc2a',1006,2,1,200,'2023-07-30 18:29:22','testingProduct'),(73,'fd112523-4231-44de-be6f-938b4a05fc2a',1006,2,1,200,'2023-07-30 18:29:22','testingProduct'),(74,'4161a12b-c073-42cf-9773-552a5122e5df',1006,2,1,200,'2023-07-30 18:31:29','testingProduct'),(75,'4161a12b-c073-42cf-9773-552a5122e5df',1006,2,1,200,'2023-07-30 18:31:29','testingProduct'),(76,'f1f021bd-5973-493d-9c30-2675e3937c44',1006,2,1,200,'2023-07-30 18:32:13','testingProduct'),(77,'f1f021bd-5973-493d-9c30-2675e3937c44',1006,2,1,200,'2023-07-30 18:32:14','testingProduct'),(78,'ad4d777c-4fbf-44ff-aa8b-4cfa4fa80d3b',1006,2,1,200,'2023-07-30 18:33:15','testingProduct'),(79,'ad4d777c-4fbf-44ff-aa8b-4cfa4fa80d3b',1006,2,1,200,'2023-07-30 18:33:15','testingProduct'),(82,'bbbc41e0-ca44-443b-bf70-ce4ea8d3d9e7',1006,2,1,200,'2023-07-30 18:35:59','testingProduct'),(83,'bbbc41e0-ca44-443b-bf70-ce4ea8d3d9e7',1006,1,1,150,'2023-07-30 18:36:00','kiwiphone3'),(84,'bbbc41e0-ca44-443b-bf70-ce4ea8d3d9e7',1006,1,1,150,'2023-07-30 18:36:00','kiwiphone3'),(85,'bbbc41e0-ca44-443b-bf70-ce4ea8d3d9e7',1006,1,1,150,'2023-07-30 18:36:01','kiwiphone3'),(86,'bbbc41e0-ca44-443b-bf70-ce4ea8d3d9e7',1006,2,1,200,'2023-07-30 18:36:02','testingProduct'),(87,'bbbc41e0-ca44-443b-bf70-ce4ea8d3d9e7',1006,1,1,150,'2023-07-30 18:36:04','kiwiphone3');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT INTO `checkout` VALUES (1,'',1006,400,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',433),(2,'',1006,600,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',649.5),(3,'363cb35f-941a-465b-b229-c6211a411ea9',1006,600,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',649.5),(4,'3a946361-9557-4131-a8ab-cba21031b367',1006,600,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',649.5),(5,'e5f31b0d-46e9-4ccf-93a5-eb234dd6c642',1006,1000,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',1082.5),(6,'96124dc0-48f4-4668-acb5-d6b47f32ac09',1006,750,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',811.875),(7,'4d626991-d431-481b-b4ca-0cabfe34d687',1006,900,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',974.25),(8,'35c67894-549f-4cbb-bacf-b890cdd8ad50',1006,850,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',920.125),(9,'2a50c438-f817-456b-9067-d1c2b8543e39',1006,1050,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',1136.625),(10,'36199174-4e85-46d1-8b84-4fa0a1e0f134',1006,850,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',920.125),(11,'7f6ec1ad-719d-404f-8039-568b2ab12a77',1006,400,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',433),(12,'ab07676c-d432-49b7-953a-77051d675c78',1006,700,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',757.75),(13,'ef0750fc-ac0d-4a64-a6a2-722d7fa94355',1006,850,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',920.125),(14,'d7fe5fa2-5aab-4866-90fd-90c74d4a0d72',1006,850,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',920.125),(15,'5d64aae2-1ce7-4cd9-bd3a-956083ee75d0',1006,700,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',757.75),(16,'bcb3b2e2-0b64-4aa8-900f-b6d2fb22f783',1006,550,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',595.38),(17,'bbf89c54-4143-44bf-bfbb-3e15a621336d',1006,750,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',811.88),(18,'340d4858-c12b-452a-af0e-6e71bf60fca9',1006,700,'Meagan Mueller','7777 Cloud Rd','Austin, Texas 78749',757.75);
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
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `Invoice_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int NOT NULL,
  `Invoice_date` date NOT NULL,
  `Final_Price` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Invoice_ID`,`Customer_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `user_account` (`Account_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
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
  `Availibility` tinyint NOT NULL DEFAULT '1',
  `ImageURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Item_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Ki-Phone-1','Phone','Black',499,1000,0,'https://live.staticflickr.com/65535/53074566253_5428038ee9_n.jpg'),(2,'Ki-Phone-2','Phone','Silver',499,1000,0,'https://live.staticflickr.com/65535/53074566253_5428038ee9_n.jpg'),(3,'Ki-Phone-3','Phone','Gold',499,1000,0,'https://live.staticflickr.com/65535/53074566253_5428038ee9_n.jpg'),(4,'Ki-Phone-4','Phone','Green',499,1000,0,'https://live.staticflickr.com/65535/53074566253_5428038ee9_n.jpg'),(5,'Ki-Tablet-1','Tablet','Black',599,1000,0,'https://live.staticflickr.com/65535/53074485985_c5202fddc6_n.jpg'),(6,'Ki-Tablet-2','Tablet','Silver',599,1000,0,'https://live.staticflickr.com/65535/53074485985_c5202fddc6_n.jpg'),(7,'Ki-Tablet-3','Tablet','Gold',599,1000,0,'https://live.staticflickr.com/65535/53074485985_c5202fddc6_n.jpg'),(8,'Ki-Tablet-4','Tablet','Green',599,1000,0,'https://live.staticflickr.com/65535/53074485985_c5202fddc6_n.jpg'),(9,'Ki-Watch-1','Watch','Black',99,1000,0,'https://live.staticflickr.com/65535/53074088021_19f0040d21_n.jpg'),(10,'Ki-Watch-2','Watch','Silver',99,1000,0,'https://live.staticflickr.com/65535/53074088021_19f0040d21_n.jpg'),(11,'Ki-Watch-3','Watch','Gold',99,1000,0,'https://live.staticflickr.com/65535/53074088021_19f0040d21_n.jpg'),(12,'Ki-Watch-4','Watch','Green',99,1000,0,'https://live.staticflickr.com/65535/53074088021_19f0040d21_n.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1000,'John','Saxton','john.saxton@gmail.com','johnsax230','574-732-0384','584 Southhampton Ct.','North Tonawanda','NY','14120','584 Southhampton Ct.','North Tonawanda','NY','14120'),(1001,'Madeline','Pilton','maddy.pilton@gmail.com','maddyPils21','574-678-6512','203 Linda Ct.','Merrick','NY','11566','203 Linda Ct.','Merrick','NY','11566'),(1002,'Marisa','Baruch','marisa.baruch22@gamil.com','maruch3028','981-676-1397','20 Marshall Ave.','Winowa','MN','55987','20 Marshall Ave.','Winowa','MN','55987'),(1003,'Radomil','Andris','radisAndil@gmail.com','Radis3081','623-355-9380','260 Pineknoll Dr.','Webster','NY','14580','260 Pineknoll Dr.','Webster','NY','14580'),(1004,'Alice ','Hadrian','aliceHadrian@gmail.com','AliceH20','943-748-8477','43 Old Ashley Ln.','Kokomo','IN','46901','43 Old Ashley Ln.','Kokomo','IN','46901'),(1005,'Suresh','Killian','surKillian430@gmail.com','Killian06498','252-235-6865','95 East Jennings Ave.','Stevens Point','WI','54481','95 East Jennings Ave.','Stevens Point','WI','54481'),(1006,'Meagan','Mueller','meaganbmueller@gmail.com','rosebud560','5127504252','7777 Cloud Rd','Austin','Texas','78749','7777 Cloud Rd','Austin','Texas','78749');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-30 22:20:06
