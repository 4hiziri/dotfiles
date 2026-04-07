#!/bin/bash

if ! type -a cargo > /dev/null ; then
    echo "cargo isn't installed"
    exit 1
fi

cargo install cargo-binstall
cargo binstall uv
cargo binstall eza # modern ls
cargo install --git https://github.com/4hiziri/yaskkserv2
cargo binstall sheldon
cargo binstall starship
cargo binstall zoxide # modern cd
cargo binstall bat # modern cat
cargo binstall fd-find # modern find
cargo binstall ripgrep # modern grep
cargo binstall git-delta # modern git diff
cargo binstall du-dust # modern du
cargo binstall broot # modern tree
cargo binstall choose # modern cut or awk
cargo binstall procs # modern ps
cargo binstall gping # modern ping
cargo binstall bottom # mordern top
cargo binstall tlrc # modern man
cargo binstall sd # modern sed
cargo binstall xh # modern curl wget
cargo binstall riffdiff # modern diff
cargo binstall difftastic # modern diff2, difft
