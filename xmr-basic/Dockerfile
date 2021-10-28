FROM alpine:3.14.2
RUN apk add git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev \
&& git clone https://github.com/xmrig/xmrig \
&& mkdir xmrig/build && cd xmrig/build \
&& cmake .. \
&& make -j$(nproc) \
&& apk del git make cmake gcc g++ libstdc++

# mount file to /xmrig/build/config.json

CMD /xmrig/build/xmrig

