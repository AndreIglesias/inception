#!/bin/sh

wget https://wordpress.org/latest.tar.gz

tar -xvf latest.tar.gz
mv -r wordpress/* ~/data/wordpress/
rm -f latest.tar.gz
