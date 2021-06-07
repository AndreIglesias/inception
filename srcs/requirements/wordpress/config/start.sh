#!/bin/sh
#wp-cli config create  --allow-root --dbname=$DATABASE --dbuser=$DB_USER --dbpass=$DB_PASSWORD --path=/www/ --dbhost=mariadb
#until wp-cli db check --allow-root --path=/www/; do
#    sleep 5
#done
#wp-cli core install --url=localhost/wordpress --title=Inception --admin_user=$DB_USER --admin_password=$DB_ROOT_PASSWORD --admin_email="$ADM_EMAIL" --allow-root --path=/www/
#wp-cli user create $DB_USER $ADM_EMAIL --role=editor --user_pass="$DB_PASSWORD" --allow-root --path=/www/

/usr/bin/php -S 0.0.0.0:9000 -t /www/
