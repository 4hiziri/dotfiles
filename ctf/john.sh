#!/bin/bash

cd
mkdir src 2> /dev/null
cd src
git clone 'https://github.com/magnumripper/JohnTheRipper.git'
cd 'JohnTheRipper/src'
./configure
make clean
make -sj4
