#File for creating wordpress image
FROM alpine:3.15

RUN apk update \
	&& apk add php-fpm php-mysqli php-json


ADD http://wordpress.org/latest.tar.gz /var/www/
#RUN tar -xzf /var/www/latest.tar.gz -C /var/www/ --strip-components 1 \
#	&& rm -rf /var/www/latest.tar.gz

RUN tar -xzf /var/www/latest.tar.gz -C /var/www/ \
	&& rm -rf /var/www/latest.tar.gz

RUN adduser -S nginx && addgroup -S nginx && adduser nginx nginx

COPY conf/www.conf /etc/php7/php-fpm.d/www.conf
COPY conf/setup.sh /var/www/setup.sh

EXPOSE 9000

ENTRYPOINT ["sh", "/var/www/setup.sh"]