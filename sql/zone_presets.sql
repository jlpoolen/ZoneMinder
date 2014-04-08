CREATE TABLE zone_presets_types (
name varchar(30) PRIMARY KEY
);
INSERT INTO zone_presets_types (name)
VALUES
('Active'),
('Inclusive'),
('Exclusive'),
('Preclusive'),
('Inactive');

CREATE TABLE zone_presets_units (
  name varchar(30) PRIMARY KEY
);
INSERT INTO zone_presets_units (name)
VALUES ('Pixels'), ('Percent');

CREATE TABLE zone_presets_check_methods (
  method varchar(30) PRIMARY KEY
);
INSERT INTO zone_presets_check_methods(method)
VALUES 
('AlarmedPixels'), 
('FilteredPixels'),
('Blobs');

DROP VIEW IF EXISTS "ZonePresets";
DROP TABLE IF EXISTS zone_presets;

CREATE TABLE zone_presets (
  id int PRIMARY KEY,
  name varchar(64)     NOT NULL DEFAULT '',
  zone_preset_type varchar(30)
   REFERENCES zone_presets_types(name)
                       NOT NULL DEFAULT 'Active',
  units varchar(30)
   REFERENCES zone_presets_units(name)
                       NOT NULL DEFAULT 'Pixels',
  check_method varchar(30)
    REFERENCES zone_presets_check_methods(method)
                       NOT NULL DEFAULT 'Blobs',
  min_pixel_threshold int       DEFAULT NULL,
  max_pixel_threshold int       DEFAULT NULL,
  min_alarm_pixels int          DEFAULT NULL,
  max_alarm_pixels int          DEFAULT NULL,
  filter_X int                  DEFAULT NULL,
  filter_Y int                  DEFAULT NULL,
  min_filter_pixels int         DEFAULT NULL,
  max_filter_pixels int         DEFAULT NULL,
  min_blob_pixels int           DEFAULT NULL,
  max_blob_pixels int           DEFAULT NULL,
  min_blobs int                 DEFAULT NULL,
  max_blobs int                 DEFAULT NULL,
  overload_frames int  NOT NULL DEFAULT '0'
);

CREATE SEQUENCE zone_preset_id_seq;
ALTER TABLE zone_presets
ALTER COLUMN id
SET DEFAULT NEXTVAL('zone_preset_id_seq');

CREATE VIEW "ZonePresets" AS
SELECT 
  id                  AS "Id",
  name                AS "Name",
  zone_preset_type    AS "Type",
  units               AS "Units",
  check_method        AS "CheckMethod",
  min_pixel_threshold AS "MinPixelThreshold",
  max_pixel_threshold AS "MaxPixelThreshold",
  min_alarm_pixels    AS "MinAlarmPixels",
  max_alarm_pixels    AS "MaxAlarmPixels",
  filter_X            AS "FilterX",
  filter_Y            AS "FilterY",
  min_filter_pixels   AS "MinFilterPixels",
  max_filter_pixels   AS "MaxFilterPixels",
  min_blob_pixels     AS "MinBlobPixels",
  max_blob_pixels     AS "MaxBlobPixels",
  min_blobs           AS "MinBlobs",
  max_blobs           AS "MaxBlobs",
  overload_frames     AS "OverloadFrames"  
FROM zone_presets;

--
-- Table structure for table `ZonePresets`
--
--	DROP TABLE IF EXISTS `ZonePresets`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `ZonePresets` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `Type` enum('Active','Inclusive','Exclusive','Preclusive','Inactive') NOT NULL DEFAULT 'Active',
--	  `Units` enum('Pixels','Percent') NOT NULL DEFAULT 'Pixels',
--	  `CheckMethod` enum('AlarmedPixels','FilteredPixels','Blobs') NOT NULL DEFAULT 'Blobs',
--	  `MinPixelThreshold` smallint(5) unsigned DEFAULT NULL,
--	  `MaxPixelThreshold` smallint(5) unsigned DEFAULT NULL,
--	  `MinAlarmPixels` int(10) unsigned DEFAULT NULL,
--	  `MaxAlarmPixels` int(10) unsigned DEFAULT NULL,
--	  `FilterX` tinyint(3) unsigned DEFAULT NULL,
--	  `FilterY` tinyint(3) unsigned DEFAULT NULL,
--	  `MinFilterPixels` int(10) unsigned DEFAULT NULL,
--	  `MaxFilterPixels` int(10) unsigned DEFAULT NULL,
--	  `MinBlobPixels` int(10) unsigned DEFAULT NULL,
--	  `MaxBlobPixels` int(10) unsigned DEFAULT NULL,
--	  `MinBlobs` smallint(5) unsigned DEFAULT NULL,
--	  `MaxBlobs` smallint(5) unsigned DEFAULT NULL,
--	  `OverloadFrames` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  PRIMARY KEY (`Id`)
--	) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
--
