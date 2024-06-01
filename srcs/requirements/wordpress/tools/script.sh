#!/bin/bash

mkdir -p /var/www/html/wordpress
chmod -R 777 /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

cd /var/www/html/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb:3306 --allow-root


wp core install --url=${WEBSITE} --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --allow-root

wp user create $USER_NAME $USER_EMAIL --role=editor --user_pass=$USER_PASS --allow-root

wp config set WP_REDIS_HOST redis-cache --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_CACHE true --allow-root
wp config set protected-mode no --allow-root
wp plugin update --all --allow-root
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

exec php-fpm8.2 -F