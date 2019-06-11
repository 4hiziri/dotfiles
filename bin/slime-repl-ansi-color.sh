#!/bin/bash

cd
git clone https://github.com/enriquefernandez/slime-repl-ansi-color.git
mv slime-repl-ansi-color/slime-repl-ansi-color.el $HOME/.emacs.d/straight/repos/slime/contrib/
rm -rf slime-repl-ansi-color/
