# Development stack

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

Github Container Registry :

1. Go to [Settings / Developer Settings / Personal Access Token](https://github.com/settings/tokens/new?scopes=write:packages)
2. Enter "Docker stack" in the **Name** field and check **write:packages** and **read:packages**
3. Copy the generated token
4. In a terminal:

```shell
docker login ghcr.io
Username: # Enter your login
Password: # Enter the generated token copied earlier
```

The message `Login successed` should appear.

#### Finish setup

```shell
./setup.sh
```

Restart your browsers !

## The base stack

The base stack contains the minimal configuration related to web development.

 - caddy
 - adminer
 - maildev
 - memcached

## Compose your stack

The default configuration include 3 databases containers : mysql 5, postgres 9 and postgres 14. You can change the loaded containers by changing the `COMPOSE_FILE` environment variable in the `.env` file.

The default configuration is

	COMPOSE_FILE=docker-compose.yml:database/adminer/adminer.yml:database/mysql/5.yml:database/postgres/9.yml:database/postgres/14.yml:docker-compose.compatibility.yml


The repository currently support theses databases :

 - postgresql 9, 10, 11, 12, 13, 14
 - mysql 5
 - mariadb 10

## Troubleshooting

- If setup.sh respond `trust: install is not supported on this system`:

```shell
    sudo trust anchor --store /var/lib/docker/volumes/dev_caddy_data/_data/caddy/pki/authorities/local/root.crt
    sudo trust anchor --store /var/lib/docker/volumes/dev_caddy_data/_data/caddy/pki/authorities/local/intermediate.crt
    sudo update-ca-trust
```
