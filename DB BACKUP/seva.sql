-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 19, 2018 at 08:33 AM
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
-- Database: `seva`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `sp_country_master`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_country_master` (IN `query` JSON)  begin

declare i_country_name varchar(100);
declare i_short_name varchar(5);
declare i_created_at datetime;
declare i_updated_at datetime;
declare i_status SMALLINT(10);


set i_country_name = JSON_EXTRACT(query,'$.country');
set i_short_name = JSON_EXTRACT(query,'$.country_short_name');
set i_created_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(query,'$.created_at'))as DATETIME);

set i_updated_at = CAST(jSON_UNQUOTE(JSON_EXTRACT(query,'$.updated_at')) as DATETIME);
set i_status = JSON_EXTRACT(query,'$.active');


insert into country_master(country,country_short_name,created_at,updated_at,active) values(i_country_name,i_short_name,i_created_at,i_updated_at,i_status);

end$$

DELIMITER ;

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
  PRIMARY KEY (`country_code`),
  UNIQUE KEY `country` (`country`),
  UNIQUE KEY `country_short_name` (`country_short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country_master`
--

INSERT INTO `country_master` (`country_code`, `country`, `country_short_name`, `created_at`, `updated_at`, `active`) VALUES
(4, 'India', 'Ind', '2018-02-13 11:13:39', '2018-02-13 11:13:39', 0),
(6, 'south africa', 'sa', '2018-02-06 00:00:00', '2018-02-16 00:00:00', 1),
(7, 'rrrrrrr', 'rrr', '2018-02-15 00:00:00', '2018-02-15 00:00:00', 1),
(8, '\"rrrrrrr\"', '\"rrr\"', '2018-02-15 13:47:01', '2018-02-15 13:47:01', 1),
(9, '\"jjjvfdjghjjdd\"', '\"wkk\"', '2018-02-15 13:47:01', '2018-02-15 13:47:01', 1),
(12, '\"kljlkj\"', '\"jhj\"', '2018-02-15 13:47:01', '2018-02-15 13:47:01', 1),
(14, '\"Usa\"', '\"Us\"', '2018-02-15 13:47:01', '2018-02-15 13:47:01', 1);

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
  PRIMARY KEY (`state_code`),
  UNIQUE KEY `state` (`state`),
  UNIQUE KEY `state_short_name` (`state_short_name`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`state_code`, `country_code`, `state`, `state_short_name`, `created_at`, `updated_at`, `active`) VALUES
(15, 4, 'Bihar', 'Br', '2018-02-13 11:41:48', '2018-02-13 11:41:48', 0);

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
  PRIMARY KEY (`user_code`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `country_code` (`country_code`),
  KEY `state_code` (`state_code`),
  KEY `role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_code`, `country_code`, `state_code`, `role_code`, `first_name`, `last_name`, `address1`, `address2`, `address3`, `city`, `pin_code`, `dob`, `anniversary`, `mobile_no`, `landline_no`, `email_id`, `password`, `active`, `created_at`, `updated_at`) VALUES
(1, 4, 15, 1, 'raj', 'kumar', 'gaya', NULL, NULL, 'gaya', '823001', '2018-02-08', '2018-02-09', 727759367, NULL, 'raj.gaya@gmail.com', '123456', 1, '2018-02-17 00:00:00', '2018-02-17 00:00:00');

--
-- Constraints for dumped tables
--

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
