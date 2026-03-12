#!/bin/bash

sudo apt-get install -y fcitx5 fcitx5-skk
cargo install --git 'https://github.com/4hiziri/yaskkserv2'
mkdir "~/src"
cd "~/src"
git clone 'https://github.com/skk-dev/dict'
