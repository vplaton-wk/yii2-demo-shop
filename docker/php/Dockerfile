FROM bitnami/php-fpm:7.1

WORKDIR /app
ADD . /app

RUN apt-get update && apt-get install -y curl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


#RUN composer --no-progress --prefer-dist install && \ 
#    composer update && \
#    composer config --global github-oauth.github.com ${github_token} &&\
#    ./init --env=Development --overwrite=y && \
#    ./yii migrate --interactive=0 && \
#    ./yii_test migrate --interactive=0 && \
#    echo 'alias app="cd /app"' | tee /home/vagrant/.bash_aliases &&\
#    sed -i "s/#force_color_prompt=yes/force_color_prompt=yes/" /home/vagrant/.bashrc 