#!/bin/sh

cd
mkdir -p "$HOME/.config/terminator/"
git clone 'https://github.com/alinmindroc/Zenburn-for-Terminator'
cp 'Zenburn-for-Terminator/config' "$HOME/.config/terminator/"
rm -rf 'Zenburn-for-Terminator'
