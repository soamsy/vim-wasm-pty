#!/bin/bash

set -e

if [ ! -d ncurses/usr/local/share/terminfo/x ]; then
    echo "ncurses does not exist. Run git submodule update --init --recursive to download the ncurses submodule."
    exit 1
fi

if [ ! -d vim/usr/local/share/vim/vim90 ]; then
    echo "vim/usr/local/share/ directory does not exist. Please build vim first before packaging files."
    exit 1
fi

cd vim
files=(../ncurses/usr/local/share/terminfo/x/xterm-256color@/usr/local/share/terminfo/x/xterm-256color)


for file in $(find usr/local/share/vim/vim90 -type f); do
    if [[ ! "$file" =~ usr/local/share/vim/vim90/lang.* ]] &&
       [[ ! "$file" =~ usr/local/share/vim/vim90/doc.* ]] &&
       [[ ! "$file" =~ usr/local/share/vim/vim90/spell.* ]] &&
       [[ ! "$file" =~ usr/local/share/vim/vim90/tutor.* ]];
    then
        files+=($file)
    fi
done

mkdir -p ../out
mycmd=("$(which emcc | xargs dirname)/tools/file_packager" ../out/fs.data --lz4 --preload ${files[@]} --js-output=../out/fs.js)
${mycmd[@]}