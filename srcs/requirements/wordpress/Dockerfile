

FROM debian:bullseye

# Install necessary packages: MariaDB client, PHP 7.4, and required PHP extensions
RUN apt -y update && apt -y upgrade && apt -y install \
    mariadb-client \
    php7.4 \
    php7.4-mysql \
    php7.4-fpm \
    wget

# Download the WP-CLI tool
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp

# Configure PHP-FPM to listen on port 9000
RUN echo "listen=0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

# Expose PHP-FPM port
EXPOSE 9000

# Copy the custom script into the container
COPY tools/wordpress.sh /wordpress.sh

# Ensure the script is executable
RUN chmod +x /wordpress.sh

# Set the entrypoint to run the script
ENTRYPOINT ["bash", "/wordpress.sh"]

