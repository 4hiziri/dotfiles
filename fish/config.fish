### fzf ###
set -U FZF_LEGACY_KEYBINDINGS 1
### fzf ###
. ~/.config/fish/env.fish

if functions balias >/dev/null
    . ~/.config/fish/aliases.fish
end
### load config file ###
### keyboard setting ###
setxkbmap -option ctrl:nocaps
### keyboard setting ###
### dict ###
# 辞書を引く(英和)
function ej
    grep "$argv" /usr/share/dict/dict -E -A 1 -wi --color=always | less -R -FX
end
# 辞書を引く(和英)
function je
    grep "$argv" /usr/share/dict/dict -E -B 1 -wi --color=always | less -R -FX
end
### dict ###
