--
-- Master table creation script for ZoneMinder in PostgreSQL
-- assumes you are connected to the database specified for
-- for ZoneMinder, e.g. zoneminder.
--
-- presumes you are in the .../ZoneMinder/sql folder
--
-- use this line after logging into postgres from /sql directory
--   \i zm_postgresql_create_tables.sql
--

--
-- Below are individual line items that may be
-- activated as desired
--
-- \i devices.sql
-- \i controls.sql
-- \i control_presets.sql
-- \i config.sql
-- \i events.sql
-- \i filters.sql
-- \i frames.sql
-- \i groups.sql
-- \i logs.sql
-- \i monitor_presets.sql
 \i monitors.sql
-- \i states.sql
-- \i stats.sql
-- \i triggers_x10.sql
-- \i users.sql
-- \i zone_presets.sql
-- \i zones.sql
--
-- unREM below to isolate whatever scripts above
--
 \q

--
-- Below is the standard install
-- 

\i devices.sql
\i controls.sql
\i control_presets.sql
\i config.sql
\i events.sql
\i filters.sql
\i frames.sql
\i groups.sql
\i logs.sql
\i monitor_presets.sql
\i monitors.sql
\i states.sql
\i stats.sql
\i triggers_x10.sql
\i users.sql
\i zone_presets.sql
\i zones.sql
