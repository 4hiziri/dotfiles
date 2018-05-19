#!/bin/bash

# install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src

export PATH="$HOME/.rbenv/bin:$PATH"

# verify rbenv install
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# install ruby-build
mkdir -p "$(rbenv root)/plugins"
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"'
echo 'eval "$(rbenv init -)"'
