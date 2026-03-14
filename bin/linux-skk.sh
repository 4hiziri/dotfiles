#!/bin/bash

sudo apt-get install -y fcitx5 fcitx5-skk

./mkskkdict-for-yaskkserv2.sh

cargo install --git 'https://github.com/4hiziri/yaskkserv2'
mkdir -p "~/.config/systemd/user/"
cp "~/dotfiles/conf/yaskkserv2.service" "~/.config/systemd/user/"
systemctl --user daemon-reload
systemctl --user enable yaskkserv2
systemctl --user start yaskkserv2

