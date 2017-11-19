(use-package cc-mode)

(use-package helm-gtags
  :init
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (setq helm-gtags-path-style 'root)
  (setq helm-gtags-auto-update t)    
  :config
  (bind-key "M-." 'helm-gtags-dwim c-mode-map)
  (bind-key "M-s" 'helm-gtags-show-stack c-mode-map)
  (bind-key "M-p" 'helm-gtags-previous-history c-mode-map)
  (bind-key "M-n" 'helm-gtags-next-history c-mode-map))
