#!/bin/sh

# Wait for dependent services to be ready (e.g., MariaDB)
sleep 10

service php7.4-fpm start

# Ensure the WordPress directory exists
mkdir -p /var/www/html
cd /var/www/html

# Download WordPress core files if not already present
    wp core download --allow-root

    # Create wp-config.php file with database details
    wp config create --allow-root \
            --dbname=$MD_DATABASE \
            --dbuser=root \
            --dbpass=$ROOT_PASSWORD \
            --dbhost=$HOST

wp db create --allow-root
    # Install WordPress core
    wp core install --allow-root \
            --url=$URL \
            --title=$TITLE \
            --admin_user=$ADMIN_LOGIN \
            --admin_password=$ADMIN_PASSWORD \
            --admin_email=$ADMIN_EMAIL

    # Create a new WordPress user
    wp user create --allow-root "$USER_LOGIN" "$USER_EMAIL" \
            --user_pass="$USER_PASSWORD" \
            --role=author

# Stop PHP-FPM service and run it in the foreground
service php7.4-fpm stop
php-fpm7.4 -F

