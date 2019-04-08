# Makefile for Docker Nginx PHP Composer

APPROOT=/opt/TalentCloud

build-db:
	php artisan migrate"
	php artisan db:seed"

clean:
	rm -Rf vendor/
	rm -Rf composer.lock
	rm -Rf etc/ssl/*
	rm -Rf report/*

env:
	cp /opt/TalentCloud/.env.example ${APPROOT}/var/www/.env

code-sniff:
	./vendor/bin/phpcs --config-set ignore_errors_on_exit 1
	./vendor/bin/phpcs --config-set ignore_warnings_on_exit 1
	./vendor/bin/phpcs -d memory_limit=512M -v --standard=PSR2 --extensions=php app/

composer-install:
	composer install

npm-install-cross-env-global:
	npm install --global cross-env

npm-install-no-bin-links:
	npm install --no-bin-links

npm-install:
	npm install

npm-dev:
	npm run dev

npm-production:
	npm run production

fake-data:
	php artisan db:seed

fresh-db:
	php artisan migrate:fresh

gen-certs:
	OPENSSL_CONF=/usr/src/php/ext/openssl/tests/openssl.cnf openssl req -nodes -x509 -newkey rsa:4096 -keyout ${APPROOT}/etc/ssl/server.key -out ${APPROOT}/etc/ssl/server.pem -days 365 -subj "/C=US/ST=Ontario/L=Ottawa/O=Localhost/OU=Org/CN=talent.test"

laravel-init:
	php artisan key:generate

phpmd:
	./vendor/bin/phpmd ./app html codesize,naming,unusedcode --reportfile report/phpmd.html --ignore-violations-on-exit

phpunit:
	vendor/bin/phpunit --coverage-clover=coverage.xml

test-all: code-sniff phpmd phpunit

.PHONY: build-db clean code-sniff composer-install docker-start docker-stop fake-data fresh-db gen-certs laravel-init logs phpmd phpunit test-all

