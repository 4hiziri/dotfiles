#!/bin/bash

sudo dpkg --add-architecture i386
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 gcc-multilib multiarch-support
