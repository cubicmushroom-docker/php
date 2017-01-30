VERSIONS := 7.1 7.0
FLAVOURS := fpm fpm-alpine

all: prepare build push

docker-login:
	docker login

prepare:
	for VERSION in $(VERSIONS) ; do \
		for FLAVOUR in $(FLAVOURS) ; do \
			rm -Rf ./$${VERSION}/fpm/scripts ; \
			rm -Rf ./$${VERSION}/fpm/alpine/scripts ; \
			cp -R ./scripts ./$${VERSION}/fpm/scripts ; \
			cp -R ./scripts ./$${VERSION}/fpm/alpine/scripts ; \
		done ; \
	done


build:
	docker-compose build --no-cache

push:
	for VERSION in $(VERSIONS) ; do \
		for FLAVOUR in $(FLAVOURS) ; do \
			docker push cubicmushroom/php:$${VERSION}-$${FLAVOUR} ; \
			docker push cubicmushroom/php:$${VERSION}-$${FLAVOUR}-dev ; \
		done ; \
	done
