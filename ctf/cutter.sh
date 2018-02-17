#!/bin/bash

cd

if  [ ! -d "$HOME/src" ]
then
    echo "There isn't $HOME/src"
    exit 1
fi
cd src

VER='v1.2'
wget "https://github.com/radareorg/cutter/releases/download/$VER/Cutter-$VER-x86_64.AppImage"

mv "Cutter-$VER-x86_64.AppImage" 'cutter'

sudo ln -sf "$HOME/src/cutter" '/usr/local/bin/'

# if which r2 > /dev/null
# then
#     cd

#     echo 'install dependencies'
#     sudo apt-get install qt5-default qttools5-dev-tools libqt5svg5-dev
    
#     if  [ ! -d "$HOME/src" ]
#     then
# 	echo "There isn't $HOME/src"
# 	exit 1
#     fi
#     cd src

#     git clone https://github.com/radareorg/cutter
#     cd cutter

#     mkdir build
#     cd build
#     cmake ../src
#     make    
# else
#     echo 'radare2 is not installed'
#     exit 1
# fi
