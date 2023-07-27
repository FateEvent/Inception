# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faventur <faventur@student.42mulhouse.f    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/20 15:57:52 by fab               #+#    #+#              #
#    Updated: 2023/07/27 11:09:04 by faventur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt-get update && apt-get upgrade -y
RUN			apt-get -y install wget

RUN         apt-get -y install php7.3 php-fpm php-mysql mariadb-client sudo

WORKDIR     /var/www/wordpress

# give the right to the user to write in the directory
RUN         chown -R www-data:www-data /var/www/wordpress

RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

COPY		conf/www.conf	/etc/php/7.3/fpm/pool.d/www.conf
# COPY		./wp-config.php	/wp-config.php
COPY		tools/auto_config.sh auto_config.sh
RUN		    chmod 755 auto_config.sh

ENTRYPOINT	["bash", "auto_config.sh"]
EXPOSE		9000