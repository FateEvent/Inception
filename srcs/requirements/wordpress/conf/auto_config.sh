#!/bin/sh

sleep 10
# https://linuxize.com/post/bash-check-if-file-exists
FILE=/var/www/wordpress/wp-config.php
if [ ! -f "$FILE" ]; then
	# https://developer.wordpress.org/cli/commands
	wp core download --allow-root

	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

	mv /wp-config.php /var/www/html/wp-config.php

	sed -i -r "s/db1/$SQL_DATABASE/1" wp-config.php
	sed -i -r "s/user/$SQL_USER/1" wp-config.php
	sed -i -r "s/pwd/$SQL_PASSWORD/1" wp-config.php

	wp core install		--allow-root \
						--url=$WP_DOMAIN_NAME \
						--title=$WP_TITLE \
						--admin_user=$WP_ADMIN_LOGIN \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_MAIL --path='/var/www/wordpress'
	wp user create		$WP_USER_LOGIN \
						$WP_USER_MAIL \
						--user_pass=$WP_USER_PASSWORD \
						--role=$WP_USER_ROLE
fi
