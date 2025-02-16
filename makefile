all: up

# Create necessary directories and start containers in detached mode
up:
	@mkdir -p /home/${USER}/data/db
	@mkdir -p /home/${USER}/data/wp
	@docker-compose -f srcs/docker-compose.yml up -d

# Stop and remove containers and networks
down:
	@docker-compose -f srcs/docker-compose.yml down

# List containers
ps:
	@docker-compose -f srcs/docker-compose.yml ps

# Remove all images, volumes, and prune the system
fclean: down
	@docker rmi -f $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker system prune -a --force
	@sudo rm -Rf /home/${USER}/data/db
	@sudo rm -Rf /home/${USER}/data/wp
	@mkdir -p /home/${USER}/data/db
	@mkdir -p /home/${USER}/data/wp

# Rebuild and restart services
re:
	@mkdir -p /home/${USER}/data/wp
	@mkdir -p /home/${USER}/data/db
	@docker-compose -f srcs/docker-compose.yml build
	@docker-compose -f srcs/docker-compose.yml up

.PHONY: all up down ps fclean re
