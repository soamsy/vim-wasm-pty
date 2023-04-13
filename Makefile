default: all

all: ncurses vim package-files

vim:
	docker-compose run wasm ./build-vim.sh

ncurses:
	docker-compose run wasm ./build-ncurses.sh
	
package-files:
	docker-compose run wasm ./package-files.sh

clean: clean-ncurses clean-vim
	
clean-vim:
	docker-compose run wasm bash -c 'cd vim && make distclean'
	
clean-ncurses:
	docker-compose run wasm bash -c 'cd ncurses && make distclean'
	
.PHONY: all vim ncurses package-files clean clean-vim clean-ncurses