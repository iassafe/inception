


FROM debian:bullseye

RUN apt -y update && apt -y upgrade && apt -y install mariadb-client php php-mysql php-fpm wget


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp && \
echo "listen=0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf


EXPOSE 9000
                                                         

COPY tools/wordpress.sh /wordpress.sh
RUN chmod +x wordpress.sh


ENTRYPOINT ["bash", "/wordpress.sh"]


# # Use the latest Debian Bullseye Linux distribution as a base image
# FROM debian:bullseye

# # Update packages and install necessary dependencies
# RUN apt-get update && apt-get upgrade -y && \1
#     apt-get install -y php php-fpm php-mysql mariadb-client wget curl

# # Download and install WP-CLI
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp && \
# chmod +x /usr/local/bin/wp

# # Configure PHP-FPM to listen on all IP addresses and port 9000
# RUN echo "listen=0.0.0.0:9000" >> /etc/php/$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;")/fpm/pool.d/www.conf

# # Expose PHP-FPM port
# EXPOSE 9000

# # Copy the setup script for WordPress
# COPY tools/wordpress.sh /wordpress.sh

# # Set the entrypoint to the setup script
# ENTRYPOINT ["bash", "/wordpress.sh"]
