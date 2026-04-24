# OS毎の設定の読み込み
[ -f $ZDOTDIR/.zshrc-`uname` ] && . $ZDOTDIR/.zshrc-`uname`

# color setting
export TERM="xterm-direct256"

# LANG
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# zsh option
setopt always_last_prompt # 補完しても次のプロンプトにいかない
setopt always_to_end
setopt append_history
setopt auto_cd # ディレクトリ名だけでcdする
setopt auto_pushd # cd したら自動的にpushdする
setopt correct
setopt cprecedences
setopt dvorak
setopt emacs
setopt extended_glob # 高機能なワイルドカード展開を使用する
unsetopt flow_control
stty -ixon
setopt hash_executables_only
setopt hist_find_nodups
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_ignore_space # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks # ヒストリに保存するときに余分なスペースを削除する
setopt interactive_comments # '#' 以降をコメントとして扱う
setopt kshoptionprint # setoptで全オプションを表示する
setopt magic_equal_subst
setopt no_beep # beep を無効にする
setopt no_flow_control # フローコントロールを無効にする
setopt print_eight_bit # 日本語ファイル名を表示可能にする
setopt prompt_subst
setopt pushd_ignore_dups # 重複したディレクトリを追加しない
# setopt share_history # 同時に起動したzshの間でヒストリを共有する

bindkey -e # emacs 風キーバインドにする

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完
autoload -Uz compinit
## for zsh-completions
fpath+='/usr/local/share/zsh-completions'
fpath+="${HOME}/.zsh/.zfunc"
compinit # 重いので手動でやる

## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

## sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
           /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

## ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

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
alias cdu="cd .."
# gdb
alias pwndbg='gdb -ex init-pwndbg'
alias peda='gdb -ex init-peda'
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias python='python3'

bindkey '^o' autosuggest-accept

# editor
alias emacs='emacsclient -nw -a ""'
alias ekill='emacsclient -e (kill-emacs)'
export EDITOR='emacsclient -nw -a ""'
export VISUAL='emacsclient -nw -a ""'

# custom commands
function set_title() {
  echo -en "\e]2;$@\a"
}

# PATH setting
## golang
if [ -d "/usr/local/go/bin/" ]
then
    export PATH="/usr/local/go/bin/:$PATH"
fi

if [ -d "$HOME/go/bin/" ]
then
    export PATH="$HOME/go/bin/:$PATH"
fi

## rust
if [ -f "$HOME/.cargo/env" ]
then
    source "$HOME/.cargo/env"
elif [ -e "$HOME/.cargo/" ]
then
     export PATH="$PATH:$HOME/.cargo/bin/"
fi

## haskell
if [ -d "$HOME/.local/bin" ]
then
    export PATH="$PATH:$HOME/.local/bin/"
fi

## global
if which global > /dev/null
then
    if [ -d "$HOME/.globalrc" ]
    then
    export GTAGSCONF "$HOME/.globalrc"
    fi
    export GTAGSLABEL 'ctags'
fi

## local/lib
export PATH="$PATH:/usr/local/lib/"

## .local/bin
if [ -d "$PATH:$HOME/.local/bin" ]
then
    export PATH="$HOME/.local/bin/:$PATH"
fi

## pipenv
export PIPENV_VENV_IN_PROJECT=1

## pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
         COMP_CWORD=$(( cword-1 )) \
         PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

## ruby
if [ -d "$HOME/.rbenv/" ]
then
   export PATH="$PATH:$HOME/.rbenv/bin/"
   eval "$(rbenv init -)"
fi

## roswell
if [ -d "$HOME/.roswell/bin/" ]
then
    export PATH="$PATH:$HOME/.roswell/bin/"
fi

## CUDA
if [ -e "/usr/local/cuda/" ]
then
    export PATH="$PATH:/usr/local/cuda/bin/"
    export LD_LIBRARY_PATH=:"/usr/local/cuda/lib64"
    export PATH="$PATH:/usr/local/cuda/targets/x86_64-linux/include"
    export LD_LIBRARY_PATH=:"/usr/local/cuda/targets/x86_64-linux/lib"
fi

## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## nvm
if [ -d ${HOME}/.nvm ]; then
  # Set NVM_DIR if not already set
  export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

  # Lazy load NVM
  nvm() {
    unset -f nvm
    source "${NVM_DIR}/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
  }

  # Add default Node version to PATH if it exists
  if [ -f "${NVM_DIR}/alias/default" ]; then
    DEFAULT_NODE_VERSION=$(cat "${NVM_DIR}/alias/default")
    NODE_BIN_PATH="${NVM_DIR}/versions/node/v${DEFAULT_NODE_VERSION}/bin"
    if [ -d "${NODE_BIN_PATH}" ]; then
      export PATH="${NODE_BIN_PATH}:$PATH"
      export NODE_PATH="${NVM_DIR}/versions/node/v${DEFAULT_NODE_VERSION}/lib/node_modules"
    fi
  fi
fi

## john
export PATH="$PATH:$HOME/src/JohnTheRipper/run/"
alias john="$HOME/src/JohnTheRipper/run/john"

## opencode
export PATH=/home/tkgsy/.opencode/bin:$PATH

## solve duplicates
typeset -U path cdpath fpath nmanpath

# modern command

## modern cat
if [ -e "$HOME/.cargo/bin/bat" ]; then
    alias bat='bat --paging=never --theme Dracula'
    export MANPAGER="sh -c 'col -bx 2>/dev/null| bat -l man -p'"
    export MANROFFOPT="-c"
    alias bathelp='bat --plain --language=help --theme Dracula'
    help() {
        "$@" --help 2>&1 | bathelp
    }
    alias -g -- -rh='-h 2>&1 | bat -l help -p'
    alias -g -- --rhelp='--help 2>&1 | bat -l help -p'
fi

## modern ls
# [ -e "$HOME/.cargo/bin/eza" ] && alias ls=eza

## zoxide, z command modern cd
type -a zoxide 2>&1 > /dev/null && eval "$(zoxide init zsh)"

## modern git diff
if [ -e "$HOME/.cargo/bin/delta" ]; then
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
    git config --global delta.navigate true
    git config --global delta.dark true  # or `delta.light true`, or omit for auto-detection
    git config --global merge.conflictStyle zdiff3
fi

## modern tree, broot
source /home/tkgsy/.config/broot/launcher/bash/br

# original command
if ! type -a dictd 2>&1 > /dev/null ; then
    sudo apt install -y dictd dict-freedict-jpn-eng dict-freedict-eng-jpn
fi

function ej() {
    dict -d fd-eng-jpn "$*"
}

function je() {
    dict -d fd-jpn-eng "$*"
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

# zsh-shellcolor
export DEFAULT_SHELLCOLOR="#00524f"

# zsh-notify
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10

# sheldon, package manager
eval "$(sheldon source)"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor line pattern)
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'

# theme
# eval "~/.zsh/starship.sh"
eval "$(eval starship init zsh)"
# `starship explain` can show explaination of current state

zre_random_execute

# freshfetch
macchina # rsftch

ansiweather
