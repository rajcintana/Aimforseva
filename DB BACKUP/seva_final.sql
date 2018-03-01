-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 22, 2018 at 03:24 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seva_final`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `sp_country_master`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_country_master` (IN `countryMaster` JSON, IN `statement` VARCHAR(30), IN `flag` INT, IN `cntry_code` INT)  begin

declare i_country_name varchar(100);
declare i_short_name varchar(5);
declare i_created_at datetime;
declare i_updated_at datetime;
declare i_created_by varchar(30);
declare i_updated_by varchar(30);
declare i_status SMALLINT(10);

set i_country_name = JSON_EXTRACT(countryMaster,'$.country');
set i_short_name = JSON_EXTRACT(countryMaster,'$.country_short_name');
set i_created_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.created_at'))as DATETIME);
set i_updated_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(countryMaster,'$.updated_at')) as DATETIME);
set i_updated_by = JSON_EXTRACT(countryMaster,'$.updated_by');
set i_created_by = JSON_EXTRACT(countryMaster,'$.created_by');
set i_status = JSON_EXTRACT(countryMaster,'$.active');
if flag=1 THEN
	if statement='Insert' then
		insert into country_master(country,country_short_name,created_at,updated_at,created_by,updated_by,active) values(i_country_name,i_short_name,i_created_at,i_updated_at,i_created_by,i_updated_by,i_status);
	elseif statement='Select' then
		select *from country_master;
    end if;
    else
    IF statement='Update' THEN
    	update country_master set country=i_country_name,country_short_name=i_short_name,active=i_status,created_at=i_created_at,updated_at=i_updated_at,updated_by=i_updated_by,created_by=i_created_by where country_code=cntry_code;
    ELSEIF statement='Delete' THEN
    	DELETE from country_master WHERE country_code=cntry_code;
	
	end if;
 end if;
	
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `annual_maintenance`
--

DROP TABLE IF EXISTS `annual_maintenance`;
CREATE TABLE IF NOT EXISTS `annual_maintenance` (
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
  `upload_document` blob,
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
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `building_donor`
--

DROP TABLE IF EXISTS `building_donor`;
CREATE TABLE IF NOT EXISTS `building_donor` (
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
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
CREATE TABLE IF NOT EXISTS `campaign` (
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
  KEY `state_code` (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country_master`
--

DROP TABLE IF EXISTS `country_master`;
CREATE TABLE IF NOT EXISTS `country_master` (
  `country_code` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `country_short_name` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` smallint(11) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `updated_by` varchar(30) NOT NULL,
  PRIMARY KEY (`country_code`),
  UNIQUE KEY `country` (`country`),
  UNIQUE KEY `country_short_name` (`country_short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_master`
--

INSERT INTO `country_master` (`country_code`, `country`, `country_short_name`, `created_at`, `updated_at`, `active`, `created_by`, `updated_by`) VALUES
(4, 'India', 'Ind', '2018-02-13 11:13:39', '2018-02-13 11:13:39', 0, '', ''),
(6, 'south africa', 'sa', '2018-02-06 00:00:00', '2018-02-16 00:00:00', 1, '', ''),
(7, 'rrrrrrr', 'rrr', '2018-02-15 00:00:00', '2018-02-15 00:00:00', 1, '', ''),
(44, '\"rajesh\"', '\"rrr\"', '2018-02-15 13:47:01', '2018-02-15 13:47:01', 1, '\"Admin\"', '\"Admin\"');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
CREATE TABLE IF NOT EXISTS `donor` (
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
  KEY `state_code` (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facility_management`
--

DROP TABLE IF EXISTS `facility_management`;
CREATE TABLE IF NOT EXISTS `facility_management` (
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
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `general_donation`
--

DROP TABLE IF EXISTS `general_donation`;
CREATE TABLE IF NOT EXISTS `general_donation` (
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
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `land_donor`
--

DROP TABLE IF EXISTS `land_donor`;
CREATE TABLE IF NOT EXISTS `land_donor` (
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
  KEY `maintenance_sub_type_code` (`maintenance_sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_sub_type`
--

DROP TABLE IF EXISTS `maintenance_sub_type`;
CREATE TABLE IF NOT EXISTS `maintenance_sub_type` (
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
  KEY `maintenance_type_code` (`maintenance_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_type`
--

DROP TABLE IF EXISTS `maintenance_type`;
CREATE TABLE IF NOT EXISTS `maintenance_type` (
  `maintenance_type_code` varchar(3) NOT NULL DEFAULT '',
  `project_category_code` varchar(3) DEFAULT NULL,
  `maintenance_type` varchar(50) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`maintenance_type_code`),
  KEY `project_category_code` (`project_category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_mode_code` varchar(3) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`payment_mode_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
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
  KEY `state_code` (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
CREATE TABLE IF NOT EXISTS `project_category` (
  `project_category_code` varchar(3) NOT NULL DEFAULT '',
  `project_category` varchar(6) DEFAULT NULL,
  `active` smallint(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`project_category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_master`
--

DROP TABLE IF EXISTS `role_master`;
CREATE TABLE IF NOT EXISTS `role_master` (
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

INSERT INTO `role_master` (`role_code`, `role`, `active`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Admin', 1, '2018-02-17 00:00:00', 'Admin', '2018-02-17 00:00:00', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `state_master`
--

DROP TABLE IF EXISTS `state_master`;
CREATE TABLE IF NOT EXISTS `state_master` (
  `state_code` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `state_short_name` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` smallint(11) NOT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`state_code`),
  UNIQUE KEY `state` (`state`),
  UNIQUE KEY `state_short_name` (`state_short_name`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`state_code`, `country_code`, `state`, `state_short_name`, `created_at`, `updated_at`, `active`, `created_by`, `updated_by`) VALUES
(15, 4, 'Bihar', 'Br', '2018-02-13 11:41:48', '2018-02-13 11:41:48', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
CREATE TABLE IF NOT EXISTS `user_master` (
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
  KEY `role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_code`, `country_code`, `state_code`, `role_code`, `first_name`, `last_name`, `address1`, `address2`, `address3`, `city`, `pin_code`, `dob`, `anniversary`, `mobile_no`, `landline_no`, `email_id`, `password`, `active`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 4, 15, 1, 'raj', 'kumar', 'gaya', NULL, NULL, 'gaya', '823001', '2018-02-08', '2018-02-09', 727759367, NULL, 'raj.gaya@gmail.com', '123456', 1, '2018-02-17 00:00:00', '2018-02-17 00:00:00', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `annual_maintenance`
--
ALTER TABLE `annual_maintenance`
  ADD CONSTRAINT `annual_maintenance_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `annual_maintenance_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  ADD CONSTRAINT `annual_maintenance_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  ADD CONSTRAINT `annual_maintenance_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  ADD CONSTRAINT `annual_maintenance_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  ADD CONSTRAINT `annual_maintenance_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  ADD CONSTRAINT `annual_maintenance_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  ADD CONSTRAINT `annual_maintenance_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`);

--
-- Constraints for table `building_donor`
--
ALTER TABLE `building_donor`
  ADD CONSTRAINT `building_donor_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `building_donor_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  ADD CONSTRAINT `building_donor_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  ADD CONSTRAINT `building_donor_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  ADD CONSTRAINT `building_donor_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  ADD CONSTRAINT `building_donor_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  ADD CONSTRAINT `building_donor_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  ADD CONSTRAINT `building_donor_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`);

--
-- Constraints for table `campaign`
--
ALTER TABLE `campaign`
  ADD CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `campaign_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`);

--
-- Constraints for table `donor`
--
ALTER TABLE `donor`
  ADD CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `donor_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`);

--
-- Constraints for table `facility_management`
--
ALTER TABLE `facility_management`
  ADD CONSTRAINT `facility_management_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `facility_management_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  ADD CONSTRAINT `facility_management_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  ADD CONSTRAINT `facility_management_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  ADD CONSTRAINT `facility_management_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  ADD CONSTRAINT `facility_management_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  ADD CONSTRAINT `facility_management_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  ADD CONSTRAINT `facility_management_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`);

--
-- Constraints for table `general_donation`
--
ALTER TABLE `general_donation`
  ADD CONSTRAINT `general_donation_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `general_donation_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  ADD CONSTRAINT `general_donation_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  ADD CONSTRAINT `general_donation_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  ADD CONSTRAINT `general_donation_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  ADD CONSTRAINT `general_donation_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  ADD CONSTRAINT `general_donation_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  ADD CONSTRAINT `general_donation_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`);

--
-- Constraints for table `land_donor`
--
ALTER TABLE `land_donor`
  ADD CONSTRAINT `land_donor_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `land_donor_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  ADD CONSTRAINT `land_donor_ibfk_3` FOREIGN KEY (`donor_code`) REFERENCES `donor` (`donor_code`),
  ADD CONSTRAINT `land_donor_ibfk_4` FOREIGN KEY (`campaign_code`) REFERENCES `campaign` (`campaign_code`),
  ADD CONSTRAINT `land_donor_ibfk_5` FOREIGN KEY (`payment_mode_code`) REFERENCES `payment` (`payment_mode_code`),
  ADD CONSTRAINT `land_donor_ibfk_6` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  ADD CONSTRAINT `land_donor_ibfk_7` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`),
  ADD CONSTRAINT `land_donor_ibfk_8` FOREIGN KEY (`maintenance_sub_type_code`) REFERENCES `maintenance_sub_type` (`maintenance_sub_type_code`);

--
-- Constraints for table `maintenance_sub_type`
--
ALTER TABLE `maintenance_sub_type`
  ADD CONSTRAINT `maintenance_sub_type_ibfk_1` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`),
  ADD CONSTRAINT `maintenance_sub_type_ibfk_2` FOREIGN KEY (`maintenance_type_code`) REFERENCES `maintenance_type` (`maintenance_type_code`);

--
-- Constraints for table `maintenance_type`
--
ALTER TABLE `maintenance_type`
  ADD CONSTRAINT `maintenance_type_ibfk_1` FOREIGN KEY (`project_category_code`) REFERENCES `project_category` (`project_category_code`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`);

--
-- Constraints for table `state_master`
--
ALTER TABLE `state_master`
  ADD CONSTRAINT `state_master_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`);

--
-- Constraints for table `user_master`
--
ALTER TABLE `user_master`
  ADD CONSTRAINT `user_master_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country_master` (`country_code`),
  ADD CONSTRAINT `user_master_ibfk_2` FOREIGN KEY (`state_code`) REFERENCES `state_master` (`state_code`),
  ADD CONSTRAINT `user_master_ibfk_3` FOREIGN KEY (`role_code`) REFERENCES `role_master` (`role_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
