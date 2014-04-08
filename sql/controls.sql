DROP VIEW  IF EXISTS "Controls";
DROP TABLE IF EXISTS controls;
DROP TABLE IF EXISTS stream_sources;
--
-- stream_sources was derived from Controls
-- where originally the values were established
-- in a MySQL enum clause
-- Since the numer is very limited, we'll
-- use hand-numbering for the id
--
CREATE TABLE stream_sources (
  id int PRIMARY KEY,
  name varchar(20) CONSTRAINT stream_sources_name_unique UNIQUE
);

insert into stream_sources
(id,name)
VALUES(1,'Local');

insert into stream_sources
(id,name)
VALUES(2,'Remote');

insert into stream_sources
(id,name)
VALUES(3,'Ffmpeg');

insert into stream_sources
(id,name)
VALUES(4,'Libvlc');

insert into stream_sources
(id,name)
VALUES(5,'cURL');

CREATE TABLE controls (
  id int               NOT NULL PRIMARY KEY,
  name varchar(64)     NOT NULL DEFAULT '',
  control_type varchar(30)
    CONSTRAINT controls_type_fk 
    REFERENCES stream_sources(name)
                       NOT NULL DEFAULT 'local' ,
  protocol varchar(64)          DEFAULT NULL,
  can_wake int         NOT NULL DEFAULT '0',
  can_sleep int        NOT NULL DEFAULT '0',
  can_reset int        NOT NULL DEFAULT '0',
  can_zoom int         NOT NULL DEFAULT '0',
  can_auto_zoom int    NOT NULL DEFAULT '0',
  can_zoom_abs int     NOT NULL DEFAULT '0',
  can_zoom_rel int     NOT NULL DEFAULT '0',
  can_zoom_con int     NOT NULL DEFAULT '0',
  min_zoom_range int            DEFAULT NULL,
  max_zoom_range int            DEFAULT NULL,
  min_zoom_step int             DEFAULT NULL,
  max_zoom_step int             DEFAULT NULL,
  has_zoom_speed int   NOT NULL DEFAULT '0',
  min_zoom_speed int            DEFAULT NULL,
  max_zoom_speed int            DEFAULT NULL,
  can_focus int        NOT NULL DEFAULT '0',
  can_auto_focus int   NOT NULL DEFAULT '0',
  can_focus_abs int    NOT NULL DEFAULT '0',
  can_focus_rel int    NOT NULL DEFAULT '0',
  can_focus_con int    NOT NULL DEFAULT '0',
  min_focus_range int           DEFAULT NULL,
  max_focus_range int           DEFAULT NULL,
  min_focus_step int            DEFAULT NULL,
  max_focus_step int            DEFAULT NULL,
  has_focus_speed int  NOT NULL DEFAULT '0',
  min_focus_speed int           DEFAULT NULL,
  max_focus_speed int           DEFAULT NULL,
  can_iris int         NOT NULL DEFAULT '0',
  can_auto_iris int    NOT NULL DEFAULT '0',
  can_iris_abs int     NOT NULL DEFAULT '0',
  can_iris_rel int     NOT NULL DEFAULT '0',
  can_iris_con int     NOT NULL DEFAULT '0',
  min_iris_range int            DEFAULT NULL,
  max_iris_range int            DEFAULT NULL,
  min_iris_step int             DEFAULT NULL,
  max_iris_step int             DEFAULT NULL,
  has_iris_speed int   NOT NULL DEFAULT '0',
  min_iris_speed int            DEFAULT NULL,
  max_iris_speed int            DEFAULT NULL,
  can_gain int         NOT NULL DEFAULT '0',
  can_auto_gain int    NOT NULL DEFAULT '0',
  can_gain_abs int     NOT NULL DEFAULT '0',
  can_gain_rel int     NOT NULL DEFAULT '0',
  can_gain_con int     NOT NULL DEFAULT '0',
  min_gain_range int            DEFAULT NULL,
  max_gain_range int            DEFAULT NULL,
  min_gain_step int             DEFAULT NULL,
  max_gain_step int             DEFAULT NULL,
  has_gain_speed int   NOT NULL DEFAULT '0',
  min_gain_speed int            DEFAULT NULL,
  max_gain_speed int            DEFAULT NULL,
  can_white int        NOT NULL DEFAULT '0',
  can_auto_white int   NOT NULL DEFAULT '0',
  can_white_abs int    NOT NULL DEFAULT '0',
  can_white_rel int    NOT NULL DEFAULT '0',
  can_white_con int    NOT NULL DEFAULT '0',
  min_white_range int           DEFAULT NULL,
  max_white_range int           DEFAULT NULL,
  min_white_step int            DEFAULT NULL,
  max_white_step int  		DEFAULT NULL,
  has_white_speed int  NOT NULL DEFAULT '0',
  min_white_speed int  		DEFAULT NULL,
  max_white_speed int  		DEFAULT NULL,
  has_presets int      NOT NULL DEFAULT '0',
  num_presets int      NOT NULL DEFAULT '0',
  has_home_preset int  NOT NULL DEFAULT '0',
  can_set_presets int  NOT NULL DEFAULT '0',
  can_move int         NOT NULL DEFAULT '0',
  can_move_diag int    NOT NULL DEFAULT '0',
  can_move_map int     NOT NULL DEFAULT '0',
  can_move_abs int     NOT NULL DEFAULT '0',
  can_move_rel int     NOT NULL DEFAULT '0',
  can_move_con int     NOT NULL DEFAULT '0',
  can_pan int  	       NOT NULL DEFAULT '0',
  min_pan_range int 		DEFAULT NULL,
  max_pan_range int		DEFAULT NULL,
  min_pan_step int 		DEFAULT NULL,
  max_pan_step int 		DEFAULT NULL,
  has_pan_speed int    NOT NULL DEFAULT '0',
  min_pan_speed int 		DEFAULT NULL,
  max_pan_speed int 		DEFAULT NULL,
  has_turbo_pan int    NOT NULL DEFAULT '0',
  turbo_pan_speed int 		DEFAULT NULL,
  can_tilt int         NOT NULL DEFAULT '0',
  min_tilt_range int 		DEFAULT NULL,
  max_tilt_range int 		DEFAULT NULL,
  min_tilt_step int 		DEFAULT NULL,
  max_tilt_step int 		DEFAULT NULL,
  has_tilt_speed int   NOT NULL DEFAULT '0',
  min_tilt_speed int 		DEFAULT NULL,
  max_tilt_speed int 		DEFAULT NULL,
  has_turbo_tilt int   NOT NULL DEFAULT '0',
  turbo_tilt_speed int 		DEFAULT NULL,
  can_auto_scan int    NOT NULL DEFAULT '0',
  num_scan_paths int   NOT NULL DEFAULT '0'
);

DROP SEQUENCE IF EXISTS controls_id_seq;
CREATE SEQUENCE controls_id_seq;
ALTER TABLE controls
  ALTER COLUMN id
  SET DEFAULT NEXTVAL('controls_id_seq');  



DROP VIEW IF EXISTS "Controls";
CREATE VIEW "Controls" as
SELECT
  id                 as "Id",
  name	             as "Name",
  control_type       as "Type",
  protocol           as "Protocol",
  can_wake           as "CanWake",
  can_sleep          as "CanSleep",
  can_reset          as "CanReset",
  can_zoom           as "CanZoom",
  can_auto_zoom      as "CanAutoZoom",
  can_zoom_abs       as "CanZoomAbs",
  can_zoom_rel       as "CanZoomRel",
  can_zoom_con       as "CanZoomCon",
  min_zoom_range     as "MinZoomRange",
  max_zoom_range     as "MaxZoomRange",
  min_zoom_step      as "MinZoomStep",
  max_zoom_step      as "MaxZoomStep",
  has_zoom_speed     as "HasZoomSpeed",
  min_zoom_speed     as "MinZoomSpeed",
  max_zoom_speed     as "MaxZoomSpeed",
  can_focus          as "CanFocus",
  can_auto_focus     as "CanAutoFocus",
  can_focus_abs      as "CanFocusAbs",
  can_focus_rel      as "CanFocusRel",
  can_focus_con      as "CanFocusCon",
  min_focus_range    as "MinFocusRange",
  max_focus_range    as "MaxFocusRange",
  min_focus_step     as "MinFocusStep",
  max_focus_step     as "MaxFocusStep",
  has_focus_speed    as "HasFocusSpeed",
  min_focus_speed    as "MinFocusSpeed",
  max_focus_speed    as "MaxFocusSpeed",
  can_iris           as "CanIris",
  can_auto_iris      as "CanAutoIris",
  can_iris_abs       as "CanIrisAbs",
  can_iris_rel       as "CanIrisRel",
  can_iris_con       as "CanIrisCon",
  min_iris_range     as "MinIrisRange",
  max_iris_range     as "MaxIrisRange",
  min_iris_step      as "MinIrisStep",
  max_iris_step      as "MaxIrisStep",
  has_iris_speed     as "HasIrisSpeed",
  min_iris_speed     as "MinIrisSpeed",
  max_iris_speed     as "MaxIrisSpeed",
  can_gain           as "CanGain",
  can_auto_gain      as "CanAutoGain",
  can_gain_abs       as "CanGainAbs",
  can_gain_rel       as "CanGainRel",
  can_gain_con       as "CanGainCon",
  min_gain_range     as "MinGainRange",
  max_gain_range     as "MaxGainRange",
  min_gain_step      as "MinGainStep",
  max_gain_step      as "MaxGainStep",
  has_gain_speed     as "HasGainSpeed",
  min_gain_speed     as "MinGainSpeed",
  max_gain_speed     as "MaxGainSpeed",
  can_white          as "CanWhite",
  can_auto_white     as "CanAutoWhite",
  can_white_abs      as "CanWhiteAbs",
  can_white_rel      as "CanWhiteRel",
  can_white_con      as "CanWhiteCon",
  min_white_range    as "MinWhiteRange",
  max_white_range    as "MaxWhiteRange",
  min_white_step     as "MinWhiteStep",
  max_white_step     as "MaxWhiteStep",
  has_white_speed    as "HasWhiteSpeed",
  min_white_speed    as "MinWhiteSpeed",
  max_white_speed    as "MaxWhiteSpeed",
  has_presets        as "HasPresets",
  num_presets        as "NumPresets",
  has_home_preset    as "HasHomePreset",
  can_set_presets    as "CanSetPresets",
  can_move           as "CanMove",
  can_move_diag      as "CanMoveDiag",
  can_move_map       as "CanMoveMap",
  can_move_abs       as "CanMoveAbs",
  can_move_rel       as "CanMoveRel",
  can_move_con       as "CanMoveCon",
  can_pan            as "CanPan",
  min_pan_range      as "MinPanRange",
  max_pan_range      as "MaxPanRange",
  min_pan_step       as "MinPanStep",
  max_pan_step       as "MaxPanStep",
  has_pan_speed      as "HasPanSpeed",
  min_pan_speed      as "MinPanSpeed",
  max_pan_speed      as "MaxPanSpeed",
  has_turbo_pan      as "HasTurboPan",
  turbo_pan_speed    as "TurboPanSpeed",
  can_tilt           as "CanTilt",
  min_tilt_range     as "MinTiltRange",
  max_tilt_range     as "MaxTiltRange",
  min_tilt_step      as "MinTiltStep",
  max_tilt_step      as "MaxTiltStep",
  has_tilt_speed     as "HasTiltSpeed",
  min_tilt_speed     as "MinTiltSpeed",
  max_tilt_speed     as "MaxTiltSpeed",
  has_turbo_tilt     as "HasTurboTilt",
  turbo_tilt_speed   as "TurboTiltSpeed",
  can_auto_scan      as "CanAutoScan",
  num_scan_paths     as "NumScanPaths"
FROM controls;

--
-- Table structure for table `Controlts`
--  Dump completed on 2014-03-28 21:55:44
--
--
--	CREATE TABLE `Controls` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `Type` enum('Local','Remote','Ffmpeg','Libvlc','cURL') NOT NULL DEFAULT 'Local',
--	  `Protocol` varchar(64) DEFAULT NULL,
--	  `CanWake` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanSleep` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanReset` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanZoom` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanAutoZoom` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanZoomAbs` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanZoomRel` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanZoomCon` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinZoomRange` int(10) unsigned DEFAULT NULL,
--	  `MaxZoomRange` int(10) unsigned DEFAULT NULL,
--	  `MinZoomStep` int(10) unsigned DEFAULT NULL,
--	  `MaxZoomStep` int(10) unsigned DEFAULT NULL,
--	  `HasZoomSpeed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinZoomSpeed` int(10) unsigned DEFAULT NULL,
--	  `MaxZoomSpeed` int(10) unsigned DEFAULT NULL,
--	  `CanFocus` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanAutoFocus` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanFocusAbs` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanFocusRel` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanFocusCon` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinFocusRange` int(10) unsigned DEFAULT NULL,
--	  `MaxFocusRange` int(10) unsigned DEFAULT NULL,
--	  `MinFocusStep` int(10) unsigned DEFAULT NULL,
--	  `MaxFocusStep` int(10) unsigned DEFAULT NULL,
--	  `HasFocusSpeed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinFocusSpeed` int(10) unsigned DEFAULT NULL,
--	  `MaxFocusSpeed` int(10) unsigned DEFAULT NULL,
--	  `CanIris` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanAutoIris` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanIrisAbs` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanIrisRel` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanIrisCon` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinIrisRange` int(10) unsigned DEFAULT NULL,
--	  `MaxIrisRange` int(10) unsigned DEFAULT NULL,
--	  `MinIrisStep` int(10) unsigned DEFAULT NULL,
--	  `MaxIrisStep` int(10) unsigned DEFAULT NULL,
--	  `HasIrisSpeed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinIrisSpeed` int(10) unsigned DEFAULT NULL,
--	  `MaxIrisSpeed` int(10) unsigned DEFAULT NULL,
--	  `CanGain` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanAutoGain` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanGainAbs` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanGainRel` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanGainCon` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinGainRange` int(10) unsigned DEFAULT NULL,
--	  `MaxGainRange` int(10) unsigned DEFAULT NULL,
--	  `MinGainStep` int(10) unsigned DEFAULT NULL,
--	  `MaxGainStep` int(10) unsigned DEFAULT NULL,
--	  `HasGainSpeed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinGainSpeed` int(10) unsigned DEFAULT NULL,
--	  `MaxGainSpeed` int(10) unsigned DEFAULT NULL,
--	  `CanWhite` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanAutoWhite` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanWhiteAbs` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanWhiteRel` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanWhiteCon` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinWhiteRange` int(10) unsigned DEFAULT NULL,
--	  `MaxWhiteRange` int(10) unsigned DEFAULT NULL,
--	  `MinWhiteStep` int(10) unsigned DEFAULT NULL,
--	  `MaxWhiteStep` int(10) unsigned DEFAULT NULL,
--	  `HasWhiteSpeed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinWhiteSpeed` int(10) unsigned DEFAULT NULL,
--	  `MaxWhiteSpeed` int(10) unsigned DEFAULT NULL,
--	  `HasPresets` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `NumPresets` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `HasHomePreset` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanSetPresets` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanMove` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanMoveDiag` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanMoveMap` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanMoveAbs` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanMoveRel` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanMoveCon` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `CanPan` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinPanRange` int(10) DEFAULT NULL,
--	  `MaxPanRange` int(10) DEFAULT NULL,
--	  `MinPanStep` int(10) DEFAULT NULL,
--	  `MaxPanStep` int(10) DEFAULT NULL,
--	  `HasPanSpeed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinPanSpeed` int(10) DEFAULT NULL,
--	  `MaxPanSpeed` int(10) DEFAULT NULL,
--	  `HasTurboPan` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `TurboPanSpeed` int(10) DEFAULT NULL,
--	  `CanTilt` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinTiltRange` int(10) DEFAULT NULL,
--	  `MaxTiltRange` int(10) DEFAULT NULL,
--	  `MinTiltStep` int(10) DEFAULT NULL,
--	  `MaxTiltStep` int(10) DEFAULT NULL,
--	  `HasTiltSpeed` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `MinTiltSpeed` int(10) DEFAULT NULL,
--	  `MaxTiltSpeed` int(10) DEFAULT NULL,
--	  `HasTurboTilt` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `TurboTiltSpeed` int(10) DEFAULT NULL,
--	  `CanAutoScan` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `NumScanPaths` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  PRIMARY KEY (`Id`)
--	) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
