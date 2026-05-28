#!/bin/bash

if ! type -a uv; then
    echo "uv isn't installed"
    exit 1
fi

uv tool install glances
uv tool install howdoi
uv tool install yewtube
uv tool install ruff
uv tool install --python 3.13 radio-active
