-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	8.0.3-rc-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema seva_final
--

CREATE DATABASE IF NOT EXISTS seva_final;
USE seva_final;

--
-- Definition of table `annual_maintenance`
--

DROP TABLE IF EXISTS `annual_maintenance`;
CREATE TABLE `annual_maintenance` (
  `receipt_no` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) DEFAULT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `upload_document` blob,
  `campaign_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`receipt_no`),
  KEY `payment_id` (`payment_id`),
  KEY `project_category_id` (`project_category_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `campaign_id` (`campaign_id`),
  CONSTRAINT `annual_maintenance_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_master` (`payment_id`),
  CONSTRAINT `annual_maintenance_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `annual_maintenance_ibfk_3` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`),
  CONSTRAINT `annual_maintenance_ibfk_4` FOREIGN KEY (`sub_type_id`) REFERENCES `maintenance_sub_type` (`sub_type_id`),
  CONSTRAINT `annual_maintenance_ibfk_5` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `annual_maintenance`
--

/*!40000 ALTER TABLE `annual_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `annual_maintenance` ENABLE KEYS */;


--
-- Definition of table `building_donor`
--

DROP TABLE IF EXISTS `building_donor`;
CREATE TABLE `building_donor` (
  `receipt_code` int(30) NOT NULL,
  `country_code` int(11) DEFAULT NULL,
  `state_code` int(11) DEFAULT NULL,
  `donor_type` int(11) DEFAULT NULL,
  `donor_code` varchar(10) NOT NULL,
  `campaign_code` int(11) DEFAULT NULL,
  `payment_mode_code` varchar(3) DEFAULT NULL,
  `project_category_code` varchar(3) DEFAULT NULL,
  `maintenance_type_code` varchar(6) DEFAULT NULL,
  `maintenance_sub_type_code` varchar(6) DEFAULT NULL,
  `today_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `cheque_no` varchar(30) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank_name` varchar(150) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `full_building` varchar(80) DEFAULT NULL,
  `ground_floor` varchar(80) DEFAULT NULL,
  `first_floor` varchar(80) DEFAULT NULL,
  `second_floor` varchar(80) DEFAULT NULL,
  `third_floor` varchar(80) DEFAULT NULL,
  `location` varchar(80) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `year_of_construction` varchar(12) DEFAULT NULL,
  `year_of_completion` varchar(12) DEFAULT NULL,
  `upload_photograph` blob,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`receipt_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `donor_code` (`donor_code`),
  KEY `campaign_code` (`campaign_code`),
  KEY `payment_mode_code` (`payment_mode_code`),
  KEY `project_category_code` (`project_category_code`),
  KEY `maintenance_type_code` (`maintenance_type_code`),
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`),
  CONSTRAINT `building_donor_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `building_donor_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  CONSTRAINT `building_donor_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  CONSTRAINT `building_donor_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  CONSTRAINT `building_donor_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  CONSTRAINT `building_donor_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  CONSTRAINT `building_donor_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  CONSTRAINT `building_donor_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building_donor`
--

/*!40000 ALTER TABLE `building_donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `building_donor` ENABLE KEYS */;


--
-- Definition of table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
CREATE TABLE `campaign` (
  `campaign_code` int(11) NOT NULL,
  `country_code` int(11) DEFAULT NULL,
  `state_code` int(11) DEFAULT NULL,
  `campaign` varchar(100) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`campaign_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `campaign_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaign`
--

/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` (`campaign_code`,`country_code`,`state_code`,`campaign`,`date_from`,`date_to`,`active`,`notes`,`created_at`,`created_by`,`updated_at`,`updated_by`) VALUES 
 (1,4,15,'Diwali','2018-02-24','2018-02-24',1,'good collection','2018-02-24 00:00:00','Admin','2018-02-24 00:00:00','Admin');
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;


--
-- Definition of table `campaign_master`
--

DROP TABLE IF EXISTS `campaign_master`;
CREATE TABLE `campaign_master` (
  `campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_code` varchar(20) NOT NULL,
  `country_code` int(11) NOT NULL,
  `state_code` int(11) NOT NULL,
  `campaign_name` varchar(100) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`campaign_id`),
  UNIQUE KEY `campaign_code` (`campaign_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `campaign` (`campaign_name`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `active` (`active`),
  CONSTRAINT `campaign_master_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `campaign_master_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign_master`
--

/*!40000 ALTER TABLE `campaign_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_master` ENABLE KEYS */;


--
-- Definition of table `country_master`
--

DROP TABLE IF EXISTS `country_master`;
CREATE TABLE `country_master` (
  `country_code` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `country_short_name` varchar(10) NOT NULL,
  `active` char(1) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`country_code`),
  UNIQUE KEY `country` (`country`),
  UNIQUE KEY `country_short_name` (`country_short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_master`
--

/*!40000 ALTER TABLE `country_master` DISABLE KEYS */;
INSERT INTO `country_master` (`country_code`,`country`,`country_short_name`,`active`,`created_by`,`created_at`,`updated_by`,`updated_at`) VALUES 
 (2,'Aland Islands','AX','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (3,'Albania','AL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (4,'Algeria','DZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (5,'American Samoa','AS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (6,'Andorra','AD','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (7,'Angola','AO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (8,'Anguilla','AI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (9,'Antarctica','AQ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (10,'Antigua and Barbuda','AG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (11,'Argentina','AR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (12,'Armenia','AM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (13,'Aruba','AW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (14,'Australia','AU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (15,'Austria','AT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (16,'Azerbaijan','AZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (17,'Bahamas','BS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (18,'Bahrain','BH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (19,'Bangladesh','BD','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (20,'Barbados','BB','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (21,'Belarus','BY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (22,'Belgium','BE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (23,'Belize','BZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (24,'Benin','BJ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (25,'Bermuda','BM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (26,'Bhutan','BT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (27,'Bolivia','BO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (28,'Bosnia and Herzegovina','BA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (29,'Botswana','BW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (30,'Bouvet Island','BV','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (31,'Brazil','BR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (32,'British Virgin Islands','VG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (33,'British Indian Ocean Territory','IO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (34,'Brunei Darussalam','BN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (35,'Bulgaria','BG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (36,'Burkina Faso','BF','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (37,'Burundi','BI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (38,'Cambodia','KH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (39,'Cameroon','CM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (40,'Canada','CA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (41,'Cape Verde','CV','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (42,'Cayman Islands','KY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (43,'Central African Republic','CF','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (44,'Chad','TD','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (45,'Chile','CL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (46,'China','CN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (47,'Hong Kong, SAR China','HK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (48,'Macao, SAR China','MO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (49,'Christmas Island','CX','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (50,'Cocos (Keeling) Islands','CC','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (51,'Colombia','CO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (52,'Comoros','KM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (53,'Congo (Brazzaville)','CG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (54,'Congo, (Kinshasa)','CD','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (55,'Cook Islands','CK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (56,'Costa Rica','CR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (57,'Côte dIvoire','CI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (58,'Croatia','HR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (59,'Cuba','CU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (60,'Cyprus','CY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (61,'Czech Republic','CZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (62,'Denmark','DK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (63,'Djibouti','DJ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (64,'Dominica','DM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (65,'Dominican Republic','DO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (66,'Ecuador','EC','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (67,'Egypt','EG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (68,'El Salvador','SV','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (69,'Equatorial Guinea','GQ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (70,'Eritrea','ER','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (71,'Estonia','EE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (72,'Ethiopia','ET','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (73,'Falkland Islands (Malvinas)','FK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (74,'Faroe Islands','FO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (75,'Fiji','FJ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (76,'Finland','FI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (77,'France','FR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (78,'French Guiana','GF','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (79,'French Polynesia','PF','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (80,'French Southern Territories','TF','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (81,'Gabon','GA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (82,'Gambia','GM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (83,'Georgia','GE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (84,'Germany','DE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (85,'Ghana','GH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (86,'Gibraltar','GI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (87,'Greece','GR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (88,'Greenland','GL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (89,'Grenada','GD','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (90,'Guadeloupe','GP','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (91,'Guam','GU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (92,'Guatemala','GT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (93,'Guernsey','GG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (94,'Guinea','GN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (95,'Guinea-Bissau','GW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (96,'Guyana','GY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (97,'Haiti','HT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (98,'Heard and Mcdonald Islands','HM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (99,'Holy See (Vatican City State)','VA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (100,'Honduras','HN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (101,'Hungary','HU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (102,'Iceland','IS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (103,'India','IN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (104,'Indonesia','ID','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (105,'Iran, Islamic Republic of','IR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (106,'Iraq','IQ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (107,'Ireland','IE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (108,'Isle of Man','IM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (109,'Israel','IL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (110,'Italy','IT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (111,'Jamaica','JM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (112,'Japan','JP','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (113,'Jersey','JE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (114,'Jordan','JO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (115,'Kazakhstan','KZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (116,'Kenya','KE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (117,'Kiribati','KI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (118,'Korea (North)','KP','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (119,'Korea (South)','KR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (120,'Kuwait','KW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (121,'Kyrgyzstan','KG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (122,'Lao PDR','LA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (123,'Latvia','LV','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (124,'Lebanon','LB','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (125,'Lesotho','LS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (126,'Liberia','LR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (127,'Libya','LY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (128,'Liechtenstein','LI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (129,'Lithuania','LT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (130,'Luxembourg','LU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (131,'Macedonia, Republic of','MK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (132,'Madagascar','MG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (133,'Malawi','MW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (134,'Malaysia','MY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (135,'Maldives','MV','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (136,'Mali','ML','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (137,'Malta','MT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (138,'Marshall Islands','MH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (139,'Martinique','MQ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (140,'Mauritania','MR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (141,'Mauritius','MU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (142,'Mayotte','YT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (143,'Mexico','MX','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (144,'Micronesia, Federated States of','FM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (145,'Moldova','MD','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (146,'Monaco','MC','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (147,'Mongolia','MN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (148,'Montenegro','ME','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (149,'Montserrat','MS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (150,'Morocco','MA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (151,'Mozambique','MZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (152,'Myanmar','MM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (153,'Namibia','NA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (154,'Nauru','NR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (155,'Nepal','NP','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (156,'Netherlands','NL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (157,'Netherlands Antilles','AN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (158,'New Caledonia','NC','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (159,'New Zealand','NZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (160,'Nicaragua','NI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (161,'Niger','NE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (162,'Nigeria','NG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (163,'Niue','NU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (164,'Norfolk Island','NF','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (165,'Northern Mariana Islands','MP','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (166,'Norway','NO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (167,'Oman','OM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (168,'Pakistan','PK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (169,'Palau','PW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (170,'Palestinian Territory','PS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (171,'Panama','PA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (172,'Papua New Guinea','PG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (173,'Paraguay','PY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (174,'Peru','PE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (175,'Philippines','PH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (176,'Pitcairn','PN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (177,'Poland','PL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (178,'Portugal','PT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (179,'Puerto Rico','PR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (180,'Qatar','QA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (181,'Réunion','RE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (182,'Romania','RO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (183,'Russian Federation','RU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (184,'Rwanda','RW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (185,'Saint-Barthélemy','BL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (186,'Saint Helena','SH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (187,'Saint Kitts and Nevis','KN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (188,'Saint Lucia','LC','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (189,'Saint-Martin (French part)','MF','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (190,'Saint Pierre and Miquelon','PM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (191,'Saint Vincent and Grenadines','VC','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (192,'Samoa','WS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (193,'San Marino','SM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (194,'Sao Tome and Principe','ST','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (195,'Saudi Arabia','SA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (196,'Senegal','SN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (197,'Serbia','RS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (198,'Seychelles','SC','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (199,'Sierra Leone','SL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (200,'Singapore','SG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (201,'Slovakia','SK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (202,'Slovenia','SI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (203,'Solomon Islands','SB','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (204,'Somalia','SO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (205,'South Africa','ZA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (206,'South Georgia and the South Sandwich Islands','GS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (207,'South Sudan','SS','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (208,'Spain','ES','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (209,'Sri Lanka','LK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (210,'Sudan','SD','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (211,'Suriname','SR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (212,'Svalbard and Jan Mayen Islands','SJ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (213,'Swaziland','SZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (214,'Sweden','SE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (215,'Switzerland','CH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (216,'Syrian Arab Republic (Syria)','SY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (217,'Taiwan, Republic of China','TW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (218,'Tajikistan','TJ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (219,'Tanzania, United Republic of','TZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (220,'Thailand','TH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (221,'Timor-Leste','TL','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (222,'Togo','TG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (223,'Tokelau','TK','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (224,'Tonga','TO','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (225,'Trinidad and Tobago','TT','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (226,'Tunisia','TN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (227,'Turkey','TR','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (228,'Turkmenistan','TM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (229,'Turks and Caicos Islands','TC','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (230,'Tuvalu','TV','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (231,'Uganda','UG','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (232,'Ukraine','UA','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (233,'United Arab Emirates','AE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (234,'United Kingdom','GB','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (235,'United States of America','US','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (236,'US Minor Outlying Islands','UM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (237,'Uruguay','UY','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (238,'Uzbekistan','UZ','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (239,'Vanuatu','VU','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (240,'Venezuela (Bolivarian Republic)','VE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (241,'Viet Nam','VN','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (242,'Virgin Islands, US','VI','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (243,'Wallis and Futuna Islands','WF','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (244,'Western Sahara','EH','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (245,'Yemen','YE','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (246,'Zambia','ZM','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL),
 (247,'Zimbabwe','ZW','Y','ADMIN','2018-03-06 18:33:03',NULL,NULL);
/*!40000 ALTER TABLE `country_master` ENABLE KEYS */;


--
-- Definition of table `donor`
--

DROP TABLE IF EXISTS `donor`;
CREATE TABLE `donor` (
  `donor_code` varchar(10) NOT NULL,
  `country_code` int(11) DEFAULT NULL,
  `state_code` int(11) DEFAULT NULL,
  `donor_type` int(11) DEFAULT NULL,
  `organization_name` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `anniversary` date DEFAULT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `landline_no` varchar(15) DEFAULT NULL,
  `fax_no` varchar(15) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `address1` varchar(80) DEFAULT NULL,
  `address2` varchar(80) DEFAULT NULL,
  `address3` varchar(80) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pin_code` varchar(50) DEFAULT NULL,
  `report_subm_period` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`donor_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `donor_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donor`
--

/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;


--
-- Definition of table `facility_management`
--

DROP TABLE IF EXISTS `facility_management`;
CREATE TABLE `facility_management` (
  `receipt_code` int(30) NOT NULL,
  `country_code` int(11) DEFAULT NULL,
  `state_code` int(11) DEFAULT NULL,
  `donor_type` int(11) DEFAULT NULL,
  `donor_code` varchar(10) NOT NULL,
  `campaign_code` int(11) DEFAULT NULL,
  `payment_mode_code` varchar(3) DEFAULT NULL,
  `project_category_code` varchar(3) DEFAULT NULL,
  `maintenance_type_code` varchar(6) DEFAULT NULL,
  `maintenance_sub_type_code` varchar(6) DEFAULT NULL,
  `today_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `cheque_no` varchar(30) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank_name` varchar(150) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`receipt_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `donor_code` (`donor_code`),
  KEY `campaign_code` (`campaign_code`),
  KEY `payment_mode_code` (`payment_mode_code`),
  KEY `project_category_code` (`project_category_code`),
  KEY `maintenance_type_code` (`maintenance_type_code`),
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`),
  CONSTRAINT `facility_management_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `facility_management_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  CONSTRAINT `facility_management_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  CONSTRAINT `facility_management_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  CONSTRAINT `facility_management_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  CONSTRAINT `facility_management_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  CONSTRAINT `facility_management_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  CONSTRAINT `facility_management_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facility_management`
--

/*!40000 ALTER TABLE `facility_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `facility_management` ENABLE KEYS */;


--
-- Definition of table `general_donation`
--

DROP TABLE IF EXISTS `general_donation`;
CREATE TABLE `general_donation` (
  `receipt_code` int(30) NOT NULL,
  `country_code` int(11) DEFAULT NULL,
  `state_code` int(11) DEFAULT NULL,
  `donor_type` int(11) DEFAULT NULL,
  `donor_code` varchar(10) NOT NULL,
  `campaign_code` int(11) DEFAULT NULL,
  `payment_mode_code` varchar(3) DEFAULT NULL,
  `project_category_code` varchar(3) DEFAULT NULL,
  `maintenance_type_code` varchar(6) DEFAULT NULL,
  `maintenance_sub_type_code` varchar(6) DEFAULT NULL,
  `today_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `cheque_no` varchar(30) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank_name` varchar(150) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`receipt_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `donor_code` (`donor_code`),
  KEY `campaign_code` (`campaign_code`),
  KEY `payment_mode_code` (`payment_mode_code`),
  KEY `project_category_code` (`project_category_code`),
  KEY `maintenance_type_code` (`maintenance_type_code`),
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`),
  CONSTRAINT `general_donation_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `general_donation_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  CONSTRAINT `general_donation_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  CONSTRAINT `general_donation_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  CONSTRAINT `general_donation_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  CONSTRAINT `general_donation_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  CONSTRAINT `general_donation_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  CONSTRAINT `general_donation_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_donation`
--

/*!40000 ALTER TABLE `general_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_donation` ENABLE KEYS */;


--
-- Definition of table `general_donaton`
--

DROP TABLE IF EXISTS `general_donaton`;
CREATE TABLE `general_donaton` (
  `receipt_no` int(11) NOT NULL AUTO_INCREMENT,
  `donor_id` int(11) DEFAULT NULL,
  `donation_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `cheque_no` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank` varchar(150) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `sub_type_id` int(11) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`receipt_no`),
  KEY `payment_id` (`payment_id`),
  KEY `project_category_id` (`project_category_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `sub_type_id` (`sub_type_id`),
  KEY `campaign_id` (`campaign_id`),
  CONSTRAINT `general_donaton_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payment_master` (`payment_id`),
  CONSTRAINT `general_donaton_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`),
  CONSTRAINT `general_donaton_ibfk_3` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenance_type` (`maintenance_id`),
  CONSTRAINT `general_donaton_ibfk_4` FOREIGN KEY (`sub_type_id`) REFERENCES `maintenance_sub_type` (`sub_type_id`),
  CONSTRAINT `general_donaton_ibfk_5` FOREIGN KEY (`campaign_id`) REFERENCES `campaign_master` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_donaton`
--

/*!40000 ALTER TABLE `general_donaton` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_donaton` ENABLE KEYS */;


--
-- Definition of table `land_donor`
--

DROP TABLE IF EXISTS `land_donor`;
CREATE TABLE `land_donor` (
  `receipt_code` int(30) NOT NULL,
  `country_code` int(11) DEFAULT NULL,
  `state_code` int(11) DEFAULT NULL,
  `donor_type` int(11) DEFAULT NULL,
  `donor_code` varchar(10) NOT NULL,
  `campaign_code` int(11) DEFAULT NULL,
  `payment_mode_code` varchar(3) DEFAULT NULL,
  `project_category_code` varchar(3) DEFAULT NULL,
  `maintenance_type_code` varchar(6) DEFAULT NULL,
  `maintenance_sub_type_code` varchar(6) DEFAULT NULL,
  `today_date` date NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `cheque_no` varchar(30) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `bank_name` varchar(150) DEFAULT NULL,
  `notes` varchar(4000) DEFAULT NULL,
  `donated` varchar(100) DEFAULT NULL,
  `leased` varchar(80) DEFAULT NULL,
  `location` varchar(80) DEFAULT NULL,
  `year_of_donation` varchar(12) DEFAULT NULL,
  `leased_period` varchar(15) DEFAULT NULL,
  `built_up_area` varchar(80) DEFAULT NULL,
  `vacant_area` varchar(80) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`receipt_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `donor_code` (`donor_code`),
  KEY `campaign_code` (`campaign_code`),
  KEY `payment_mode_code` (`payment_mode_code`),
  KEY `project_category_code` (`project_category_code`),
  KEY `maintenance_type_code` (`maintenance_type_code`),
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`),
  CONSTRAINT `land_donor_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `land_donor_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  CONSTRAINT `land_donor_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  CONSTRAINT `land_donor_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  CONSTRAINT `land_donor_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  CONSTRAINT `land_donor_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  CONSTRAINT `land_donor_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  CONSTRAINT `land_donor_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `land_donor`
--

/*!40000 ALTER TABLE `land_donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `land_donor` ENABLE KEYS */;


--
-- Definition of table `maintenance_sub_type`
--

DROP TABLE IF EXISTS `maintenance_sub_type`;
CREATE TABLE `maintenance_sub_type` (
  `maintenance_sub_type_code` varchar(6) NOT NULL,
  `project_category_code` varchar(3) NOT NULL,
  `maintenance_type_code` varchar(6) NOT NULL,
  `sub_type` varchar(50) NOT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`maintenance_sub_type_code`),
  KEY `project_category_code` (`project_category_code`),
  KEY `maintenance_type_code` (`maintenance_type_code`),
  CONSTRAINT `maintenance_sub_type_ibfk_1` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  CONSTRAINT `maintenance_sub_type_ibfk_2` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintenance_sub_type`
--

/*!40000 ALTER TABLE `maintenance_sub_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_sub_type` ENABLE KEYS */;


--
-- Definition of table `maintenance_type`
--

DROP TABLE IF EXISTS `maintenance_type`;
CREATE TABLE `maintenance_type` (
  `maintenance_type_code` varchar(3) NOT NULL DEFAULT '',
  `project_category_code` varchar(3) DEFAULT NULL,
  `maintenance_type` varchar(50) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`maintenance_type_code`),
  KEY `project_category_code` (`project_category_code`),
  CONSTRAINT `maintenance_type_ibfk_1` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintenance_type`
--

/*!40000 ALTER TABLE `maintenance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_type` ENABLE KEYS */;


--
-- Definition of table `notification_master`
--

DROP TABLE IF EXISTS `notification_master`;
CREATE TABLE `notification_master` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) DEFAULT NULL,
  `email_sub` varchar(100) DEFAULT NULL,
  `email_content` varchar(200) DEFAULT NULL,
  `sms_content` varchar(200) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_master`
--

/*!40000 ALTER TABLE `notification_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_master` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_mode_code` varchar(3) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`payment_mode_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `payment_master`
--

DROP TABLE IF EXISTS `payment_master`;
CREATE TABLE `payment_master` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_code` char(5) NOT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_code` (`payment_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_master`
--

/*!40000 ALTER TABLE `payment_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_master` ENABLE KEYS */;


--
-- Definition of table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_code` varchar(6) NOT NULL,
  `country_code` int(11) DEFAULT NULL,
  `state_code` int(11) DEFAULT NULL,
  `project_name` varchar(100) NOT NULL,
  `address1` varchar(80) DEFAULT NULL,
  `address2` varchar(80) DEFAULT NULL,
  `address3` varchar(80) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pin_code` varchar(50) DEFAULT NULL,
  `report_subm_period` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`project_code`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;


--
-- Definition of table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
CREATE TABLE `project_category` (
  `project_category_code` varchar(3) NOT NULL DEFAULT '',
  `project_category` varchar(6) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`project_category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_category`
--

/*!40000 ALTER TABLE `project_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_category` ENABLE KEYS */;


--
-- Definition of table `project_dtl`
--

DROP TABLE IF EXISTS `project_dtl`;
CREATE TABLE `project_dtl` (
  `project_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `project_category_id` int(11) DEFAULT NULL,
  `report_subm_comments` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`project_dtl_id`),
  KEY `project_id` (`project_id`),
  KEY `project_category_id` (`project_category_id`),
  CONSTRAINT `project_dtl_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `project_dtl_ibfk_2` FOREIGN KEY (`project_category_id`) REFERENCES `project_category` (`project_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_dtl`
--

/*!40000 ALTER TABLE `project_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_dtl` ENABLE KEYS */;


--
-- Definition of table `role_master`
--

DROP TABLE IF EXISTS `role_master`;
CREATE TABLE `role_master` (
  `role_code` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  `active` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  PRIMARY KEY (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_master`
--

/*!40000 ALTER TABLE `role_master` DISABLE KEYS */;
INSERT INTO `role_master` (`role_code`,`role`,`active`,`created_at`,`created_by`,`updated_at`,`updated_by`) VALUES 
 (1,'Admin',1,'2018-02-17 00:00:00','Admin','2018-02-17 00:00:00','Admin');
/*!40000 ALTER TABLE `role_master` ENABLE KEYS */;


--
-- Definition of table `role_screen_mapping_master`
--

DROP TABLE IF EXISTS `role_screen_mapping_master`;
CREATE TABLE `role_screen_mapping_master` (
  `screen_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_code` int(11) DEFAULT NULL,
  `screen` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`screen_id`),
  KEY `role_id` (`role_id`),
  KEY `user_code` (`user_code`),
  CONSTRAINT `role_screen_mapping_master_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`role_id`),
  CONSTRAINT `role_screen_mapping_master_ibfk_2` FOREIGN KEY (`user_code`) REFERENCES `user_master` (`user_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_screen_mapping_master`
--

/*!40000 ALTER TABLE `role_screen_mapping_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_screen_mapping_master` ENABLE KEYS */;


--
-- Definition of table `role_user_mapping_master`
--

DROP TABLE IF EXISTS `role_user_mapping_master`;
CREATE TABLE `role_user_mapping_master` (
  `role_mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_code` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`role_mapping_id`),
  KEY `role_id` (`role_id`),
  KEY `user_code` (`user_code`),
  CONSTRAINT `role_user_mapping_master_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`role_id`),
  CONSTRAINT `role_user_mapping_master_ibfk_2` FOREIGN KEY (`user_code`) REFERENCES `user_master` (`user_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_user_mapping_master`
--

/*!40000 ALTER TABLE `role_user_mapping_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_user_mapping_master` ENABLE KEYS */;


--
-- Definition of table `state_master`
--

DROP TABLE IF EXISTS `state_master`;
CREATE TABLE `state_master` (
  `state_code` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `state_short_name` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`state_code`),
  UNIQUE KEY `state` (`state`),
  UNIQUE KEY `state_short_name` (`state_short_name`),
  KEY `country_code` (`country_code`),
  CONSTRAINT `state_master_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state_master`
--

/*!40000 ALTER TABLE `state_master` DISABLE KEYS */;
INSERT INTO `state_master` (`state_code`,`country_code`,`state`,`state_short_name`,`created_at`,`updated_at`,`created_by`,`updated_by`) VALUES 
 (15,4,'Bihar','Br','2018-02-13 11:41:48','2018-02-13 11:41:48',NULL,NULL);
/*!40000 ALTER TABLE `state_master` ENABLE KEYS */;


--
-- Definition of table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
CREATE TABLE `user_master` (
  `user_code` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` int(11) NOT NULL,
  `state_code` int(11) NOT NULL,
  `role_code` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address1` varchar(80) DEFAULT NULL,
  `address2` varchar(80) DEFAULT NULL,
  `address3` varchar(80) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pin_code` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `anniversary` date DEFAULT NULL,
  `mobile_no` int(15) DEFAULT NULL,
  `landline_no` int(12) DEFAULT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `active` smallint(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_code`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `role_code` (`role_code`),
  CONSTRAINT `user_master_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  CONSTRAINT `user_master_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  CONSTRAINT `user_master_ibfk_3` FOREIGN KEY (`role_code`) REFERENCES `role_master` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` (`user_code`,`country_code`,`state_code`,`role_code`,`first_name`,`last_name`,`address1`,`address2`,`address3`,`city`,`pin_code`,`dob`,`anniversary`,`mobile_no`,`landline_no`,`email_id`,`password`,`active`,`created_at`,`updated_at`,`created_by`,`updated_by`) VALUES 
 (1,4,15,1,'raj','kumar','gaya',NULL,NULL,'gaya','823001','2018-02-08','2018-02-09',727759367,NULL,'raj.gaya@gmail.com','123456',1,'2018-02-17 00:00:00','2018-02-17 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;


--
-- Definition of procedure `sp_campaign_master`
--

DROP PROCEDURE IF EXISTS `sp_campaign_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campaign_master`(IN `campaignMaster` JSON, IN `statement` VARCHAR(30), IN `flag` INT, IN `cmp_code` INT)
begin

declare i_country_code int;
declare i_state_code int;
declare i_campaign_name varchar(100);
declare i_date_from date;
declare i_date_to date;
declare i_created_at datetime;
declare i_updated_at datetime;
declare i_created_by varchar(30);
declare i_updated_by varchar(30);
declare i_status SMALLINT(10);
declare i_notes varchar(4000);

set i_country_code = JSON_EXTRACT(campaignMaster,'$.country_code');
set i_state_code = JSON_EXTRACT(campaignMaster,'$.state_code');
set i_campaign_name = JSON_EXTRACT(campaignMaster,'$.campaign');
set i_date_from = CAST(jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.date_from'))as DATE);
set i_date_to = CAST(jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.date_to'))as DATE);
set i_created_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.created_at'))as DATETIME);
set i_updated_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(campaignMaster,'$.updated_at')) as DATETIME);
set i_updated_by = JSON_EXTRACT(campaignMaster,'$.updated_by');
set i_created_by = JSON_EXTRACT(campaignMaster,'$.created_by');
set i_status = JSON_EXTRACT(campaignMaster,'$.active');
set i_notes = JSON_EXTRACT(campaignMaster,'$.notes');

if flag=1 THEN
	if statement='Insert' then
		insert into campaign(country_code,state_code,campaign,date_from,date_to,created_at,updated_at,created_by,updated_by,active,notes) values(i_country_code,i_state_code,i_date_from,i_date_to,i_created_at,i_updated_at,i_created_by,i_updated_by,i_status,i_notes);
	elseif statement='Select' then
		SELECT country_master.country, state_master.state,campaign.campaign,campaign.date_from,campaign.date_to,campaign.active FROM country_master INNER JOIN state_master INNER JOIN campaign ON  campaign.country_code=country_master.country_code and campaign.state_code=state_master.state_code;
    end if;
    else
    IF statement='Update' THEN
    	update campaign set country_code=i_country_code, state_code=i_state_code,date_from=i_date_from,date_to=i_date_to,active=i_status,created_at=i_created_at,updated_at=i_updated_at,updated_by=i_updated_by,created_by=i_created_by,notes=i_notes where campaign_code=cmp_code;
    ELSEIF statement='Delete' THEN
    	DELETE from state_master WHERE state_code=cmp_code;
	end if;
 end if;
	
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_country_master`
--

DROP PROCEDURE IF EXISTS `sp_country_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_country_master`(IN `countryMaster` JSON, IN `statement` int,
IN `cntry_code` INT)
begin


declare i_country_name varchar(100);
declare i_short_name varchar(5);
declare i_created_at datetime;
declare i_updated_at datetime;
declare i_created_by varchar(30);
declare i_updated_by varchar(30);
declare i_active SMALLINT(10);



set i_country_name = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.country'));
set i_short_name = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.country_short_name'));
set i_active = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.active'));
set i_created_by = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.created_by'));
set i_created_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.created_at'))as DATETIME);
set i_updated_by = jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.updated_by'));
set i_updated_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.updated_at')) as DATETIME);




/* 1-Insert, 2-Select, 3-Select byId, 4- Update, 5-Delete  */

      if statement= 1 then

          insert into country_master(country, country_short_name, active, created_by, created_at, updated_by, updated_at)
          values(i_country_name,i_short_name,i_active,i_created_by,i_created_at,i_updated_by,i_updated_at);

      elseif statement= 2 then

          select * from country_master where active= 'Y';

      elseif statement= 3 THEN

          SELECT * from country_master WHERE country_code=cntry_code and active= 'Y';

    elseif statement= 4 THEN

      update country_master set country=i_country_name,country_short_name=i_short_name,active=i_active,
      updated_by=i_updated_by,updated_at=i_updated_at where country_code=cntry_code;

    elseif statement= 5 THEN

      update country_master set active= 'N' WHERE country_code=cntry_code;


      end if;


end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `sp_state_master`
--

DROP PROCEDURE IF EXISTS `sp_state_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_state_master`(IN `stateMaster` JSON, IN `statement` VARCHAR(30), IN `flag` INT, IN `st_code` INT)
begin

declare i_country_code int;
declare i_state_name varchar(100);
declare i_short_name varchar(5);
declare i_created_at datetime;
declare i_updated_at datetime;
declare i_created_by varchar(30);
declare i_updated_by varchar(30);


set i_country_code = JSON_EXTRACT(stateMaster,'$.country_code');
set i_state_name = JSON_EXTRACT(stateMaster,'$.state');
set i_short_name = JSON_EXTRACT(stateMaster,'$.state_short_name');
set i_created_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.created_at'))as DATETIME);
set i_updated_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(stateMaster,'$.updated_at')) as DATETIME);
set i_updated_by = JSON_EXTRACT(stateMaster,'$.updated_by');
set i_created_by = JSON_EXTRACT(stateMaster,'$.created_by');

if flag=1 THEN
	if statement='Insert' then
		insert into state_master(country_code,state,state_short_name,created_at,updated_at,created_by,updated_by) values(i_country_code,i_state_name,i_short_name,i_created_at,i_updated_at,i_created_by,i_updated_by);
	elseif statement='Select' then
		SELECT country_master.country, state_master.state,state_master.state_short_name FROM country_master INNER JOIN state_master ON country_master.country_code=state_master.country_code;
    end if;
    else
    IF statement='Update' THEN
    	update state_master set country_code=i_country_code, state=i_state_name,state_short_name=i_short_name,active=i_status,created_at=i_created_at,updated_at=i_updated_at,updated_by=i_updated_by,created_by=i_created_by where state_code=cntry_code;
    ELSEIF statement='Delete' THEN
    	DELETE from state_master WHERE state_code=st_code;
	ELSEIF statement='SelectById' THEN
    	SELECT *from state_master WHERE state_code=st_code;
	end if;
 end if;
	
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
