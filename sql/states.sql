DROP VIEW IF EXISTS "States";
DROP TABLE IF EXISTS states;

CREATE TABLE states (
  name varchar(64) UNIQUE NOT NULL DEFAULT '',
  definition text         NOT NULL
);

CREATE VIEW "States" AS
SELECT
  name       AS "Name",
  definition AS "Definition"
FROM states;

--
-- Table structure for table `States`
--  Dump completed on 2014-03-28 21:55:44
--
--     DROP TABLE IF EXISTS `States`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `States` (
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `Definition` text NOT NULL,
--	  PRIMARY KEY (`Name`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
