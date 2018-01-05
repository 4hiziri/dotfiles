#!/bin/bash
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:pwntools/binutils
sudo apt-get update
sudo apt-get install binutils-$ARCH-linux-gnu
