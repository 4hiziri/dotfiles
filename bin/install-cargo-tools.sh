#!/bin/bash

if ! type -a cargo > /dev/null ; then
    echo "cargo isn't installed"
    exit 1
fi

cargo install cargo-binstall
yes | cargo binstall uv
yes | cargo binstall eza # modern ls
cargo install --git https://github.com/4hiziri/yaskkserv2
yes | cargo binstall sheldon
yes | cargo binstall starship
yes | cargo binstall zoxide # modern cd
yes | cargo binstall bat # modern cat
yes | cargo binstall fd-find # modern find
yes | cargo binstall ripgrep # modern grep
yes | cargo binstall git-delta # modern git diff
yes | cargo binstall du-dust # modern du
yes | cargo binstall broot # modern tree
yes | cargo binstall choose # modern cut or awk
yes | cargo binstall procs # modern ps
yes | cargo binstall gping # modern ping
yes | cargo binstall bottom # mordern top
yes | cargo binstall tlrc # modern man
yes | cargo binstall sd # modern sed
yes | cargo binstall xh # modern curl wget
yes | cargo binstall riffdiff # modern diff
yes | cargo binstall difftastic # modern diff2, difft
