FROM  debian:12.5

RUN apt-get update 
RUN apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld

# RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

COPY ./tools/init_db.sh /home

RUN chmod +x /home/init_db.sh

ENTRYPOINT ["sh", "/home/init_db.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]


# FROM alpine:3.18

# RUN apk update && apk add --no-cache mariadb mariadb-client

# RUN mkdir -p /run/mysqld

# RUN chown -R mysql:mysql /run/mysqld

# RUN chmod 755 /run/mysqld

# COPY init.sql /docker-entrypoint-initdb.d/

# CMD ["mysqld", "-u", "root"]

# EXPOSE 3306