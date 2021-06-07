#!/bin/sh

mv /index.html /www/index.html

/usr/sbin/nginx -g 'daemon off;'
