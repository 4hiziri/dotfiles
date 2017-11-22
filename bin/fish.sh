#!/bin/bash

sudo apt-get update
sudo apt-get install apt-file
sudo apt-file update
sudo apt-file add-apt-repository
sudo apt-get install software-properties-common

sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
