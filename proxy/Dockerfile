ARG CADDY_VERSION=2.6.4
FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

RUN xcaddy build \
  # Docker label support
  --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
  # Mercure / Vulcain support
  --with github.com/dunglas/mercure \
  --with github.com/dunglas/mercure/caddy \
  --with github.com/dunglas/vulcain \
  --with github.com/dunglas/vulcain/caddy

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY --from=dunglas/mercure:v0.11 /srv/public /srv/mercure-assets/
COPY Caddyfile /etc/caddy/Caddyfile

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "wget", "-qO-", "http://localhost:2019/config" ]

CMD ["caddy", "docker-proxy", "--caddyfile-path=/etc/caddy/Caddyfile"]
