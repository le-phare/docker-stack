# Development stack

This repository contains the dev configuration for commons containers.

## Install

```shell
git clone git@github.com:le-phare/docker-stack.git
cd docker-stack
```

### Configuration
You need to set the `DOCKER_HOST_SUFFIX` env var in your shell, then copy `.env.dist` to `.env`.

```shell
echo 'export DOCKER_HOST_SUFFIX="change_me"' >> ~/.bash_profile
cp .env.dist .env
docker compose up -d
```

GitHub Container Registry :

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

Restart your browsers!

## The base stack

The base stack contains the minimal configuration related to web development.

- Adminer
- Caddy
- MailDev
- Memcached

## Compose your stack

The default configuration enables currently supported PostgreSQL images : 14, 15, 16, 17 and 18.

You can change the loaded containers by changing the `COMPOSE_FILE` environment variable in the `.env` file.

The default configuration can be found in the `.env.dist` file.

The repository currently supports these databases:

- PostgreSQL 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
- MySQL 5
- MariaDB 10

The repository currently supports these message brokers:

- RabbitMQ 3.8

[Redisinsight](https://redis.io/insight/) is available:

 - Add `./redis/redisinsight.yml` to your `.env`
 - Got to [redisinsight.${DOCKER_HOST_SUFFIX}.lph](https://redisinsight.${DOCKER_HOST_SUFFIX}.lph/) or [redisinsight.lph](https://redisinsight.lph/)

[Aspire Dashboard](https://aspire.dev/dashboard/standalone/) is available as a local OpenTelemetry backend (traces, metrics, logs, GenAI spans):

 - Add `observability/aspire.yml` to your `.env`
 - Go to [aspire.${DOCKER_HOST_SUFFIX}](https://aspire.${DOCKER_HOST_SUFFIX}/)
 - Send OTLP data to `localhost:4317` (gRPC) or `localhost:4318` (HTTP) from the host, or to `aspire-dashboard:18889` (gRPC) or `aspire-dashboard:18890` (HTTP) from containers on the private network
 - Telemetry is kept in memory only and OTLP endpoints are unauthenticated (bound to `127.0.0.1`): local use only

An optional watchtower service is available to update docker images automatically:
Add `watchtower.yml` to `COMPOSE_FILE` variable and set a schedule with `WATCHTOWER_SCHEDULE` variable in your `.env` file
(default is `0 0 17 * * *`).

You should also
[login to your docker hub account](https://docs.docker.com/security/for-developers/access-tokens/#create-an-access-token)
to prevent rate limit issues.
