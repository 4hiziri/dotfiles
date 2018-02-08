balias emacs '/usr/local/bin/emacsclient -nw -a ""'
balias ekill '/usr/local/bin/emacsclient -e (kill-emacs)'

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'

alias ls 'ls -F --color=auto'

balias mkdirp 'mkdir -p'

balias sudo 'sudo '

# for ctf
balias exploit 'python exploit.py'
