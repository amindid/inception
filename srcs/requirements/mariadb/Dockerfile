FROM  debian:12.5

RUN apt-get update 
RUN apt-get install -y mariadb-server

# prepare the directory /run/mysqld for mariadb's runtime operations.
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld

COPY ./tools/init_db.sh /home

RUN chmod +x /home/init_db.sh

ENTRYPOINT ["sh", "/home/init_db.sh"]

#to run the mariadb server with the mysql user, and to listen for connections from all available network interfaces.
CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]