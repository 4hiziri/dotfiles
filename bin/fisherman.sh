#!/bin/bash

sudo apt update
yes | sudo apt install curl

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
