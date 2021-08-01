GRANT ALL PRIVILEGES ON *.* TO 'leela'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'leela'@'localhost';

--The SQL syntax is as follows to grant all privileges on database;
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';

--grant access to user lava
GRANT ALL PRIVILEGES ON *.* TO 'lava'@'10.211.55.0/255.255.255.0' ;

FLUSH PRIVILEGES;

-- Understanding MySQL grants for admin (superuser) account 
--The syntax is:
--GRANT <PERMISSION_TYPE> ON <Database_Name>.<Table_Name> TO '<user_name>'@'<Host_Name (or) Host_Address>';

/*
1. Data USAGE privileges includes: SELECT, INSERT, UPDATE, DELETE and FILE
2. Stucture privileges includes: CREATE, ALTER, INDEX, DROP, CREATE TEMPORARY TABLES, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE, CREATE VIEW, EVENT, and TRIGGER
3. Administration privileges includes: GRANT, SUPER, PROCESS, RELOAD, SHOUTDOWN, SHOW DTABASES, LOCK TABLES, REFERENCES, REPLICATION CLIENT, REPLICATION SLAVE, and CREATE USER
4. SSL privileges includes: REQUIRE NONE, REQUIRE SSL, REQUIRE X509
5. ALL PRIVILEGES: shortcut to grants all privileges to a mysql user account.
*/

GRANT 
    SELECT, 
    INSERT, 
    UPDATE, 
    DELETE 
ON mydb.t1 
TO 'lava'@'10.211.55.0/255.255.255.0';
GRANT 
    ALTER, 
    ALTER ROUTINE, 
    CREATE, 
    CREATE ROUTINE, 
    CREATE TEMPORARY TABLES, 
    CREATE USER, 
    CREATE VIEW, 
    DELETE, 
    DROP, 
    EVENT, 
    EXECUTE, 
    INDEX, 
    INSERT, 
    LOCK TABLES, 
    PROCESS, 
    REFERENCES, 
    RELOAD, 
    REPLICATION CLIENT, 
    REPLICATION SLAVE, 
    SELECT, 
    SHOW DATABASES, 
    SHOW VIEW, 
    TRIGGER, 
    UPDATE ON 
*.* TO 'lava_sr'@'10.211.55.0/255.255.255.0' 
WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON *.* TO 'leela'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'amdin'@'%';

--Reload changes;
FLUSH PRIVILEGES;

-- We can list user GRANTS as follows:
SHOW GRANTS FOR 'leela'@'locahost';
SHOW GRANTS FOR 'leela'@'%';
SHOW GRANTS FOR 'admin'@'%';
SHOW GRANTS FOR 'lava_sr'@'10.211.55.0/255.255.255.0' ;
SHOW GRANTS FOR 'lava'@'10.211.55.0/255.255.255.0' ;