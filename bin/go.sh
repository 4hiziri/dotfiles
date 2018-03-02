#!/bin/bash

wget 'https://dl.google.com/go/go1.10.linux-amd64.tar.gz'
tar xvf 'go1.10.linux-amd64.tar.gz'
sudo mv go /usr/local/
rm 'go1.10.linux-amd64.tar.gz'
