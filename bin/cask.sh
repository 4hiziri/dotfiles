#!/bin/bash

sudo apt install curl

curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
export PATH="$HOME/.cask/bin:$PATH"

cd
cask upgrade-cask
cd ~/.emacs.d
cask install
