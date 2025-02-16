mman@mman:~/INCEPTION$ ^C^C
mman@mman:~/INCEPTION$ docker exec -it nginx bash
Error response from daemon: Container 01aace92e9eaa100f7cd5dd2dadafc33819405a6db7c6c3e5b6a7db429f235e1 is not running
mman@mman:~/INCEPTION$ nginx -t
bash: nginx: command not found
mman@mman:~/INCEPTION$ ^C^C
mman@mman:~/INCEPTION$ docker exec -it wordpress bash
Error response from daemon: Container e150fe887010df7f66298e9e8327cc0e908a88d1c35aa65f5d92b729990d3283 is not running
mman@mman:~/INCEPTION$ cd srcs/
mman@mman:~/INCEPTION/srcs$ docker-compose -f srcs/docker-compose.yml up -d
ERROR: .FileNotFoundError: [Errno 2] No such file or directory: './srcs/docker-compose.yml'
mman@mman:~/INCEPTION/srcs$ cd ..
mman@mman:~/INCEPTION$ docker-compose -f srcs/docker-compose.yml up -d
mariadb is up-to-date
portainer is up-to-date
Starting wordpress ... 
Starting wordpress ... done
Starting nginx     ... done
mman@mman:~/INCEPTION$ docker ps
CONTAINER ID   IMAGE                           COMMAND                  CREATED          STATUS          PORTS                                                                                            NAMES
bb224dc496a2   adminer:4                       "entrypoint.sh php -…"   18 minutes ago   Up 18 minutes   0.0.0.0:9000->8080/tcp, :::9000->8080/tcp                                                        adminer
add5ddd8840c   srcs_mariadb                    "/bin/sh -c /usr/bin…"   18 minutes ago   Up 18 minutes   3306/tcp                                                                                         mariadb
d740cc0bcc6e   portainer/portainer-ce:latest   "/portainer"             18 minutes ago   Up 18 minutes   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp, 9000/tcp   portainer
mman@mman:~/INCEPTION$ docker exec -it nginx bash
Error response from daemon: Container 01aace92e9eaa100f7cd5dd2dadafc33819405a6db7c6c3e5b6a7db429f235e1 is not running
mman@mman:~/INCEPTION$ docker exec -it wordpress bash
Error response from daemon: Container e150fe887010df7f66298e9e8327cc0e908a88d1c35aa65f5d92b729990d3283 is not running
mman@mman:~/INCEPTION$ 