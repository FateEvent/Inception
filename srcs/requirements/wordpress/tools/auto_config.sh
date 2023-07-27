#!bin/bash

sleep 10
# https://stackoverflow.com/questions/43654656/dockerfile-if-else-condition-with-external-arguments
# https://linuxize.com/post/bash-check-if-file-exists
if [ ! -e /var/www/wordpress/wp-config.php ]; then
	mkdir -p /var/www/.wp-cli && chown -R www-data:www-data /var/www/.wp-cli && chmod -R 755 /var/www/.wp-cli
	sudo -u www-data wp core download --path="/var/www/wordpress/"
	sudo -u www-data wp config create \
						--dbhost=$SQL_HOST \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'

	sleep 10
	sudo -u www-data wp core install     --url=$DOMAIN_NAME \
						--title=$SITE_TITLE \
						--admin_user=$ADMIN_USER \
						--admin_password=$ADMIN_PASSWORD \
						--admin_email=$ADMIN_EMAIL \
						--path='/var/www/wordpress'
						
	sudo -u www-data wp user create      --role=author $USER1_LOGIN $USER1_MAIL \
						--user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
	
	sudo -u www-data wp plugin install wp-redis --activate
	sudo -u www-data wp redis enable
fi

# if /run/php folder does not exist, create it
if [ ! -d /run/php ]; then
	mkdir /run/php
fi
/usr/sbin/php-fpm7.3 -F