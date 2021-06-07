#https://wiki.alpinelinux.org/wiki/Nginx
FROM alpine:3.12

# update && install (nginx, openssl)
RUN apk update --no-cache \
	&& apk upgrade --no-cache \
	&& apk add nginx openssl \
	&& rm -rf /var/cache/apk/*

# create user && group for nginx
RUN adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& mkdir -p /var/run/nginx

# SSL
RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	   -out /etc/nginx/ssl/inception.pem -keyout /etc/nginx/ssl/inception.key \
	   -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=IT/CN=inception"

# nginx config
RUN rm /etc/nginx/nginx.conf

COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/index.html /index.html

COPY ./config/setup.sh .
RUN chmod +x setup.sh

EXPOSE 443

ENTRYPOINT ["./setup.sh"]
