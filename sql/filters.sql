DROP TABLE IF EXISTS filters;
DROP VIEW IF EXISTS Filters;

CREATE TABLE filters (
  name varchar(64) PRIMARY KEY,
  query text       NOT NULL,
  auto_archive int NOT NULL DEFAULT '0',
  auto_video int   NOT NULL DEFAULT '0',
  auto_upload int  NOT NULL DEFAULT '0',
  auto_email int   NOT NULL DEFAULT '0',
  auto_message int NOT NULL DEFAULT '0',
  auto_execute int NOT NULL DEFAULT '0',
  auto_execute_cmd text,
  auto_delete int  NOT NULL DEFAULT '0',
  background int   NOT NULL DEFAULT '0'
);

CREATE VIEW "Filters" as
  SELECT
    name           as "Name",
    query          as "Query",
    auto_archive   as "AutoArchive",
    auto_video     as "AutoVideo",
    auto_upload    as "AutoUpload",
    auto_email     as "AutoEmail",
    auto_message   as "AutoExecute",
    auto_execute   as "AutoExecuteCmd",
    auto_delete    as "AutoDelete",
    background     as "Background"
  FROM filters;

--
-- Table structure for table `Filters`
--  Dump completed on 2014-03-28 21:55:44
--
--	DROP TABLE IF EXISTS `Filters`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Filters` (
--	  `Name` varchar(64) NOT NULL DEFAULT '',
--	  `Query` text NOT NULL,
--	  `AutoArchive` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `AutoVideo` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `AutoUpload` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `AutoEmail` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `AutoMessage` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `AutoExecute` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `AutoExecuteCmd` tinytext,
--	  `AutoDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Background` tinyint(1) unsigned NOT NULL DEFAULT '0',
--	  PRIMARY KEY (`Name`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
