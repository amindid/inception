FROM  alpine:latest

RUN apk update && apk add --no-cach mariadb mariadb-client

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

COPY init_db.sh /home

RUN chmod +x /home/init_db.sh

# ENTRYPOINT ["sh", "/home/script.sh"]

EXPOSE 8080

CMD ["mariadbd", "--user=mysql"]

# FROM alpine:3.18

# RUN apk update && apk add --no-cache mariadb mariadb-client

# RUN mkdir -p /run/mysqld

# RUN chown -R mysql:mysql /run/mysqld

# RUN chmod 755 /run/mysqld

# COPY init.sql /docker-entrypoint-initdb.d/

# CMD ["mysqld", "-u", "root"]

# EXPOSE 3306