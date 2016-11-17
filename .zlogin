read pid <<< `pgrep Emacs`

if [ ${pid} -lt 700 ]; then
    pkill Emacs
fi
