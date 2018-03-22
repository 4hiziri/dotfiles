#!/bin/bash

cd "$HOME/dotfiles/bin"
./rustup.sh

. "$HOME/.cargo/env"
rustup install nightly
rustup component add rust-src
rustup completions fish > ~/.config/fish/completions/rustup.fish

sudo mkdir /usr/local/share/zsh-completions/
rustup completions zsh | sudo tee -a /usr/local/share/zsh-completions/_rustup 

./rust-env.sh
