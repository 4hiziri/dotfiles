#!/bin/bash
ver="28.1"

sudo apt-get -y install gcc make ncurses-dev libxml2-dev gnutls-bin gnutls-dev libpng-dev libacl1-dev build-essential mailutils libgccjit-10-dev

cd
mkdir 'src' 2>&1 > /dev/null
cd src
wget "http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-$ver.tar.gz"
tar xvf "emacs-$ver.tar.gz"
rm -f "emacs-$ver.tar.gz"
cd "emacs-$ver"
./autogen.sh
CFLAGS='-I/usr/lib/gcc/x86_64-linux-gnu/10/include -L/usr/lib/gcc/x86_64-linux-gnu/10' ./configure --with-cairo --without-x --without-dbus --without-gconf --without-gsettings --without-toolkit-scroll-bars --without-xaw3d --without-sound --without-pop --without-xpm --without-tiff --without-rsvg --without-selinux --without-gpm --with-native-compilation --with-gnutls --without-gif
make
sudo make install
