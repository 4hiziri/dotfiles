(use-package flycheck
  :defer t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))
