;;; 20-bison-mode.el --- 

(use-package binson-mode
  :mode (("\.\(y\|yy\)$" . bison-mode)))

(use-package flex-mode
  :mode (("\.\(l\|ll\)$" . flex-mode)))
