--
-- PostgreSQL does not support the "ON UPDATE" feature
-- that MySQL has.  Here's the work-around
--
DROP VIEW  IF EXISTS "Frames";
DROP TABLE IF EXISTS frames;
DROP TABLE IF EXISTS frames_type;

CREATE TABLE frame_types (
  id int PRIMARY KEY,
  name text UNIQUE
);
INSERT INTO frame_types (id, name) VALUES (1,'Normal');
INSERT INTO frame_types (id, name) VALUES (2,'Bulk');
INSERT INTO frame_types (id, name) VALUES (3,'Alarm');

--
-- Note: we're adding a static "created_at"
-- and then directing the old "TimeStamp" col to "updated_at"
--
CREATE TABLE frames (
  event_id int         NOT NULL DEFAULT '0',
  frame_id int         NOT NULL DEFAULT '0',
  frame_type text      NOT NULL DEFAULT  'Normal' 
    CONSTRAINT frame_type_FK
    REFERENCES frame_types(name),
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  delta decimal(8,2)   NOT NULL DEFAULT 0.00,
  score int            NOT NULL DEFAULT 0,
  CONSTRAINT frames_event_frame_PK 
    PRIMARY KEY (event_id, frame_id)
);

CREATE VIEW "Frames" AS
SELECT 
    event_id   AS "EventId",
    frame_id   AS "FrameId",
    frame_type AS "Type",
    score      AS "Score",
    delta      AS "Delta",
    updated_at AS "TimeStamp"
FROM frames;
--
-- Below we provide the automatic updating feature from MySQL
--
CREATE OR REPLACE FUNCTION auto_updated() 
RETURNS TRIGGER AS
   ' BEGIN NEW.updated_at = NOW(); 
    RETURN NEW; 
    END; '
LANGUAGE 'plpgsql';  
     
CREATE TRIGGER auto_update_trigger 
BEFORE UPDATE ON frames 
FOR EACH ROW EXECUTE PROCEDURE auto_updated(); 

CREATE INDEX frames_type_index       ON frames(frame_type);
CREATE INDEX frames_time_stamp_index ON frames(updated_at);


--
-- Table structure for table `Frames`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `Frames`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Frames` (
--	  `EventId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `FrameId` int(10) unsigned NOT NULL DEFAULT '0',
--	  `Type` enum('Normal','Bulk','Alarm') NOT NULL DEFAULT 'Normal',
--	  `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--	  `Delta` decimal(8,2) NOT NULL DEFAULT '0.00',
--	  `Score` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  PRIMARY KEY (`EventId`,`FrameId`),
--	  KEY `Type` (`Type`),
--	  KEY `TimeStamp` (`TimeStamp`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
