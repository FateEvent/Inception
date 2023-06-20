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

# Install NGinx server 
RUN apt install nginx -y

# Install OpenSSL to generate a self-signed certificate
RUN apt-get install openssl -y

# Create the repertory for the certificate and the key
RUN mkdir -p /etc/nginx/ssl

# Generate a self-signed certificate and key
RUN openssl req -newkey rsa:4096 -days 100 -nodes -x509 \
-subj "/C=FR/ST=GE/L=Mulhouse/O=42/OU=42/CN=faventur.42.fr/UID=faventur" \
-out /etc/ssl/certs/inception.crt \
-keyout /etc/ssl/private/inception.key

# Copy the nginx.conf file into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Use chmod to give the right to the user to edit html folder
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

# Start the nginx service
CMD [ "nginx", "-g", "daemon off;" ]

# avant modif:
#RUN openssl req -x509 -nodes \
#	-out /etc/nginx/ssl/inception.crt \
#	-keyout /etc/nginx/ssl/inception.key \
#	-subj "/C=FR/ST=GE/L=Mulhouse/O=42/OU=42/CN=faventur.42.fr/UID=faventur"FROM	debian:buster
