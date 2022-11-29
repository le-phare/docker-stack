# UPGRADE 2.0

## Cleanup

Remove your `.env` file and copy `.env.dist` as `.env`
Backup your `docker-compose.override.yml`

## Start the new stack

[Follow instructions in the README.md](./README.md)

## Cleanup orphaned containers

```
docker compose up -d --remove-orphans
```

## Fix your projects

There is only two networks in this stack :

  - __public__: representing what is expose to your computer
  - __private__: representing what is expose to your application

To make it simple:

  - proxy ➡ public
  - everything else ➡ private

The new routing system use [Caddy](https://caddyserver.com/v2) leveraging HTTP 1, 2 & 3.

It use docker labels instead of environment vars:

```diff
 services:
   web:
     image: lephare/apache:2.4
     environments:
       VIRTUAL_HOST: mydomain.nla.lph
-      HTTPS_REDIRECT: nohttp
-      VIRTUAL_PORT: 8080
+   labels:
+      caddy: mydomain.nla.lph # this was the former VIRTUAL_HOST var
+      caddy.tls: internal # tells Caddy to generate a SSL/TLS certificate for you
+      caddy.reverse_proxy: '{{ upstreams 8080 }}' # configure internal routing
```
