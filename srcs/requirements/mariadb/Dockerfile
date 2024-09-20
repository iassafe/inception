FROM debian:bullseye

# Update packages and install MariaDB server
RUN apt update && \
    apt upgrade -y && \
    apt install mariadb-server -y

# Expose the MariaDB port
EXPOSE 3306

# Copy the script to create the database and the user into the container
COPY tools/mariadb.sh /mariadb.sh

RUN chmod +x /mariadb.sh

# Set the entrypoint to the script
ENTRYPOINT ["bash", "/mariadb.sh"]
