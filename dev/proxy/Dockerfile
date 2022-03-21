ARG CADDY_VERSION=2.4.0
ARG LABEL_PREFIX=proxy
FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY tls /config/tls

CMD ["caddy", "docker-proxy", "-caddyfile-path", "/etc/caddy/Caddyfile", "-label-prefix", "$LABEL_PREFIX"]
