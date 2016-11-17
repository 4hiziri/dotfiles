;;paredit
(use-package paredit
  :defer t
  :bind (("C-c C-<right>" . paredit-forward-slurp-sexp)
	 ("C-c C-<left>" . paredit-forward-barf-sexp)))
