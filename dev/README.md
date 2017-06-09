# The docker dev stack

This repository contains the dev configuration for commons containers.

## Install

	$ git clone git@bitbucket.org:lephare/docker-stack.git
	$ cd docker-stack/dev
	$ cp .env.dist .env
	$ docker-compose up -d

## Choose yours databases

The default configuration include two databases containers : mysql-5.5 and postgresql-9.6. You can change the loaded containers by changing the `COMPOSE_FILE` environment variable in the `.env` file.

The default configuration is

	COMPOSE_FILE=docker-compose.yml:mysql_55.yml:pgsql_95.yml

If you don't use mysql but have multiple project running elastic-search you can use

	COMPOSE_FILE=docker-compose.yml:pgsql_95.yml:elastic_53.yml

The repository currently support theses databases :

 - postgresql 9.4
 - postgresql 9.5
 - postgresql 9.6
 - mysql 5.5
 - mysql 5.7
 - elasticsearch 5.3

## Build the docs

The documentation can be builded with the following step

	$ cd docs
	$ composer update

Then restart the containers with

	$ docker-compose up -d
