FROM richarvey/nginx-php-fpm:1.2.0
WORKDIR /var/www/html

ADD . /var/www/html

RUN rm -Rf /etc/nginx/sites-enabled/*

ADD docker/conf/nginx/app.conf /etc/nginx/sites-available/app.conf
RUN ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/var/www/html --filename=composer


#RUN  apk update && apk upgrade &&\
#    apk add -U tzdata
#ENV TZ=Europe/Moscow
#RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime

#RUN composer --no-progress --prefer-dist install && \ 
#    composer update && \
##    composer config --global github-oauth.github.com ${github_token} &&\
#    ./init --env=Development --overwrite=y && \
#    ./yii migrate --interactive=0 && \
#    ./yii_test migrate --interactive=0 && \
#    echo 'alias app="cd /app"' | tee /var/www/html/vagrant/.bash_aliases && \
#    sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /var/www/html/vagrant/.bashrc

