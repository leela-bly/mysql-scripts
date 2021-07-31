--fixing the sudo root problem.

USE mysql;

UPDATE USER SET PLUGIN='' WHERE User='root';

FLUSH PRIVILEGES;