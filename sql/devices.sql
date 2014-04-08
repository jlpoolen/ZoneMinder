DROP VIEW     IF EXISTS "Devices";
DROP TABLE    IF EXISTS devices;
DROP SEQUENCE IF EXISTS devices_id_seq;

CREATE TABLE devices (
  id int           PRIMARY KEY,
  name text        NOT NULL,
  device_type text          DEFAULT 'X10',
  key_string text  NOT NULL DEFAULT ''
);

CREATE SEQUENCE devices_id_seq;
ALTER TABLE devices
ALTER COLUMN id
SET DEFAULT NEXTVAL('devices_id_seq');

CREATE VIEW "Devices" as
  SELECT
    id          as "Id",
    name        as "Name",
    device_type as "Type",
    key_string  as "KeyString"
  from devices;

--
-- Table structure for table `Devices`
--  Dump completed on 2014-03-28 21:55:44
--
--
--	DROP TABLE IF EXISTS `Devices`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Devices` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `Name` tinytext NOT NULL,
--	  `Type` enum('X10') NOT NULL DEFAULT 'X10',
--	  `KeyString` varchar(32) NOT NULL DEFAULT '',
--	  PRIMARY KEY (`Id`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
