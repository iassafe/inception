FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
    mariadb-client \
    php-fpm \
    php-mysqli \
    wget

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN echo "listen=0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

COPY tools/wordpress.sh /wordpress.sh

RUN chmod +x /wordpress.sh

ENTRYPOINT ["bash", "/wordpress.sh"]
