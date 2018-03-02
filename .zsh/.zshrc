### OS ###
[ -f $ZDOTDIR/.zshrc-`uname` ] && . $ZDOTDIR/.zshrc-`uname`

### zplug ###
export ZPLUG_HOME="$HOME/.zplug"

source $ZPLUG_HOME/init.zsh

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
zplug 'themes/kardan', from:oh-my-zsh

# tools
zplug "marzocchi/zsh-notify"
# zplug "oknowton/zsh-dwim"

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

### editor ###
alias emacs='emacsclient -nw -a ""'
alias ekill='emacsclient -e (kill-emacs)'
export EDITOR='emacsclient -nw -a ""'
export VISUAL='emacsclient -nw -a ""'

### golang ###
if [ -d "/usr/local/go" ] 
then
    export GOPATH="$HOME/.go"    
    export GOROOT='/usr/local/go'
    export PATH="$PATH:$GOROOT/bin"
    export GOARCH='amd64'
fi
### golang ###
### rust ###
if [ -d "$HOME/.cargo/env" ]
then
    source "$HOME/.cargo/env"
fi
### rust ###
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
if [ -d "/usr/local/texlive/2017/bin/x86_64-linux" ]
then
    export PATH="/usr/local/texlive/2017/bin/x86_64-linux:$PATH"
fi
### tex ###
    
################################
# zsh-256color
################################
# color view
# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

################################
# zsh-colors
################################
# red hi -> hi(Red)
# green, blue, black, cyan, yellow

################################
# zsh-url-highlighter
################################

################################
# zsh-syntax-highlighting
################################
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor line pattern)
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'

################################
# zsh-notify
################################
# notify finish of command which spends 10 seconds
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10

################################
# zsh-dwin
################################
# C-u

################################
# zsh-autosuggestions

################################
bindkey '^o' autosuggest-accept

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
    export PATH="$HOME/.cask/bin:$PATH"
    export EMACS='/usr/local/bin/emacs'
fi
### cask ###

### local/lib ###
export PATH="/usr/local/lib:$PATH"
### local/lib ###

### pyenv ###
export PYTHONPATH="$PYTHONPATH:$HOME/.python_script"
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
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
   export PATH="$HOME/.rbenv/bin:$PATH"
   eval "$(rbenv init -)"
fi
### ruby ###

#########################################
# powerline
########################################

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]
then
    export TERM='xterm-256color'
    export PATH=$PATH:~/.local/bin
    powerline-daemon -q
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e
 
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
 
# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
# PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
#  %# "
 
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
 
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

########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
 
# function _update_vcs_info_msg() {
#     LANG=en_US.UTF-8 vcs_info
#     RPROMPT+="${vcs_info_msg_0_}"
# }
# add-zsh-hook precmd _update_vcs_info_msg

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
 
########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beep を無効にする
setopt no_beep
 
# フローコントロールを無効にする
setopt no_flow_control
 
# '#' 以降をコメントとして扱う
setopt interactive_comments
 
# ディレクトリ名だけでcdする
setopt auto_cd
 
# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
 
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
  
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
 
# 高機能なワイルドカード展開を使用する
setopt extended_glob
 
########################################
# キーバインド
 
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
# bindkey '^R' history-incremental-pattern-search-backward
 
########################################
# エイリアス
 
alias la='ls -a'
alias ll='ls -l'
 
alias rm='rm -i'
alias cp='cp -i'
alias cpf='cp -f'
alias mv='mv -i'

alias mkdir='mkdir -p'
 
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
 
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
 
# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi
 
########################################

########################################
# OS 別の設定


#######################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
