#!/bin/bash

sudo apt update
sudo apt install libgmp-dev libz-devv libbz2-dev libpcap-dev

cd
mkdir src 2> /dev/null
cd src
git clone 'https://github.com/magnumripper/JohnTheRipper.git'
cd 'JohnTheRipper/src'
./configure
make clean
make -sj4
