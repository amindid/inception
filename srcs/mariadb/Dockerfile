FROM  debian:12.5

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld

RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

# mysql_install_db --user=mysql --ldata=/var/lib/mysql
# mysql.user table already exists!
# Run mysql_upgrade, not mysql_install_db

COPY init_db.sh /home

RUN chmod +x /home/init_db.sh

# ENTRYPOINT ["sh", "/home/init_db.sh"]

EXPOSE 3306

CMD ["yes"]
# CMD ["mariadbd", "--user=mysql"]


# FROM alpine:3.18

# RUN apk update && apk add --no-cache mariadb mariadb-client

# RUN mkdir -p /run/mysqld

# RUN chown -R mysql:mysql /run/mysqld

# RUN chmod 755 /run/mysqld

# COPY init.sql /docker-entrypoint-initdb.d/

# CMD ["mysqld", "-u", "root"]

# EXPOSE 3306