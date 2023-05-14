CREATE DATABASE  IF NOT EXISTS `littlelemondb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `littlelemondb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `table_num` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fkBookings_Customer_idx` (`customer_id`),
  CONSTRAINT `fkBookings_Customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,'2023-05-15',1),(2,2,'2023-05-15',2),(3,1,'2023-05-16',2),(4,3,'2023-05-16',3),(5,4,'2023-05-16',3);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Gail Porter','gail@twitter.com','43767437','Charnwood Way','York','United Kingdom'),(2,'Harry Windsor','harry@meghan.com','34643743','Epsom Grove','Bristol','United Kingdom'),(3,'Jessica Rabbit','jessica@rabbit.com','437437347','Goat Lane','Hull','United Kingdom'),(4,'Kenny Kenn','kenny@msn.com','75484657654','Picturesque Place','Ipswich','United Kingdom'),(5,'Lisa Lettice','lisa@bbc.com','54683465','Lettuce Lane','London','United Kingdom');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `Cuisine` varchar(45) NOT NULL,
  `CourseName` varchar(45) NOT NULL,
  `StarterName` varchar(45) NOT NULL,
  `DessertName` varchar(45) NOT NULL,
  `price` decimal(5,0) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'American','Mega Burger','Fried Onion','Fried Ice Cream',30),(2,'Italian','Pizza','Calamari','Gelato',55),(3,'Indian','Chicken Chaat Puree','Pathia','Jogurt Ice Cream',45),(4,'English','Tasteless Tomatoes','Frozen Fish and Soggy Chips','Fried Mars Bar',100);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `quantity` int NOT NULL,
  `order_dt` datetime NOT NULL,
  `hasPaid` tinyint NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fkOrders_Staff_idx` (`staff_id`),
  KEY `fkOrders_Booking_idx` (`booking_id`),
  KEY `fkOrders_Menu_idx` (`menu_id`),
  CONSTRAINT `fkOrders_Booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`),
  CONSTRAINT `fkOrders_Menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `fkOrders_Staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,3,2,2,'2023-05-15 18:01:00',1),(2,2,4,1,4,'2023-05-15 18:11:00',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `orderStatus_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `order_status` varchar(100) NOT NULL,
  `status_dt` datetime NOT NULL,
  PRIMARY KEY (`orderStatus_id`),
  KEY `fkOrderStatus_Order_idx` (`order_id`),
  CONSTRAINT `fkOrderStatus_Order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,1,'ordered','2023-05-15 18:03:00'),(2,1,'ready to serve','2023-05-15 18:37:00'),(3,2,'ordered','2023-05-15 18:39:00'),(4,1,'served','2023-05-15 18:41:00'),(5,2,'ready to serve','2023-05-15 19:03:00'),(6,1,'paid','2023-05-15 19:05:00'),(7,2,'served','2023-05-15 19:07:00'),(8,2,'compaint','2023-05-15 19:09:00'),(9,2,'complaint resolved','2023-05-15 19:13:00'),(10,2,'paid','2023-05-15 19:33:00');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `role` varchar(45) NOT NULL,
  `salary` decimal(7,0) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Bob Bailey','Owner',100000),(2,'Carol Coathanger','Chef',60000),(3,'Derek Dolittle','Waitor',50000),(4,'Erica Errornous','Waitor',40000),(5,'Frank Frankinstein','Waitor',35000);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-14 20:14:39
