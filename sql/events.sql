DROP VIEW  IF EXISTS "Events";
DROP TABLE IF EXISTS events;


CREATE TABLE events (
  id int               NOT NULL,
  monitor_id int       NOT NULL DEFAULT 0,
  name varchar(64)     NOT NULL DEFAULT '',
  cause varchar(32)    NOT NULL DEFAULT '',
  start_time timestamp          DEFAULT NULL,
  end_time timestamp            DEFAULT NULL,
  width int            NOT NULL DEFAULT 0,
  height int           NOT NULL DEFAULT 0,
  length decimal(10,2) NOT NULL DEFAULT 0.00,
  frames int                    DEFAULT NULL,
  alarm_frames int              DEFAULT NULL,
  tot_score int        NOT NULL DEFAULT 0,
  avg_score int                 DEFAULT 0,
  max_score int                 DEFAULT 0,
  archived int         NOT NULL DEFAULT 0,
  videoed int          NOT NULL DEFAULT 0,
  uploaded int         NOT NULL DEFAULT 0,
  emailed int          NOT NULL DEFAULT 0,
  messaged int         NOT NULL DEFAULT 0,
  executed int         NOT NULL DEFAULT 0,
  notes text,
  CONSTRAINT events_pk 
    PRIMARY KEY(id, monitor_id)
);

CREATE VIEW "Events" AS
SELECT
  id           AS "Id",
  monitor_id   AS "MonitorId",
  name         AS "Name",
  cause        AS "Cause",
  start_time   AS "StartTime",
  end_time     AS "EndTime",
  width        AS "Width",
  height       AS "Height",
  length       AS "Length",
  frames       AS "Frames",
  alarm_frames AS "AlarmFrames",
  tot_score    AS "TotScore",
  avg_score    AS "AvgScore",
  max_score    AS "MaxScore",
  archived     AS "Archived",
  videoed      AS "Videoed",
  uploaded     AS "Uploaded",
  emailed      AS "Emailed",
  messaged     AS "Messaged",
  executed     AS "executed",
  notes        AS "Notes"
FROM events;

--
-- 50 is what was specified in the MySQL export
--
DROP SEQUENCE IF EXISTS events_id_seq;
CREATE SEQUENCE events_id_seq INCREMENT BY 50;
ALTER TABLE events
ALTER COLUMN id
SET DEFAULT NEXTVAL('events_id_seq');

CREATE INDEX events_monitor_id_index ON events(monitor_id);
CREATE INDEX events_start_time_index ON events(start_time);
CREATE INDEX events_frames_index     ON events(frames);
CREATE INDEX events_archived_index   ON events(archived);

--
-- Table structure for table `Events`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `Events`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Events` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `MonitorId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `Cause` varchar(32) NOT NULL DEFAULT '',
--	  `StartTime` datetime DEFAULT NULL,
--	  `EndTime` datetime DEFAULT NULL,
--	  `Width` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `Height` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `Length` decimal(10,2) NOT NULL DEFAULT '0.00',
--	  `Frames` int(10) unsigned DEFAULT NULL,
--	  `AlarmFrames` int(10) unsigned DEFAULT NULL,
--	  `TotScore` int(10) unsigned NOT NULL DEFAULT '0',
--	  `AvgScore` smallint(5) unsigned DEFAULT '0',
--	  `MaxScore` smallint(5) unsigned DEFAULT '0',
--	  `Archived` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Videoed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Uploaded` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Emailed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Messaged` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Executed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Notes` text,
--	  PRIMARY KEY (`Id`,`MonitorId`),
--	  KEY `MonitorId` (`MonitorId`),
--	  KEY `StartTime` (`StartTime`),
--	  KEY `Frames` (`Frames`),
--	  KEY `Archived` (`Archived`)
--	) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
