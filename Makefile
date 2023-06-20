# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faventur <faventur@student.42Mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 18:54:40 by faventur          #+#    #+#              #
#    Updated: 2023/06/01 10:50:24 by faventur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception
COMPOSE = srcs/docker-compose.yml
ENV = srcs/.ENV
FLAGS = -f $(COMPOSE) -p $(NAME)
RM = rm -rf

all:
	sudo mkdir -p /home/${USER}/data
	sudo mkdir -p /home/${USER}/data/mariadb
	sudo mkdir -p /home/${USER}/data/wordpress
	@docker-compose $(FLAGS) up -d --build

build:
	@docker-compose $(FLAGS) build

start:
	@docker-compose ${FLAGS} start

stop:
	@docker-compose ${FLAGS} stop

clean: stop
	@docker-compose ${FLAGS} down -v

fclean: stop clean
	sudo rm -rf /home/${USER}/data/wordpress/*
	sudo rm -rf /home/${USER}/data/mariadb/*
	docker system prune -af

re: stop fclean all

.phony: all build start stop clean fclean re
