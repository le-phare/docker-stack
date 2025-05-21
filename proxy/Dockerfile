FROM --platform=$BUILDPLATFORM caddy:2-builder AS builder
ARG TARGETOS
ARG TARGETARCH

RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/dunglas/mercure/caddy \
    --with github.com/dunglas/vulcain/caddy

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile

CMD ["caddy", "docker-proxy", "--caddyfile-path=/etc/caddy/Caddyfile"]
