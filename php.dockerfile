FROM php:7.3-fpm-alpine

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

# Tell the apk to install a program called shadow that give us access to the usermod command 
# add the 1000 id user (default root id user) to www-data group
# RUN apk --no-cache add shadow && usermod -u 1000 www-data

RUN docker-php-ext-install pdo pdo_mysql bcmath

RUN chown laravel:laravel /var/www/html
