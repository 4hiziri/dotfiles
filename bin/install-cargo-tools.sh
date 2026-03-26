#!/bin/bash

if ! type -a cargo > /dev/null ; then
    echo "cargo isn't installed"
    exit 1
fi

cargo install cargo-binstall
cargo binstall uv
cargo binstall exa
cargo install --git https://github.com/4hiziri/yaskkserv2
cargo binstall sheldon
cargo binstall starship
cargo binstall zoxide
