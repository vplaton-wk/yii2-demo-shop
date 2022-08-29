FROM php:7.1-fpm

RUN groupadd --gid 1000 php \
    && useradd --uid 1000 --gid php --shell /bin/bash --create-home php

WORKDIR /var/www/html
ADD . /var/www/html

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
	libpng-dev \
	libonig-dev \
	libzip-dev \
	libmcrypt-dev \
    && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql zip \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

#RUN composer --no-progress --prefer-dist install && \ 
#    ./init 
#    ./yii migrate 

CMD ["php-fpm"]