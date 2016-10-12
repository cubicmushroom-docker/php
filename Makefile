VERSIONS := 7.0-fpm 7.0-fpm-dev

all: docker-login build push

docker-login:
	docker login

build:
	docker-compose build

push:
	for VERSION in $(VERSIONS) ; do \
	  docker push cubicmushroom/php-$${VERSION} ; \
	done