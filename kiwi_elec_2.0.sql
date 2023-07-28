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
  PRIMARY KEY (`Cart_ID`,`Session`),
  KEY `Product` (`Item_ID`),
  KEY `User_cart` (`Account_ID`),
  CONSTRAINT `Product` FOREIGN KEY (`Item_ID`) REFERENCES `product` (`Item_ID`),
  CONSTRAINT `User_cart` FOREIGN KEY (`Account_ID`) REFERENCES `user_account` (`Account_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `Code_ID` int NOT NULL AUTO_INCREMENT,
  `Account_ID` int NOT NULL,
  `Code` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Value` decimal(10,0) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Status` tinyint NOT NULL,
  `Usages` int NOT NULL DEFAULT '999999',
  `Use_ct` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Code_ID`),
  UNIQUE KEY `Unique_Account_Code` (`Account_ID`,`Code`),
  CONSTRAINT `FK_Account_Discount` FOREIGN KEY (`Account_ID`) REFERENCES `user_account` (`Account_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
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
-- Table structure for table `invoice_item_list`
--

DROP TABLE IF EXISTS `invoice_item_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_item_list` (
  `Invoice_item_ID` int NOT NULL AUTO_INCREMENT,
  `Invoice_ID` int NOT NULL,
  `Item_name` varchar(100) NOT NULL,
  `Description` text,
  `Quantity` int NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Subtotal` decimal(10,0) GENERATED ALWAYS AS ((`Quantity` * `Price`)) STORED,
  PRIMARY KEY (`Invoice_item_ID`,`Invoice_ID`),
  KEY `Invoice_ID` (`Invoice_ID`),
  CONSTRAINT `invoice_item_list_ibfk_1` FOREIGN KEY (`Invoice_ID`) REFERENCES `invoice` (`Invoice_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_item_list`
--

LOCK TABLES `invoice_item_list` WRITE;
/*!40000 ALTER TABLE `invoice_item_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_item_list` ENABLE KEYS */;
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
  PRIMARY KEY (`Item_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
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

-- Dump completed on 2023-07-23 19:18:28
