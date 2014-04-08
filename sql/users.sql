
DROP VIEW  IF EXISTS "Users";
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS privileges;

CREATE TABLE privileges (
id int PRIMARY KEY,
privilege text UNIQUE
);
INSERT INTO privileges (id, privilege)
VALUES (1,'None'),(2,'View'),(3,'Edit');


CREATE TABLE users (
  id int PRIMARY KEY,
  user_name text 
   CONSTRAINT user_name_unique UNIQUE 
                       NOT NULL,
  password varchar(64) NOT NULL,
  language varchar(8)  NOT NULL DEFAULT '',
  enabled int          NOT NULL DEFAULT 1,
  stream varchar(30) 
    CONSTRAINT users_stream_privilege_FK
    REFERENCES privileges(privilege)  
                       NOT NULL DEFAULT 'None',
  events varchar(30) 
    CONSTRAINT users_events_privilege_FK
    REFERENCES privileges(privilege) 
                       NOT NULL DEFAULT 'None',
  control varchar(30) 
    CONSTRAINT users_control_privilege_FK
    REFERENCES privileges(privilege) 
                       NOT NULL DEFAULT 'None',
  monitors varchar(30) 
    CONSTRAINT users_monitors_privilege_FK
    REFERENCES privileges(privilege) 
                       NOT NULL DEFAULT 'None',
  devices varchar(30) 
    CONSTRAINT users_devices_privilege_FK
    REFERENCES privileges(privilege) 
                       NOT NULL DEFAULT 'None',
  system varchar(30) 
    CONSTRAINT system_devices_privilege_FK
    REFERENCES privileges(privilege) 
                       NOT NULL DEFAULT 'None',
  max_bandwith varchar(16) 
                       NOT NULL DEFAULT '',
  monitor_ids text     NOT NULL

);

DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq START 100;
ALTER TABLE users
  ALTER COLUMN id
  SET DEFAULT NEXTVAL('users_id_seq');

CREATE VIEW "Users" AS
SELECT 
  id           AS "Id",
  user_name    AS "Username",
  password     AS "Password",
  language     AS "Language",
  enabled      AS "Enabled",
  stream       AS "Stream",
  events       AS "Events",
  control      AS "Control",
  monitors     AS "Monitors",
  devices      AS "Devices",
  system       AS "System",
  max_bandwith AS "MaxBandwidth",
  monitor_ids  AS "MonitorIds"
FROM users;

--
-- Table structure for table `Users`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `Users`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Users` (
--	  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--	  `Username` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
--	  `Password` varchar(64) NOT NULL DEFAULT '',
--	  `Language` varchar(8) NOT NULL DEFAULT '',
--	  `Enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
--	  `Stream` enum('None','View') NOT NULL DEFAULT 'None',
--	  `Events` enum('None','View','Edit') NOT NULL DEFAULT 'None',
--	  `Control` enum('None','View','Edit') NOT NULL DEFAULT 'None',
--	  `Monitors` enum('None','View','Edit') NOT NULL DEFAULT 'None',
--	  `Devices` enum('None','View','Edit') NOT NULL DEFAULT 'None',
--	  `System` enum('None','View','Edit') NOT NULL DEFAULT 'None',
--	  `MaxBandwidth` varchar(16) NOT NULL DEFAULT '',
--	  `MonitorIds` tinytext NOT NULL,
--	  PRIMARY KEY (`Id`),
--	  UNIQUE KEY `UC_Username` (`Username`)
--	) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
