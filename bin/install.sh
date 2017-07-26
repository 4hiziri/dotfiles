#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -sf $HOME/dotfiles/"$f" $HOME/"$f" 
done

for f in `ls fish | grep ".*\.fish"`
do
    ln -sf "$HOME/dotfiles/fish/$f" "$HOME/.config/fish/$f"
done

ln -sf "$HOME/dotfiles/fish/fishfile" "$HOME/.config/fish/fishfile"
ln -sf "$HOME/dotfiles/fish/functions/fish_user_key_bindings.fish" "$HOME/.config/fish/functions/fish_user_key_bindings.fish"
ln -sf "$HOME/dotfiles/fish/completions/rustup.fish" "$HOME/.config/fish/completions/rustup.fish"
