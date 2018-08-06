;;; 20-bison-mode.el --- 

(use-package binson-mode
  :mode (("\.\(y\|yy\)$" . bison-mode))
  :straight nil)

(use-package flex-mode
  :mode (("\.\(l\|ll\)$" . flex-mode))
  :straight nil)
