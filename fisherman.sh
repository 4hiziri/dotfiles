#!/bin/bash

exec fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
curl -L git.io/fisher-up-me | fish
fisher
