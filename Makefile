.PHONY: all setup up down clean

all: setup up

setup:
	@docker volume create wordpress_db
	@docker volume create wordpress_html

up:
	@docker-compose up -d --build

down:
	@docker-compose down

clean:
	@docker-compose down -v
	@docker volume rm -f wordpress_db wordpress_html

re: clean all
