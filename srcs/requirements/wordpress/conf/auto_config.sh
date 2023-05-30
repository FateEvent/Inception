#!/bin/sh

sleep 10
# https://linuxize.com/post/bash-check-if-file-exists
FILE=/var/www/wordpress/wp-config.php
if [ ! -f "$FILE" ]; then
	# https://developer.wordpress.org/cli/commands
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'
	wp core install		--allow-root \
						--url=$WP_DOMAIN_NAME \
						--title=$WP_TITLE \
						--admin_user=$WP_ADMIN_LOGIN \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_MAIL \
						--path='/var/www/wordpress'
	wp user create		$WP_USER_LOGIN \
						$WP_USER_MAIL \
						--user_pass=$WP_USER_PASSWORD \
						--role=$WP_USER_ROLE
fi
