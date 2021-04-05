#!/bin/bash

if [ -d "$HOME/.emacs.d/" ]
then
    sudo apt-get -y install curl python gnutls-bin
	
	git clone https://github.com/cask/cask ~/.cask
    PATH=$HOME/.cask/bin:$PATH

    cask upgrade-cask
    cd "$HOME/.emacs.d"
    cask install  
else
    echo 'plz install emacs!'
fi
