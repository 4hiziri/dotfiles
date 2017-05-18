#!/bin/bash
# sudo apt-get install gcc make autoconf automake libcurl3-dev
# for sbcl; sudo apt-get install libz-dev

cd
git clone https://github.com/snmsts/roswell.git
cd roswell
./bootstrap
./configure
sudo make
sudo make install
