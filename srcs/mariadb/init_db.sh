#!/bin/bash

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"

mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';"

mysql -u root -e "FLUSH PRIVILEGES;"

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
