;;; migemo --- migemo conf
;;; Commentary:
;; need apt install cmigemo
;;; Code:

;;migemo
(use-package migemo
  :if (executable-find "cmigemo")
  :defer t
  :commands (migemo-get-pattern)
  :custom
  (migemo-command "cmigemo")
  (migemo-options '("-q" "--emacs"))
  (migemo-user-dictionary nil)
  (migemo-coding-system 'utf-8-unix)
  (migemo-regex-dictionary nil)
  :config
  (let ((path "/usr/share/cmigemo/utf-8/migemo-dict"))
    (if (file-exists-p path)
        (setq migemo-dictionary path)))
  (migemo-init))

;;; 80-migemo.el ends here
