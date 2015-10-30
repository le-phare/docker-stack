FROM alpine:latest

RUN export CONSUL_VERSION=0.5.2 \
	&& apk add --update -t build-deps go gcc libgcc libc-dev git mercurial curl \
	&& export GOPATH=/go \
	&& git clone --single-branch --branch=v${CONSUL_VERSION} https://github.com/hashicorp/consul /go \
	&& cd /go \
	&& go get -d -v -ldflags "${CGO_LDFLAGS}" ./... \
	&& go build -ldflags "${CGO_LDFLAGS} -X main.GitCommit $(git rev-parse HEAD) -X main.GitDescribe $(git describe --tags)" -v -o /usr/bin/consul \
	&& curl -sL https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_web_ui.zip > /tmp/webui.zip \
	&& mkdir /ui \
	&& cd /ui \
	&& unzip /tmp/webui.zip \
	&& mv dist/* . \
	&& rm -rf dist \
	&& apk del --purge build-deps \
	&& rm -rf /go /var/cache/apk/* /tmp/webui.zip

COPY config /config

CMD ["consul"]
