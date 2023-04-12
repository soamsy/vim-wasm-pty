#!/usr/bin/env bash

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

for file in usr/local/share/vim/vim90/**/*; do
    [[ $file == usr/local/share/vim/vim90/lang* ]] && continue
    [[ $file == usr/local/share/vim/vim90/doc* ]] && continue
    [[ $file == usr/local/share/vim/vim90/spell* ]] && continue
    [[ $file == usr/local/share/vim/vim90/tutor* ]] && continue
    files+=($file)
done

mkdir -p ../out
mycmd=("$(which emcc | xargs dirname)/tools/file_packager" ../out/fs.data --lz4 --preload ${files[@]} --js-output=../out/fs.js)
${mycmd[@]}