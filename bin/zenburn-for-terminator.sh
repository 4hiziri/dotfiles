#!/bin/sh

mkdir "$HOME/src"
cd "$HOME/src"
mkdir -p "$HOME/.config/terminator/"
git clone 'https://github.com/alinmindroc/Zenburn-for-Terminator'
cp 'Zenburn-for-Terminator/config' "$HOME/.config/terminator/"
