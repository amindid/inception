.PHONY: all setup up down clean

all: setup up

setup:
	@docker volume create wordpress
	@docker volume create db_data

up:
	@docker-compose up -d --build

down:
	@docker-compose down

clean:
	@docker-compose down -v
	@docker volume rm wordpress db_data
