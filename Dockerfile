FROM ubuntu:jammy AS bash_on_steroids

RUN apt-get update && apt-get dist-upgrade -y 
RUN apt-get install -y wget

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
