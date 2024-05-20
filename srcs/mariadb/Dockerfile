FROM alpine:3.18

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld

RUN chown -R mysql:mysql /run/mysqld

RUN chmod 755 /run/mysqld

CMD ["mysqld", "-u", "root"]

EXPOSE 443