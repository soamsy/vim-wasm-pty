#!/bin/bash

set -ex

cd ncurses
./configure --build x86_64-linux-gnu --host wasm32-unknown-emscripten --disable-stripping --with-install-prefix=$PWD --without-ada -with-termlib \
  CC=emcc CXX=emcc LD=emcc AR=emar RANLIB=emranlib \
  LDFLAGS="-sLZ4=1"
make install
