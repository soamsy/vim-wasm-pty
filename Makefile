default: all

all: ncurses vim package-files

vim:
	docker-compose run wasm ./build-vim.sh

ncurses:
	docker-compose run wasm ./build-ncurses.sh
	
package-files:
	docker-compose run wasm ./package-files.sh

clean:
	docker-compose run wasm ./clean.sh
	
.PHONY: all vim ncurses package-files clean