FROM ghcr.io/makenv/rtty-build:ubuntu-24.04 AS builder

COPY . .
RUN \
rm -fr build && mkdir build && cd build && \
cmake -DUSE_OPENSSL=ON .. && make && \
mkdir /target && cp src/rtty /target 

FROM ubuntu:24.04 AS main
COPY --from=builder /target /target


