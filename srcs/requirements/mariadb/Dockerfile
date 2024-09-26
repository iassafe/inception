FROM debian:bullseye

RUN apt update && \
    apt upgrade -y && \
    apt install mariadb-server -y

EXPOSE 3306

COPY tools/mariadb.sh /mariadb.sh

RUN chmod +x /mariadb.sh

ENTRYPOINT ["bash", "/mariadb.sh"]
