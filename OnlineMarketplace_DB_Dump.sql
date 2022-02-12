-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: hr payroll
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `bank_transfer`
--

DROP TABLE IF EXISTS `bank_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_transfer` (
  `transaction_id` int NOT NULL,
  `bank_account` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`transaction_id`),
  CONSTRAINT `bank_transfer_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_transfer`
--

LOCK TABLES `bank_transfer` WRITE;
/*!40000 ALTER TABLE `bank_transfer` DISABLE KEYS */;
INSERT INTO `bank_transfer` VALUES (2000,'9046204851'),(2001,'2551245643'),(2002,'3986325371'),(2003,'1402594955'),(2004,'8646721938'),(2005,'6562278680'),(2006,'0738251511'),(2007,'5839466544'),(2008,'9532820217'),(2009,'6031775169'),(2010,'9760044937'),(2011,'6436025380'),(2012,'4021867800'),(2013,'8976977493'),(2014,'9215657648'),(2015,'7062982132'),(2016,'1283258040'),(2017,'0219482795'),(2018,'0532596325'),(2019,'2538300012'),(2020,'0002303714'),(2021,'1894336244'),(2022,'0780405000'),(2023,'3322379137'),(2024,'0459479767'),(2025,'7588705568'),(2026,'4383323379'),(2027,'2938828274'),(2028,'3760814679'),(2029,'0712592855');
/*!40000 ALTER TABLE `bank_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Administration'),(2,'Production'),(3,'Marketing'),(4,'Quality control'),(5,'Human resource management'),(6,'Financial'),(7,'Logistic'),(8,'Maid'),(9,'Security'),(10,'Information technology');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `fname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` int NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `national_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `emp_id` int NOT NULL,
  `sf_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dept_id` int DEFAULT NULL,
  `memp_id` int DEFAULT NULL,
  `emp_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dept_id` (`dept_id`),
  KEY `memp_id` (`memp_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`memp_id`) REFERENCES `manager` (`memp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Pattadon','Singhajan','M','0982626327','0977 Lotheville Junction',71199,'psinghajan@gmail.com','Single','8857904091',100,'8870594646','CEO',1,100,'Manager'),('Celie','Tofts','F','0651546785','2 Spaight Hill',79022,'cbagnal0@sogou.com','Married','1272774513',101,'5667186351','Production Manager',2,101,'Manager'),('Sander','Percy','F','0874054678','2 Trailsway Way',63973,'sweippert1@is.gd','Single','0138380113',102,'3583714809','Marketing Manager',3,102,'Manager'),('Jolie','Cazereau','F','0843261801','6374 Lunder Point',39516,'jbalcock2@vistaprint.com','Engaged','0153214578',103,'9802943177','Quality control manager',4,103,'Manager'),('Torey','Nuscher','M','0954622245','524 Atwood Circle',54354,'inwza007@hotmail.com','Single','1485432145',104,'5246842451','Human resource management manager',5,104,'Manager'),('Peder','Devaney','M','0871254325','434 Clemons Avenue',24247,'pgolsby3@creativecommons.org','Single','0728593432',105,'9206611090','Financial manager',6,105,'Manager'),('Dilan','Irons','M','0645879834','454 Lotheville Court',66067,'dgrouenb@youtu.be','Married','8652496905',106,'9770876193','Logistic manager',7,106,'Manager'),('Jamie','Jex','M','0842531457','0808 Bartillon Street',56007,'jmarklewc@opera.com','Married','0298431400',107,'8975126948','Maid head',8,107,'Manager'),('Jamey','List','F','7649206327','3872 Porter Circle',60200,'jcahillaneh@netlog.com','Single','5975904885',108,'8754424371','Security head',9,108,'Manager'),('Kevina','Beadham','F','4397083535','8598 Fieldstone Park',42736,'krandl@state.gov','Married','1772405588',109,'9196646955','Information technology manager',10,109,'Manager'),('Kissee','Vail','F','0642145789','20 Moulton Park',23734,'kforseyp@livejournal.com','Single','7873107407',110,'3466970396','Worker',2,101,'Full-time'),('Selina','Stobe','F','0985462778','25 Moulton Park',23734,'cnealeyb@reddit.con','Single','4582457895',111,'3548452111','Worker',2,101,'Full-time'),('Juliana','Vineall','F','0943245452','2 Independence Plaza',48262,'jbaressq@patch.com','Married','1305257596',112,'0269745973','Analyst',3,102,'Full-time'),('Jamie','Jex','M','0870542548','0808 Bartillon Street',56007,'jmarklewc@opera.com','Engaged','0298431400',113,'8975126948','SNS admin',3,102,'Full-time'),('Jamey','List','M','0846245444','3872 Porter Circle',60200,'jcahillaneh@netlog.com','Single','5975904885',114,'8754424371','Tester',4,103,'Full-time'),('Jamie','Goodacre','M','0942215463','6 Sachtjen Alley',17230,'jbeabyn@desdev.cn','Single','7011481669',115,'0302635069','Advertisement',3,102,'Full-time'),('Kathrine','Priden','F','0800703139','76 Florence Court',56765,'kroadknighte@virginia.edu','Married','9941587091',116,'7772598774','Recruiter',5,104,'Full-time'),('Aksel','Punter','M','0687074515','67 Hanson Avenue',26241,'aheinickef@networksolutions.com','Married','2084218179',117,'1529928852','Evaluator',5,104,'Full-time'),('Vincent','Pecey','M','0874531546','2162 Village Green Court',81418,'vdooguen@toplist.cz','Single','2009587848',118,'5731174426','Accountant',6,105,'Full-time'),('Darb','Stanbro','M','0264848999','7 Dapin Place',8433,'dpopeleyc@cafepress.com','Single','7888148165',119,'7847144872','Auditor',6,105,'Full-time'),('Chrissy','Merigeau','F','0642546655','45429 Merrick Hill',29382,'ckunzelq@upenn.edu','Single','7819899077',120,'8903469997','Driver',7,106,'Full-time'),('Tamas','Seegar','M','0988754621','58300 Redwing Parkway',19519,'tkerwoodh@google.fr','Single','5996086195',121,'1886343378','Driver',7,106,'Full-time'),('Nayika','Srinean','F','0954553222','7 Hovde Junction',68008,'nhullerj@springer.com','Married','8407245264',122,'7793209970','Secretary',1,100,'Full-time'),('Nathanil','Sammon','F','0624554678','96 Mendota Hill',32190,'nlangel@boston.com','Married','1441374404',123,'6365099423','Maid',8,107,'Full-time'),('Myrah','McIlory','F','0845512453','0 Browning Parkway',57836,'mizaksont@alexa.com','Single','7656736436',124,'6737397653','Security guard',9,108,'Full-time'),('Tiertza','Morcom','F','0994562144','9 Dryden Circle',97231,'tleylandi@altervista.org','Single','0442627055',125,'4063786555','Security guard',9,108,'Full-time'),('Sal','Leaburn','M','0901001200','0 Birchwood Street',19719,'sboyn2@wsj.com','Married','0613044799',126,'7668975736','Front end dev',10,109,'Full-time'),('Roldan','Phant','M','0945335465','71 Fairfield Road',22934,'rflockhartd@vinaora.com','Married','3601633783',127,'6291925310','back end dev',10,109,'Full-time'),('Tammy','Micklewright','F','0872215465','3554 Dunning Pass',25551,'tstallybrass8@flavors.me','Single','5561284371',128,'4483976879','Full stack dev',10,109,'Full-time'),('Cloe','Hickinbottom','M','0645524764','0597 Transport Lane',81479,'cbuiem@mac.com','Single','2919103372',129,'5517331675','Senior dev',10,109,'Full-time');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `full-time`
--

DROP TABLE IF EXISTS `full-time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `full-time` (
  `femp_id` int NOT NULL,
  `date_start` date DEFAULT NULL,
  PRIMARY KEY (`femp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `full-time`
--

LOCK TABLES `full-time` WRITE;
/*!40000 ALTER TABLE `full-time` DISABLE KEYS */;
INSERT INTO `full-time` VALUES (110,'2020-07-08'),(111,'2020-05-08'),(112,'2005-07-08'),(113,'2018-07-08'),(114,'2016-07-08'),(115,'2012-06-04'),(116,'2015-07-08'),(117,'2020-07-08'),(118,'2020-09-09'),(119,'2014-02-01'),(120,'2020-07-08'),(121,'2020-07-08'),(122,'2015-05-25'),(123,'2020-07-08'),(124,'2015-07-24'),(125,'2020-07-08'),(126,'2020-07-08'),(127,'2020-07-08'),(128,'2012-02-08'),(129,'2020-07-24');
/*!40000 ALTER TABLE `full-time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` int NOT NULL,
  `Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `peroid_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `memp_id` int NOT NULL,
  `emp_id` int NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `memp_id` (`memp_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`memp_id`) REFERENCES `manager` (`memp_id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1002,NULL,'2020-05-08','Daily',105,101),(1003,'Bonus','2020-02-17','Weekly',105,102),(1004,'Bonus','2020-11-15','Weekly',105,103),(1005,'OT','2020-02-07','Daily',105,104),(1006,'OT','2020-05-04','Daily',105,105),(1007,NULL,'2020-07-27','Monthly',105,106),(1008,NULL,'2019-12-03','Monthly',105,107),(1009,NULL,'2020-06-18','Monthly',105,108),(1010,'Bonus','2020-01-03','Monthly',105,110),(1012,'Bonus','2020-12-02','Monthly',105,111),(1013,NULL,'2020-01-17','Monthly',105,112),(1014,NULL,'2020-05-11','Monthly',105,113),(1015,'Bonus','2020-03-02','Monthly',105,114),(1016,NULL,'2020-04-20','Monthly',105,115),(1017,NULL,'2020-05-05','Monthly',105,116),(1018,'Bonus','2020-01-10','Monthly',105,117),(1019,NULL,'2020-05-24','Monthly',105,118),(1020,'Vivamus in felis eu sapien cursus vestibulum. ','2020-03-23','Monthly',105,119),(1021,'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.','2020-07-20','Monthly',105,120),(1022,NULL,'2020-09-24','Daily',105,121),(1023,NULL,'2020-08-22','Monthly',105,122),(1024,'Bonus','2020-07-08','Monthly',105,123),(1025,NULL,'2020-10-15','Monthly',105,124),(1026,'Bonus','2020-02-23','1',105,125),(1027,NULL,'2020-11-01','Monthly',105,126),(1028,'Bonus','2020-09-16','Monthly',105,127),(1029,NULL,'2020-04-10','Monthly',105,128),(1030,NULL,'2020-06-18','Monthly',105,129),(1094,'In hac habitasse platea dictumst.','2020-07-08','Daily',105,100),(1099,'Bonus','2020-07-12','Monthly',105,109);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_form`
--

DROP TABLE IF EXISTS `leave_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_form` (
  `record_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `emp_id` int NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `leave_form_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `record` (`record_id`),
  CONSTRAINT `leave_form_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_form`
--

LOCK TABLES `leave_form` WRITE;
/*!40000 ALTER TABLE `leave_form` DISABLE KEYS */;
INSERT INTO `leave_form` VALUES (3010,'Annual leave','2020-09-16','2021-01-05',119),(3011,'Parental leave','2020-09-03','2021-01-10',122),(3012,'Annual leave','2020-09-10','2021-01-06',113),(3013,'Annual leave','2020-11-08','2021-01-06',102),(3014,'Annual leave','2020-04-04','2021-01-07',108),(3015,'Long service leave','2020-11-22','2021-01-09',120),(3016,'Annual leave','2020-01-21','2021-01-05',122),(3017,'Parental leave','2020-09-08','2021-01-07',129),(3018,'Annual leave','2020-06-03','2021-01-09',120),(3019,'Annual leave','2020-09-08','2021-01-07',110),(3020,'Annual leave','2021-09-10','2021-11-29',114),(3021,'Annual leave','2019-12-26','2021-10-07',117),(3022,'Parental leave','2020-11-26','2020-04-27',105),(3023,'Long leave','2020-06-09','2021-11-25',100),(3024,'Annual leave','2019-12-19','2021-05-18',104),(3025,'Annual leave','2021-04-26','2019-12-09',101),(3026,'Annual leave','2021-04-30','2021-06-17',103),(3027,'Annual leave','2021-06-17','2020-06-09',124),(3028,'Annual leave','2020-08-29','2020-11-01',109),(3029,'Annual leave','2020-07-29','2020-05-10',108);
/*!40000 ALTER TABLE `leave_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `memp_id` int NOT NULL,
  `dept_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`memp_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`memp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (100,1,'2019-02-01'),(101,2,'2019-02-01'),(102,3,'2019-02-01'),(103,4,'2019-02-01'),(104,5,'2019-02-01'),(105,6,'2019-02-01'),(106,7,'2019-02-01'),(107,8,'2019-02-01'),(108,9,'2019-02-01'),(109,10,'2019-02-01');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `record_id` int NOT NULL,
  `date` date NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rec_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (3000,'2020-01-17',NULL,'violation_rec'),(3001,'2020-04-06',NULL,'violation_rec'),(3002,'2020-11-25','Smoking in office','violation_rec'),(3003,'2020-08-06','Punch his manager','violation_rec'),(3004,'2020-06-02',NULL,'violation_rec'),(3005,'2020-11-05','forgot to turn off the light','violation_rec'),(3006,'2020-08-12','Break office\'s mirror','violation_rec'),(3007,'2020-08-13','Sleep in worktime','violation_rec'),(3008,'2020-09-04','Sleep','violation_rec'),(3009,'2020-05-16','Too bad','violation_rec'),(3010,'2020-04-28',NULL,'leave_form'),(3011,'2020-09-18',NULL,'leave_form'),(3012,'2020-06-28','For my family vacation','leave_form'),(3013,'2020-09-24',NULL,'leave_form'),(3014,'2020-04-13',NULL,'leave_form'),(3015,'2020-08-15','Family dinner','leave_form'),(3016,'2020-02-06',NULL,'leave_form'),(3017,'2020-05-12',NULL,'leave_form'),(3018,'2020-03-27','I need to sleep','leave_form'),(3019,'2020-06-17',NULL,'leave_form'),(3020,'2020-01-10',NULL,'leave_form'),(3021,'2020-08-22','for full moon party','leave_form'),(3022,'2020-10-06',NULL,'leave_form'),(3023,'2020-12-21',NULL,'leave_form'),(3024,'2020-02-03',NULL,'leave_form'),(3025,'2020-09-21',NULL,'leave_form'),(3026,'2020-10-23',NULL,'leave_form'),(3027,'2020-12-09','Game release','leave_form'),(3028,'2020-04-02',NULL,'leave_form'),(3029,'2020-12-10',NULL,'leave_form');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timecard`
--

DROP TABLE IF EXISTS `timecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timecard` (
  `Timestamp` int NOT NULL,
  `date` date DEFAULT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `break_hrs` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  PRIMARY KEY (`Timestamp`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `timecard_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timecard`
--

LOCK TABLES `timecard` WRITE;
/*!40000 ALTER TABLE `timecard` DISABLE KEYS */;
/*!40000 ALTER TABLE `timecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL,
  `Datetime` date NOT NULL,
  `trans_type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `memp_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `memp_id` (`memp_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`memp_id`) REFERENCES `manager` (`memp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (2000,'2015-05-22','Bank_transfer',105),(2001,'2021-05-10','Bank_transfer',105),(2002,'2021-09-14','Bank_transfer',105),(2003,'2021-01-08','Bank_transfer',105),(2004,'2021-02-01','Bank_transfer',105),(2005,'2020-08-23','Bank_transfer',105),(2006,'2020-11-20','Bank_transfer',105),(2007,'2021-11-16','Bank_transfer',105),(2008,'2021-11-19','Bank_transfer',105),(2009,'2020-03-20','Bank_transfer',105),(2010,'2020-07-08','Bank_transfer',105),(2011,'2020-08-06','Bank_transfer',105),(2012,'2021-07-02','Bank_transfer',105),(2013,'2020-08-21','Bank_transfer',105),(2014,'2020-06-14','Bank_transfer',105),(2015,'2020-02-28','Bank_transfer',105),(2016,'2020-12-12','Bank_transfer',105),(2017,'2020-04-12','Bank_transfer',105),(2018,'2020-07-14','Bank_transfer',105),(2019,'2020-09-09','Bank_transfer',105),(2020,'2021-09-27','Bank_transfer',105),(2021,'2020-09-04','Bank_transfer',105),(2022,'2020-09-25','Bank_transfer',105),(2023,'2019-12-11','Bank_transfer',105),(2024,'2020-09-11','Bank_transfer',105),(2025,'2020-12-11','Bank_transfer',105),(2026,'2020-08-07','Bank_transfer',105),(2027,'2021-04-20','Bank_transfer',105),(2028,'2020-07-31','Bank_transfer',105),(2029,'2021-08-26','Bank_transfer',105),(2030,'2012-04-05','Bank_transfer',105),(2031,'2011-01-10','Bank_transfer',105);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violation_rec`
--

DROP TABLE IF EXISTS `violation_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `violation_rec` (
  `record_id` int NOT NULL,
  `penalty` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memp_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `memp_id` (`memp_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `violation_rec_ibfk_1` FOREIGN KEY (`memp_id`) REFERENCES `manager` (`memp_id`),
  CONSTRAINT `violation_rec_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `violation_rec_ibfk_3` FOREIGN KEY (`record_id`) REFERENCES `record` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violation_rec`
--

LOCK TABLES `violation_rec` WRITE;
/*!40000 ALTER TABLE `violation_rec` DISABLE KEYS */;
INSERT INTO `violation_rec` VALUES (3000,'Salary deduction',102,112),(3001,'Salary deduction',102,113),(3002,'Suspension',107,123),(3003,'Salary deduction',107,123),(3004,'Suspension',109,129),(3005,'Salary deduction',109,127),(3006,'Salary deduction',103,114),(3007,'Salary deduction',106,121),(3008,'Suspension',102,115),(3009,'Salary deduction',101,111);
/*!40000 ALTER TABLE `violation_rec` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-06 16:11:26
