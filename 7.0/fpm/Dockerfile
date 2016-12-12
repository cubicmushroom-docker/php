FROM php:7.0-fpm
MAINTAINER Toby Griffiths <toby@cubicmushroom.co.uk>

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get dist-upgrade -y && \
    apt-get install -y git unzip libicu-dev wget && \
    apt-get clean && \
    docker-php-ext-install intl

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

RUN mkdir -p /usr/local/bin

ADD ./scripts/install_composer.sh /usr/local/bin/install_composer.sh

RUN echo "Bust cache"

RUN /usr/local/bin/install_composer.sh