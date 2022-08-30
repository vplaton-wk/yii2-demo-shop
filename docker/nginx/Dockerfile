
FROM nginx:latest

RUN groupadd --gid 1000 app \
    && useradd --uid 1000 --gid app --shell /bin/bash --create-home app

WORKDIR /var/www/html

ADD . /var/www/html

COPY default.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && \
    apt-get install curl &&\
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
ENV TZ="Europe/Moscow"


