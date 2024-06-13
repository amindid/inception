#!/bin/bash

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
	mkdir -p /var/www/html/wordpress
	chmod -R 777 /var/www/html/wordpress
	adduser --disabled-password --gecos "" $SYSUSER
	echo "$SYSUSER:$SYSUSERPASS" | chpasswd
	chown -R $SYSUSER:$SYSUSER /var/www/html/wordpress

	cd /var/www/html/wordpress

	#download the wp-cli.phar, (wp-cli stands for wordpress command line interface)
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	chmod +x wp-cli.phar

	mv wp-cli.phar /usr/local/bin/wp

	#download wordpress core files, --allow-root flag permits the command to be run as the root user
	wp core download --allow-root

	#creat the wp-config.php file with the specified informations (database name, user and user password)
	wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb:3306 --allow-root

	#insatll wordpress with the specified informations
	wp core install --url=${WEBSITE} --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL} --allow-root

	#creat new user, and sets it's role to editor that can edit and publish posts, pages and comments ...etc
	wp user create $USER_NAME $USER_EMAIL --role=editor --user_pass=$USER_PASS --allow-root


	wp config set WP_REDIS_HOST redis-cache --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
	wp config set WP_CACHE true --allow-root
	wp config set protected-mode no --allow-root
	wp plugin update --all --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp redis enable --allow-root
fi

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

exec php-fpm8.2 -F
