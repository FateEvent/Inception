#!/bin/bash

# https://stackoverflow.com/questions/25503412/how-do-i-know-when-my-docker-mysql-container-is-up-and-mysql-is-ready-for-taking
while ! mysqladmin ping -h"$SQL_HOST" --silent; do
	sleep 1
done

# https://stackoverflow.com/questions/43654656/dockerfile-if-else-condition-with-external-arguments
# https://linuxize.com/post/bash-check-if-file-exists
if [ ! -e /var/www/wordpress/wp-config.php ]; then
	mkdir -p /var/www/.wp-cli && chown -R www-data:www-data /var/www/.wp-cli && chmod -R 755 /var/www/.wp-cli
	sudo -u www-data wp core download --path='/var/www/wordpress/'
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

	if [ ! -f /log.txt ]; then
		touch /log.txt
	fi
	sudo -u www-data wp user create      --role=author $USER1_LOGIN $USER1_MAIL \
						--user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
	
	# sudo -u www-data wp theme install twentyseventeen --activate
	# sudo -u www-data wp option update comment_moderation 0 --path='/var/www/wordpress'

fi
