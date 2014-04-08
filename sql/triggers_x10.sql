
DROP VIEW IF EXISTS "TriggersX10";
DROP TABLE IF EXISTS triggers_x10;

CREATE TABLE triggers_x10 (
  monitor_id int           PRIMARY KEY DEFAULT '0',
  activation varchar(32)               DEFAULT NULL,
  alarm_input varchar(32)              DEFAULT NULL,
  alarm_output varchar(32)             DEFAULT NULL
);

CREATE VIEW "TriggersX10" AS
SELECT
  monitor_id   AS "MonitorId",
  activation   AS "Activation",
  alarm_input  AS "AlarmInput",
  alarm_output AS "AlarmOutput"
FROM triggers_x10;


--
-- Table structure for table `TriggersX10`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `TriggersX10`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `TriggersX10` (
--	  `MonitorId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Activation` varchar(32) DEFAULT NULL,
--	  `AlarmInput` varchar(32) DEFAULT NULL,
--	  `AlarmOutput` varchar(32) DEFAULT NULL,
--	  PRIMARY KEY (`MonitorId`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
