CREATE DATABASE  IF NOT EXISTS `RentalDatabase` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `RentalDatabase`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: RentalDatabase
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `phone` char(25) DEFAULT NULL,
  `email` char(25) NOT NULL,
  `name` char(50) DEFAULT NULL,
  `customer_id` char(10) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerContactRealtor`
--

DROP TABLE IF EXISTS `CustomerContactRealtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerContactRealtor` (
  `customer_id` char(10) NOT NULL,
  `realtor_id` char(10) NOT NULL,
  `date` datetime DEFAULT NULL,
  `contact_message` char(200) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`realtor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerContactRealtor`
--

LOCK TABLES `CustomerContactRealtor` WRITE;
/*!40000 ALTER TABLE `CustomerContactRealtor` DISABLE KEYS */;
INSERT INTO `CustomerContactRealtor` VALUES ('1','2','2017-04-08 00:00:00','Be me shall purse my ought times. Joy years doors all would again rooms these. Solicitude announcing as to sufficient my. No my reached suppose proceed pressed perhaps he. Eagerness it delighted prono'),('2','1','2018-01-02 00:00:00','Started several mistake joy say painful removed reached end. State burst think end are its. Arrived off she elderly beloved him affixed noisier yet. An course regard to up he hardly. View four has sai'),('3','3','2018-03-12 00:00:00','Doubtful two bed way pleasure confined followed. Shew up ye away no eyes life or were this. Perfectly did suspicion daughters but his intention. Started on society an brought it explain. Position two'),('4','4','2016-08-01 00:00:00','\nAttachment apartments in delightful by motionless it no. And now she burst sir learn total. Hearing hearted shewing own ask. Solicitude uncommonly use her motionless not collecting age. The properly'),('5','1','2017-09-01 00:00:00','Luckily friends do ashamed to do suppose. Tried meant mr smile so. Exquisite behaviour as to middleton perfectly. Chicken no wishing waiting am. Say concerns dwelling graceful six humoured. Whether mr'),('6','2','2018-04-13 00:00:00','Real sold my in call. Invitation on an advantages collecting. But event old above shy bed noisy. Had sister see wooded favour income has. Stuff rapid since do as hence. Too insisted ignorant procured');
/*!40000 ALTER TABLE `CustomerContactRealtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feature`
--

DROP TABLE IF EXISTS `Feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feature` (
  `feature_name` char(50) NOT NULL,
  `description` char(50) DEFAULT NULL,
  `property_id` char(10) NOT NULL,
  PRIMARY KEY (`feature_name`,`property_id`),
  KEY `propertyid_idx` (`property_id`),
  CONSTRAINT `propertyid` FOREIGN KEY (`property_id`) REFERENCES `Property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feature`
--

LOCK TABLES `Feature` WRITE;
/*!40000 ALTER TABLE `Feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `Feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ForRent`
--

DROP TABLE IF EXISTS `ForRent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ForRent` (
  `property_id` int(11) NOT NULL,
  `rent` int(11) DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `property_id_UNIQUE` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ForRent`
--

LOCK TABLES `ForRent` WRITE;
/*!40000 ALTER TABLE `ForRent` DISABLE KEYS */;
INSERT INTO `ForRent` VALUES (1,3000),(2,4000),(3,5000);
/*!40000 ALTER TABLE `ForRent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ForSale`
--

DROP TABLE IF EXISTS `ForSale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ForSale` (
  `property_id` char(10) NOT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  CONSTRAINT `ppid` FOREIGN KEY (`property_id`) REFERENCES `Property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ForSale`
--

LOCK TABLES `ForSale` WRITE;
/*!40000 ALTER TABLE `ForSale` DISABLE KEYS */;
/*!40000 ALTER TABLE `ForSale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostalCode`
--

DROP TABLE IF EXISTS `PostalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostalCode` (
  `postal_code` char(7) NOT NULL,
  `city` char(50) DEFAULT NULL,
  `province` char(2) DEFAULT NULL,
  PRIMARY KEY (`postal_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostalCode`
--

LOCK TABLES `PostalCode` WRITE;
/*!40000 ALTER TABLE `PostalCode` DISABLE KEYS */;
INSERT INTO `PostalCode` VALUES ('V5L 3X8','Vancouver','BC'),('V6E 1A3','Vancouver','BC'),('V6K 1N9','Vancouver','BC'),('V6S 1A5','Vancouver','BC'),('V6T 1W6','Vancouver','BC');
/*!40000 ALTER TABLE `PostalCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Property`
--

DROP TABLE IF EXISTS `Property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Property` (
  `property_id` char(10) NOT NULL,
  `realtor_id` char(10) NOT NULL,
  `postal_code` char(7) DEFAULT NULL,
  `type` char(50) DEFAULT NULL,
  `date_built` date DEFAULT NULL,
  `sq_ft` float DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `num_beds` int(11) DEFAULT NULL,
  `num_baths` float DEFAULT NULL,
  `address` char(50) NOT NULL,
  PRIMARY KEY (`property_id`),
  KEY `property1_idx` (`realtor_id`),
  KEY `property2_idx` (`postal_code`),
  CONSTRAINT `property1` FOREIGN KEY (`realtor_id`) REFERENCES `Realtor` (`realtor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `property2` FOREIGN KEY (`postal_code`) REFERENCES `PostalCode` (`postal_code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Property`
--

LOCK TABLES `Property` WRITE;
/*!40000 ALTER TABLE `Property` DISABLE KEYS */;
INSERT INTO `Property` VALUES ('1','1','V6Z 2T7','Apt/Condo','1996-04-21',1100,'2016-05-01',2,2,'1A-139 Drake Street'),('2','1','V6L 3B4','Apt/Condo','1974-09-12',1316,'2013-12-13',2,2,'409-2101 Mcmullen Avenue'),('3','2','V5L 1K3','Townhouse','2018-05-29',1468,'2014-08-29',3,3,'2036 Franklin Street'),('4','3','V6N 1N3','House','2016-12-10',4132,'2018-01-03',6,6,'4928 Blenheim Street'),('5','4','V5L 1K3','Townhouse','1998-07-31',1445,'2015-07-29',3,3,'2034 Franklin Street');
/*!40000 ALTER TABLE `Property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Realtor`
--

DROP TABLE IF EXISTS `Realtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Realtor` (
  `phone` char(25) DEFAULT NULL,
  `email` char(50) NOT NULL,
  `name` char(50) DEFAULT NULL,
  `realtor_id` char(10) NOT NULL,
  `branch_id` char(10) NOT NULL,
  PRIMARY KEY (`realtor_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `branchid_idx` (`branch_id`),
  CONSTRAINT `branchid` FOREIGN KEY (`branch_id`) REFERENCES `RealtyOffice` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Realtor`
--

LOCK TABLES `Realtor` WRITE;
/*!40000 ALTER TABLE `Realtor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Realtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RealtyOffice`
--

DROP TABLE IF EXISTS `RealtyOffice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RealtyOffice` (
  `branch_id` char(10) NOT NULL,
  `branch_name` char(50) DEFAULT NULL,
  `address` char(50) DEFAULT NULL,
  `postal_code` char(50) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `postalcode_idx` (`postal_code`),
  CONSTRAINT `office` FOREIGN KEY (`postal_code`) REFERENCES `PostalCode` (`postal_code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RealtyOffice`
--

LOCK TABLES `RealtyOffice` WRITE;
/*!40000 ALTER TABLE `RealtyOffice` DISABLE KEYS */;
INSERT INTO `RealtyOffice` VALUES ('1','UBC','2166 Western Pkwy, Vancouver, BC','V6T 1W6'),('2','Kits','2201 W 4th Ave, Vancouver,BC','V6K 1N9'),('3','Dunbar','3320 Crown St, Vancouver, BC','V6S 1A5'),('4','Downtown','1032 Alberni Street, Vancouver, BC','V6E 1A3'),('5','UBC',NULL,'V6T 1W6');
/*!40000 ALTER TABLE `RealtyOffice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rented`
--

DROP TABLE IF EXISTS `Rented`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rented` (
  `property_id` char(10) NOT NULL,
  `final_rent` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `customer_id` char(10) NOT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rented`
--

LOCK TABLES `Rented` WRITE;
/*!40000 ALTER TABLE `Rented` DISABLE KEYS */;
INSERT INTO `Rented` VALUES ('2',3800,'2016-04-01','2019-04-01','1'),('3',4900,'2018-01-01','2019-01-01','2');
/*!40000 ALTER TABLE `Rented` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `room_name` char(50) NOT NULL,
  `property_id` char(10) NOT NULL,
  `image_url` text,
  PRIMARY KEY (`room_name`,`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES ('Kitchen','1','data:image/jpeg;base64,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'),('Kitchen','2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSso1UcE5VRN9GqyhTtZybK3ZpPediXIzCqkwBUfntlK0zW6aY'),('Kitchen','3','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTblcJP5w6KW9PdDphNKnKxltwJ4AmtcKDSup_nVYVVDbjq6ykM'),('Kitchen','4','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnek3zfZ1L0Hy2eghfD0bHZ5jk1El9LuQJiiAcvAve1_N-dlhk3g'),('Kitchen','5','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmDjylnGTPDHDPlfrfVfvyF0xK_GmOgek0xCB3lLz1HNQo90T39g'),('Master Bedroom','1','data:image/jpeg;base64,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'),('Master Bedroom','2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpxulVRD44oyqRxKLcLhQSHXg-iqXhQQ8T6JuTT7DAlRaKT_2d'),('Master Bedroom','3','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh9B4f9h8CQIKLdE5UE4OSyZAun-g07MeLFyQ-8HuUVjUUSADh'),('Master Bedroom','4','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO6I31RxNgY5ynvGdLT9wLHcFhTtshi9oMLhhSXb5gEjEwwwWOMQ'),('Master Bedroom','5','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ9cS8HG_bPuUiMlrDzLBFqwNW9gKVXrPQcsvOiGCduRrMgPocsA'),('Master Washroom','1','data:image/jpeg;base64,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'),('Master Washroom','2','data:image/jpeg;base64,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'),('Master Washroom','3','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmsF028vG4phnxHVQ4C1MmQSlRAaq-oSN9U99eTb2pt8B8ak_Ziw'),('Master Washroom','4','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnek3zfZ1L0Hy2eghfD0bHZ5jk1El9LuQJiiAcvAve1_N-dlhk3g'),('Master Washroom','5','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY--XHEe0PUsgh4PFKNYWKIivRcBa7LOIfG1cL2k_UkrmZL_QnxA');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sold`
--

DROP TABLE IF EXISTS `Sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sold` (
  `property_id` char(10) NOT NULL,
  `final_price` int(11) DEFAULT NULL,
  `date_sold` datetime DEFAULT NULL,
  `customer_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  KEY `ccid_idx` (`customer_id`),
  CONSTRAINT `sold1` FOREIGN KEY (`property_id`) REFERENCES `Property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sold2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sold`
--

LOCK TABLES `Sold` WRITE;
/*!40000 ALTER TABLE `Sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sold` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-25 12:59:36
