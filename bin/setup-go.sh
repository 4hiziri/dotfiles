#!/bin/bash

cd $HOME/dotfiles/bin/
./go.sh
./goenv.sh 

# if which go > /dev/null
# then
#     go get github.com/rogpeppe/godef
#     go get -u github.com/nsf/gocode
#     go get github.com/golang/lint/golint
#     go get github.com/kisielk/errcheck
# else
#     echo "go command doesn't exists"
# fi
