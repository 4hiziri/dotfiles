scoop bucket add extras
scoop update
scoop install ag direnv fzf global ripgrep gow fd gpg git
scoop install emacs

# need admin
New-Item -Value "C:/Users/tkgsy/Documents/GitHub/dotfiles/.emacs.d" -Path "C:/Users/tkgsy/AppData/Roaming" -Name ".emacs.d" -ItemType SymbolicLink