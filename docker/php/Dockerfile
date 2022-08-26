FROM php:7.1-fpm

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
#    composer update && \
#    composer config --global github-oauth.github.com ${github_token} &&\
#    ./init --env=Development --overwrite=y && \
#    ./yii migrate --interactive=0 && \
#    ./yii_test migrate --interactive=0 && \
#    echo 'alias app="cd /app"' | tee /home/vagrant/.bash_aliases &&\
#    sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /home/vagrant/.bashrc 
CMD ["php-fpm"]