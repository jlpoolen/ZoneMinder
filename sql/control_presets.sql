DROP VIEW  IF EXISTS "ControlPresets";
DROP TABLE IF EXISTS control_presets;

CREATE TABLE control_presets(
  monitor_id int    NOT NULL DEFAULT '0',
  preset int        NOT NULL DEFAULT '0',
  label varchar(64) NOT NULL DEFAULT '',
  CONSTRAINT control_presets_pk 
    PRIMARY KEY (monitor_id,preset)
);

CREATE VIEW "ControlPresets" AS
SELECT 
    monitor_id AS "MonitorId",
    preset     AS "Preset",
    label      AS "Label"
FROM control_presets

--
-- Table structure for table `ControlPresets`
--  Dump completed on 2014-03-28 21:55:44
--
--
--	CREATE TABLE `ControlPresets` (
--	  `MonitorId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Preset` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Label` varchar(64) NOT NULL DEFAULT '',
--	  PRIMARY KEY (`MonitorId`,`Preset`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
