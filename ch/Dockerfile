
FROM golang:1.17.2-alpine3.14 as builder
WORKDIR /ch-build/
RUN apk update \
 && apk add git \
 && git clone https://github.com/camerondurham/ch.git \
 && cd ch \
 && go mod download \
 && mkdir -p /ch-build/ch/build && go build -v -o /ch-build/ch/build

FROM alpine:3.14.2 as cli
WORKDIR /cli/
COPY --from=builder /ch-build/ch/build ./
ENTRYPOINT ["/cli/ch"]
