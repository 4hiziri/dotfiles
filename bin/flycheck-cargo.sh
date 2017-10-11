#!/bin/bash

cd
git clone https://github.com/hugoduncan/flycheck-cargo.git
mkdir "$HOME/.emacs.d/elpa/"
cp flycheck-cargo/flycheck-cargo.el "$HOME/.emacs.d/elpa/"
rm -rf flycheck-cargo
