;;; migemo --- migemo conf
;;; Commentary:
;; need apt install cmigemo
;;; Code:

;;migemo
(use-package migemo
  :if (executable-find "cmigemo")
  :defer t
  :commands (migemo-get-pattern)
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-user-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-regex-dictionary nil)
  (migemo-init))

;;; 80-migemo.el ends here
