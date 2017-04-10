### path ###
set -U fish_user_paths "$HOME/.cask/bin" $fish_user_paths
set -U fish_user_paths "$GOPATH/bin" $fish_user_paths
### path ###
### lang ###
set -x LANG ja_JP.UTF-8
### lang ###
### editor ###
set -x EDITOR 'emacsclient -nw -a ""'
set -x VISUAL 'emacsclient -nw -a ""'
### editor ###
### pyenv ###
set -x PYENV_ROOT "$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]
    set -U fish_user_paths "$PYENV_ROOT/bin" $fish_user_paths
    pyenv init -
    pyenv virtualenv-init -
end
### pyenv ###
### virtualenv ###
set -x PYENV_VIRTUALENV_DISABLE_PROMPT 0
### virtualenv ###
### powerline ###
if [ -f "~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh" ]
    set -x TERM 'xterm-256color'
    set -U fish_user_paths "~/.local/bin" $fish_user_paths
    powerline-daemon -q
    . "~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"
end
### powerline ###
### go ###
set -x GOPATH "$HOME/.go"
### go ###
