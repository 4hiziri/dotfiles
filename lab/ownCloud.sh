#!/bin/bash

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_16.04/ /' > /etc/apt/sources.list.d/owncloud-client.list"
sudo apt-get update
sudo apt-get install owncloud-client

# key
wget -nv https://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_16.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
