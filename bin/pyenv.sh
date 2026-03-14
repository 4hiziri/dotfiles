#!/bin/bash

sudo apt-get -y install zlib1g libbz2-dev tk-dev libssl-dev libreadline-dev libsqlite3-dev libffi-dev

git clone 'https://github.com/pyenv/pyenv.git' "${HOME}/.pyenv"
