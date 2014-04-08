DROP VIEW IF EXISTS "Logs";
DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
  time_key decimal(16,6) NOT NULL,
  component text         NOT NULL,
  pid int                         DEFAULT NULL,
  level int              NOT NULL,
  code text              NOT NULL,
  message text           NOT NULL,
  file text              NOT NULL,
  line int                         DEFAULT NULL
);

CREATE INDEX logs_time_key_index ON logs(time_key);

CREATE VIEW "Logs" AS
SELECT
  time_key  AS "TimeKey",
  component AS "Component",
  pid       AS "Pid",
  level     AS "Level",
  code      AS "Code",
  message   AS "Message",
  file      AS "File",
  line      AS "Line"
FROM logs;


--
-- Table structure for table `Logs`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `Logs`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Logs` (
--	  `TimeKey` decimal(16,6) NOT NULL,
--	  `Component` varchar(32) NOT NULL,
--	  `Pid` smallint(6) DEFAULT NULL,
--	  `Level` tinyint(3) NOT NULL,
--	  `Code` char(3) NOT NULL,
--	  `Message` text NOT NULL,
--	  `File` varchar(255) DEFAULT NULL,
--	  `Line` smallint(5) unsigned DEFAULT NULL,
--	  KEY `TimeKey` (`TimeKey`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
