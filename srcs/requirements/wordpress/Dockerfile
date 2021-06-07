FROM alpine:3.12

# Update && Install (php7)
RUN apk update --no-cache \
	&& apk upgrade --no-cache \
	&& apk add --no-cache php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar wget

#add user www-data
RUN addgroup -g 82 -S www-data;\
	adduser -u 82 -D -S -G www-data www-data

RUN wget -O /tmp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x /tmp/wp-cli.phar \
	&& mv /tmp/wp-cli.phar /usr/local/bin/wp-cli

COPY ./config/phpconf /

RUN rm /etc/php7/php-fpm.d/www.conf

COPY ./config/www.conf  /etc/php7/php-fpm.d/www.conf

COPY ./config/setup.sh .
RUN chmod +x setup.sh

ENTRYPOINT ["./setup.sh"]
