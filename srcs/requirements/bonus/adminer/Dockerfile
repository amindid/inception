FROM debian:12.5

RUN apt update -y

RUN apt install -y php8.2-fpm && \
	php8.2-mysql \
	curl

COPY ./tools/adminer.sh .

ENTRYPOINT ["sh", "adminer.sh"]

CMD [""php-fpm8.2", "-F""]