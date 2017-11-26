#!/bin/bash

if [ -d "$HOME/.config/fish" ]
then    
    ln -sf "$HOME/dotfiles/fish/aliases.fish" "$HOME/.config/fish/aliases.fish"
    ln -sf "$HOME/dotfiles/fish/config.fish" "$HOME/.config/fish/config.fish"
    ln -sf "$HOME/dotfiles/fish/env.fish" "$HOME/.config/fish/env.fish"
    ln -sf "$HOME/dotfiles/fish/fishfile" "$HOME/.config/fish/fishfile"
    ln -sf "$HOME/dotfiles/fish/functions/fish_user_key_bindings.fish" "$HOME/.config/fish/functions/fish_user_key_bindings.fish"
else
    echo "fish shell does not exists."
fi
