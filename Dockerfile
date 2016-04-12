# GOSU Tool on Alpine Linux
FROM gliderlabs/alpine:edge

ARG GOSU_VERSION=1.7
ENV GOSU_VERSION $GOSU_VERSION
ARG GOSU_DOWNLOAD_URL=https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64
ENV GOSU_DOWNLOAD_URL ${GOSU_DOWNLOAD_URL}

RUN apk add --update curl
RUN curl -o /usr/local/bin/gosu -sSL ${GOSU_DOWNLOAD_URL} && \
    chmod +x /usr/local/bin/gosu
RUN apk del curl && \
    rm -rf /var/cache/apk/*

CMD ["/usr/local/bin/gosu"]
