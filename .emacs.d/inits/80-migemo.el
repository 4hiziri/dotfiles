;;; migemo --- migemo conf
;;; Commentary:
;; TODO: research
;; TODO: integrate moccur
;;; Code:

;;migemo
(use-package migemo
  :if (executable-find "cmigemo")
  :defer t
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-user-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-regex-dictionary nil)
  (migemo-init))

;;; 80-migemo.el ends here
