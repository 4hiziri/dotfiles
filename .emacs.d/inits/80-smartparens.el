(add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)

(use-package smartparens-config 
  :bind (("C-c r" . sp-forward-slurp-sexp) ;; paredit-forward-slurp-sexp
	 ("C-c l" . sp-forward-barf-sexp)
	 ("C-c DEL" . backward-delete-char))
  :config
  (smartparens-global-mode t)
  (sp-use-paredit-bindings))
