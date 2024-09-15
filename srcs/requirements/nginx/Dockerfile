


FROM debian:bullseye

# Update package lists, install Nginx and OpenSSL
RUN apt update && apt upgrade -y && apt install -y nginx openssl

# Generate an SSL certificate
RUN openssl req -x509 -nodes \
-out /etc/nginx/ssl_certificate.crt \
-keyout /etc/nginx/ssl_certificate_key.key \
-subj "/C=MA/L=Khouribga/CN=Assafe"

# Copy custom Nginx configuration file into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf 

# Expose port 443 for HTTPS traffic
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
