# !/bin/bash

service mariadb start

sleep 5

mysql -u root --skip-password <<EOF
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$PASSWORD');
RENAME USER 'root'@'localhost' TO 'root'@'%';
FLUSH PRIVILEGES;
EOF

service mariadb stop

mysqld_safe --port=3306 --bind-address=0.0.0.0
