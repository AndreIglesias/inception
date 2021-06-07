#!/bin/sh

if [ ! -e /var/www/html/wordpress ]; then
	wget -O /tmp/latest.tar.gz --no-check-certificate https://wordpress.org/latest.tar.gz;
	tar -xvzf /tmp/latest.tar.gz -C /var/www/html/;
	rm /tmp/latest.tar.gz;
	echo "<?php" > /wp-config.php
	echo "define( 'DB_NAME', '$WP_DB_NAME' );" >> /wp-config.php
	echo "define( 'DB_USER', '$WP_DB_USER' );" >> /wp-config.php
	echo "define( 'DB_PASSWORD', '$WP_DB_PASS' );" >> /wp-config.php
	cat /phpconf >> /wp-config.php
	mv /wp-config.php /var/www/html/wordpress
	wp-cli core install --url=$DOMAIN_NAME/wordpress --title=Inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email="$WP_ADMIN_MAIL" --allow-root --path=/var/www/html/wordpress
	wp-cli user create $WP_USER $WP_USER_MAIL --role=editor --user_pass="$WP_USER_PASS" --allow-root --path=/var/www/html/wordpress
fi

php-fpm7 --nodaemonize
