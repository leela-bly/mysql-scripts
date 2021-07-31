DROP USER [IF EXISTS] 'leela'@'localhost';

CREATE USER [IF NOT EXISTS] 'leela'@'localhost' IDENTIFIED BY 'sanlee78';

--Create admin user to access the database in any network using '%' (internet)
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';

--Limit access to 10.211.55.0/24 CIDR (10.211.55.0/255.255.255.0 subnet):
-- lava user can access the DB with in intranet.
/*
leela@nimmi:/etc/nginx/sites-available$ ifconfig
enp0s5: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.211.55.13  netmask 255.255.255.0  broadcast 10.211.55.255
        inet6 fde4:a9cb:caf6:381a:32ce:8513:c0b:b4f4  prefixlen 64  scopeid 0x0<global>
        inet6 fde4:a9cb:caf6:381a:b2a4:5972:11ca:5d0c  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::58f4:d8e2:1a60:c16e  prefixlen 64  scopeid 0x20<link>
        ether 00:1c:42:77:2a:ae  txqueuelen 1000  (Ethernet)
        RX packets 776268  bytes 1120031472 (1.1 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 235914  bytes 22857101 (22.8 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 8456  bytes 1036283 (1.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 8456  bytes 1036283 (1.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

*/
CREATE USER 'lava'@'10.211.55.0/255.255.255.0' IDENTIFIED BY 'lava';

-- nimmi user can access the DB only using TSL/SSL
-- 100% secured connection
CREATE USER 'nimmi'@'10.211.55.0/255.255.255.0' 
IDENTIFIED WITH 'mysql_native_password' BY 'nimmi'
REQUIRE SSL;

