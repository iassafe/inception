#!/bin/bash

# 1 start mariadb ...
service mariadb start


# 2 configuration ...

mysqladmin -u root password $MARIADB_ROOT_PASSWORD

mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE ;"
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD' ;"
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' ;"
mysql -u root -p$MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"


# 3 stop the service and run the container in  ...
service mariadb stop

# start the MySQL server daemon
# bind-address where to accept conection ....
mysqld_safe --port=3306 --bind-address=0.0.0.0