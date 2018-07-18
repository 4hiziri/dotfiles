#!/bin/bash
# for debian

# Dependency
sudo apt install  apt-transport-https ca-certificates curl software-properties-common

#Add key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install
sudo apt update
sudo apt install docker-ce
