FROM golang:1.7

ENV USER root

WORKDIR /go/src/github.com/cloudflare/cfssl
COPY . .

# restore all deps and build
RUN go get github.com/GeertJohan/go.rice/rice && rice embed-go -i=./cli/serve && \
    go install ./cmd/...

RUN go get github.com/pressly/goose/cmd/goose

VOLUME ["/etc/cfssl"]

EXPOSE 8888

ENTRYPOINT ["cfssl"]
CMD ["--help"]
