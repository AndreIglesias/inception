#!/bin/sh
if [ ! -e /var/www/html/wordpress ]; then
	mv /usr/src/wordpress /var/www/html/wordpress;
	sleep 10
	wp-cli config create  --allow-root --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASS --path=/var/www/html/wordpress --dbhost=mariadb
	until wp-cli db check --allow-root --path=/var/www/html/wordpress; do
    sleep 5
	done
	wp-cli core install --url=localhost/wordpress --title=Inception --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASS --admin_email="$WP_ADMIN_EMAIL" --allow-root --path=/var/www/html/wordpress 
	wp-cli user create $WP_USER_LOGIN_1 $WP_USER_EMAIL_1 --role=editor --user_pass="$WP_USER_PASS_1" --allow-root --path=/var/www/html/wordpress
	wp-cli user create $WP_USER_LOGIN_2 $WP_USER_EMAIL_2 --role=editor --user_pass="$WP_USER_PASS_2" --allow-root --path=/var/www/html/wordpress
fi

php-fpm7 --nodaemonize