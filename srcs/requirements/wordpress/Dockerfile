FROM debian:12.5

RUN apt update -y

RUN apt install -y php8.2-fpm

RUN apt install -y php8.2-mysql

RUN apt install -y curl 

COPY ./tools/script.sh .

RUN chmod +x script.sh

CMD [ "sh", "script.sh" ]
