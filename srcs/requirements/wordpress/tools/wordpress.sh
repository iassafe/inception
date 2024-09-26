#!/bin/sh

sleep 10

service php7.4-fpm start

cd /var/www/html

    wp core download --allow-root

    wp config create --allow-root \
            --dbname=$DATABASE \
            --dbuser=root \
            --dbpass=$PASSWORD \
            --dbhost=$HOST

    wp db create --allow-root 
    wp core install --allow-root \
            --url=$URL \
            --title=$TITLE \
            --admin_user=$ADMIN_LOGIN \
            --admin_password=$PASSWORD \
            --admin_email=$ADMIN_EMAIL

    wp user create --allow-root "$USER_LOGIN" "$USER_EMAIL" \
            --user_pass="$PASSWORD" \
            --role=author

service php7.4-fpm stop
php-fpm7.4 -F
