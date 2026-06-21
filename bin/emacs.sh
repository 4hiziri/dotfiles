#!/bin/bash
ver="30.2"

sudo apt-get -y install gcc make ncurses-dev libxml2-dev gnutls-bin gnutls-dev libpng-dev libacl1-dev build-essential mailutils texinfo pkg-config libgnutls28-dev libgtk-3-dev libtree-sitter-dev libgccjit-dev libasound2-dev libwebp-dev libotf-dev libgpm-dev libseccomp-dev libsystemd-dev libmagickwand-dev libm17n-dev libxft-dev libgif-dev libtiff-dev libpng-dev libjpeg-dev librsvg2-dev libwebp-dev

cd
mkdir 'src' 2>&1 > /dev/null
cd src
wget "http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-$ver.tar.gz"
tar xvf "emacs-$ver.tar.gz"
rm -f "emacs-$ver.tar.gz"
cd "emacs-$ver"
./autogen.sh
./configure --with-cairo --without-x --without-dbus --without-gconf --without-gsettings --without-toolkit-scroll-bars --without-xaw3d --with-sound --without-pop --without-selinux --without-gpm --with-native-compilation --with-gnutls --with-x-toolkit=lucid --with-tree-sitter
make
sudo make install
