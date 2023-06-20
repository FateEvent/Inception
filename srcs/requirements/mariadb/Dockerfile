# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faventur <faventur@student.42Mulhouse.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 18:54:40 by faventur          #+#    #+#              #
#    Updated: 2023/06/01 10:50:24 by faventur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Create a container from DEBIAN
FROM debian:buster

# MAJ of apt-get, to get the last version of packages
RUN apt-get update -y && apt-get upgrade -y

# Install MariaDB server (MySQL)
RUN apt-get install mariadb-server -y

# Copy into the container the config file of MariaDB from folder conf
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 755 /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the bash script to create the database and the user into the container
COPY conf/mariadb_config.sh /mariadb_config.sh
RUN chmod 755 /mariadb_config.sh

# Execute the bash script to create the database and the user
ENTRYPOINT ["bash", "mariadb_config.sh"]

# Expose the only port allowed by the subject (MySQL)
EXPOSE 3306
