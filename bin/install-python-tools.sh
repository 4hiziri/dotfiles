#!/bin/bash

if ! type -a uv; then
    echo "uv isn't installed"
    exit 1
fi

# python 3.14
uv tool install glances
uv tool install howdoi
uv tool install yewtube
uv tool install ruff
uv tool install --python 3.13 radio-active
uv tool install moviemon
uv tool install epy-reader
uv tool install rebound-cli
uv tool install buku
uv tool install hns
uv tool install lakshmi
uv tool install gcalcli
uv tool install deadlink
uv tool install thefuck
uv tool install recoverpy
uv tool install ricksay
uv tool install marker
uv tool install pdd
uv tool install pywal
