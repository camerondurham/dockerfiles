FROM rust:1.56.1-slim-buster as builder
ENV builddeps="cmake git clang"
WORKDIR /usr/src/ion-cli
RUN apt-get update -y \
  && apt-get install -y ${builddeps} \
  && git clone https://github.com/amzn/ion-cli.git \
  && git submodule update --init --recursive
RUN cargo install --path .

FROM debian:11.1-slim
COPY --from=builder /usr/local/cargo/bin/ion /usr/bin/ion
CMD /usr/bin/ion
VOLUME /data
