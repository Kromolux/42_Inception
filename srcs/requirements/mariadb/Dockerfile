#File for creating mariadb image
FROM alpine:3.16
#FROM debian:buster-slim

RUN apk update \
	&& apk add mariadb mariadb-client bash\
	&& rm -rf /var/cache/apk*
#RUN apk add mariadb
#RUN apt-get update \
#	&& apt-get install -y mariadb-server

#COPY conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf

#RUN mariadb-install-db --user=mysql --ldata=/var/lib/mysql
#RUN mkdir /var/run/mysqld
#RUN chown -R mysql:root /var/run/mysqld

COPY conf/mysql_secure_installation.sh /usr/bin/mysql_secure_installation.sh
COPY conf/setup.sql /usr/bin/setup.sql

#VOLUME DB
#RUN chmod +x /usr/bin/mysql_secure_installation.sh
CMD ["bash", "/usr/bin/mysql_secure_installation.sh"]
#CMD ["mysqld", "--user=mysql"]