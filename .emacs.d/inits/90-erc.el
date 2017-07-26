(setq erc-server-coding-system '(iso-2022-jp . iso-2022-jp))

(defun connect-lab ()
  (interactive)
  (erc :server "irc.media.kyoto-u.ac.jp" :port 6667 :nick "tkgsy" :password ""))

(setq erc-autojoin-channels-alist '(("irc.media.kyoto-u.ac.jp" "#tom-lab:*.jp" "#shimalab:*.jp")))
