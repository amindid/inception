FROM debian:12.5

RUN apt update && apt install -y \
	php-fpm \
	php-mysql \
	php-curl \
	wget \
	unzip

RUN mkdir -p /var/www/html && \
	cd /var/www/html && \
	wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	mv wordpress/* . && \
	rmdir wordpress && \
	rm latest.zip