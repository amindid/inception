#!/bin/bash

echo "FLUSH PRIVILEGES;" > test.sql
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> test.sql

# 2024-05-24 17:20:29 0 [Warning] You need to use --log-bin to make --expire-logs-days or --binlog-expire-logs-seconds work.

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';" >> test.sql

echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';" >> test.sql

echo "FLUSH PRIVILEGES;" >> test.sql

mariadbd -u root --bootstrap < test.sql


# rm test.sql

exec "$@"
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
