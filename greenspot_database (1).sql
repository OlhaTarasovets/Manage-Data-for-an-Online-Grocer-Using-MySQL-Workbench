CREATE DATABASE  IF NOT EXISTS `greenspot_new` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `greenspot_new`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: greenspot_new
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` varchar(15) NOT NULL,
  `customerName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('100988',''),('111000',''),('196777',''),('198765',''),('202900',''),('277177','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL,
  `item_id` int NOT NULL,
  `productname` varchar(45) NOT NULL,
  `quantity_on_hand` int NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1000,'Bennet Farm free-range eggs',21,'D12'),(2,1100,'Freshness White beans',41,'a2'),(3,1222,'Freshness Green beans',47,'a3'),(4,1223,'Freshness Green beans',7,'a7'),(5,1224,'Freshness Wax beans',23,'a3'),(6,2000,'Ruby\'s Kale',26,'p12'),(7,2001,'Ruby\'s Organic Kale',7,'po2');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL,
  `productName` varchar(45) NOT NULL,
  `item_type` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1000,'Bennet Farm free-range eggs','Dairy','dozen'),(1100,'Freshness White beans','Canned','12 oz can'),(1222,'Freshness Green beans','Canned','12 oz can'),(1223,'Freshness Green beans','Canned','36 oz can'),(1224,'Freshness Wax beans','Canned','12 oz can'),(2000,'Ruby\'s Kale','Produce','bunch'),(2001,'Ruby\'s Organic Kale','Produce','bunch');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `purchase_id` int NOT NULL,
  `item_id` int NOT NULL,
  `purchase_date` mediumtext NOT NULL,
  `vendorName` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `item_id` (`item_id`) /*!80000 INVISIBLE */,
  KEY `vendorName_idx` (`vendorName`),
  CONSTRAINT `item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `vendorName` FOREIGN KEY (`vendorName`) REFERENCES `vendors` (`vendorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,1000,'2/1/2022','Bennet Farms',25,2.35),(2,1100,'2/2/2022','Freshness Inc.',40,0.69),(3,1222,'2/10/2022','Freshness Inc.',40,0.59),(4,1223,'2/10/2022','Freshness Inc.',10,1.75),(5,1224,'2/10/2022','Freshness Inc.',30,0.65),(7,2000,'2/12/2022','Ruby Redd Produce LLC',25,1.29),(8,2001,'2/12/2022','Ruby Redd Produce LLC',20,2.19),(9,1223,'2/15/2022','Freshness Inc.',10,1.80);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` varchar(10) NOT NULL,
  `item_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `date_sold` mediumtext NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `quantity` int NOT NULL,
  KEY `customer_id` (`customer_id`) /*!80000 INVISIBLE */,
  KEY `item_id_idx` (`item_id`),
  CONSTRAINT `fk_sales_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('00001',1000,5.49,'2/2/2022','198765',2),('00002',1100,1.49,'2/2/2022','202900',2),('00002',2000,3.99,'2/2/2022','202900',2),('00003',1000,5.99,'2/4/2022','196777',2),('00004',1100,1.49,'2/7/2022','198765',8),('00005',1000,5.49,'2/11/2022','277177',4),('00005',1100,1.49,'2/11/2022','277177',4),('00006',1222,1.29,'2/12/2022','111000',12),('00006',1224,1.55,'2/12/2022','111000',8),('00008',1223,3.49,'2/13/2022','198765',5),('00009',2001,6.99,'2/13/2022','100988',1),('00010',2001,6.99,'2/14/2022','202900',12),('00011',2000,3.99,'2/15/2022','111000',2);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `vendor_id` varchar(10) NOT NULL,
  `vendorName` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`vendor_id`,`vendorName`),
  KEY `vendorName` (`vendorName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES ('v001','Bennet Farms','Rt. 17 Evansville, IL 55446'),('v002','Freshness Inc.','202 E. Maple St., St. Joseph, MO 45678'),('v003','Ruby Redd Produce LLC','1212 Milam St., Kenosha, AL 34567');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 17:04:40
