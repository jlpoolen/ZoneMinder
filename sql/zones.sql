DROP VIEW     IF EXISTS "Zones";
DROP TABLE    IF EXISTS zones;
DROP SEQUENCE IF EXISTS zones_id_seq;
DROP INDEX    IF EXISTS zones_monitor_id_index;

CREATE TABLE zones (
  id int  PRIMARY KEY,
  monitor_id int       NOT NULL DEFAULT '0',
  name varchar(64)     NOT NULL DEFAULT '',
  zone_type varchar(30)
    CONSTRAINT zones_zone_type_fk
    REFERENCES zone_presets_types(name)
                       NOT NULL DEFAULT 'Active',
  units varchar(30)
    CONSTRAINT zones_units_fk
    REFERENCES zone_presets_units(name)
                       NOT NULL DEFAULT 'pixels',
  num_coords int       NOT NULL DEFAULT '0',
  coords text          NOT NULL,
  area int             NOT NULL DEFAULT '0',
  alarm_RGB int                 DEFAULT '0',
  check_method varchar(30)
	CONSTRAINT aones_check_method_fk
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

CREATE SEQUENCE zones_id_seq;
ALTER TABLE zones
ALTER COLUMN id
SET DEFAULT NEXTVAL('zones_id_seq');

CREATE VIEW "Zones" AS
SELECT
  id	              AS "Id",	
  monitor_id	      AS "MonitorId",	
  name	              AS "Name",	
  zone_type	      AS "Type",	
  units	              AS "Units",	
  num_coords	      AS "NumCoords",	
  coords	      AS "Coords",	
  area	              AS "Area",	
  alarm_RGB	      AS "AlarmRGB",	
  check_method	      AS "CheckMethod",	
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
  min_blobs	      AS "MinBlobs",	
  max_blobs	      AS "MaxBlobs",	
  overload_frames     AS "OverloadFrames"
FROM zones;

CREATE INDEX zones_monitor_id_index ON zones(monitor_id);

--
-- Table structure for table `Zones`
--  Dump completed on 2014-03-28 21:55:44
--
--
--	DROP TABLE IF EXISTS `Zones`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Zones` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `MonitorId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `Type` enum('Active','Inclusive','Exclusive','Preclusive','Inactive') NOT NULL DEFAULT 'Active',
--	  `Units` enum('Pixels','Percent') NOT NULL DEFAULT 'Pixels',
--	  `NumCoords` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Coords` tinytext NOT NULL,
--	  `Area` int(10) unsigned NOT NULL DEFAULT '0',
--	  `AlarmRGB` int(10) unsigned DEFAULT '0',
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
--	  PRIMARY KEY (`Id`),
--	  KEY `MonitorId` (`MonitorId`)
--	  ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
--	  /*!40101 SET character_set_client = @saved_cs_client */;
--	  /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
--	  
