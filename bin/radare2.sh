#!/bin/bash

git clone https://github.com/radare/radare2
cd radare2 && sys/install.sh
sys/user.sh
rm -rf radare2
