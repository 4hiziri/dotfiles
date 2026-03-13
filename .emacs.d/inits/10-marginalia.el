(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map ("C-M-a" . #'marginalia-cycle))
  :init
  (marginalia-mode))
