FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx openssl curl vim && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/certs /run/secrets /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

RUN openssl req -x509 -nodes \
    -keyout /etc/nginx/certs/server.key \
    -out /etc/nginx/certs/server.crt \
    -days 365 \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jdufour.42.fr/UID=jdufour" \
    && chmod 644 /etc/nginx/certs/server.crt /etc/nginx/certs/server.key 

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
