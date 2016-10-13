VERSIONS := 7.0-fpm 7.0-fpm-dev 7.0-fpm-alpine 7.0-fpm-alpine-dev

all: build push

docker-login:
	docker login

build:
	docker-compose build

push:
	for VERSION in $(VERSIONS) ; do \
	  docker push cubicmushroom/php:$${VERSION} ; \
	done
