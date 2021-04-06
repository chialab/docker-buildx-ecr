###
# Get buildx
###
FROM alpine AS fetcher

ARG BUILDX_VERSION=0.5.1

RUN apk add wget \
    && wget -O /docker-buildx "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-amd64" \
    && chmod a+x /docker-buildx

###
# Get aws-cli helper
###
FROM golang:1.16 AS builder

RUN go get -ldflags "-linkmode external -extldflags -static" github.com/chialab/aws-ecr-get-login-password \
    && cp $GOPATH/bin/aws-ecr-get-login-password /usr/local/bin/

###
# Final image
###
FROM docker:20.10

COPY --from=fetcher /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx
COPY --from=builder /usr/local/bin/aws-ecr-get-login-password /usr/local/bin/

ENV DOCKER_BUILDKIT=1
