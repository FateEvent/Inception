# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faventur <faventur@student.42mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 18:54:40 by faventur          #+#    #+#              #
#    Updated: 2023/08/01 12:02:36 by faventur         ###   ########.fr        #
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
