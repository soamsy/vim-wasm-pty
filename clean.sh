#!/bin/bash

set -eix

cd ncurses && make distclean
cd ../vim && make distclean