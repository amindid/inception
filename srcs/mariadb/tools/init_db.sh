#!/bin/bash

# cat << EOF > /tmp/init_db.sql

# echo FLUSH PRIVILEGES > test.sql;
# echo ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
# echo CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
# echo CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
# echo GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
# echo FLUSH PRIVILEGES;


echo "FLUSH PRIVILEGES;" > test.sql
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> test.sql

# 2024-05-24 17:20:29 0 [Warning] You need to use --log-bin to make --expire-logs-days or --binlog-expire-logs-seconds work.
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> test.sql

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> test.sql

echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';" >> test.sql

echo "FLUSH PRIVILEGES;" >> test.sql

mariadbd -u root --bootstrap < test.sql

rm test.sql

exec "$@"



# EOF

# mariadbd --user=mysql --bootstrap < /tmp/init_db.sql

# exec "$@"

# cat << EOF > /tmp/init_db.sql

# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
# CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
# CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
# GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
# FLUSH PRIVILEGES;


# EOF

# mariadbd --user=mysql --bootstrap < /tmp/init_db.sql

# # rm test.sql

# exec mariadbd --user=mysql --bind-address=0.0.0.0

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
