FROM debian:buster

RUN apt-get update \
&& apt-get install wget curl gnupg -yq \
&& wget http://nginx.org/keys/nginx_signing.key \
&& apt-key add nginx_signing.key \
&& echo "deb http://nginx.org/packages/debian/ buster nginx" >> /etc/apt/sources.list \
&& echo "deb-src http://nginx.org/packages/debian/ buster nginx" >> /etc/apt/sources.list \
&& apt-get update -yq \
&& apt-get install nginx -yq \
&& apt-get clean -yq

ADD . /config/

CMD systemctl start nginx.service