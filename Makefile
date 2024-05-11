.PHONY: all up down create-volumes

all: up create-volumes

up:
	docker-compose up -d

down:
	docker-compose down

create-volumes:
	docker volume create --name=wordpress_data
	docker volume create --name=db_data
