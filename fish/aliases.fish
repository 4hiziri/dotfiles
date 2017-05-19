switch (uname)
    case Linux
        balias emacs '/usr/local/bin/emacsclient -nw -a ""'
    case '*'
        balias emacs '/usr/local/bin/emacsclient -nw -a ""'
end

balias ekill '/usr/local/bin/emacsclient -e (kill-emacs)'
balias rm 'rm -i'

balias cp 'cp -i'
balias cpf 'cp -f'
balias mv 'mv -i'
balias ls 'ls -F --color=auto'

balias mkdir 'mkdir -p'

balias sudo 'sudo '
