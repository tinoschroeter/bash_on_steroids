FROM ubuntu:20.04 AS bash_on_steroids

ENV DEBIAN_FRONTEND=noninteractive TZ=Europe/Berlin
RUN apt-get update && \ 
    apt-get install -y wget curl

WORKDIR /bash_on_steroids
COPY install.sh .

RUN sh install.sh

COPY build.sh .
COPY index.htsh .

RUN mkdir /var/www/html/static
COPY static /var/www/html/static/
RUN chmod +x build.sh
RUN ./build.sh

CMD ["apachectl", "-D", "FOREGROUND"]
