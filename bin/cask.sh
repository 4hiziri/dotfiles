#!/bin/bash

if [ -d "$HOME/.emacs.d/" ]
then
    sudo apt-get -y install curl python gnutls-bin
    curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
    # TODO: bash config
    export PATH="$HOME/.cask/bin:$PATH"

    cd
    cask upgrade-cask
    cd ~/.emacs.d
    cask install  
else
    echo 'plz install emacs!'
fi
