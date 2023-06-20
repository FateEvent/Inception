#!/bin/sh

sleep 10
# https://linuxize.com/post/bash-check-if-file-exists
FILE=/var/www/wordpress/wp-config.php
if [ ! -e "$FILE" ]; then
	wp config create	--allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'

	sleep 10
	wp core install     --url=$WP_DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
	wp user create      --allow-root --role=author $WP_USER_LOGIN $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD --path='/var/www/wordpress' >> /log.txt
fi

# if /run/php folder doesn't exist, create it
# https://stackoverflow.com/questions/43654656/dockerfile-if-else-condition-with-external-arguments
if [ ! -d /run/php ]; then
	mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F