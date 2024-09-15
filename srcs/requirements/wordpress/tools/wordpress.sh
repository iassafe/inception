#!/bin/sh
# Wait for dependent services to be ready (e.g., MariaDB)
sleep 10

service php7.4-fpm start

# Ensure the WordPress directory exists
mkdir -p /var/www/html
cd /var/www/html

# Download WordPress core files if not already present
if [ ! -f wp-config.php ]; then
    wp core download --allow-root

    # Create wp-config.php file with database details
    wp config create --allow-root \
            --dbname=mariadbDataBase \
            --dbuser=$WP_LOGIN \
            --dbpass=$WP_PASSWORD \
            --dbhost=$DB_HOST

    # Install WordPress core
    wp core install --allow-root 
            --url=iassafe.42.fr \
            --title=$WP_TITLE \
            --admin_user=$WP_LOGIN \
            --admin_password=$WP_PASSWORD \
            --admin_email=$WP_EMAIL

    # Create a new WordPress user
    wp user create --allow-root "$WP_USER_LOGIN" "$WP_USER_EMAIL" \
            --user_pass="$WP_USER_PASSWORD" \
            --role="$WP_USER_ROLE"
fi


# Stop PHP-FPM service and run it in the foreground
service php7.4-fpm stop
php-fpm7.4 -F