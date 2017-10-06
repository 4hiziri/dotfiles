### PATH ###
set PATH "$HOME/.cask/bin" $PATH
### PATH ###
### LANG ###
set -x LANG ja_JP.UTF-8
### LANG ###
### EDITOR ###
set -x EDITOR 'emacsclient -nw -a ""'
set -x VISUAL 'emacsclient -nw -a ""'
### EDITOR ###
### DISPLAY ###
if test -n "$SSH_CLIENT"
    or test -n "$SSH_CONNECTION"
    set -x DISPLAY ':0.0'
end
### DISPLAY ###
### cask ###
set -x EMACS '/usr/local/bin/emacs'
### cask ###
### pyenv ###
if which pyenv >/dev/null
    # set -x PATH "$HOME/.pyenv/shims" $PATH
    # set -x PATH "$HOME/.pyenv/bin" $PATH
    # and . (pyenv init - | psub) # raise error!
    if status --is-interactive
        set PATH "$HOME/.pyenv/shims" $PATH
        setenv PYENV_SHELL fish
        . '/home/tkgsy/.pyenv/libexec/../completions/pyenv.fish'
        command pyenv rehash 2>/dev/null
        function pyenv
            set command $argv[1]
            set -e argv[1]

            switch "$command"
                case activate deactivate rehash shell
                    . (pyenv "sh-$command" $argv|psub)
                case '*'
                    command pyenv "$command" $argv
            end
        end
    end
end
### pyenv ###
### virtualenv ###
set -x PYENV_VIRTUALENV_DISABLE_PROMPT 0
### virtualenv ###
### powerline ###
if [ -f "~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh" ]
    set -x TERM 'xterm-256color'
    set PATH "~/.local/bin" $PATH
    . (powerline-daemon -q)
    . "~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"
end
### powerline ###
### go ###
if which go >/dev/null
    set -x GOPATH "$HOME/.go"
    set PATH "$GOPATH/bin" $PATH
    set -x GOROOT "/usr/local/go"
    set -x GOOS "linux"
    set -x GOARCH "amd64"
end
### go ###
### rust ###
if [ -f "$HOME/.cargo/env" ]
    source "$HOME/.cargo/env"
end
### rust ###
### john ###
if [ -d "$HOME/src/JohnTheRipper/run" ]
    set PATH "$HOME/src/JohnTheRipper/run" $PATH
end
### john ###
### hashcat ###
if [ -d "$HOME/src/hashcat" ]
    set PATH "$HOME/src/hashcat" $PATH
end
### hashcat ###
### checksec ###
if [ -d "$HOME/src/checksec.sh/" ]
    set PATH "$HOME/src/checksec.sh/" $PATH
end
### checksec ###
