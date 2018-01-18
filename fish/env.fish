### cask ###
if [ -d "$HOME/.cask/bin" ]
    set PATH "$HOME/.cask/bin" $PATH
    set -x EMACS '/usr/local/bin/emacs'
end
### cask ###
### LOCAL/LIB ###
set PATH "/usr/local/lib" $PATH
### LOCAL/LIB ###
### LANG ###
set -x LANG ja_JP.UTF-8
### LANG ###
### EDITOR ###
set -x EDITOR 'emacsclient -nw -a ""'
set -x VISUAL 'emacsclient -nw -a ""'
### EDITOR ###
### DISPLAY ###
# if test -n "$SSH_CLIENT"
#     or test -n "$SSH_CONNECTION"
#     set -x DISPLAY ':0.0'
# end
### DISPLAY ###
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
### ninix ###
if [ -d "$HOME/src/ninix-aya/bin/" ]
    set PATH "$HOME/src/ninix-aya/bin/" $PATH
end
### ninix ###
### global ###
if which global >/dev/null
    set -x GTAGSCONF "$HOME/.globalrc"
    set -x GTAGSLABEL "ctags"
end
### global ###
### tex ###
if [ -d "/usr/local/texlive/2017/bin/x86_64-linux" ]
    set PATH "/usr/local/texlive/2017/bin/x86_64-linux" $PATH
end
### tex ###
