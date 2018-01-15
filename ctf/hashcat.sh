#!/bin/bash

cd
mkdir src
cd src
git clone https://github.com/hashcat/hashcat
cd hashcat
git submodule update --init
make
sudo make install
