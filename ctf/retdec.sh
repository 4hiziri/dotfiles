#!/bin/bash

sudo apt-get install build-essential cmake git perl python3 bash bison flex autoconf automake libtool pkg-config m4 coreutils zlib1g-dev libtinfo-dev wget bc upx doxygen graphviz

cd
mkdir src 2> /dev/null
cd src

git clone https://github.com/avast-tl/retdec
cd retdec
mkdir build && cd build
# need cmake >= 3.6
cmake .. # -DCMAKE_INSTALL_PREFIX=<path>
make -j4
sudo make install
