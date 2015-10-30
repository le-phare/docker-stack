FROM alpine:latest

RUN export REGISTRATOR_VERSION=v5 \
	&& apk add --update -t build-deps go gcc libgcc libc-dev git mercurial \
	&& export GOPATH=/go \
	&& git clone --single-branch --branch=${REGISTRATOR_VERSION} https://github.com/gliderlabs/registrator /go/src/github.com/gliderlabs/registrator \
	&& cd /go/src/github.com/gliderlabs/registrator \
	&& go get \
	&& go build -ldflags "-X main.Version $(cat VERSION)" -o /bin/registrator \
	&& apk del --purge build-deps \
	&& rm -rf /go /var/cache/apk/*

CMD ["registrator"]
