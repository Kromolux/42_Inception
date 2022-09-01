# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rkaufman <rkaufman@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/26 18:52:27 by rkaufman          #+#    #+#              #
#    Updated: 2022/08/31 16:34:35 by rkaufman         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UNAME		:= $(shell uname)
NAME		:=	Inception
YML			:=	srcs/docker-compose.yml

all: $(NAME)

$(NAME):
	docker compose -f $(YML) up --build -d

stop:
	docker compose -f $(YML) down

conf:
	docker compose -f $(YML) config

clean: Cs C I V N

Cs:
	-docker container stop $$(docker container ps -aq)

C:
	-docker container rm $$(docker container ps -aq)

I:
	-docker image rm -f $$(docker image ls -aq)

V:
	-docker volume rm $$(docker volume ls -q)

N:
	-docker network rm $$(docker network ls -q)

P:
	docker system prune -af

#	rm -fr $(OBJS)

fclean: clean volume

domain:
	bash -c 'echo "127.0.0.1 rkaufman.42.fr" >> /etc/hosts'

ifeq ($(UNAME), Darwin)
volume:
		rm -fr /Users/rkaufman/Projects/WordPress
		rm -fr /Users/rkaufman/Projects/DB
		mkdir -p /Users/rkaufman/Projects/WordPress
		mkdir -p /Users/rkaufman/Projects/DB
endif

#	@ ifeq ($(UNAME), Linux)
#volume:
#		rm -fr /home/rkaufman/data/WordPress
#		rm -fr /home/rkaufman/data/DB
#		mkdir -p /home/rkaufman/data/WordPress
#		mkdir -p /home/rkaufman/data/DB
#	@ endif

cert:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=DE/ST=GERMANY/L=WOLFSBURG/O=42Wolfsburg/CN=rkaufman.42.fr" \
	-keyout ./srcs/requirements/nginx/conf/ssl/nginx-selfsigned.key \
	-out ./srcs/requirements/nginx/conf/ssl/nginx-selfsigned.crt

re: clean fclean all

.PHONY: clean re Cstop Cs C I V N cert
