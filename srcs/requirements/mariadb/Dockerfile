FROM debian:buster

RUN apt-get update \
	&& apt-get install -y mariadb-server

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./config/setup.sh .
COPY ./config/my.cnf /etc/

# Setup mariadb
RUN mkdir -p /run/mysqld

RUN chmod +x setup.sh
CMD ["./setup.sh"]
