#FROM richarvey/nginx-php-fpm:1.2.0
FROM nginx:latest

WORKDIR /var/www/html

ADD . /var/www/html

RUN rm -Rf /etc/nginx/sites-enabled/*

ADD app.conf /etc/nginx/conf.d/default.conf
#RUN ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

RUN apt-get update && \
    apt-get install curl &&\
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
ENV TZ="Europe/Moscow"


