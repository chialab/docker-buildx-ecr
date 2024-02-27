###
# Get aws-cli helper
###
FROM golang:1.22 AS builder

RUN go install -ldflags "-linkmode external -extldflags -static" github.com/chialab/aws-ecr-get-login-password@latest \
    && cp $GOPATH/bin/aws-ecr-get-login-password /usr/local/bin/

###
# Final image
###
FROM docker:25.0.3-cli

COPY --from=builder /usr/local/bin/aws-ecr-get-login-password /usr/local/bin/
