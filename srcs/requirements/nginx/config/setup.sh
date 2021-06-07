#!/bin/sh

if [ ! -e /www/index.html ]; then
	mv /index.html /www/index.html
fi

/usr/sbin/nginx -g 'daemon off;'
