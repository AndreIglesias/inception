FROM alpine:3.12

# Update && Install (php7)
RUN apk update --no-cache \
	&& apk upgrade --no-cache \
	&& apk add --no-cache php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# Download && Install && Config (Wordpress)
ADD https://wordpress.org/latest.tar.gz .

COPY config/wp-config.php .

RUN tar -xvf latest.tar.gz \
	&& mv wordpress /www \
	&& mv wp-config.php /www/ \
	&& rm -f latest.tar.gz

CMD /usr/bin/php -S 0.0.0.0:80 -t /www/