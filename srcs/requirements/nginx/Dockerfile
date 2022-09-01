#File for creating nginx image
FROM alpine:3.15


RUN apk update \
	&& apk add nginx openssl \
	&& rm -rf /var/cache/apk*


#https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=DE/ST=Niedersachsen/L=Wolfsburg/O=42Wolfsburg/CN=rkaufman" \
	-keyout /etc/ssl/nginx-selfsigned.key \
	-out /etc/ssl/nginx-selfsigned.crt


COPY conf/nginx.conf /etc/nginx/nginx.conf


EXPOSE 443


ENTRYPOINT ["nginx", "-g", "daemon off;"]
#CMD ["nginx", "-g", "daemon off;"]