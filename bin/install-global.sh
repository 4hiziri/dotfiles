#!/bin/sh

cd
yes | sudo apt-get install exuberant-ctags
wget http://tamacom.com/global/global-6.5.7.tar.gz
tar xvf global-6.5.7.tar.gz
rm global-6.5.7.tar.gz
cd global-6.5.7
./configure --with-exuberant-ctags=/usr/bin/ctags-exuberant
make
sudo make install

cd ..
mv global-6.5.7 src/global
