#!/bin/bash

if ! type -a uv; then
    echo "uv isn't installed"
    exit 1
fi

if ! type -a pipx; then
    echo "pipx isn't installed"
    exit 1
fi

pipx install git+https://github.com/mps-youtube/yewtube.git
pipx install howdoi
