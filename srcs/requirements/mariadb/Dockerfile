FROM debian:buster

RUN apt-get update \
	&& apt-get install -y mariadb-server

#COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./config/init.sql .

RUN service mysql start && \
	mysql -u root --password= < init.sql

CMD ["mysqld"]
