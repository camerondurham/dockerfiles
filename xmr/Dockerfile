FROM alpine:3.14.2
RUN apk --no-cache add git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev \
&& git clone https://github.com/xmrig/xmrig \
&& mkdir xmrig/build && cd xmrig/build \
&& cmake -DCMAKE_BUILD_TYPE=Release  .. \
&& make -j$(nproc) \
&& apk del git make cmake gcc g++ libstdc++

CMD /xmrig/build/xmrig
