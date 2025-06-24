FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    nginx git unzip libzip-dev libcurl4-openssl-dev libxml2-dev libonig-dev openssh-server \
    && docker-php-ext-install pdo_mysql curl mbstring xml bcmath zip \
    && apt-get clean

WORKDIR /var/www/html

COPY ./laravel /var/www/html

CMD service nginx start && service ssh start && php-fpm
