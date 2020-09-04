FROM php:7.3-fpm-alpine3.8

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk --update add --no-cache composer freetype-dev libjpeg-turbo-dev libpng-dev \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/freetype2 \
  && docker-php-ext-install mysqli pdo pdo_mysql mbstring opcache gd

WORKDIR /app

COPY . .
