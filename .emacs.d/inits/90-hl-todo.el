(use-package hl-todo  
  :config
  (push 'emacs-lisp-mode hl-todo-activate-in-modes)
  (global-hl-todo-mode 1)  
  (add-to-list 'hl-todo-keyword-faces '("WARN" . "#f1e928")))
