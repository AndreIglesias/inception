FROM alpine:3.12

# Update && Install (php7)
RUN apk update --no-cache \
	&& apk upgrade --no-cache \
	&& apk add --no-cache php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

COPY ./config/start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
