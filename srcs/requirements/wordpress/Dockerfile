FROM    debian:buster

RUN		apt-get update && apt-get upgrade -y
RUN		apt-get install -y wget php7.3 php-fpm php-mysql mariadb-client

RUN		wget https://https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress
