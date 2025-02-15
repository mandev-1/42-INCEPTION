FROM debian:buster

# Update package list and install MariaDB server to set up the database environment
RUN apt update
RUN apt install -y mariadb-server

# Copy custom MariaDB configuration and initialization tools into the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

# Expose port 3306 to allow external MariaDB connections
EXPOSE 3306

# Initialize database with schema and cleanup initialization file
RUN service mysql start && mysql < /var/www/createdb.sql && rm -f /var/www/createdb.sql

# Launch MariaDB server in safe mode as the container's primary process
CMD /usr/bin/mysqld_safe
