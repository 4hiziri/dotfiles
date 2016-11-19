################################
# zplug
################################

case `uname -s` in
    Linux)
	export ZPLUG_HOME=~/.zplug
	#=============================
	# editor
	#=============================
	alias emacs='emacsclient -nw -a ""'
	alias ekill='emacsclient -e (kill-emacs)'
	export EDITOR='emacsclient -nw -a'
	export VISUAL='emacsclient -nw -a'
	;;
    Darwin)
	export ZPLUG_HOME=/usr/local/opt/zplug
	# MacPorts Installer addition on 2014-07-15_at_12:00:34: adding an appropriate PATH vari\
	#able for use with MacPorts.
	export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
	# Finished adapting your PATH environment variable for use with MacPorts.
	export PATH="/usr/local/bin:$PATH"
	#token
	export HOMEBREW_GITHUB_API_TOKEN="832b654d3603021658907b6d10f176aa6f1b24d8"
	# brew
	for d in "/share/zsh-completions" "/share/zsh/zsh-site-functions";do
	    brew_completion=$(brew --prefix 2>/dev/null)$d
	    if [ $? -eq 0 ] && [ -d "$brew_completion" ];then
		fpath=($brew_completion $fpath)
	    fi
	done
	#=============================
	# editor
	#=============================
	alias emacs='/usr/local/bin/emacsclient -nw -a ""'
	alias ekill='emacsclient -e "(kill-emacs)"'
	export EDITOR='/usr/local/bin/emacsclient -nw'
	export VISUAL='/usr/local/bin/emacsclient -nw'
	;;
esac

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
zplug "zsh-users/zsh-syntax-highlighting", nice:10
# zplug "ascii-soup/zsh-url-highlighter", use:url/zsh-url-highlighter :WARN erorr

# tools
zplug "marzocchi/zsh-notify"
zplug "oknowton/zsh-dwim"

zplug "peco/peco"

zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
	echo; zplug install
    fi
fi

# source each file and alias command
zplug load --verbose

################################
# zsh-256color
################################

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
# if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ];then
#     source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fi

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
# power-line
################################
export TERM='xterm-256color'

################################
# pyenv zsh-python-prompt
################################
autoload -Uz add-zsh-hook

function _update_pyenv() {
    RPROMPT="[$ZSH_PYTHON_PROMPT] "    
}

add-zsh-hook precmd _update_pyenv

setopt prompt_subst
# custamize
# zstyle ':zsh-python-prompt:pyenv:' symbol '⌘'

################################
# zsh prompt
################################
# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
%# "
################################
# other
################################

#solve duplicates
typeset -U path cdpath fpath nmanpath

#mkcmd
CMD_EXPORT="$HOME/my-bin"
export CMD_EXPORT

# current dir add to path
export PATH=".:$PATH"

# add my sh-scripts
export PATH="$HOME/my-bin:$PATH"

# path for cask
PATH="$HOME/.cask/bin:$PATH"

#============================
# python setting
# pyenv setting
#============================
export PYTHONPATH="$PYTHONPATH:$HOME/.python_script"
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# virtualenv setting
export PYENV_VIRTUALENV_DISABLE_PROMPT=0

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

#########################################
# powerline
########################################
export PATH=$PATH:~/.local/bin
powerline-daemon -q
source /Users/seiya/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# color setting
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

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
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
 %# "
 
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
 
########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
 
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT+="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

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
bindkey '^R' history-incremental-pattern-search-backward
 
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

case ${OSTYPE} in
    darwin*)
	#Mac用の設定
	export CLICOLOR=1
	alias ls='ls -G -F'
	;;
    linux*)
	#Linux用の設定
	alias ls='ls -F --color=auto'
	;;
esac
#######################################
