FROM ubuntu:16.04
MAINTAINER Tino Schroeter

RUN apt-get update && apt-get install -y fcgiwrap nginx && apt-get clean

ADD default /etc/nginx/sites-enabled/default
ADD . /var/www/html

CMD spawn-fcgi -s /var/run/fcgiwrap.socket /usr/sbin/fcgiwrap \
&& chown www-data /var/run/fcgiwrap.socket && nginx -g "daemon off;"
