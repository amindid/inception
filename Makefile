.PHONY: all setup up down clean clean_all re

all: setup up

setup:
	bash ./tools/set.sh

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

clean:
	@docker compose -f ./srcs/docker-compose.yml down -v
	@docker volume rm -f ./data/wordpress ./data/mariadb

clean_all: clean
	@docker system prune -af

reset: clean_all all

re: down all
