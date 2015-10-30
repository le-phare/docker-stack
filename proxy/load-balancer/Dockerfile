FROM alpine:latest

RUN export CONSUL_TEMPLATE_VERSION=v0.9.0 \
	&& apk add --update nginx \
	&& mkdir -p /tmp/nginx \
	&& apk add -t build-deps go gcc libgcc libc-dev git mercurial \
	&& export GOPATH=/go \
	&& git clone --single-branch --branch=${CONSUL_TEMPLATE_VERSION} https://github.com/hashicorp/consul-template /go/src/github.com/hashicorp/consul-template \
	&& cd /go/src/github.com/hashicorp/consul-template \
	&& go get \
	&& go build -o /usr/bin/consul-template \
	&& apk del --purge build-deps \
	&& rm -rf /go /var/cache/apk/*

COPY config /etc/consul-template

CMD ["consul-template", "--config", "/etc/consul-template/config.hcl"]
