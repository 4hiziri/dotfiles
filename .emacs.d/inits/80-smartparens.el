;;; smartparens --- smartparens
;;; Commentary:
;; TODO: integrate?
;;; Code:

(use-package smartparens
  :hook (prog-mode text-mode markdown-mode)
  :config
  (sp-with-modes '(lisp-mode lisp-interaction-mode slime-mode slime-repl-mode emacs-lisp-mode)
    (sp-local-pair "'" nil :actions nil)
    (sp-local-pair "`" nil :actions nil))
  (provide 'smartparens-lisp))

(use-package smartparens-config
  :ensure nil
  :after smartparens
  :bind (("C-c r" . sp-forward-slurp-sexp) ;; paredit-forward-slurp-sexp
		 ("C-c l" . sp-forward-barf-sexp)
		 ("C-c DEL" . backward-delete-char))
                                        ;  :init
                                        ; (add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (sp-use-paredit-bindings)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)
                                        ;    (sp-with-modes '(lisp-mode lisp-interaction-mode slime-mode slime-repl-mode emacs-lisp-mode)
  (sp-local-pair "'" nil :actions nil)
  (sp-local-pair "`" nil :actions nil))

(provide 'smartparens-lisp)
;; TODO: fix load order



;;; 80-smartparens.el ends here
