DROP VIEW  IF EXISTS "Stats";
DROP TABLE IF EXISTS stats;

CREATE TABLE stats (
  monitor_id int     NOT NULL DEFAULT '0',
  zone_id int        NOT NULL DEFAULT '0',
  event_id int       NOT NULL DEFAULT '0',
  frame_id int       NOT NULL DEFAULT '0',
  pixel_diff int     NOT NULL DEFAULT '0',
  alarm_pixels int   NOT NULL DEFAULT '0',
  filter_pixels int  NOT NULL DEFAULT '0',
  blob_pixels int    NOT NULL DEFAULT '0',
  blobs int          NOT NULL DEFAULT '0',
  min_blob_size int  NOT NULL DEFAULT '0',
  max_blob_size int  NOT NULL DEFAULT '0',
  minX int           NOT NULL DEFAULT '0',
  maxX int           NOT NULL DEFAULT '0',
  minY int           NOT NULL DEFAULT '0',
  maxY int           NOT NULL DEFAULT '0',
  score int          NOT NULL DEFAULT '0'
); 

CREATE INDEX stats_events   ON stats(event_id);
CREATE INDEX stats_monitors ON stats(monitor_id);
CREATE INDEX stats_zones    ON stats(zone_id);

CREATE VIEW "Stats" as
SELECT 
  monitor_id     	AS "MonitorId",
  zone_id        	AS "ZoneId",
  event_id       	AS "EventId",
  frame_id       	AS "FrameId",
  pixel_diff     	AS "PixelDiff",
  alarm_pixels   	AS "AlarmPixels",
  filter_pixels  	AS "FilterPixels",
  blob_pixels    	AS "BlobPixels",
  blobs          	AS "Blobs",
  min_blob_size  	AS "MinBlobSize",
  max_blob_size  	AS "MaxBlobSize",
  minX           	AS "MinX",
  maxX           	AS "MaxX",
  minY           	AS "MinY",
  maxY           	AS "MaxY",
  score          	AS "Score"
FROM stats;

--
-- Table structure for table `Stats`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `Stats`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Stats` (
--	  `MonitorId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `ZoneId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `EventId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `FrameId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `PixelDiff` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `AlarmPixels` int(10) unsigned NOT NULL DEFAULT '0',
--	  `FilterPixels` int(10) unsigned NOT NULL DEFAULT '0',
--	  `BlobPixels` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Blobs` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `MinBlobSize` int(10) unsigned NOT NULL DEFAULT '0',
--	  `MaxBlobSize` int(10) unsigned NOT NULL DEFAULT '0',
--	  `MinX` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `MaxX` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `MinY` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `MaxY` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `Score` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  KEY `EventId` (`EventId`),
--	  KEY `MonitorId` (`MonitorId`),
--	  KEY `ZoneId` (`ZoneId`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
