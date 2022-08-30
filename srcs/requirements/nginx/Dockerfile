#File for creating nginx image
#FROM debian:buster
FROM alpine:3.16

#RUN apt update
#RUN apt install -y nginx
RUN apk update \
	&& apk add nginx \
	&& apk add openssl \
	&& rm -rf /var/cache/apk*
#RUN apk upgrade
#RUN apk add nginx
#RUN apk add openssl

#https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=DE/ST=GERMANY/L=WOLFSBURG/O=42Wolfsburg/CN=rkaufman.42.fr" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

#RUN mkdir html
#VOLUME /Users/rkaufman/Projects/Inception_intra/srcs/requirements/html
#COPY conf/ssl/nginx-selfsigned.key /etc/ssl/certs/nginx-selfsigned.crt
#COPY conf/ssl/nginx-selfsigned.crt /etc/ssl/private/nginx-selfsigned.key
COPY index.html /var/www/html/index.html
COPY conf/nginx.conf /etc/nginx/nginx.conf
#COPY /html/ /var/www/html/

#EXPOSE 80
EXPOSE 443

#CMD nginx -g 'daemon off;'
#CMD bash
ENTRYPOINT ["nginx", "-g", "daemon off;"]

#CMD ["nginx", "-g", "daemon off;"]