#!/bin/sh

VER='6.6.3'

cd
sudo apt install -y exuberant-ctags
wget "https://ftp.gnu.org/pub/gnu/global/global-${VER}.tar.gz"
tar xvf "global-${VER}.tar.gz"
rm "global-${VER}.tar.gz"
cd "global-${VER}"
./configure --with-exuberant-ctags=/usr/bin/ctags-exuberant
make
sudo make install

cd ..
mv "global-${VER}" src/global
