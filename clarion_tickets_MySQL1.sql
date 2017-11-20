-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: clarion_concerttickets
-- ------------------------------------------------------
-- Server version	5.6.30-log

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

DROP DATABASE IF EXISTS clarion_concerttickets;

CREATE DATABASE clarion_concerttickets;
USE clarion_concerttickets;

--
-- Table structure for table `concert`
--

DROP TABLE IF EXISTS `concert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concert` (
  `CONCERT_ID` int(11) NOT NULL,
  `CONCERT_GENRE_CODE` char(5) NOT NULL,
  `CRITICS_RATING_CODE` char(5) NOT NULL,
  `CONCERT_TITLE` varchar(100) NOT NULL,
  `ARTIST_FEE_1` decimal(9,2) DEFAULT NULL,
  `ARTIST_FEE_2` decimal(9,2) DEFAULT NULL,
  `SEASON_YEAR` char(4) DEFAULT NULL,
  PRIMARY KEY (`CONCERT_ID`),
  KEY `CRITICS_RATING_CODE` (`CRITICS_RATING_CODE`),
  KEY `IX_CONCERT_GENRE_CONCERT` (`CONCERT_GENRE_CODE`),
  KEY `IX_CONCERT_TITLE` (`CONCERT_TITLE`),
  CONSTRAINT `concert_ibfk_1` FOREIGN KEY (`CONCERT_GENRE_CODE`) REFERENCES `concert_genre` (`CONCERT_GENRE_CODE`),
  CONSTRAINT `concert_ibfk_2` FOREIGN KEY (`CRITICS_RATING_CODE`) REFERENCES `critics_rating` (`CRITICS_RATING_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concert`
--

LOCK TABLES `concert` WRITE;
/*!40000 ALTER TABLE `concert` DISABLE KEYS */;
INSERT INTO `concert` VALUES (1,'Piano','*****','Martha Argerich Plays Chopin',50000.00,10000.00,'2015'),(2,'ViolP','****','Itzhak Perlman--Favorites',50000.00,10000.00,'2014'),(3,'Symph','*****','Chicago Symphony Orchestra',25000.00,5000.00,'2014'),(4,'ViolP','****','Gidon Kremer Plays Mozart',50000.00,10000.00,'2015'),(5,'ViolP','*****','Gloria Strauss--Menuhin Competition Winner',10000.00,2000.00,'2016'),(6,'ViolP','****','Hilary Hahn Plays Bach',25000.00,5000.00,'2014'),(7,'Piano','****','Lang Lang: The Virtuoso',50000.00,10000.00,'2014'),(8,'ViolP','*****','Yo Yo Ma and Anton Bendix--Songs for Life',50000.00,10000.00,'2015'),(9,'ViolP','*****','Anne-Sophie Mutter',50000.00,10000.00,'2013'),(10,'Piano','*****','Martha Argerich--Romantic Moments',50000.00,10000.00,'2013'),(11,'VocaP','***','Jane Bunnell--Brahms Lieder',34000.00,5000.00,'2012'),(12,'Symph','****','Atlanta Symphony:  Love at Midnight',54000.00,25000.00,'2012'),(13,'Symph','****','Leipzig Gewandhaus Orchestra',75000.00,10000.00,'2016'),(14,'Piano','*****','Lang Lang: Brilliant Favorites',50000.00,10000.00,'2016'),(15,'Piano','*****','Seattle Piano Festival Top 3',12000.00,6000.00,'2015'),(16,'Symph','****','Chicago Civic Orchestra',5000.00,1000.00,'2016'),(17,'VocaP','****','Tony Stevenson:  Pavarotti Favorites',25000.00,5000.00,'2014'),(18,'Piano','*****','Tra Nguyen:  Vietnamese Summer ',5000.00,1000.00,'2014'),(19,'ViolP','NR','Indiana State String Competition Winners',1000.00,0.00,'2013'),(20,'Youth','*****','The Wiggles:  Dragon Races',15000.00,2000.00,'2015');
/*!40000 ALTER TABLE `concert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concert_event`
--

DROP TABLE IF EXISTS `concert_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concert_event` (
  `CONCERT_ID` int(11) NOT NULL,
  `TICKET_NUMBER` int(11) NOT NULL,
  `DATE_BOOKED` date NOT NULL,
  `DATE_CANCELLED` date DEFAULT NULL,
  `TICKET_FORMAT` char(1) NOT NULL,
  PRIMARY KEY (`CONCERT_ID`,`TICKET_NUMBER`),
  CONSTRAINT `concert_event_ibfk_1` FOREIGN KEY (`CONCERT_ID`) REFERENCES `concert` (`CONCERT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concert_event`
--

LOCK TABLES `concert_event` WRITE;
/*!40000 ALTER TABLE `concert_event` DISABLE KEYS */;
INSERT INTO `concert_event` VALUES (1,1,'2015-01-01',NULL,'D'),(1,3,'2015-01-12',NULL,'D'),(1,4,'2015-01-12',NULL,'D'),(1,5,'2015-01-12',NULL,'D'),(1,6,'2015-01-13',NULL,'D'),(1,7,'2015-01-14',NULL,'P'),(1,8,'2015-01-15',NULL,'P'),(1,9,'2015-01-16',NULL,'D'),(1,10,'2015-01-17',NULL,'P'),(1,12,'2015-01-13',NULL,'D'),(2,1,'2015-01-10',NULL,'D'),(2,2,'2015-01-01',NULL,'P'),(2,3,'2015-04-15',NULL,'D'),(2,4,'2015-04-16',NULL,'P'),(2,5,'2015-04-15',NULL,'P'),(2,6,'2015-04-21',NULL,'D'),(2,7,'2015-04-21',NULL,'D'),(2,8,'2015-04-21',NULL,'D'),(2,9,'2015-04-22',NULL,'P'),(2,10,'2015-04-22',NULL,'P'),(3,1,'2014-01-01','2014-01-30','D'),(3,2,'2014-02-15',NULL,'D'),(3,3,'2014-02-12',NULL,'D'),(3,4,'2014-02-12',NULL,'D'),(3,5,'2014-02-15',NULL,'D'),(3,6,'2014-02-15',NULL,'D'),(3,7,'2014-02-16',NULL,'P'),(3,8,'2014-02-21',NULL,'P'),(3,9,'2014-02-21',NULL,'D'),(3,10,'2014-02-21',NULL,'D'),(4,1,'2015-02-15',NULL,'D'),(5,1,'2015-02-15',NULL,'D'),(5,2,'2015-02-15',NULL,'P'),(6,1,'2015-02-15',NULL,'D'),(7,1,'2015-02-28',NULL,'D'),(8,1,'2015-02-28','2015-03-15','D'),(9,1,'2015-02-28',NULL,'D'),(10,1,'2015-03-01',NULL,'D'),(10,2,'2015-03-01',NULL,'P'),(11,1,'2015-03-10',NULL,'D'),(12,1,'2015-03-10',NULL,'D'),(13,1,'2015-03-10',NULL,'D'),(14,1,'2015-03-10',NULL,'D'),(14,2,'2015-03-10',NULL,'D'),(15,1,'2015-04-01',NULL,'D'),(16,1,'2015-04-01',NULL,'P'),(17,1,'2015-04-01',NULL,'D'),(18,1,'2015-04-01',NULL,'D'),(19,1,'2015-04-01',NULL,'D'),(20,1,'2015-04-15','2015-04-15','P');
/*!40000 ALTER TABLE `concert_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concert_genre`
--

DROP TABLE IF EXISTS `concert_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concert_genre` (
  `CONCERT_GENRE_CODE` char(5) NOT NULL,
  `CONCERT_GENRE_DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY (`CONCERT_GENRE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concert_genre`
--

LOCK TABLES `concert_genre` WRITE;
/*!40000 ALTER TABLE `concert_genre` DISABLE KEYS */;
INSERT INTO `concert_genre` VALUES ('Piano','Piano Solo'),('POrch','Piano and Orchestra'),('SoloO','Solo Instrument with Orchestra'),('SoloP','Solo Instrument with Piano'),('Symph','Symphony Orchestra'),('ViolO','Violin and Orchestra'),('ViolP','Violin and Piano'),('VocaO','Voice and Orchestra'),('VocaP','Voice and Piano'),('Youth','Young Performers');
/*!40000 ALTER TABLE `concert_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concert_type`
--

DROP TABLE IF EXISTS `concert_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concert_type` (
  `CONCERT_ID` int(11) NOT NULL,
  `TYPE_CODE` char(2) NOT NULL,
  PRIMARY KEY (`CONCERT_ID`,`TYPE_CODE`),
  KEY `IX_LANG_CONCERT_LANG` (`TYPE_CODE`),
  CONSTRAINT `concert_type_ibfk_1` FOREIGN KEY (`TYPE_CODE`) REFERENCES `type` (`TYPE_CODE`),
  CONSTRAINT `concert_type_ibfk_2` FOREIGN KEY (`CONCERT_ID`) REFERENCES `concert` (`CONCERT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concert_type`
--

LOCK TABLES `concert_type` WRITE;
/*!40000 ALTER TABLE `concert_type` DISABLE KEYS */;
INSERT INTO `concert_type` VALUES (1,'ev'),(2,'ev'),(3,'ev'),(4,'ev'),(5,'ev'),(6,'ev'),(7,'ev'),(8,'ev'),(9,'ev'),(10,'ev'),(11,'ev'),(12,'ev'),(13,'ev'),(14,'ev'),(15,'ev'),(16,'ev'),(17,'ev'),(18,'ev'),(19,'ev'),(20,'ev'),(1,'ma'),(9,'ma'),(16,'ma'),(19,'ma'),(2,'pr'),(3,'pr'),(4,'pr'),(5,'pr'),(6,'pr'),(7,'pr'),(8,'pr'),(9,'pr'),(10,'pr'),(11,'pr'),(12,'pr'),(13,'pr'),(15,'pr'),(20,'pr'),(20,'yo');
/*!40000 ALTER TABLE `concert_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `critics_rating`
--

DROP TABLE IF EXISTS `critics_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `critics_rating` (
  `CRITICS_RATING_CODE` char(5) NOT NULL,
  `CRITICS_RATING_DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY (`CRITICS_RATING_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critics_rating`
--

LOCK TABLES `critics_rating` WRITE;
/*!40000 ALTER TABLE `critics_rating` DISABLE KEYS */;
INSERT INTO `critics_rating` VALUES ('*','One Star'),('**','Two Stars'),('***','Three Stars'),('****','Four Stars'),('*****','Five Stars'),('NR','Not Rated');
/*!40000 ALTER TABLE `critics_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_account`
--

DROP TABLE IF EXISTS `customer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_account` (
  `CUSTOMER_ACCOUNT_ID` int(11) NOT NULL,
  `CUSTOMER_HOLD_INDIC` char(1) NOT NULL DEFAULT 'N',
  `DATE_ENROLLED` date NOT NULL,
  `DATE_TERMINATED` date DEFAULT NULL,
  `CUSTOMER_DEPOSIT_AMOUNT` decimal(5,2) DEFAULT NULL,
  `CREDIT_CARD_ON_FILE_INDIC` char(1) NOT NULL,
  `CHILD_SALES_ALLOWED_INDIC` char(1) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account`
--

LOCK TABLES `customer_account` WRITE;
/*!40000 ALTER TABLE `customer_account` DISABLE KEYS */;
INSERT INTO `customer_account` VALUES (1,'N','2012-01-01',NULL,NULL,'N','N'),(2,'N','2012-01-18',NULL,NULL,'N','N'),(3,'N','2012-02-01',NULL,NULL,'Y','N'),(4,'N','2012-02-01',NULL,50.00,'N','Y'),(5,'N','2013-02-01',NULL,50.00,'N','N'),(6,'Y','2013-02-15','2015-03-01',NULL,'Y','N'),(7,'N','2013-02-15',NULL,NULL,'Y','N'),(8,'N','2014-03-01',NULL,NULL,'Y','N'),(9,'Y','2014-03-01',NULL,50.00,'N','N');
/*!40000 ALTER TABLE `customer_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_account_person`
--

DROP TABLE IF EXISTS `customer_account_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_account_person` (
  `CUSTOMER_ACCOUNT_ID` int(11) NOT NULL,
  `PERSON_ID` int(11) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ACCOUNT_ID`,`PERSON_ID`),
  KEY `IX_PERSON_CUSTOMER_ACCT_PERSON` (`PERSON_ID`),
  CONSTRAINT `customer_account_person_ibfk_1` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`),
  CONSTRAINT `customer_account_person_ibfk_2` FOREIGN KEY (`CUSTOMER_ACCOUNT_ID`) REFERENCES `customer_account` (`CUSTOMER_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account_person`
--

LOCK TABLES `customer_account_person` WRITE;
/*!40000 ALTER TABLE `customer_account_person` DISABLE KEYS */;
INSERT INTO `customer_account_person` VALUES (1,1),(2,2),(3,3),(3,4),(4,5),(4,6),(3,7),(4,7),(5,8),(6,9),(7,10),(7,11),(7,12),(8,13),(8,14),(9,15);
/*!40000 ALTER TABLE `customer_account_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_transaction`
--

DROP TABLE IF EXISTS `customer_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_transaction` (
  `TRANSACTION_ID` int(11) NOT NULL,
  `CUSTOMER_ACCOUNT_ID` int(11) NOT NULL,
  `EMPLOYEE_PERSON_ID` int(11) NOT NULL,
  `TRANSACTION_DATE` date NOT NULL,
  `SALES_TAX` decimal(5,2) NOT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `IX_EMPLOYEE_CUSTOMER_TRANS` (`EMPLOYEE_PERSON_ID`),
  KEY `IX_CUST_ACCT_CUST_TRANS` (`CUSTOMER_ACCOUNT_ID`),
  CONSTRAINT `customer_transaction_ibfk_1` FOREIGN KEY (`EMPLOYEE_PERSON_ID`) REFERENCES `employee` (`PERSON_ID`),
  CONSTRAINT `customer_transaction_ibfk_2` FOREIGN KEY (`CUSTOMER_ACCOUNT_ID`) REFERENCES `customer_account` (`CUSTOMER_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_transaction`
--

LOCK TABLES `customer_transaction` WRITE;
/*!40000 ALTER TABLE `customer_transaction` DISABLE KEYS */;
INSERT INTO `customer_transaction` VALUES (1,1,1,'2015-01-05',1.00),(2,1,1,'2015-01-05',2.97),(3,2,2,'2015-01-18',1.50),(4,3,1,'2015-02-01',0.50),(5,4,2,'2015-02-01',1.00),(6,6,2,'2015-02-15',0.50),(7,7,1,'2015-02-15',1.00),(8,7,1,'2015-02-23',1.50),(9,8,10,'2015-03-01',3.51),(10,9,10,'2015-03-01',2.08);
/*!40000 ALTER TABLE `customer_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `PERSON_ID` int(11) NOT NULL,
  `SUPERVISOR_PERSON_ID` int(11) DEFAULT NULL,
  `EMPLOYEE_TAX_ID` varchar(15) NOT NULL,
  `EMPLOYEE_JOB_CATEGORY` char(1) NOT NULL,
  `EMPLOYEE_HOURLY_RATE` decimal(5,2) NOT NULL,
  `HIRE_DATE` date NOT NULL,
  `TERMINATION_DATE` date DEFAULT NULL,
  PRIMARY KEY (`PERSON_ID`),
  KEY `IX_SUPERVISOR_PERSON_ID` (`SUPERVISOR_PERSON_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`SUPERVISOR_PERSON_ID`) REFERENCES `employee` (`PERSON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,NULL,'000-01-1234','M',15.00,'2015-01-01',NULL),(2,1,'000-02-8564','C',9.75,'2015-01-01',NULL),(10,1,'000-57-8385','C',9.75,'2015-03-01',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `PERSON_ID` int(11) NOT NULL,
  `PERSON_FIRST_NAME` varchar(25) NOT NULL,
  `PERSON_MIDDLE_NAME` varchar(25) DEFAULT NULL,
  `PERSON_LAST_NAME` varchar(25) NOT NULL,
  `PERSON_ADDRESS_1` varchar(100) DEFAULT NULL,
  `PERSON_ADDRESS_2` varchar(100) DEFAULT NULL,
  `PERSON_ADDRESS_CITY` varchar(40) DEFAULT NULL,
  `PERSON_ADDRESS_STATE_PROV` char(2) DEFAULT NULL,
  `PERSON_ADDRESS_POSTAL_CODE` varchar(10) DEFAULT NULL,
  `PERSON_ADDRESS_COUNTRY` char(2) DEFAULT NULL,
  `PERSON_PHONE` varchar(15) DEFAULT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `DEATH_DATE` date DEFAULT NULL,
  PRIMARY KEY (`PERSON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Miller','Byron','Alexander','420 Central','Apt. 4A','Paperwork City','CA','94645','US','805-280-2018','1970-07-04',NULL),(2,'Tin','Tang','Chung','3467 Skyline Blvd','Apt. 4583','Oakland','CA','94620','US','230-229-8976','1968-05-05',NULL),(3,'Cassandra','J','Alvarado','553 Elm St.','','Denver','CO','80012','US','836-429-8375','1981-09-27',NULL),(4,'Raul','Ramon','Alvarado','553 Elm St.','','Denver','CO','80012','US','836-429-8375','1983-08-26',NULL),(5,'Klaus','Jurgen','Schmidt','2920 College Drive','Apt. 12','Dayton','OH','45404','US','514-369-0478','1951-06-20',NULL),(6,'Hildegard','C','Schmidt','2920 College Drive','Apt. 12','Dayton','OH','45404','US','514-369-0478','1953-12-15',NULL),(7,'Wolfgang','Jurgen','Schmidt','2920 College Drive','Apt. 12','Dayton','OH','45404','US','514-369-0479','1980-04-16',NULL),(8,'Toshiro','Isuzu','Yamada','720 Geary Blvd.','','San Francisco','CA','94111','US','401-617-7297','1949-03-16','2015-03-30'),(9,'Beverly','Virginia','Baker','748 Highway 63','','Thunder Bay','ON','4WC2RY','CA','705-555-6376','1981-02-28',NULL),(10,'Gerald','M','Bernstein','12940 Wilshire Blvd.','','Los Angeles','CA','90048','US','820-541-8590','1959-08-13',NULL),(11,'Rose','Barbara','Bernstein','12940 Wilshire Blvd.','','Los Angeles','CA','90048','US','820-541-8590','1960-04-16',NULL),(12,'Steven','Isaac','Bernstein','12940 Wilshire Blvd.','','Los Angeles','CA','90048','US','820-541-8590','1994-06-17',NULL),(13,'Linda','Ann','Campos','Box 426','Rural Route 12','Searchlight','NV','89046','US','615-995-1458','1974-11-15',NULL),(14,'Jorge','Luis','Jimenez','Box 426','Rural Route 12','Searchlight','NV','89046','US','615-995-3748','1974-12-21',NULL),(15,'Liyi','F','Huang','228 1st St. NE','','St. Paul','MN','55111','US','708-668-6696','1976-05-14',NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_sales`
--

DROP TABLE IF EXISTS `ticket_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_sales` (
  `CONCERT_ID` int(11) NOT NULL,
  `TICKET_NUMBER` int(11) NOT NULL,
  `TRANSACTION_ID` int(11) NOT NULL,
  `DELIVERY_DATE` date DEFAULT NULL,
  `SALES_FEE` decimal(7,2) DEFAULT NULL,
  `REPLACEMENT_FEE` decimal(5,2) DEFAULT NULL,
  `CONCERT_DATE` date DEFAULT NULL,
  PRIMARY KEY (`CONCERT_ID`,`TICKET_NUMBER`,`TRANSACTION_ID`),
  KEY `IX_CONCERT_CUST_TRANS` (`TRANSACTION_ID`),
  CONSTRAINT `ticket_sales_ibfk_1` FOREIGN KEY (`CONCERT_ID`, `TICKET_NUMBER`) REFERENCES `concert_event` (`CONCERT_ID`, `TICKET_NUMBER`),
  CONSTRAINT `ticket_sales_ibfk_2` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `customer_transaction` (`TRANSACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_sales`
--

LOCK TABLES `ticket_sales` WRITE;
/*!40000 ALTER TABLE `ticket_sales` DISABLE KEYS */;
INSERT INTO `ticket_sales` VALUES (1,1,1,'2015-01-09',6.00,NULL,'2015-01-07'),(1,1,3,'2015-01-22',6.00,NULL,'2015-01-22'),(1,1,4,'2015-02-05',6.00,NULL,'2015-02-04'),(1,1,8,'2015-02-27',6.00,4.00,'2015-03-01'),(2,1,3,'2015-01-22',6.00,NULL,'2015-01-18'),(2,1,5,'2015-02-05',6.00,4.00,'2015-02-08'),(2,2,1,'2015-01-09',6.00,NULL,'2015-01-08'),(2,2,3,'2015-01-22',6.00,NULL,'2015-01-20'),(2,2,8,'2015-02-27',6.00,NULL,NULL),(3,1,2,'2015-01-09',6.00,29.99,'2015-01-30'),(3,2,10,'2015-03-04',6.25,NULL,NULL),(4,1,10,'2015-03-04',6.25,NULL,'2015-03-04'),(5,1,8,'2015-02-27',6.00,NULL,NULL),(5,2,6,'2015-02-19',6.00,NULL,NULL),(6,1,7,'2015-02-19',6.00,NULL,'2015-02-19'),(8,1,9,'2015-03-04',6.25,29.98,'2015-03-15'),(10,1,9,'2015-03-04',6.25,NULL,NULL),(16,1,7,'2015-02-19',6.00,NULL,'2015-02-19'),(17,1,10,'2015-03-04',6.25,NULL,NULL),(18,1,10,'2015-03-04',6.25,NULL,'2015-03-05');
/*!40000 ALTER TABLE `ticket_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `TYPE_CODE` char(2) NOT NULL,
  `TYPE_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES ('bp','Backstage_Pass'),('cp','Competition'),('ev','Evening'),('ma','Matinee'),('pr','Premium'),('ra','Restricted_Audience'),('yo','Youth');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-22  6:06:14
