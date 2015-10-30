FROM alpine:latest

RUN export REDIS_COMMANDER_VERSION=0.2.1 \
	&& apk add --update nodejs \
	&& apk add -t build-deps git \
  && npm install -g redis-commander@${REDIS_COMMANDER_VERSION} \
	&& apk del --purge build-deps \
	&& rm -rf /go /var/cache/apk/*

EXPOSE 8081

CMD ["redis-commander", "--redis-port=${REDIS_PORT_6379_TCP_PORT}", "--redis-host=${REDIS_PORT_6379_TCP_ADDR}"]
