#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql

cat << EOF > /tmp/init.sql
CREATE DATABASE $DATABASE;
GRANT all privileges on $DATABASE.* to '$DB_USER'@'%' identified by '$DB_PASSWORD';
GRANT all privileges on *.* to '$DB_USER_NAME'@'%' identified by '$DB_USER_PASS';
USE $DATABASE;
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --init-file=/tmp/init.sql
