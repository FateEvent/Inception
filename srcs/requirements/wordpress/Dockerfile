FROM		debian:buster

RUN			apt-get update && apt-get upgrade -y
RUN			apt-get -y install wget php7.3 php7.3-fpm php7.3-mysql mariadb-client

RUN			wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN			cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz

# To obtain the rights on our root and main users
RUN			chown -R root:root /var/www/wordpress

COPY		conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

COPY		conf/auto_config.sh conf/auto_config.sh
RUN			chmod 755 conf/auto_config.sh
ENTRYPOINT	["conf/auto_config.sh"]

# https://stackoverflow.com/questions/43654656/dockerfile-if-else-condition-with-external-arguments
RUN         if [ ! -d /run/php ] ; then mkdir /run/php ; fi

CMD			["/usr/sbin/php-fpm7.3", "-F"]
