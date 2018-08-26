#!/bin/bash

# Java Decompiler, disassembler, assembler

cd "$HOME/src/"
git clone 'https://github.com/Storyyeller/Krakatau'

# for pyenv problem, fix shebang
sed -i '1c#!/usr/bin/python2' 'Krakatau/assemble.py'
sed -i '1c#!/usr/bin/python2' 'Krakatau/disassemble.py'
sed -i '1c#!/usr/bin/python2' 'Krakatau/decompile.py'

ln -sf "$HOME/src/Krakatau/assemble.py" "$HOME/.local/bin/"
ln -sf "$HOME/src/Krakatau/disassemble.py" "$HOME/.local/bin/"
ln -sf "$HOME/src/Krakatau/decompile.py" "$HOME/.local/bin/"
