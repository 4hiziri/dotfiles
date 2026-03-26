#!/bin/bash

echo "install sheldon config, package manager for zsh"

if [ -e "$HOME/.config/sheldon/plugins.toml" ]; then
    echo "already installed, skipped"
    exit 1
fi

mkdir -p "$HOME/.config/sheldon/"
ln -s "$HOME/dotfiles/conf/plugins.toml" "$HOME/.config/sheldon/plugins.toml"
