#!/bin/sh

cd
mkdir -p "$HOME/.config/terminator/"
git clone 'https://github.com/ghuntley/terminator-solarized.git'
cp 'terminator-solarized/config' "$HOME/.config/terminator/"
rm -rf 'terminator-solarized/'
