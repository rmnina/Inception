FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y mariadb-server netcat \
    && rm -rf /var/lib/apt/lists/*

COPY config/mariadb.cnf /etc/mysql/mariadb.cnf
COPY config/mariadb-init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

ENTRYPOINT ["./init.sh"]