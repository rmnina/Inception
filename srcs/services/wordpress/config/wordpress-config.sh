#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress
chmod -R 755 /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress

wp core download --allow-root

wp config create \
    --dbhost=mariadb:3306 \
    --dbname="$MYSQL_DATABASE" \
    --dbuser="$MYSQL_USER" \
    --dbpass="$MYSQL_PASSWORD" \
    --allow-root

if ! wp core is-installed --allow-root; then
    wp core install \
        --url="$WP_URL" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PSWD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root
fi

wp user create "$WP_USER" "$WP_USER_EMAIL" \
    --user_pass="$WP_USER_PSWD" \
    --role="author" \
    --allow-root

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
