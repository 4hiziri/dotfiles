#!/bin/bash

if [ -d "$HOME/.config/fish" ]
then
    cd "$HOME/dotfiles/fish/"
    for f in `ls | grep ".*\.fish"`
    do
	ln -sf "$HOME/dotfiles/fish/$f" "$HOME/.config/fish/$f"
    done

    ln -sf "$HOME/dotfiles/fish/fishfile" "$HOME/.config/fish/fishfile"
    ln -sf "$HOME/dotfiles/fish/functions/fish_user_key_bindings.fish" "$HOME/.config/fish/functions/fish_user_key_bindings.fish"    
else
    echo "fish shell does not exists."
fi
