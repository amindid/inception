#!/bin/bash

echo "FLUSH PRIVILEGES;" | mariadbd -u root --bootstrap

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mariadbd -u root --bootstrap

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadbd -u root --bootstrap

echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';" | mariadbd -u root --bootstrap

echo "FLUSH PRIVILEGES;" | mariadbd -u root --bootstrap

exec $@
# -- Create WordPress database if not exists
# CREATE DATABASE IF NOT EXISTS wordpress;

# -- Create WordPress user
# CREATE USER 'wordpress'@'%' IDENTIFIED BY 'exemple';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
# FLUSH PRIVILEGES;

# -- Create another user with administrative privileges
# CREATE USER 'wordpress'@'%' IDENTIFIED BY 'exemple';
# GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%';
# FLUSH PRIVILEGES;
