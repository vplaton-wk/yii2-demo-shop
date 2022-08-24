FROM richarvey/nginx-php-fpm

ADD . /var/www/app

RUN rm -Rf /etc/nginx/sites-enabled/*

ADD docker/conf/nginx/app.conf /etc/nginx/sites-available/app.conf
RUN ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
