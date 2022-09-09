;;; hl-todo --- highlight todo
;;; Commentary:
;;; Code:

(use-package hl-todo
  :config
  (push 'emacs-lisp-mode hl-todo-activate-in-modes)
  (global-hl-todo-mode 1))

;;; 90-hl-todo.el ends here
=======
(use-package hl-todo  
  :config
  (push 'emacs-lisp-mode hl-todo-activate-in-modes)
  (global-hl-todo-mode 1)  
  (add-to-list 'hl-todo-keyword-faces '("WARN" . "#f1e928")))
>>>>>>> bdaeed2f160be86d1e2c9072efca4435fb74117b
