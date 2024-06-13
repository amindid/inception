#!/bin/bash

if [ ! -f /var/www/html/adminer.php ]; then
	wget https://www.adminer.org/latest.php -O adminer.php
	mv adminer.php /var/www/html/wordpress/
fi

exec "$@"
