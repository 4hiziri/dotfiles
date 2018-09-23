### OS ###
[ -f $ZDOTDIR/.zshrc-`uname` ] && . $ZDOTDIR/.zshrc-`uname`

### zplug ###
export ZPLUG_HOME="$HOME/.zplug"
if [ -d '/usr/share/zsh/scripts/zplug' ]
then
    source '/usr/share/zsh/scripts/zplug/init.zsh'
else
    source "$ZPLUG_HOME/init.zsh"
fi

# prompt
zplug "4hiziri/zsh-python-prompt"

# complemetion
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

# syntax and color
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting", defer:3

zplug "seebi/dircolors-solarized"

# theme
# zplug 'bhilburn/powerlevel9k', use:powerlevel9k.zsh-theme
# zplug 'themes/kardan', from:oh-my-zsh
zplug 'nojhan/liquidprompt'
# prompt setting
export LP_PS1_POSTFIX="
> "

# tools
zplug "marzocchi/zsh-notify"
# zplug "oknowton/zsh-dwim"
zplug "rupa/z"
zplug "peco/peco"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
	echo; zplug install
    fi
fi

# color setting
export TERM="xterm-256color"

# source each file and alias command
zplug load

### zsh ###
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

bindkey -e # emacs 風キーバインドにする

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt share_history # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_ignore_space # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks # ヒストリに保存するときに余分なスペースを削除する

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完
#for zsh-completions
if [ -e '/usr/local/share/zsh-completions' ]
then
    fpath=('/usr/local/share/zsh-completions' $fpath)
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
		   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

# オプション
setopt print_eight_bit # 日本語ファイル名を表示可能にする

setopt no_beep # beep を無効にする

setopt no_flow_control # フローコントロールを無効にする

setopt interactive_comments # '#' 以降をコメントとして扱う

setopt auto_cd # ディレクトリ名だけでcdする

setopt auto_pushd # cd したら自動的にpushdする
setopt pushd_ignore_dups # 重複したディレクトリを追加しない

setopt extended_glob # 高機能なワイルドカード展開を使用する

# キーバインド
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# エイリアス
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias rm='rm -i'
alias cp='cp -i'
alias cpf='cp -f'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo ' # sudo の後のコマンドでエイリアスを有効にする

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# zsh-256color
# color view
# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor line pattern)
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'

# zsh-notify
# notify finish of command which spends 10 seconds
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10

################################
bindkey '^o' autosuggest-accept

### editor ###
alias emacs='emacsclient -nw -a ""'
alias ekill='emacsclient -e (kill-emacs)'
export EDITOR='emacsclient -nw -a ""'
export VISUAL='emacsclient -nw -a ""'
### editor ###
### golang ###
if [ -d "/usr/local/go" ]
then
    export GOPATH="$HOME/.go"
    export GOROOT='/usr/local/go'
    export PATH="$PATH:$GOPATH/bin"
    export PATH="$PATH:$GOROOT/bin"
    export GOARCH='amd64'
fi

if [ -d "$HOME/.goenv/" ]
then
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$HOME/.goenv/bin:$PATH"    
    eval "$(goenv init -)"    
fi
### golang ###
### rust ###
if [ -f "$HOME/.cargo/env" ]
then
    source "$HOME/.cargo/env"
elif [ -e "$HOME/.cargo/" ]
then
     export PATH="$PATH:$HOME/.cargo/bin"
fi
### rust ###
### haskell ###
if [ -d "$HOME/.local/bin" ]
then
    export PATH="$PATH:$HOME/.local/bin"
fi
### haskell ###
### global ###
if which global > /dev/null
then
    if [ -d "$HOME/.globalrc" ]
    then
	export GTAGSCONF "$HOME/.globalrc"
    fi
    export GTAGSLABEL 'ctags'
fi
### global ###
### tex ###
if [ -d "/usr/local/texlive/2018/bin/x86_64-linux" ]
then
    export PATH="$PATH:/usr/local/texlive/2018/bin/x86_64-linux"
elif [ -d "/usr/local/texlive/2017/bin/x86_64-linux" ]
then
    export PATH="$PATH:/usr/local/texlive/2017/bin/x86_64-linux"
fi
### tex ###
### z ###
. "$ZPLUG_REPOS/rupa/z/z.sh"
### z ###
################################
# powerlevel9k
################################
# POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uE868  %d.%m.%y}"
# typeset -gAH vcs_states
# vcs_states=(
#     'clean' '122'
#     'modified' 'yellow'
#     'untracked' 'red'
# )
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs pyenv vcs ram time)

################################
# pyenv zsh-python-prompt
################################
autoload -Uz add-zsh-hook

# function _update_pyenv() {
#     RPROMPT="[$ZSH_PYTHON_PROMPT] "
# }

# add-zsh-hook precmd _update_pyenv

setopt prompt_subst

#solve duplicates
typeset -U path cdpath fpath nmanpath

### cask ###
if [ -d "$HOME/.cask/" ]
then
    export PATH="$PATH:$HOME/.cask/bin"
    if [ -e '/usr/local/bin/emacs' ]
    then
	export EMACS='/usr/local/bin/emacs'
    elif [ -e '/usr/bin/emacs' ]
    then
	export EMACS='/usr/bin/emacs'
    fi
fi
### cask ###

### local/lib ###
export PATH="$PATH:/usr/local/lib"
### local/lib ###

### .local/bin ###
if [ -d "$PATH:$HOME/.local/bin" ]
then
    export PATH="$HOME/.local/bin:$PATH"
fi
### .local/bin ###
### pyenv ###
if [ -d "$HOME/.pyenv" ]
then
    export PYTHONPATH="$PYTHONPATH:$HOME/.python_script"
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PATH:$PYENV_ROOT/bin"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# virtualenv setting
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
### pyenv ###

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
	     COMP_CWORD=$(( cword-1 )) \
	     PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

### ruby ###
if [ -d "$HOME/.rbenv/" ]
then
   export PATH="$PATH:$HOME/.rbenv/bin"
   eval "$(rbenv init -)"
fi
### ruby ###

### roswell ###
if [ -d "$HOME/.roswell/bin/" ]
then
    export PATH="$PATH:$HOME/.roswell/bin"
fi

#########################################
# powerline
########################################

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]
then
    export TERM='xterm-256color'
    export PATH="$PATH:$HOME/.local/bin"
    powerline-daemon -q
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

########################################
# peco
########################################
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
	tac="tac"
    else
	tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
	eval $tac | \
	peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

### CUDA ###
if [ -e "/usr/local/cuda/" ]
then
    export PATH="$PATH:/usr/local/cuda/bin"
    export LD_LIBRARY_PATH=:"/usr/local/cuda/lib64"
    export PATH="$PATH:/usr/local/cuda/targets/x86_64-linux/include"
    export LD_LIBRARY_PATH=:"/usr/local/cuda/targets/x86_64-linux/lib"
fi

### command ###
function ej() {
    grep "$*" /usr/share/dict/dict -E -A 1 -wi --color=always | less -R -FX
}

function je() {
    grep "$*" /usr/share/dict/dict -E -B 1 -wi --color=always | less -R -FX
}

function man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
