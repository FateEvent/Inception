NAME		=	inception
SRCS_PATH	=	srcs/
COMPOSE		=	${SRCS_PATH}/docker-compose.yml
ENV		=	${SRCS_PATH}/.env
FLAGS		=	-f ${COMPOSE} -p ${NAME}

all: refresh

build:
	@docker-compose $(FLAGS) build

start:
	@docker-compose ${FLAGS} start

stop:
	@docker-compose ${FLAGS} stop

refresh:
	@docker-compose $(FLAGS) up -d --build

clean: stop
	sudo rm -rf ~/data/www/* && sudo rm -rf ~/data/mariadb/*

fclean: stop clean
	docker system prune -f

re: stop fclean all

.phony: all build start stop refresh clean fclean re