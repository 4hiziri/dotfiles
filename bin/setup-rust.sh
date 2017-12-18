#!/bin/bash

cd "$HOME/dotfiles/bin"
./rustup.sh

rustup install nightly
rustup component add rust-src
rustup completions fish > ~/.config/fish/completions/rustup.fish

./rust-env.sh
