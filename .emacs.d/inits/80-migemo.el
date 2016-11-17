;;migemo
(use-package migemo
  :if (executable-find "cmigemo")
  :defer t
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-user-dictionary nil)
  (setq migemo-coding-system 'utf-8)
  (setq migemo-regex-dictionary nil)
  (load-library "migemo")
  (migemo-init))
