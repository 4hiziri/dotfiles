#!/bin/bash

if [ ! -e "$HOME/src" ]
then
	mkdir -p $HOME/src
fi

cd "$HOME/src/"
git clone 'https://github.com/CISOfy/lynis'
