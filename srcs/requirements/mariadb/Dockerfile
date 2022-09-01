#File for creating mariadb image
FROM alpine:3.15


RUN apk update \
	&& apk add mariadb mariadb-client\
	&& rm -rf /var/cache/apk*


COPY conf/mysql_setup.sh /usr/bin/mysql_setup.sh
COPY conf/setup.sql /usr/bin/setup.sql
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY conf/data-dump.sql /etc/bin/data-dump.sql


EXPOSE 3306


ENTRYPOINT ["sh", "/usr/bin/mysql_setup.sh"]


CMD ["mysqld", "--user=mysql"]