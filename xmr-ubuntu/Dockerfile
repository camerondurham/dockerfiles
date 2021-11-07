FROM ubuntu:20.04

ARG DEBIAN_FRONTEND="noninteractive"
RUN apt-get update \
    && apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev \
    && git clone https://github.com/xmrig/xmrig.git \
    && mkdir xmrig/build \
    && cd xmrig/build \
    && cmake .. \
    && make -j$(nproc)
CMD /xmrig/build/xmrig
