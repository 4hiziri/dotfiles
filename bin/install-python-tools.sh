#!/bin/bash

if ! type -a uv; then
    echo "uv isn't installed"
    exit 1
fi

uv tool install ruff@latest
