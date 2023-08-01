# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faventur <faventur@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 18:54:40 by faventur          #+#    #+#              #
#    Updated: 2023/08/01 12:35:23 by faventur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN	apt-get update -y 
RUN	apt-get upgrade -y 
RUN	apt-get -y install wget
RUN	apt-get install -y php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client \
	sudo \
	sendmail

WORKDIR /var/www/wordpress

# give the right to the user to write in the directory
RUN	chown -R www-data:www-data /var/www/wordpress

# configuration de wordpress
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# copy wp-cli to /usr/local/bin/wp and give the right to the user to write in the directory
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp

# copy auto-configuration script
COPY	./conf/php.conf	/etc/php/7.3/fpm/pool.d/www.conf
COPY	conf/wp_config.sh	wp_config.sh
RUN		chmod 755 wp_config.sh

ENTRYPOINT ["bash", "wp_config.sh"]
EXPOSE	9000