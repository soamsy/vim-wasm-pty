#!/bin/bash

set -ex

cd vim

./configure --build=x86_64-linux-gnu --host=wasm32-unknown-emscripten --target=wasm32-unknown-emscripten --with-tlib=tinfo --with-vim-name=vim-core \
  CC=emcc CXX=emcc LD=emcc AR=emar RANLIB=emranlib STRIP=true \
  CFLAGS="-Os -g" \
  LDFLAGS="-Os -g -sLZ4=1 -sFS_DEBUG -sNO_EXIT_RUNTIME=1 -sFORCE_FILESYSTEM=1 -Wno-implicit-function-declaration -L$PWD/../ncurses/usr/local/lib" \
  ac_cv_sizeof_int=4 \
  vim_cv_memmove_handles_overlap=yes \
  vim_cv_stat_ignores_slash=yes \
  vim_cv_tgetent=non-zero \
  vim_cv_terminfo=yes \
  vim_cv_toupper_broken=no \
  vim_cv_tty_group=world \
  vim_cv_getcwd_broken=no
make install DESTDIR=$PWD

mkdir -p ../out
cp src/vim-core ../out/vim-core.js
cp src/vim-core.wasm ../out/vim-core.wasm