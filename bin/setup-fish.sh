#!/bin/bash

cd $HOME/dotfiles/bin/
./fish.sh
./fisherman.sh
./fish-conf.sh

fish -c 'fisher install'
