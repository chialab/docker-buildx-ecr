###
# Get aws-cli helper
###
FROM golang:1.19 AS builder

RUN go install -ldflags "-linkmode external -extldflags -static" github.com/chialab/aws-ecr-get-login-password@latest \
    && cp $GOPATH/bin/aws-ecr-get-login-password /usr/local/bin/

###
# Final image
###
FROM docker:20.10

COPY --from=docker/buildx-bin /buildx /usr/libexec/docker/cli-plugins/docker-buildx
COPY --from=builder /usr/local/bin/aws-ecr-get-login-password /usr/local/bin/

ENV DOCKER_BUILDKIT=1
