#!/bin/bash
# for sbcl; sudo apt-get install libz-dev

sudo apt-get -y install gcc make autoconf automake libcurl3-dev libz-dev

cd
git clone https://github.com/snmsts/roswell.git
cd roswell
./bootstrap
./configure
sudo make
sudo make install

cd
mv roswell src/
