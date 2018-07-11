#!/bin/sh

sudo apt install -y git build-essential libtinfo-dev python3-dev libxmu-dev libxpm-dev libgtk-3-dev

cd
cd src
git clone https://github.com/vim/vim.git
cd vim
./configure --enable-python3interp=dynamic --enable-fail-if-missing
make
sudo make install
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 100
sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/vim 100

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
