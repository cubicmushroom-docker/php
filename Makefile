VERSIONS := 7.0-fpm 7.0-fpm-dev 7.0-fpm-alpine 7.0-fpm-alpine-dev

all: prepare build push

docker-login:
	docker login

prepare:
	rm -Rf ./7.0/fpm/scripts
	rm -Rf ./7.0/fpm/alpine/scripts
	cp -R ./scripts ./7.0/fpm/scripts
	cp -R ./scripts ./7.0/fpm/alpine/scripts

build:
	docker-compose build --no-cache

push:
	for VERSION in $(VERSIONS) ; do \
	  docker push cubicmushroom/php:$${VERSION} ; \
	done
