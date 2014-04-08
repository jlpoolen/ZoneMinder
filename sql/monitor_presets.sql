DROP TABLE IF EXISTS monitor_presets;
DROP VIEW IF EXISTS "MonitorPresets";

CREATE TABLE monitor_presets (
  id int PRIMARY KEY,
  name text 		NOT NULL DEFAULT '',
  monitor_source text   NOT NULL
     CONSTRAINT monitor_presents_source_fk 
     REFERENCES stream_sources(name),
  device text,
  channel text,
  format int 			 DEFAULT NULL,
  protocol varchar(16)		 DEFAULT NULL,
  method varchar(16) 		 DEFAULT NULL,
  host text 			 DEFAULT NULL,
  port text 			 DEFAULT NULL,
  path text 			 DEFAULT NULL,
  subpath text 			 DEFAULT NULL,
  width int 			 DEFAULT NULL,
  height int 			 DEFAULT NULL,
  palette int 			 DEFAULT NULL,
  max_fps decimal(10,2) 	 DEFAULT NULL,
  controllable int 	NOT NULL DEFAULT 0,
  control_id text 		 DEFAULT NULL,
  control_device text 		 DEFAULT NULL,
  control_address text 		 DEFAULT NULL,
  default_rate int 	NOT NULL DEFAULT 100,
  default_scale int 	NOT NULL DEFAULT 100
);

CREATE VIEW "MonitorPresets" AS
SELECT
  id              AS "Id",
  name            AS "Name",
  monitor_source  AS "Type",
  device          AS "Device",
  channel         AS "Channel",
  format          AS "Format",
  protocol        AS "Protocol",
  method          AS "Method",
  host            AS "Host",
  port            AS "Port",
  path            AS "Path",
  subpath         AS "SubPath",
  width           AS "Width",
  height          AS "Height",
  palette         AS "Pallete",
  max_fps         AS "MaxFPS",
  controllable    AS "Controllable",
  control_id      AS "ControlId",
  control_device  AS "ControlDevice",
  control_address AS "ControlAddress",
  default_rate    AS "DefaultRate",
  default_scale   AS "DefaultScale"
FROM monitor_presets;

CREATE SEQUENCE monitor_presets_id_seq;
ALTER TABLE groups
ALTER COLUMN id
SET DEFAULT NEXTVAL('monitor_presets_id_seq'); 


--
-- Table structure for table `MonitorPresets`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `MonitorPresets`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `MonitorPresets` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `Type` enum('Local','Remote','File','Ffmpeg','Libvlc','cURL') NOT NULL DEFAULT 'Local',
--	  `Device` tinytext,
--	  `Channel` tinytext,
--	  `Format` int(10) unsigned DEFAULT NULL,
--	  `Protocol` varchar(16) DEFAULT NULL,
--	  `Method` varchar(16) DEFAULT NULL,
--	  `Host` varchar(64) DEFAULT NULL,
--	  `Port` varchar(8) DEFAULT NULL,
--	  `Path` varchar(255) DEFAULT NULL,
--	  `SubPath` varchar(64) DEFAULT NULL,
--	  `Width` smallint(5) unsigned DEFAULT NULL,
--	  `Height` smallint(5) unsigned DEFAULT NULL,
--	  `Palette` int(10) unsigned DEFAULT NULL,
--	  `MaxFPS` decimal(5,2) DEFAULT NULL,
--	  `Controllable` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `ControlId` varchar(16) DEFAULT NULL,
--	  `ControlDevice` varchar(255) DEFAULT NULL,
--	  `ControlAddress` varchar(255) DEFAULT NULL,
--	  `DefaultRate` smallint(5) unsigned NOT NULL DEFAULT '100',
--	  `DefaultScale` smallint(5) unsigned NOT NULL DEFAULT '100',
--	  PRIMARY KEY (`Id`)
--	) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
