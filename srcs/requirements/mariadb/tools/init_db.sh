#!/bin/bash

#clears any cached privileges
echo "FLUSH PRIVILEGES;" > test.sql

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> test.sql

#change root password ('root'@'localhost' means that root can only be connected from local machine as mysql administrator, to prevent remote access to root acount)
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> test.sql

#'$MYSQL_USER'@'%' means that the user $MYSQL_USER can be connected from any host to allow remote access 
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> test.sql

#grants privileges to $MYSQL_USER on all databases and tables (*.* means 'all databases'.'all tables')
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';" >> test.sql

#to reload the privilege tables, ensuring that the changes take effect immediately.
echo "FLUSH PRIVILEGES;" >> test.sql

#bootstrap mode is used for initialization tasks when mariadb is first installed.
mariadbd -u mysql --bootstrap < test.sql

rm test.sql

exec "$@"