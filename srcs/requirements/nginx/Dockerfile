FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN openssl req -x509 -nodes \
-out /etc/nginx/ssl_certificate.crt \
-keyout /etc/nginx/ssl_certificate_key.key \
-subj "/C=MA/L=Khouribga/CN=Assafe"

COPY conf/nginx.conf /etc/nginx/nginx.conf 

RUN mkdir -p /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
