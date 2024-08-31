




# FROM debian:bullseye

# RUN apt -y update && apt upgrade -y && \
#     apt install mariadb-server -y

# EXPOSE 3306

# COPY tools/mariadb.sh /

# RUN chmod +x mariadb.sh

# ENTRYPOINT ["./mariadb.sh"]

# Use Debian Bullseye Linux distribution as a base image
FROM debian:bullseye

# Update packages and install MariaDB server
RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

# # Configure MariaDB to allow remote connections
# RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose the MariaDB port
EXPOSE 3306

# Copy the script to create the database and the user into the container
COPY tools/mariadb.sh /mariadb.sh
RUN chmod +x /mariadb.sh

# Set the entrypoint to the script
ENTRYPOINT ["bash", "/mariadb.sh"]
