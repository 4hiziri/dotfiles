;;; hl-todo --- highlight todo
;;; Commentary:

;;; Code:

(use-package hl-todo
  :init
  (global-hl-todo-mode)
  :config
  (add-to-list 'hl-todo-keyword-faces '("WARN" . "#f1e928")))

;;; 90-hl-todo.el ends here
