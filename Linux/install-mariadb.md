1. create db, username, passwd
```
mysql -u root -p
```
```
CREATE DATABASE database;
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
```
```
GRANT ALL PRIVILEGES ON database.* TO 'user'@'%';
flush privileges; 
```
2. login
```
mysql -h 192.168.227.110 -P 3306 -u user -p
```
3. mount
```
use database;
source /path.sql; 
```
