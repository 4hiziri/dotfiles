#!/bin/bash

if ! type -a cargo > /dev/null ; then
    echo "cargo isn't installed"
    exit 1
fi

cargo install cargo-binstall
yes | cargo binstall broot # modern tree
yes | cargo binstall riffdiff # modern diff
# cargo install --git https://github.com/K4rakara/freshfetch # show system info
# yes | cargo binstall rsftch
