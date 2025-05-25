FROM ubuntu:24.04

RUN --mount=type=cache,target=/var/lib/apt/lists \
cp -a /etc/apt /etc/apt__ && \
apt-get update && \
apt-get install -y openssh-server git build-essential cmake && \
apt-get install -y age libev-dev libssl-dev