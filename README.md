# Development stack

This repository contains the dev configuration for commons containers.

## Install

```shell
git clone git@github.com:le-phare/docker-stack.git
cd docker-stack
```

### Configuration
You also need to set the DOCKER_HOST_SUFFIX env var in your shell

	echo 'export DOCKER_HOST_SUFFIX="eri.lph"' >> ~/.bash_profile

```shell
cp .env.dist .env
docker compose up -d
```

Github Container Registry :

1. Go to [Settings / Developer Settings / Personal Access Token](https://github.com/settings/tokens/new?scopes=write:packages)
2. Enter "Docker stack" in the **Name** field and check **write:packages** and **read:packages**
3. Copy the generated token
4. In a terminal:

```shell
docker login ghcr.io
Username: # Enter your login or your email
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

The default configuration include 3 databases containers : mysql 5, postgres 9 and postgres 17. You can change the loaded containers by changing the `COMPOSE_FILE` environment variable in the `.env` file.

The default configuration can be found in the `.env.dist` file.


The repository currently supports these databases:

 - postgresql 9, 10, 11, 12, 13, 14, 15, 16, 17
 - mysql 5
 - mariadb 10

The repository currently supports these message brokers:

 - rabbitmq 3.8

An optional watchtower service is available to update docker images automatically. Add `watchtower.yml` to `COMPOSE_FILE` variable and set a schedule with `WATCHTOWER_SCHEDULE` variable in your `.env` file (default is `0 0 17 * * *`). You should also [login to your docker hub account](https://docs.docker.com/security/for-developers/access-tokens/#create-an-access-token) to prevent rate limit issues.

## Troubleshooting

- If setup.sh respond `trust: install is not supported on this system`:

```shell
    sudo trust anchor --store /var/lib/docker/volumes/dev_caddy_data/_data/caddy/pki/authorities/local/root.crt
    sudo trust anchor --store /var/lib/docker/volumes/dev_caddy_data/_data/caddy/pki/authorities/local/intermediate.crt
    sudo update-ca-trust
```
