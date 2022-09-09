;;; smartparens --- smartparens
;;; Commentary:
;; TODO: integrate?
;;; Code:

(use-package smartparens-config
  :straight nil
  :bind (("C-c r" . sp-forward-slurp-sexp) ;; paredit-forward-slurp-sexp
		 ("C-c l" . sp-forward-barf-sexp)
		 ("C-c DEL" . backward-delete-char))
  :init
  (add-hook 'emacs-lisp-mode-hook 'turn-on-smartparens-strict-mode)
  :config
  (smartparens-global-mode t)
  (sp-use-paredit-bindings))

;;; 80-smartparens.el ends here
