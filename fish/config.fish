### fzf ###
set -U FZF_LEGACY_KEYBINDINGS 1
### fzf ###
### emacs ###
# set fish_plugins emacs
### emacs ###

. ~/.config/fish/env.fish

if functions balias >/dev/null
    . ~/.config/fish/aliases.fish
end
### load config file ###
### keyboard setting ###
setxkbmap -option ctrl:nocaps
### keyboard setting ###
