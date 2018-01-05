#!/bin/bash

sudo apt-get update
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get -y install fish
