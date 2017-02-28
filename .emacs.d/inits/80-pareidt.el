;;paredit
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interacton-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)

(use-package paredit
  :defer t
  :bind (("C-c r" . paredit-forward-slurp-sexp)
	 ("C-c l" . paredit-forward-barf-sexp)
	 ("C-h" . paredit-backward-delete)))
