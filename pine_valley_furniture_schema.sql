-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: pine_valley_furniture
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerid` int NOT NULL AUTO_INCREMENT,
  `customername` varchar(100) DEFAULT NULL,
  `customeraddress` varchar(100) DEFAULT NULL,
  `customerpostalcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Farooque','Jhuddo','KKM Word:02'),(2,'Sajjad','Jhuddo','KKM Word:02'),(3,'Talha','Tando Allayar','AR Word:09'),(4,'Rafy','TMK','MM Word:04'),(5,'Rohit','UK','U Word:03'),(6,'Fakhar','Lahore','LH Word:01'),(7,'Imam','Karachi','KR Word:08'),(8,'Babar','Peshawar','PW Word:11'),(9,'Saim','Multan','ML Word:17'),(10,'Amir','Karachi','KR Word:02');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlineitem`
--

DROP TABLE IF EXISTS `orderlineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlineitem` (
  `orderlineitemid` int NOT NULL AUTO_INCREMENT,
  `orderquantity` int DEFAULT NULL,
  `customerid` int DEFAULT NULL,
  `orderid` int DEFAULT NULL,
  PRIMARY KEY (`orderlineitemid`),
  KEY `customerid` (`customerid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `orderlineitem_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`),
  CONSTRAINT `orderlineitem_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlineitem`
--

LOCK TABLES `orderlineitem` WRITE;
/*!40000 ALTER TABLE `orderlineitem` DISABLE KEYS */;
INSERT INTO `orderlineitem` VALUES (2,1,1,8),(3,3,2,2),(4,4,2,9),(5,5,3,3),(6,10,4,4),(7,11,5,5),(8,10,6,6),(9,20,7,7);
/*!40000 ALTER TABLE `orderlineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `orderdate` date DEFAULT NULL,
  `customerid` int DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'2024-03-21',2),(3,'2024-03-22',3),(4,'2024-03-23',4),(5,'2024-03-24',5),(6,'2024-03-25',6),(7,'2024-03-26',7),(8,'2024-03-27',1),(9,'2024-03-28',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `productdescription` varchar(100) DEFAULT NULL,
  `productfinish` varchar(100) DEFAULT NULL,
  `productstandardprice` decimal(10,0) DEFAULT NULL,
  `productlineid` int DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `productlineid` (`productlineid`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`productlineid`) REFERENCES `productline` (`productlineid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Sofa','Leather',900,1),(2,'Single Bed','Wood',2000,2),(3,'Double Bed','Wood',3000,3),(4,'Dining Table','Glass',1000,4),(6,'Kitchen Kabinet','Stainless Steel',1300,6),(7,'Desk','Metal',200,7),(8,'Chair','Wood',200,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_rawmaterial_vendor_view`
--

DROP TABLE IF EXISTS `product_rawmaterial_vendor_view`;
/*!50001 DROP VIEW IF EXISTS `product_rawmaterial_vendor_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_rawmaterial_vendor_view` AS SELECT 
 1 AS `productid`,
 1 AS `productdescription`,
 1 AS `productfinish`,
 1 AS `productstandardprice`,
 1 AS `materialname`,
 1 AS `materialstandardcost`,
 1 AS `vendorname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productline`
--

DROP TABLE IF EXISTS `productline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productline` (
  `productlineid` int NOT NULL AUTO_INCREMENT,
  `productlinename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`productlineid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productline`
--

LOCK TABLES `productline` WRITE;
/*!40000 ALTER TABLE `productline` DISABLE KEYS */;
INSERT INTO `productline` VALUES (1,'Modern Living Room'),(2,'Cozy Bedroom'),(3,'Elegant Dinning Room'),(4,'Sleek Kitchen'),(5,'Functional Office'),(6,'Relaxing Outdoor'),(7,'ColorFul Kids Room'),(8,'Organized Storage'),(9,'Luxury Bathroom');
/*!40000 ALTER TABLE `productline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterial`
--

DROP TABLE IF EXISTS `rawmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterial` (
  `rawmaterialid` int NOT NULL AUTO_INCREMENT,
  `unitofmeasure` varchar(100) DEFAULT NULL,
  `materialname` varchar(100) DEFAULT NULL,
  `materialstandardcost` decimal(10,0) DEFAULT NULL,
  `productid` int DEFAULT NULL,
  PRIMARY KEY (`rawmaterialid`),
  KEY `productid` (`productid`),
  CONSTRAINT `rawmaterial_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterial`
--

LOCK TABLES `rawmaterial` WRITE;
/*!40000 ALTER TABLE `rawmaterial` DISABLE KEYS */;
INSERT INTO `rawmaterial` VALUES (1,'sq.ft','Leather',15,1),(2,'kg','Wood',11,2),(3,'kg','Wood',11,3),(4,'sq.m','Glass',12,4),(5,'m','Stainless Steel',18,6),(6,'kg','Metal',8,7),(7,'sq.ft','Leather',15,1),(8,'kg','Wood',10,2);
/*!40000 ALTER TABLE `rawmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `supplyid` int NOT NULL AUTO_INCREMENT,
  `supplyunitprice` decimal(10,0) DEFAULT NULL,
  `rawmaterialid` int DEFAULT NULL,
  `vendorid` int DEFAULT NULL,
  PRIMARY KEY (`supplyid`),
  KEY `rawmaterialid` (`rawmaterialid`),
  KEY `vendorid` (`vendorid`),
  CONSTRAINT `supply_ibfk_1` FOREIGN KEY (`rawmaterialid`) REFERENCES `rawmaterial` (`rawmaterialid`),
  CONSTRAINT `supply_ibfk_2` FOREIGN KEY (`vendorid`) REFERENCES `vendor` (`vendorid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES (1,100,1,1),(2,120,2,2),(3,120,3,2),(4,130,4,2),(5,110,5,3),(6,140,6,4),(7,199,7,5);
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usedquantity`
--

DROP TABLE IF EXISTS `usedquantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usedquantity` (
  `usedquantityid` int NOT NULL AUTO_INCREMENT,
  `usedquantity` decimal(10,0) DEFAULT NULL,
  `rawmaterialid` int DEFAULT NULL,
  `productid` int DEFAULT NULL,
  PRIMARY KEY (`usedquantityid`),
  KEY `rawmaterialid` (`rawmaterialid`),
  KEY `productid` (`productid`),
  CONSTRAINT `usedquantity_ibfk_1` FOREIGN KEY (`rawmaterialid`) REFERENCES `rawmaterial` (`rawmaterialid`),
  CONSTRAINT `usedquantity_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usedquantity`
--

LOCK TABLES `usedquantity` WRITE;
/*!40000 ALTER TABLE `usedquantity` DISABLE KEYS */;
INSERT INTO `usedquantity` VALUES (1,10,1,1),(2,12,2,2),(3,9,3,3),(4,8,4,4),(5,3,5,6),(6,2,6,7),(7,4,7,1),(8,11,8,2);
/*!40000 ALTER TABLE `usedquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `vendorid` int NOT NULL AUTO_INCREMENT,
  `vendorname` varchar(100) DEFAULT NULL,
  `vendoraddress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vendorid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Leather Supplier A','123 Main Street karachi'),(2,'Wood Supplier B','456 Fateh Chowk Street Hyderabad'),(3,'Glass Supplier C','789 M.A Street Lahore'),(4,'Stainless Steel Supplier D','101 Pine Street Islamabad'),(5,'Metal Supplier E','202 Maple Street Multan');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `product_rawmaterial_vendor_view`
--

/*!50001 DROP VIEW IF EXISTS `product_rawmaterial_vendor_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_rawmaterial_vendor_view` AS select `product`.`productid` AS `productid`,`product`.`productdescription` AS `productdescription`,`product`.`productfinish` AS `productfinish`,`product`.`productstandardprice` AS `productstandardprice`,`rawmaterial`.`materialname` AS `materialname`,`rawmaterial`.`materialstandardcost` AS `materialstandardcost`,`vendor`.`vendorname` AS `vendorname` from ((((`product` join `usedquantity` on((`product`.`productid` = `usedquantity`.`productid`))) join `rawmaterial` on((`usedquantity`.`rawmaterialid` = `rawmaterial`.`rawmaterialid`))) join `supply` on((`rawmaterial`.`rawmaterialid` = `supply`.`rawmaterialid`))) join `vendor` on((`supply`.`vendorid` = `vendor`.`vendorid`))) */;
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

-- Dump completed on 2024-03-30 23:25:52
