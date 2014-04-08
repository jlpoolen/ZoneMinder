DROP VIEW IF EXISTS "Config";
DROP TABLE IF EXISTS config;

CREATE TABLE config (
  id int             NOT NULL DEFAULT '0',
  name text          PRIMARY KEY,
  value text         NOT NULL,
  config_type text   NOT NULL,
  default_value text,
  hint text,
  pattern text,
  format text,
  prompt text,
  help_text text,
  category varchar   NOT NULL DEFAULT '',
  read_only int      NOT NULL DEFAULT '0',
  requires text
);

CREATE VIEW "Config" AS
SELECT
    id            AS "Id",
    name          AS "Name",
    value         AS "Value",
    config_type   AS "Type",
    default_value AS "DefaultValue",
    hint          AS "Hint",
    pattern       AS "Pattern",
    format        AS "Format",
    prompt        AS "Prompt",
    help_text     AS "Help",
    category      AS "Category",
    read_only     AS "Readonly",
    requires      AS "Requires"
FROM config;

--
-- Table structure for table `Config`
--  Dump completed on 2014-03-28 21:55:44
--
--
--	DROP TABLE IF EXISTS `Config`;
--	/*!40101 SET @saved_cs_client     = @@character_set_client */;
--	/*!40101 SET character_set_client = utf8 */;
--	CREATE TABLE `Config` (
--	  `Id` smallint(5) unsigned NOT NULL DEFAULT '0',
--	  `Name` varchar(32) NOT NULL DEFAULT '',
--	  `Value` text NOT NULL,
--	  `Type` tinytext NOT NULL,
--	  `DefaultValue` text,
--	  `Hint` tinytext,
--	  `Pattern` tinytext,
--	  `Format` tinytext,
--	  `Prompt` tinytext,
--	  `Help` text,
--	  `Category` varchar(32) NOT NULL DEFAULT '',
--	  `Readonly` tinyint(3) unsigned NOT NULL DEFAULT '0',
--	  `Requires` text,
--	  PRIMARY KEY (`Name`)
--	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--	/*!40101 SET character_set_client = @saved_cs_client */;
--
