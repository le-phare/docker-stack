# The docker dev stack

This repository contains the dev configuration for commons containers.

## Install

```shell
git clone git@gitlab.com:lephare/docker-stack.git
cd docker-stack/dev
```

### Configuration
You also need to set the DOCKER_HOST_SUFFIX env var in your shell

	echo 'export DOCKER_HOST_SUFFIX="eri.lph"' >> ~/.bash_profile

```shell
cp .env.dist .env
docker-compose up -d
```

Gitlab Registry :

1. Go to (https://gitlab.com/-/profile/personal_access_tokens)
2. Enter "Docker stack" in the **Name** field and check **api** and **read_registry**
3. Copy the generated token
4. In a terminal:

```shell
docker login registry.gitlab.com
Username: token # Litteraly
Password: # Enter the generated token copied earlier
```

The message `Login successed` should appear.

#### For Ubuntu / Debian:

```shell
docker-compose up
sudo update-ca-certificates
```

#### For Arch / Manjaro:

```shell
echo 'CA_STORE=/etc/ca-certificates/trust-source/anchors' >> .env
docker-compose up
sudo trust extract-compat
```

#### For Fedora / RHEL / CentOS:

```shell
echo 'CA_STORE=/etc/pki/ca-trust/source/anchors' >> .env
docker-compose up
sudo update-ca-trust extract
```

##### For Gentoo:

```shell
echo 'CA_STORE=/etc/ssl/certs' >> .env
docker-compose up
sudo update-ca-certificates
```

Restart your browsers !

## The base stack

The base stack contains the minimal configuration related to web development.

 - nginx-proxy
 - mkcert-plugin-for-nginx
 - adminer
 - maildev
 - memcached
 - watchtower

## Compose your stack

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
 - blackfire
 - mariadb 10.5.9

### How to use blackfire ?

Add `blackfire.yml` to your COMPOSE_FILE env vars in `.env`. Then go to `https://blackfire.io/account` to get your credentials. Put then in your `env` like this :

```
BLACKFIRE_CLIENT_ID=<blackfire_credentials>
BLACKFIRE_CLIENT_TOKEN=<blackfire_credentials>
BLACKFIRE_SERVER_ID=<blackfire_credentials>
BLACKFIRE_SERVER_TOKEN=<blackfire_credentials>
```
