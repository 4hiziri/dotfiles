#!/bin/bash

sudo apt-get -y install zlib1g libbz2-dev tk-dev libssl-dev libreadline-dev libsqlite3-dev libffi-dev

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo 'export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile

echo "restart $SHELL"
