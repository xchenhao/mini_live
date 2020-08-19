FROM php:7.3-fpm-alpine3.8

RUN apk --update add --no-cache composer freetype-dev libjpeg-turbo-dev libpng-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/freetype2

RUN docker-php-ext-install mysqli pdo pdo_mysql mbstring opcache gd

WORKDIR /app

COPY . .
