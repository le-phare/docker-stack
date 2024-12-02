FROM caddy:2-alpine
ARG TARGETOS
ARG TARGETARCH

ADD --chmod=500 https://caddyserver.com/api/download?os=${TARGETOS}&arch=${TARGETARCH}&p=github.com/lucaslorentz/caddy-docker-proxy/v2&p=github.com/dunglas/mercure/caddy&p=github.com/dunglas/vulcain/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile

HEALTHCHECK --interval=5s --timeout=5s --start-period=5s --retries=3 CMD [ "wget", "-qO-", "http://127.0.0.1:2019/config" ]

CMD ["caddy", "docker-proxy", "--caddyfile-path=/etc/caddy/Caddyfile"]
