all: up

up:
	@mkdir -p /home/mman/data/db
	@mkdir -p /home/mman/data/wp
	@docker-compose -f srcs/docker-compose.yml up -d