#!/bin/bash

curl https://sh.rustup.rs -sSf | sh
. "$HOME/.cargo/env"

mkdir ~/.zfunc/
rustup completions zsh > ~/.zfunc/_rustup
