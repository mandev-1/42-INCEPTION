#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chmod -R 775 /var/www/html/wordpress;
chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

# Check if WordPress is already installed
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    echo "Setting up WordPress..."
    # Download WordPress core files
    wp core download --path=/var/www/html/wordpress --allow-root

    # Create wp-config.php
    wp config create --path=/var/www/html/wordpress --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root

    # Install WordPress
    wp core install --path=/var/www/html/wordpress --url="http://localhost" --title="WordPress Site" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root

    # static website
    cp /var/www/index.html /var/www/html/wordpress/index.html

    echo "Wordpress: creating users..."
    wp user create ${MYSQL_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${MYSQL_PASSWORD} --role=author --allow-root;
    wp theme install inspiro --activate --allow-root

    # enable redis cache
    sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOST' );"      /var/www/html/wordpress/wp-config.php
    sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               /var/www/html/wordpress/wp-config.php
    #sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   /var/www/html/wordpress/wp-config.php
    sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               /var/www/html/wordpress/wp-config.php
    sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          /var/www/html/wordpress/wp-config.php
    sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            /var/www/html/wordpress/wp-config.php

    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root

    echo "Wordpress: set up!"
else
    echo "WordPress is already set up!"
fi

wp redis enable --allow-root

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7.3 -F
