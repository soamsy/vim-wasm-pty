FROM docker.io/library/ubuntu:22.04

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        findutils \
        git \
        python3 \
        python3-pip
        

# Install emscripten
RUN git clone https://github.com/emscripten-core/emsdk.git /root/emsdk
RUN /root/emsdk/emsdk install 3.1.35
RUN /root/emsdk/emsdk activate 3.1.35
RUN git clone https://github.com/emscripten-core/emscripten /root/emscripten
ENV EMSCRIPTEN /root/emscripten

WORKDIR /usr/src/app

ENV SHELL="/bin/bash"