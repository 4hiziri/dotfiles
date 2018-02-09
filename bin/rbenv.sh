#!/bin/bash

git clone git@github.com:sstephenson/rbenv.git ~/.rbenv
mkdir $HOME/.rbenv/plugins
git clone git@github.com:sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"'
echo 'eval "$(rbenv init -)"'
