#File for creating adminer image
FROM alpine:3.15


RUN apk update \
	&& rm -rf /var/cache/apk*


#https://www.adminer.org/de/#download
#ADD http://www.adminer.org/latest.php /tmp/adminer.php
ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php /tmp/adminer.php


COPY conf/setup.sh /tmp/setup.sh


ENTRYPOINT ["sh", "/tmp/setup.sh"]