#!/bin/sh
mysql_install_db --user=mysql --datadir=/var/lib/mysql

cat << EOF > /tmp/init.sql
CREATE DATABASE $DATABASE;
GRANT all privileges on $DATABASE.* to '$WP_DB_USER'@'%' identified by '$WP_DB_PASS';
GRANT all privileges on *.* to '$DB_USER'@'%' identified by '$DB_ROOT_PASSWORD';
USE $DATABASE;
FLUSH PRIVILEGES;
EOF

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --init-file=/tmp/init.sql
