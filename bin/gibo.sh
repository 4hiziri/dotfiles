#!/bin/bash

curl -L https://raw.github.com/simonwhitaker/gibo/master/gibo \
    -so ~/bin/gibo && chmod +x ~/bin/gibo && gibo -u
