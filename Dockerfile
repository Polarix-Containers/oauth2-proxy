ARG VERSION=7.7.1
ARG UID=700000
ARG GID=700000

FROM golang:alpine AS builder
ARG VERSION

RUN apk -U upgrade \
    && apk add build-base \
    && rm -rf /var/cache/apk/*

ADD https://github.com/oauth2-proxy/oauth2-proxy.git#v${VERSION} .

RUN go get github.com/go-jose/go-jose/v3@v3.0.3 golang.org/x/crypto@v0.31.0 golang.org/x/net@v0.33.0 \
    && go mod download
    
RUN --network=none \
    sed -i 's/CGO_ENABLED=0/CGO_ENABLED=1/g' Makefile \
    && make build

# ======================================= #

FROM alpine
ARG UID
ARG GID

LABEL maintainer="Thien Tran contact@tommytran.io"

RUN apk -U upgrade \
    && apk add ca-certificates libstdc++ \
    && rm -rf /var/cache/apk/*

RUN --network=none \
    addgroup -g ${GID} oauth2-proxy \
    && adduser -u ${UID} --ingroup oauth2-proxy --disabled-password --system oauth2-proxy

COPY --from=builder /go/oauth2-proxy /bin/oauth2-proxy

COPY --from=ghcr.io/polarix-containers/hardened_malloc:latest /install /usr/local/lib/
ENV LD_PRELOAD="/usr/local/lib/libhardened_malloc.so"

USER oauth2-proxy

ENTRYPOINT ["/bin/oauth2-proxy"]
