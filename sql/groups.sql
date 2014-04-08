
DROP VIEW IF EXISTS "Groups";
DROP SEQUENCE IF EXISTS groups_id_seq;
DROP TABLE IF EXISTS groups;

CREATE TABLE groups (
  id int          PRIMARY KEY,
  name text       NOT NULL,
  monitor_id text NOT NULL
);

CREATE VIEW "Groups" AS
SELECT
  id         AS "Id",
  name       AS "Name",
  monitor_id AS "MonitorId"
FROM groups;

--
-- provide the MySQL AUTO_INCREMENT feature
-- Note in MySQL that the AUTO_INCREMENT is by 2
--
CREATE SEQUENCE groups_id_seq INCREMENT BY 2;
ALTER TABLE groups
ALTER COLUMN id
SET DEFAULT NEXTVAL('groups_id_seq'); 


--
-- Table structure for table `Groups`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `Groups`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Groups` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `MonitorIds` tinytext NOT NULL,
--	  PRIMARY KEY (`Id`)
--	) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
