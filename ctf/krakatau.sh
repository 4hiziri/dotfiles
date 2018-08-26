#!/bin/bash

# Java Decompiler, disassembler, assembler

cd "$HOME/src/"
git clone 'https://github.com/Storyyeller/Krakatau'
ln -sf "$HOME/src/Krakatau/assemble.py" "$HOME/.local/bin/"
ln -sf "$HOME/src/Krakatau/disassemble.py" "$HOME/.local/bin/"
ln -sf "$HOME/src/Krakatau/compile.py" "$HOME/.local/bin/"