FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y curl php-fpm php-mysql php-cli php-mbstring php-xml php-gd php-curl php-zip mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY config/wordpress-config.sh /wordpress-config.sh

RUN chmod +x /wordpress-config.sh

EXPOSE 9000

ENTRYPOINT ["./wordpress-config.sh"]