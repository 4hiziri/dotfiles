#!/bin/bash

sudo apt-get -y install gcc make ncurses-dev libxml2-dev libgif-dev libxpm-dev libgnutls-dev gnutls-bin libjpeg-dev libtiff-dev libpng-dev libacl1-dev

cd
mkdir 'src' 2>&1 > /dev/null
cd src
ver="26.1"
wget "http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-$ver.tar.gz"
tar xvf "emacs-$ver.tar.gz"
rm -f "emacs-$ver.tar.gz"
cd "emacs-$ver"
./configure --with-x-toolkit=no
make
sudo make install
