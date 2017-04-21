(defun paste-linux ()
  "Handle copy/paste intelligently on linux."
  (let ((paste (purecopy "/usr/bin/xclip"))
	(command (purecopy "/usr/bin/xclip -o -selection clipboard")))
    (if (and (eq system-type 'gnu/linux)
             (file-exists-p paste))
        (let ((tramp-mode nil)
              (default-directory "~"))
          (shell-command-to-string command)))))

(defun cut-linux (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "emacs-xclip"
			       "*Messages*"
			       "/usr/bin/xclip"
			       "-i"
			       "-selection"
			       "clipboard")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'cut-linux
      interprogram-paste-function 'paste-linux)
