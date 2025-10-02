# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jdufour <jdufour@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/11 15:44:07 by jdufour           #+#    #+#              #
#    Updated: 2025/04/06 21:11:07 by jdufour          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

WP_DATA = /home/jdufour/data/wordpress
DB_DATA = /home/jdufour/data/mariadb
COMPOSE_PATH = srcs/docker-compose.yml

all: up

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker-compose -f $(COMPOSE_PATH) up -d

build:
	docker-compose -f $(COMPOSE_PATH) build

down:
	docker-compose -f $(COMPOSE_PATH) down

clean: down
	docker system prune -af

fclean: clean
	rm -rfd $(WP_DATA)
	rm -rfd $(DB_DATA)

re: fclean all

prune: clean
		@docker system prune -a --volumes -f