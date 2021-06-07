FROM alpine

#apk install
RUN		set -eux;\
	apk update;\
	apk --no-cache add \
	wget \
	openssl \
	openssh \
	openrc \
	php7 \
	php7-fpm \
	php7-curl \
	php7-dom \
	php7-exif \
	php7-fileinfo \
	php7-json \
	php7-mbstring \
	php7-mysqli \
	php7-sodium \
	php7-openssl \
	php7-imagick \
	php7-xml \
	php7-zip \
	php7-phar \
	mysql-client

#add user www-data
RUN set -eux;\
	addgroup -g 82 -S www-data;\
	adduser -u 82 -D -S -G www-data www-data

#install wp-cli

RUN		set -eux;\
	wget -O /tmp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
	php /tmp/wp-cli.phar --info;\
	chmod +x /tmp/wp-cli.phar; \
	mv /tmp/wp-cli.phar /usr/local/bin/wp-cli;

#setup wordpress
COPY	./srcs/latest.tar.gz /tmp/latest.tar.gz

RUN		set -eux;\
	#wget -O /tmp/latest.tar.gz --no-check-certificate https://wordpress.org/latest.tar.gz;\
	mkdir /usr/src/;\
	tar -xvzf /tmp/latest.tar.gz -C /usr/src/;\
	rm /tmp/latest.tar.gz;

RUN		rm /etc/php7/php-fpm.d/www.conf

COPY 	./srcs/www.conf  /etc/php7/php-fpm.d/www.conf

RUN		chown -R www-data:www-data /usr/src/wordpress

COPY	srcs/start.sh /start.sh
RUN		chmod 744 /start.sh

ENTRYPOINT [ "/start.sh" ]