# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faventur <faventur@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/20 16:02:57 by faventur          #+#    #+#              #
#    Updated: 2023/06/20 16:03:00 by faventur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt-get update && apt-get upgrade -y
RUN			apt-get install -y mariadb-server-10.3

COPY		conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN			chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf

# https://www.warp.dev/terminus/dockerfile-run-sh
COPY		tools/mysql_script.sh mysql_script.sh
RUN			chmod 755 mysql_script.sh
ENTRYPOINT	["./mysql_script.sh"]
#ENTRYPOINT	["tail", "-f"]
EXPOSE		3306
