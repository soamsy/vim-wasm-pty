FROM docker.io/library/ubuntu:22.04

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        git \
        python3 \
        python3-pip
        

RUN git clone https://github.com/emscripten-core/emsdk.git /root/emsdk
# Download and install the latest SDK tools.
RUN /root/emsdk/emsdk install 3.1.35
# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
RUN /root/emsdk/emsdk activate 3.1.35
# Get emscripten repo, for Emscripten.cmake
RUN git clone https://github.com/emscripten-core/emscripten /root/emscripten
ENV EMSCRIPTEN /root/emscripten
#RUN touch /root/.bash_profile && echo 'source "/root/emsdk/emsdk_env.sh"' >> /root/.bash_profile

WORKDIR /usr/src/app

ENV SHELL="/bin/bash"