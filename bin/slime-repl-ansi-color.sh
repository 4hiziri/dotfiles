#!/bin/bash

git clone git@github.com:enriquefernandez/slime-repl-ansi-color.git
mv slime-repl-ansi-color/slime-repl-ansi-color.el $HOME/.emacs.d/.cask/2*/elpa/slime-2*/contrib/
rm -rf slime-repl-ansi-color/
