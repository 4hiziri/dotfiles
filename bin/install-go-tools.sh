#!/bin/bash

if ! type -a go; then
    echo "go isn't installed"
    exit1
fi

go install github.com/peco/peco/cmd/peco@latest
go install github.com/muesli/duf@latest # modern df
go install github.com/mr-karan/doggo/cmd/doggo@latest # modern dig
go install github.com/cheat/cheat/cmd/cheat@latest # cheatsheet tool
go install github.com/rs/curlie@latest # modern curl wget
go install github.com/gokcehan/lf@latest
