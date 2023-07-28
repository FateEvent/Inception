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
	
	# https://github.com/rhubarbgroup/redis-cache/blob/develop/INSTALL.md
	# these commands install the Redis plugin for Wordpress
	wp plugin install wp-redis --activate --allow-root
	wp plugin update --all --allow-root

	# adjust Redis host and port if necessary 
	wp config set 'WP_REDIS_HOST', '127.0.0.1'
	wp config set 'WP_REDIS_PORT', 6379

	# change the prefix and database for each site to avoid cache data collisions
	wp config set 'WP_REDIS_PREFIX', $SITE_TITLE
	wp config set 'WP_REDIS_DATABASE', 0 # 0-15

	# reasonable connection and read+write timeouts
	wp config set 'WP_REDIS_TIMEOUT', 1
	wp config set 'WP_REDIS_READ_TIMEOUT', 1
fi

# if /run/php folder does not exist, create it
if [ ! -d /run/php ]; then
	mkdir /run/php
fi
sudo -u www-data wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F