FROM ubuntu:14.04

MAINTAINER Amit Mor <amimimor@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y build-essential libevent-1.4-2 autoconf libtool openssl libssl-dev
RUN apt-get install -y git
WORKDIR /

ADD dynomite/ /dynomite/
RUN cd /dynomite && autoreconf -fvi && \
    ./configure --enable-debug=log && \
    make && \
    src/dynomite -h

