FROM php:7.0-fpm-alpine
MAINTAINER Toby Griffiths <toby@cubicmushroom.co.uk>

RUN apk update && apk upgrade -U -a

# Composer will need git installed sometimes
RUN apk add git unzip

# Renumber the user/group
RUN deluser www-data ; addgroup -S -g 1000 www-data ; adduser -SDu 1000 -G www-data www-data

RUN mkdir -p /usr/local/bin

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"