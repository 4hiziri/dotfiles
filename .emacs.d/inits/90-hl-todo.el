;;; hl-todo --- highlight todo
;;; Commentary:
;;; Code:

(use-package hl-todo
  :config
  (push 'emacs-lisp-mode hl-todo-activate-in-modes)
  (global-hl-todo-mode 1))

;;; 90-hl-todo.el ends here
