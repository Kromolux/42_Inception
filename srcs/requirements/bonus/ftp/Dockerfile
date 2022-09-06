#File for creating ftp image
FROM alpine:3.15


RUN apk update \
	&& apk upgrade \
	&& apk add vsftpd \
	&& rm -rf /var/cache/apk*


COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY conf/setup.sh /etc/setup.sh

EXPOSE 20
EXPOSE 21
EXPOSE 12000


ENTRYPOINT ["sh", "/etc/setup.sh"]
