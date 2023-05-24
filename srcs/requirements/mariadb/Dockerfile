FROM    debian:buster

RUN		apt-get update && apt-get upgrade -y \
		&& apt-get install mariadb-server-10.3 -y     

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
