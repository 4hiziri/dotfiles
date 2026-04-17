(use-package undo-fu
  :config
  (global-unset-key (kbd "C-_"))
  (global-set-key (kbd "C-_")   'undo-fu-only-undo)
  (global-set-key (kbd "M-=") 'undo-fu-only-redo))
