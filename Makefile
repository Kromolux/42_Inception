# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rkaufman <rkaufman@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/26 18:52:27 by rkaufman          #+#    #+#              #
#    Updated: 2022/08/29 18:43:20 by rkaufman         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		:=	Inception

all: $(NAME)

$(NAME):
	docker-compose -f srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f srcs/docker-compose.yml down

clean: Cs C I V N

Cs:
	docker container stop $$(docker container ps -aq)

C:
	docker container rm $$(docker container ps -aq)

I:
	docker image rm -f $$(docker image ls -aq)

V:
	docker volume rm $$(docker volume ls -q)

N:
	docker network rm $$(docker network ls -q)
	
#	rm -fr $(OBJS)
cert:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=DE/ST=GERMANY/L=WOLFSBURG/O=42Wolfsburg/CN=rkaufman.42.fr" \
	-keyout ./srcs/requirements/nginx/conf/ssl/nginx-selfsigned.key \
	-out ./srcs/requirements/nginx/conf/ssl/nginx-selfsigned.crt

re: clean all

.PHONY: clean re Cstop Cs C I V N cert
