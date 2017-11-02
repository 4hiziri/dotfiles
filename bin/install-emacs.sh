#!/bin/bash

sudo apt-get install gcc make ncurses-dev libxml2 libgif-dev libxpm-dev

cd
ver="25.3"
wget "http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-$ver.tar.gz"
tar xvf "emacs-$ver.tar.gz"
cd "emacs-$ver"
./configure --without-x
sudo make
sudo make install
