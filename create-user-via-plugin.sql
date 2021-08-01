-- Install the Plugin

INSTALL SONAME 'auth_ed25519';

UNINSTALL SONAME 'auth_ed25519';

INSTALL PLUGIN 'auth_ed25519';

--Create Users via plugin

CREATE USER 'lava_sr'@'localhost' IDENTIFIED VIA ed25519 USING PASSWORD('secret');

-- SQL_MODE does not have NO_AUTO_CREATE_USER set, then you can also create via GRANT.CREATE
GRANT SELECT ON *.* TO 'lava_sr'@'localhost' IDENTIFIED VIA ed25519 USING PASSWORD('secret');

--old version of mysql or MariaDB, the PASSWORD() function and SET PASSWORD
--create FUNCTION
CREATE FUNCTION ed25519_password RETURNS STRING SONAME "auth_ed25519.so";


-- Calulate a password hash by executing:
SELECT ed25519_password("secrect");
--ZIgUREUg5PVgQ6LskhXmO+eZLS0nC8be6HPjYWR4YJY

ALTER USER 'lava_sr'@'localhost' IDENTIFIED VIA ed25519 USING 'ZIgUREUg5PVgQ6LskhXmO+eZLS0nC8be6HPjYWR4YJY';


-- List Users with their plugins:
SELECT USER, plugin FROM mysql.user;
select USER, plugin , host, ssl_type FROM mysql.user;

SELECT USER, plugin, host FROM mysql.user;

--SQL statement shows the CREATE USER statement that creates the named user called lava_sr
SHOW CREATE USER 'admin';
SHOW CREATE USER 'lava_sr';


