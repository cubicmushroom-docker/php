FROM cubicmushroom/php:7.1-fpm-alpine

RUN apk update && apk upgrade -U -a

###
# Xdebug requires zendframework, but this is not currently in the Alpine core packages, only edge, so not supporting
# this as yet
###

#RUN apk add build-base autoconf \
#    && pecl install xdebug \
#    && apk del build-base autoconf
#
#RUN docker-php-ext-enable xdebug
#
#RUN sed -i '1 a xdebug.remote_autostart=1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && sed -i '1 a xdebug.remote_mode=req' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && sed -i '1 a xdebug.remote_handler=dbgp' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && sed -i '1 a xdebug.remote_port=9000' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && sed -i '1 a xdebug.remote_host=10.254.254.254' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && sed -i '1 a xdebug.remote_enable=1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && sed -i '1 a xdebug.remote_log=/tmp/xdebug.log' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#
#RUN touch /tmp/xdebug.log && chmod 666 /tmp/xdebug.log