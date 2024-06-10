.PHONY: all setup up down clean

all: setup up

setup:
	bash ./tools/set.sh

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose down

clean:
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@docker volume rm -f ./data/wordpress ./data/mariadb ./data/website

clean_all: clean
	@docker rm -f $(shell docker ps -aq) || true
	@docker rmi -f $(shell docker images -q) || true
	@docker volume rm $(shell docker volume ls -q) || true
	@docker network prune  || true
	@sudo rm -rf ~/data/*

re: clean_all all
