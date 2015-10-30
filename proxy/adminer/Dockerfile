FROM alpine:latest
MAINTAINER Nicolas LAURENT <docker@aegypius.com>

WORKDIR /app
EXPOSE 9000

RUN apk --update add -t runtime-deps php-fpm php-pdo_mysql php-pdo_pgsql php-pdo_sqlite curl && \
  curl -sL http://www.adminer.org/latest.php > /app/index.php && \
  rm -rf /var/cache/apk/*

CMD ["/usr/bin/php-fpm", "--nodaemonize"]
