# !/bin/bash

service mariadb start

sleep 5

# CREATE DATABASE IF NOT EXISTS $MD_DATABASE;
# CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$MD_PASSWORD' ;
# GRANT ALL PRIVILEGES ON $MD_DATABASE.* TO '$USER'@'%' ;"
mysql -u root --skip-password <<EOF
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$ROOT_PASSWORD');
RENAME USER 'root'@'localhost' TO 'root'@'%';
FLUSH PRIVILEGES;
EOF

service mariadb stop

mysqld_safe --port=3306 --bind-address=0.0.0.0
