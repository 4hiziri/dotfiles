#!/bin/bash

VER='1.25.0'

sudo curl -L "https://github.com/docker/compose/releases/download/${VER}/docker-compose-$(uname -s)-$(uname -m)" -o '/usr/local/bin/docker-compose'

sudo chmod +x '/usr/local/bin/docker-compose'

# completion
## for bash
sudo curl -L "https://raw.githubusercontent.com/docker/compose/${VER}/contrib/completion/bash/docker-compose" -o '/etc/bash_completion.d/docker-compose'
## for zsh
mkdir -p "$HOME/.zsh/completion"
curl -L "https://raw.githubusercontent.com/docker/compose/${VER}/contrib/completion/zsh/_docker-compose" > "$HOME/.zsh/completion/_docker-compose"
