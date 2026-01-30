;;; linux-paste --- emacs copy sync with clipboard
;;; Commentary:
;;; Code

(use-package xclip
  :demand t
  :if (eq system-type 'gnu/linux)
  :config
  (xclip-mode))

;;; linux-paste.el ends here
