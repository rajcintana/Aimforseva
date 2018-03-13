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
-- Create schema seva
--

CREATE DATABASE IF NOT EXISTS seva;
USE seva;

--
-- Definition of procedure `sp_user_master`
--

DROP PROCEDURE IF EXISTS `sp_user_master`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_master`(userMaster JSON,statement varchar(30),user_code int)
begin

declare i_country_code int;
declare i_state_code int;
declare i_first_name varchar(50);
declare i_last_name varchar(50);
declare i_dob char(10);
declare i_anniversary char(10);
declare i_mobile_no char(15);
declare i_landline_no char(15);
declare i_email varchar(100);
declare i_active smallint(6);
declare i_address1 varchar(80);
declare i_address2 varchar(80);
declare i_address3 varchar(80);
declare i_city varchar(50);
declare i_postal_code char(10);

declare i_created_on datetime;
declare i_updated_on char(19);
declare i_created_by varchar(30);
declare i_updated_by varchar(30);
declare m_dob date;
declare m_anniversary date;
declare m_updated_on date;


set i_country_code=JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.country_code'));
set i_state_code = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.state_code'));
set i_first_name = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.first_name'));
set i_last_name = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.last_name'));
set i_dob=(select (if (ifnull(json_extract(json_object(userMaster,null),'$.dob'),'0000-00-00')='0000-00-00', (CAST(jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.dob'))as char)) , (CAST(jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.dob'))as char)))));
set i_anniversary = (select (if (ifnull(json_extract(json_object(userMaster,null),'$.anniversary'),'0000-00-00')='0000-00-00', (CAST(jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.anniversary'))as char)) , (CAST(jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.anniversary'))as char)))));
set i_mobile_no = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.mobile_no'));
set i_landline_no = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.landline_no'));
set i_email = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.email_id'));
set i_active = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.active'));
set i_address1 = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.address1'));
set i_address2 = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.address2'));
set i_address3 = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.address3'));
set i_city = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.city'));
set i_postal_code = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.postal_code'));
set i_created_on = now();
set i_updated_on = (select (if (ifnull(json_extract(json_object(userMaster,null),'$.updated_on'),'0000-00-00')='0000-00-00', (CAST(jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.updated_on'))as char)) , (CAST(jSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.updated_on'))as char)))));
set i_updated_by = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.updated_by'));
set i_created_by = JSON_UNQUOTE(JSON_EXTRACT(userMaster,'$.created_by'));

set m_dob=(select case when cast(ifnull(i_dob,'0000-00-00')as date) is null then '0000-00-00' else  cast(i_dob as date) end);
set m_anniversary=(select case when cast(ifnull(i_anniversary,'0000-00-00')as date) is null then '0000-00-00' else  cast(i_anniversary as date) end);
set m_updated_on=(select case when cast(ifnull(i_updated_on,'0000-00-00')as date) is null then '0000-00-00' else  cast(i_updated_on as date) end);


	if statement='Insert' then

  		insert into user_master(country_code,state_code,first_name,last_name,dob,anniversary,mobile_no,landline_no,email_id,
                              active,address1,address2,address3,city,postal_code,created_by,created_on)
      values(i_country_code,i_state_code,i_first_name,i_last_name,m_dob,m_anniversary,i_mobile_no,i_landline_no,i_email,
      i_active,i_address1,i_address2,i_address3,i_city,i_postal_code,i_created_by,i_created_on);


	elseif statement='Select' then

		select * from user_master;

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
