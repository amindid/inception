.PHONY: all setup up down clean

all: setup up

setup:
	@mkdir -p /home/aouchaad/data
	@mkdir -p /home/aouchaad/data/wordpress_db
	@mkdir -p /home/aouchaad/data/wordpress_html

up:
	@docker-compose up -d --build

down:
	@docker-compose down

clean:
	@docker-compose down -v
	@docker volume rm -f /home/aouchaad/data/wordpress_db /home/aouchaad/data/wordpress_html

re: clean all
