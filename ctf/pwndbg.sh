#!/bin/bash

sudo apt install python3-setuptools

cd
mkdir src 2> /dev/null
cd src
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
