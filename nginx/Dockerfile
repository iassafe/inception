


# Base Image: Starts from Debian 11
FROM debian:11 

# Updates package lists and installs Nginx and OpenSSL
RUN apt update && apt upgrade -y && apt install -y nginx openssl

# Generate SSL Certificate: Creates a self-signed SSL certificate and key for secure HTTPS connections
RUN openssl req -x509 -nodes -out /etc/nginx/ssl_cer.crt -keyout /etc/nginx/ssl_cer_key.key -subj "/C=Ma/L=khouribga/CN=iassafe/UID=iassafe"


# Copies a custom Nginx configuration file into the container.
COPY conf/nginx.conf /etc/nginx/nginx.conf


# Port: Makes port 443 available for HTTPS traffic
EXPOSE 443

# Starts Nginx in the foreground when the container runs
CMD ["nginx", "-g", "daemon off;"]




