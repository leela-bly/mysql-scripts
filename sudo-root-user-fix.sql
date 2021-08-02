--fixing the sudo root problem.

USE mysql;

UPDATE USER SET PLUGIN='' WHERE user='root';

FLUSH PRIVILEGES;