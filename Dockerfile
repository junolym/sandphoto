FROM php:8-apache

RUN apt-get update && \
    apt-get install -y zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install gd exif

WORKDIR /var/www/html
COPY . .
RUN chmod 777 temp
