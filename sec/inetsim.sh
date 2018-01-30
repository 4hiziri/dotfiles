#!/bin/bash

sudo sh -c 'echo "deb http://www.inetsim.org/debian/ binary/" > /etc/apt/sources.list.d/inetsim.list'
wget -O - http://www.inetsim.org/inetsim-archive-signing-key.asc > /tmp/inetsim-key
sudo apt-key add /tmp/inetsim-key
rm /tmp/inetsim-key

sudo apt update
sudo apt install inetsim
