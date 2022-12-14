FROM buildpack-deps:stretch

RUN sed -i 's/archive.ubuntu.com/mirror.aarnet.edu.au\/pub\/ubuntu\/archive/g' /etc/apt/sources.list

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get -y update && apt-get install -y \
    libjansson-dev \
    libnice-dev \
    libssl-dev \
    libsrtp-dev \
    libsofia-sip-ua-dev \
    libglib2.0-dev \
    libopus-dev \
    libogg-dev \
    libini-config-dev \
    libcollection-dev \
    libconfig-dev \
    pkg-config \
    gengetopt \
    libtool \
    autopoint \
    automake \
    build-essential \
    subversion \
    git \
    cmake \
    unzip \
    zip \
    lsof wget vim sudo rsync cron mysql-client openssh-server supervisor locate mplayer valgrind certbot python-certbot-apache dnsutils tcpdump gstreamer1.0-tools

RUN cd / && git clone https://github.com/meetecho/janus-gateway.git && cd /janus-gateway && \
    git checkout refs/tags/v1.1.0 && \
    sh autogen.sh
