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

To keep telemetry on disk, add an [OpenTelemetry Collector](https://opentelemetry.io/docs/collector/) in front of Aspire:

 - Add `observability/collector.yml` to your `.env`, **after** `observability/aspire.yml`
 - The collector takes over `localhost:4317` / `localhost:4318`, forwards everything to Aspire and writes OTLP JSON lines to `observability/telemetry/` (`traces.jsonl`, `metrics.jsonl`, `logs.jsonl`)
 - Each file is rotated when it reaches `OTEL_TELEMETRY_MAX_MB` (default `100`); rotated files older than `OTEL_TELEMETRY_MAX_DAYS` (default `30`) or beyond the newest `OTEL_TELEMETRY_MAX_BACKUPS` (default `20`, per signal) are deleted at the next rotation or collector start, so the default disk usage is capped around 6 GB
 - Files are written as UID/GID `1000`; set `OTEL_COLLECTOR_UID` / `OTEL_COLLECTOR_GID` if yours differ, or `OTEL_TELEMETRY_DIR` to write elsewhere
 - Query them with `jq` or [DuckDB](https://duckdb.org/), e.g. span names: `jq -r '.resourceSpans[].scopeSpans[].spans[].name' observability/telemetry/traces.jsonl | sort | uniq -c`
 - GenAI spans from Claude Code (`CLAUDE_CODE_ENABLE_TELEMETRY=1`) get standard `gen_ai.usage.*` attributes, so token counts show up in Aspire's GenAI visualizer
 - With `OTEL_LOG_USER_PROMPTS=1` or `OTEL_LOG_TOOL_CONTENT=1`, prompts and tool inputs/outputs are written in clear text to these files, along with your account email: keep them out of shared or backed-up folders
 - For your own LLM calls, set `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT=true` (where your SDK supports it) to see prompts and completions in the GenAI visualizer

Observability roadmap:

 - Add a reliable `gen_ai.usage.cost` attribute to Claude Code spans: a price table in the collector underestimates cache writes, since Claude Code's 1-hour cache is billed 2× input, not 1.25×; reusing the `cost_usd` that Claude Code reports in its `claude_code.api_request` log events would avoid hardcoded prices

An optional watchtower service is available to update docker images automatically:
Add `watchtower.yml` to `COMPOSE_FILE` variable and set a schedule with `WATCHTOWER_SCHEDULE` variable in your `.env` file
(default is `0 0 17 * * *`).

You should also
[login to your docker hub account](https://docs.docker.com/security/for-developers/access-tokens/#create-an-access-token)
to prevent rate limit issues.
