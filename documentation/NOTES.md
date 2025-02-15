WARN[0000] /home/mman/INCEPTION/srcs/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion
unable to get image 'srcs-wordpress': permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.47/images/srcs-wordpress/json": dial unix /var/run/docker.sock: connect: permission denied


This error occurs because your user doesn't have the necessary permissions to access the Docker daemon socket. Here are a few ways to resolve this:

1. Add your user to the docker group (Recommended):
```bash
sudo usermod -aG docker $USER
```
Then log out and log back in for the changes to take effect, or run:
```bash
newgrp docker
```

2. If you're using Docker Compose, make sure you have permissions:
```bash
sudo chown $USER /var/run/docker.sock
```

3. Alternatively, you can run docker commands with sudo:
```bash
sudo docker-compose up
```

As for the version warning, you can safely remove the `version` field from your docker-compose.yml file as it's no longer required in recent versions of Docker Compose.

Choose the method that best fits your security requirements. The first method (adding user to docker group) is generally recommended for development environments.

Remember that giving a user access to the Docker daemon is essentially giving them root access to your system, so be careful in production environments.
