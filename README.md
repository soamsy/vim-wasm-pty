# vim-wasm-pty

Build scripts for making a WebAssembly port of Vim that works with xterm.js

## Compiling WASM

Install docker and docker compose, and then run:
```
git submodule init
make
```

Once the build is complete, the following files should be available in the `out` directory:
```
fs.data
fs.js
vim-core.js
vim-core.wasm
```

## Credits
See https://github.com/mame/xterm-pty/ for the original build scripts this repo is based on