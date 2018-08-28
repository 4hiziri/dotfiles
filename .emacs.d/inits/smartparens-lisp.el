(sp-with-modes '(lisp-mode lisp-interaction-mode slime-mode slime-repl-mode emacs-lisp-mode)
  (sp-local-pair "'" nil :actions nil)
  (sp-local-pair "`" nil :actions nil))

(provide 'smartparens-lisp)
;; TODO: fix load order
