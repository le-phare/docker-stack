ARG CADDY_VERSION=2.5.1

FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

RUN xcaddy build \
  # Docker label support
  --with github.com/lucaslorentz/caddy-docker-proxy/plugin \
  # Mercure / Vulcain support
  --with github.com/dunglas/mercure \
  --with github.com/dunglas/mercure/caddy \
  --with github.com/dunglas/vulcain \
  --with github.com/dunglas/vulcain/caddy

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY --from=dunglas/mercure:v0.11 /srv/public /srv/mercure-assets/
COPY Caddyfile /etc/caddy/Caddyfile

CMD ["caddy", "docker-proxy", "-caddyfile-path=/etc/caddy/Caddyfile"]
