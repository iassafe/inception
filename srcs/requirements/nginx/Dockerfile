


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


RUN mkdir -p /var/www/html









# Expose port 443 for HTTPS traffic
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]








# FROM debian:11

# RUN apt update && apt upgrade -y && apt install -y nginx openssl


# RUN openssl req -x509 -nodes -out /etc/nginx/ssl_cer.crt -keyout /etc/nginx/ssl_cer_key.key -subj "/C=Ma/L=khouribga/CN=hed-dyb/UID=hed-dyb"


# COPY conf/nginx.conf /etc/nginx/nginx.conf


# EXPOSE 443
# # start the Nginx in the foreground..
# CMD ["nginx", "-g", "daemon off;"]
