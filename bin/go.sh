#!/bin/bash

VER="1.16.3"

cd "$HOME/src/"

wget "https://dl.google.com/go/go${VER}.linux-amd64.tar.gz"
tar xvf "go${VER}.linux-amd64.tar.gz"
sudo cp -r go '/usr/local/'
rm "go${VER}.linux-amd64.tar.gz"
