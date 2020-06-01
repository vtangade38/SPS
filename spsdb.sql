-- MySQL dump 10.16  Distrib 10.1.36-MariaDB, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: spsdb
-- ------------------------------------------------------
-- Server version	10.1.36-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `a_username` varchar(50) NOT NULL,
  `a_password` varchar(45) DEFAULT NULL,
  `a_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`a_username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('apurva','123','a@gmail.com'),('vikas','123','v@gmail.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_description` varchar(100) NOT NULL,
  `f_rating` int(10) NOT NULL,
  `f_date` date NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `f_uid_fk` (`u_id`),
  KEY `f_serviceid_fk` (`service_id`),
  CONSTRAINT `f_serviceid_fk` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `f_uid_fk` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (10,'good',4,'2020-10-02',22,5),(11,'bad',1,'2020-10-02',22,5);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `r_area` varchar(45) DEFAULT NULL,
  `r_city` varchar(45) DEFAULT NULL,
  `r_desc` varchar(100) DEFAULT NULL,
  `r_date` date DEFAULT NULL,
  `r_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `r_serviceid_fk` (`service_id`),
  KEY `r_uid_fk` (`u_id`),
  CONSTRAINT `r_serviceid_fk` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `r_uid_fk` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (3,22,5,'pune','pune','reapi','2020-11-22','dgs'),(12,25,9,'pimpri','pune','repare','2020-05-12','complete');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceman`
--

DROP TABLE IF EXISTS `serviceman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceman` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_username` varchar(45) DEFAULT NULL,
  `s_password` varchar(45) DEFAULT NULL,
  `service_type` varchar(45) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `s_name` varchar(45) DEFAULT NULL,
  `s_mobileno` double DEFAULT NULL,
  `s_email` varchar(45) DEFAULT NULL,
  `s_line1` varchar(45) DEFAULT NULL,
  `s_line2` varchar(45) DEFAULT NULL,
  `s_area` varchar(45) DEFAULT NULL,
  `s_city` varchar(45) DEFAULT NULL,
  `s_pincode` int(6) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceman`
--

LOCK TABLES `serviceman` WRITE;
/*!40000 ALTER TABLE `serviceman` DISABLE KEYS */;
INSERT INTO `serviceman` VALUES (20,'vikas','vikas','ac',1,'vikas tangade',8975650076,'a@gmail.com','rahatani','rahatani','pimpri','pune',411017),(36,'apurva','456','salon',5,'Apurva',7845123265,'apurva@gmail.com','sangvi','sabgvi','sangvi','pune',411022);
/*!40000 ALTER TABLE `serviceman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type` varchar(50) DEFAULT NULL,
  `service_desc` varchar(50) DEFAULT NULL,
  `service_image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (5,'ac','ac reapir','ac.jpg'),(9,'mech','mechanical service','mech.jpg'),(10,'salon','salon service','salon.jpg');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_username` varchar(45) DEFAULT NULL,
  `u_password` varchar(45) DEFAULT NULL,
  `u_name` varchar(45) DEFAULT NULL,
  `u_mobileno` double DEFAULT NULL,
  `u_email` varchar(45) DEFAULT NULL,
  `u_line1` varchar(45) DEFAULT NULL,
  `u_line2` varchar(45) DEFAULT NULL,
  `u_area` varchar(45) DEFAULT NULL,
  `u_city` varchar(45) DEFAULT NULL,
  `u_pincode` int(6) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (22,'vikas','123','vikas tangade',8975650076,'@gmail.com','rahatani','rahatani','pimpri','pune',411017),(23,'yogesh','123','vikas tangade',8975650076,'@gmail.com','rahatani','rahatani','pimpri','pune',411017),(24,'pooja','pooja','Pooja Ishwar Patil',9657574151,'poojapatil2604@gmail.com',',Gangapur road','pumping station','pimpri','Nashik',422013),(25,'apurva','apurva','apurva',7378496361,'a@gmail.com','sangvi','sangvi','sangvi','pune',411014),(27,'pooja','123','Pooja Ishwar Pa',9657574151,'poojapatil2604@gmail','Gangapu','Gangapu','pumping station','Nashik',422013),(28,'jayesh','jayesh','Pooja Ishwar Pa',9657574151,'poojapatil2604@gmail','Gangapu','Gangapu','pumping station','Nashik',422013);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-31 14:55:20
