#!/bin/bash

curl https://sh.rustup.rs -sSf | sh
. $HOME/.cargo/env 
rustup component add rust-src
