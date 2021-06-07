FROM alpine:3.12

# Update && Install (php7)
RUN apk update --no-cache \
	&& apk upgrade --no-cache \
	&& apk add --no-cache php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


#add user www-data
RUN set -eux;\
	addgroup -g 82 -S www-data;\
	adduser -u 82 -D -S -G www-data www-data

RUN		rm /etc/php7/php-fpm.d/www.conf

COPY 	./config/www.conf  /etc/php7/php-fpm.d/www.conf

RUN		mkdir -p /var/www/html/wordpress

RUN		chown -R www-data:www-data /var/www/html/wordpress

COPY ./config/start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]

EXPOSE 9000
