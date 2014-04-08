--
-- See controls.sql for ancillay table:
--    stream_sources
-- loads except that "Triggers" needs to be dealt with
--

DROP VIEW     IF EXISTS "Monitors";
DROP TABLE    IF EXISTS monitors;
DROP SEQUENCE IF EXISTS monitors_id_seq;
DROP TABLE    IF EXISTS monitor_functions;
DROP TABLE    IF EXISTS monitor_orientations;
DROP TABLE    IF EXISTS monitor_view_types;
DROP TABLE    IF EXISTS trigger_types;

CREATE TABLE trigger_types(
       name varchar(30) PRIMARY KEY
);
INSERT INTO trigger_types VALUES ('X10');

CREATE TABLE monitor_functions (
  name varchar(30) PRIMARY KEY
);
INSERT INTO monitor_functions
VALUES ('None'),('Monitor'),('Modect'),
('Record'),('Mocord'),('Nodect');

CREATE TABLE monitor_orientations (
  name varchar(30) PRIMARY KEY
);
INSERT INTO monitor_orientations
VALUES ('0'),('90'),('180'),('270'),
('hori'),('vert');

CREATE TABLE monitor_view_types (
   name varchar(30) PRIMARY KEY
);
INSERT INTO monitor_view_types
VALUES ('Events'),('Control'); 


CREATE TABLE monitors (
  id int PRIMARY KEY,
  name text                           NOT NULL DEFAULT '',
  monitor_type varchar(20)
    CONSTRAINT monitors_type_fk
    REFERENCES stream_sources(name)
                                      NOT NULL,
  monitor_function varchar(30)
   CONSTRAINT monitors_function_fk
   REFERENCES monitor_functions(name)
                                      NOT NULL,
  enabled int                         NOT NULL DEFAULT '1',
  linked_monitors text                NOT NULL DEFAULT '',
  triggers text
    CONSTRAINT monitors_trigger_types_fk
    REFERENCES trigger_types(name)
                                      NOT NULL DEFAULT 'X10',
  devices text                        NOT NULL DEFAULT '',
  channel int                         NOT NULL DEFAULT '0',
  monitor_format int                  NOT NULL DEFAULT '0',
  protocol varchar(16)                NOT NULL DEFAULT '',
  method varchar(16)                  NOT NULL DEFAULT '',
  host varchar(64)                    NOT NULL DEFAULT '',
  port varchar(8)                     NOT NULL DEFAULT '',
  subpath varchar(64)                 NOT NULL DEFAULT '',
  path varchar(255)                   NOT NULL DEFAULT '',
  username varchar(64)                NOT NULL DEFAULT '',
  password varchar(64)                NOT NULL DEFAULT '',
  width int                           NOT NULL DEFAULT '0',
  height int                          NOT NULL DEFAULT '0',
  colors int                          NOT NULL DEFAULT '1',
  palette int                         NOT NULL DEFAULT '0',
  orientation varchar(30)
    CONSTRAINT monitor_orientation_fk
    REFERENCES monitor_orientations(name)
                                      NOT NULL DEFAULT '0',
  deinterlacing int                   NOT NULL DEFAULT '0',
  brightness int                      NOT NULL DEFAULT '-1',
  contrast int                        NOT NULL DEFAULT '-1',
  hue int                             NOT NULL DEFAULT '-1',
  color int                           NOT NULL DEFAULT '-1',
  event_prefix varchar(32)            NOT NULL DEFAULT 'Event-',
  label_format varchar(64)            NOT NULL DEFAULT '%N - %y/%m/%d %H:%M:%S',
  label_x int                         NOT NULL DEFAULT '0',
  label_y int                         NOT NULL DEFAULT '0',
  image_buffer_count int              NOT NULL DEFAULT '100',
  warmup_count int                    NOT NULL DEFAULT '25',
  pre_event_count int                 NOT NULL DEFAULT '10',
  post_event_count int                NOT NULL DEFAULT '10',
  stream_replay_buffer int            NOT NULL DEFAULT '1000',
  alarm_frame_count int               NOT NULL DEFAULT '1',
  section_length int                  NOT NULL DEFAULT '600',
  frame_skip int                      NOT NULL DEFAULT '0',
  max_fps decimal(5,2)                         DEFAULT NULL,
  alarm_max_fps decimal(5,2)                   DEFAULT NULL,
  fps_report_interval int             NOT NULL DEFAULT '250',
  ref_blend_perc int                  NOT NULL DEFAULT '6',
  alarm_ref_blend_perc int            NOT NULL DEFAULT '6',
  controllable int                    NOT NULL DEFAULT '0',
  control_id int                      NOT NULL DEFAULT '0',
  control_device varchar(255)                  DEFAULT NULL,
  control_address varchar(255)                 DEFAULT NULL,
  auto_stop_timeout decimal(5,2)               DEFAULT NULL,
  track_motion int                    NOT NULL DEFAULT '0',
  track_delay int                     NOT NULL DEFAULT '0',
  return_location int                 NOT NULL DEFAULT '-1',
  return_delay int                    NOT NULL DEFAULT '0',
  default_view varchar(30)
    CONSTRAINT monitor_default_view_type_fk
    REFERENCES monitor_view_types(name)
                                      NOT NULL DEFAULT 'Events',
  default_rate int                    NOT NULL DEFAULT '100',
  default_scale int                   NOT NULL DEFAULT '100',
  signal_check_colour varchar(32)     NOT NULL DEFAULT '#0000BE',
  web_colour varchar(32)              NOT NULL DEFAULT 'red',
  monitor_sequence int                         DEFAULT NULL
);

--
-- Why 5?
--
CREATE SEQUENCE monitors_id_seq INCREMENT BY  5;
ALTER TABLE monitors
ALTER COLUMN id
SET DEFAULT NEXTVAL('monitors_id_seq');

CREATE VIEW "Monitors" as
SELECT
  id                   AS "Id",
  name                 AS "Name", 
  monitor_type         AS "Type",
  monitor_function     AS "Function",
  enabled              AS "Enabled",
  linked_monitors      AS "LinkedMonitors",
  triggers             AS "Triggers",
  devices              AS "Devices",
  channel              AS "Channel",
  monitor_format       AS "Format",
  protocol             AS "Protocol",
  method               AS "Method",
  host                 AS "Host",
  port                 AS "Port",
  subpath              AS "SubPath",
  path                 AS "Path",
  username             AS "User",
  password             AS "Pass",
  width                AS "Width",
  height               AS "Height",
  colors               AS "Colours",
  palette              AS "Palette",
  orientation          AS "Orientation",
  deinterlacing        AS "Deinterlacing",
  brightness           AS "Brightness",
  contrast             AS "Contrast",
  hue                  AS "Hue",
  color                AS "Colour",
  event_prefix         AS "EventPrefix",
  label_format         AS "LabelFormat",
  label_x              AS "LabelX",
  label_y              AS "LabelY",
  image_buffer_count   AS "ImageBufferCount",
  warmup_count         AS "WarmupCount",
  pre_event_count      AS "PreEventCount",
  post_event_count     AS "PostEventCount",
  stream_replay_buffer AS "StreamReplayBuffer",
  alarm_frame_count    AS "AlarmFrameCount",
  section_length       AS "SectionLength",
  frame_skip           AS "FrameSkip",
  max_fps              AS "MaxFPS",
  alarm_max_fps        AS "AlarmMaxFPS",
  fps_report_interval  AS "FPSReportInterval",
  ref_blend_perc       AS "RefBlendPerc",
  alarm_ref_blend_perc AS "AlarmRefBlendPerc",
  controllable         AS "Controllable",
  control_id           AS "ControlId",
  control_device       AS "ControlDevice",
  control_address      AS "ControlAddress",
  auto_stop_timeout    AS "AutoStopTimeout",
  track_motion         AS "TrackMotion",
  track_delay          AS "TrackDelay",
  return_location      AS "ReturnLocation",
  return_delay         AS "ReturnDelay",
  default_view         AS "DefaultView",
  default_rate         AS "DefaultRate",
  default_scale        AS "DefaultScale",
  signal_check_colour  AS "SignalCheckColour",
  web_colour           AS "WebColour",
  monitor_sequence     AS "Sequence"
FROM monitors;

--
-- Table structure for table `Monitors`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `Monitors`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Monitors` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `Type` enum('Local','Remote','File','Ffmpeg','Libvlc','cURL') NOT NULL DEFAULT 'Local',
--	  `Function` enum('None','Monitor','Modect','Record','Mocord','Nodect') NOT NULL DEFAULT 'Monitor',
--	  `Enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
--	  `LinkedMonitors` varchar(255) NOT NULL DEFAULT '',
--	  `Triggers` set('X10') NOT NULL DEFAULT '',
--	  `Device` varchar(64) NOT NULL DEFAULT '',
--	  `Channel` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Format` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Protocol` varchar(16) NOT NULL DEFAULT '',
--	  `Method` varchar(16) NOT NULL DEFAULT '',
--	  `Host` varchar(64) NOT NULL DEFAULT '',
--	  `Port` varchar(8) NOT NULL DEFAULT '',
--	  `SubPath` varchar(64) NOT NULL DEFAULT '',
--	  `Path` varchar(255) NOT NULL DEFAULT '',
--	  `User` varchar(64) NOT NULL DEFAULT '',
--	  `Pass` varchar(64) NOT NULL DEFAULT '',
--	  `Width` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `Height` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `Colours` tinyint(3) unsigned NOT NULL DEFAULT '1',
--	  `Palette` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Orientation` enum('0','90','180','270','hori','vert') NOT NULL DEFAULT '0',
--	  `Deinterlacing` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Brightness` mediumint(7) NOT NULL DEFAULT '-1',
--	  `Contrast` mediumint(7) NOT NULL DEFAULT '-1',
--	  `Hue` mediumint(7) NOT NULL DEFAULT '-1',
--	  `Colour` mediumint(7) NOT NULL DEFAULT '-1',
--	  `EventPrefix` varchar(32) NOT NULL DEFAULT 'Event-',
--	  `LabelFormat` varchar(64) NOT NULL DEFAULT '%N - %y/%m/%d %H:%M:%S',
--	  `LabelX` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `LabelY` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `ImageBufferCount` smallint(5) unsigned NOT NULL DEFAULT '100',
--	  `WarmupCount` smallint(5) unsigned NOT NULL DEFAULT '25',
--	  `PreEventCount` smallint(5) unsigned NOT NULL DEFAULT '10',
--	  `PostEventCount` smallint(5) unsigned NOT NULL DEFAULT '10',
--	  `StreamReplayBuffer` int(10) unsigned NOT NULL DEFAULT '1000',
--	  `AlarmFrameCount` smallint(5) unsigned NOT NULL DEFAULT '1',
--	  `SectionLength` int(10) unsigned NOT NULL DEFAULT '600',
--	  `FrameSkip` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `MaxFPS` decimal(5,2) DEFAULT NULL,
--	  `AlarmMaxFPS` decimal(5,2) DEFAULT NULL,
--	  `FPSReportInterval` smallint(5) unsigned NOT NULL DEFAULT '250',
--	  `RefBlendPerc` tinyint(3) unsigned NOT NULL DEFAULT '6',
--	  `AlarmRefBlendPerc` tinyint(3) unsigned NOT NULL DEFAULT '6',
--	  `Controllable` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `ControlId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `ControlDevice` varchar(255) DEFAULT NULL,
--	  `ControlAddress` varchar(255) DEFAULT NULL,
--	  `AutoStopTimeout` decimal(5,2) DEFAULT NULL,
--	  `TrackMotion` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `TrackDelay` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `ReturnLocation` tinyint(3) NOT NULL DEFAULT '-1',
--	  `ReturnDelay` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `DefaultView` enum('Events','Control') NOT NULL DEFAULT 'Events',
--	  `DefaultRate` smallint(5) unsigned NOT NULL DEFAULT '100',
--	  `DefaultScale` smallint(5) unsigned NOT NULL DEFAULT '100',
--	  `SignalCheckColour` varchar(32) NOT NULL DEFAULT '#0000BE',
--	  `WebColour` varchar(32) NOT NULL DEFAULT 'red',
--	  `Sequence` smallint(5) unsigned DEFAULT NULL,
--	  PRIMARY KEY (`Id`)
--	) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;

