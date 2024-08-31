#!/bin/bash

# starts the MySQL service
service mariadb start 

mysqladmin -u root password "$PASSWORD"

# Create database if it doesn't exist
mysql -u root -p"$PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

# Create user if it doesn't exist and grant privileges
mysql -u root -p"$PASSWORD" -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$PASS';"
mysql -u root -p"$PASSWORD" -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$USER'@'%';"

# Change root password (ensure it matches the initial password setup)
mysql -u root -p"$PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASS';"

# Flush privileges to apply changes
mysql -u root -p"$PASSWORD" -e "FLUSH PRIVILEGES;"

# Stop the MariaDB service before running it as a daemon
service mariadb stop

# Start the MariaDB server daemon with specified configurations
mysqld_safe --port=3306 --bind-address=0.0.0.0