#!/bin/bash
PECO_VER="v0.5.1"

cd /var/tmp/
wget https://github.com/peco/peco/releases/download/$PECO_VER/peco_linux_amd64.tar.gz
tar -zxvf peco_linux_amd64.tar.gz
cd peco_linux_amd64
sudo cp peco /usr/local/bin/
