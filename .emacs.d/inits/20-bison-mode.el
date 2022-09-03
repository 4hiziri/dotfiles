;;; 20-bison-mode.el --- bison-mode config
;;; Commentary:
;;; Code:

(use-package binson-mode
  :mode ("\\.\(y\|yy\)\\." . bison-mode)
  :straight nil)

(use-package flex-mode
  :mode ("\\.\(l\|ll\)\\'" . flex-mode)
  :straight nil)

;;; 20-bison-mode.el ends here
