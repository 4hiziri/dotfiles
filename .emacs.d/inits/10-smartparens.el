;;; 10-smartparens.el --- insert end of ()
;;; Commentary:
;; M-x sp-cheat-sheet
;;; Code:

(use-package smartparens
  :config
  (sp-with-modes '(lisp-mode lisp-interaction-mode slime-mode slime-repl-mode emacs-lisp-mode)
                 (sp-local-pair "'" nil :actions nil)
                 (sp-local-pair "`" nil :actions nil))
  (provide 'smartparens-lisp))

;;; 10-smartparens.el ends here
