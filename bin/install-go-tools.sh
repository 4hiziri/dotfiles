#!/bin/bash

if ! type -a go; then
    echo "go isn't installed"
    exit1
fi

go install github.com/peco/peco/cmd/peco@latest
