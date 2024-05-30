FROM debian:12.5

RUN apt-get update && apt-get install -y php-mysql

RUN apt-get update && \
    apt-get install -y php8.2-cli \
    php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    curl 

COPY /tools/script.sh .

RUN chmod +x script.sh

CMD [ "sh", "script.sh" ]