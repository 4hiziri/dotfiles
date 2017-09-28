(require 'smartparens)

(sp-with-modes '(lisp-mode lisp-interaction-mode slime-mode)
  (sp-local-pair "'" nil :actions nil)
  (sp-local-pair "`" nil :actions nil))

(provide 'smartparens-lisp)
