FROM debian:12.5

RUN apt update -y

RUN apt install -y php8.2-fpm
RUN apt install -y php8.2
RUN apt install -y wget
RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

COPY ./tools/adminer.sh .

ENTRYPOINT ["sh", "adminer.sh"]

CMD ["php-fpm8.2", "-F"]