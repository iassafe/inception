#!/bin/bash


service mariadb start
sleep 5
mysql -u root --skip-password <<EOF
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MARIADB_ROOT_PASSWORD');
CREATE DATABASE IF NOT EXISTS mariadbDataBase;
CREATE USER IF NOT EXISTS 'MariadbUser'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL PRIVILEGES ON mariadbDataBase.* TO 'MariadbUser'@'%';
FLUSH PRIVILEGES;
EOF
service mariadb stop

mysqld_safe --port=3306 --bind-address=0.0.0.0
