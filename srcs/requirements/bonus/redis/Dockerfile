# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: faventur <faventur@student.42mulhouse.f    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/20 16:02:57 by faventur          #+#    #+#              #
#    Updated: 2023/07/28 09:24:21 by faventur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM		debian:buster

RUN			apt-get update && apt-get upgrade -y

# https://redis.io/docs/getting-started/installation/install-redis-on-linux
RUN			apt-get install -y lsb-release curl gpg
RUN			curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN			echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list
RUN			apt-get update
RUN			apt-get install -y redis

COPY		conf/redis.conf /etc/redis/redis.conf
RUN			chmod 755 /etc/redis/redis.conf

COPY		tools/redis_script.sh redis_script.sh
RUN			chmod 755 redis_script.sh

#ENTRYPOINT	["./redis_script.sh"]
CMD			["redis-server"]
EXPOSE		6379