docker compose
Dockerfiles are called by docker-compose.yml in my Makefile

-

Dockerfiles -- 1 per service
Each has a name per service (Each Docker)
docker-network establishing connection between my containers

### -- NGINX with TLSv1.2
### -- WordPress + php-fpm 
### -- MariaDB

#### -- Volume containing WordPress database
#### -- Volume containing WordPress website files

NOTE: Containers have to RESTART on crash


--------------------

# VOLUMES 
> Will be available in /home/mman/data

# DOMAIN
> mman.42.fr
> points to local IP address

# OS
> Debian 10: Buster
> Debian 11: Bullseye
> Debian 12: Bookworm
> (TBA) Debian 13: Trixie







# ============================= #

sudo apt-get update
sudo apt-get install -y nginx
nginx -g 'daemon off;'


sudo systemctl start docker