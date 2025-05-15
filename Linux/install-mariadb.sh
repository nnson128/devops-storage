___install and config___
1.
# - install mariadb server
# - change bind address
# create user password database 
```
- mysql -u root -p
```
```
CREATE DATABASE database;
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
```
```
GRANT ALL PRIVILEGES ON database.* TO 'user'@'%';
flush privileges; 
```

# login
- mysql -h 192.168.227.110 -P 3306 -u user -p
# mount sql to database
- use database;
- source /path.sql; 