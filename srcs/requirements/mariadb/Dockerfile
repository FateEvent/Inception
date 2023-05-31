FROM	debian:buster

RUN		apt-get update && apt-get upgrade -y \
		&& apt-get install mariadb-server-10.3 -y

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN		chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf

# https://www.warp.dev/terminus/dockerfile-run-sh
COPY	./tools/mysql_script.sh	./tools/mysql_script.sh
RUN		chmod 755 ./tools/mysql_script.sh
CMD		["./tools/mysql_script.sh"]
