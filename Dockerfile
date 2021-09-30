FROM ubuntu:groovy AS bash_on_steroids

RUN apt update && apt dist-upgrade -y

WORKDIR /bash_on_steroids
COPY install.sh .

RUN ./install.sh

RUN wget https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/index.htsh /var/www/html
RUN wget https://raw.githubusercontent.com/tinoschroeter/bash_on_steroids/master/build.sh
RUN chmod +x build.sh

CMD ["apachectl", "-D", "FOREGROUND"]
