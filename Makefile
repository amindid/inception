.PHONY: all setup up down clean

all: setup up

setup:
	bash set.sh

up:
	@docker-compose up -d --build

down:
	@docker-compose down

clean:
	@docker-compose down -v
	@docker volume rm -f ./data/wordpress ./data/mariadb

clean_all: clean
	@docker rm -f $(shell docker ps -aq) || true
	@docker rmi -f $(shell docker images -q) || true
	@docker volume rm $(shell docker volume ls -q) || true
	@docker network prune  || true

re: clean all
