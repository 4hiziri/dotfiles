(add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)

(use-package smartparens-config
  :defer t
  :bind (("C-c r" . sp-forward-slurp-sexp) ;; paredit-forward-slurp-sexp
	 ("C-c l" . sp-forward-barf-sexp)
	 ("C-c h" . sp-backward-delete-char)))
