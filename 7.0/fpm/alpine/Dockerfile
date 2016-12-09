FROM php:7.0-fpm-alpine
MAINTAINER Toby Griffiths <toby@cubicmushroom.co.uk>

RUN apk update && \
    apk upgrade -U -a && \
    apk add git unzip icu-libs wget && \
    docker-php-ext-install intl

# Renumber the user/group
RUN deluser www-data ; addgroup -S -g 1000 www-data ; adduser -SDu 1000 -G www-data www-data

RUN mkdir -p /usr/local/bin

ADD ./scripts/install_composer.sh /usr/local/bin/install_composer.sh

RUN /usr/local/bin/install_composer.sh