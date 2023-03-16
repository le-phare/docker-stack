#!/usr/bin/env bash

docker compose --ansi never up -d --build 2>& 1> /dev/null
docker compose cp proxy:/usr/bin/caddy /tmp/caddy

XDG_DATA_HOME=/var/lib/docker/volumes/dev_caddy_data/_data

sudo XDG_DATA_HOME=${XDG_DATA_HOME} \
/tmp/caddy start 2&> /dev/null; \
/tmp/caddy untrust; \
/tmp/caddy trust; \
/tmp/caddy stop 2&> /dev/null; \

rm /tmp/caddy
