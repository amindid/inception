#!/bin/bash

echo "FLUSH PRIVILEGES;" > test.sql
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> test.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> test.sql

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> test.sql

echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';" >> test.sql

echo "FLUSH PRIVILEGES;" >> test.sql

mariadbd -u mysql --bootstrap < test.sql

rm test.sql

exec "$@"