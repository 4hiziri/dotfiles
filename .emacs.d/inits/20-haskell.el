;;; haskell --- haskell mode config
;;; Commentary:
;;; Code:

;; stack install hlint # linter
;; stack install stylish-haskell # formatter
(use-package intero
  :defer t)

(use-package haskell-mode
  :defer t
  :init
  (add-hook 'haskell-mode-hook 'intero-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
  (add-hook 'haskell-mode-hook 'font-lock-mode)
  (add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
  (setq haskell-program-name "/usr/local/bin/stack ghci")
  (add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
  (add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
  ;; (setq haskell-process-type "stack-ghci")
  ;; (setq haskell-process-path-ghci "stack")
  ;; (setq haskell-process-args-ghci "ghci")
  ;; (setq haskell-process-args-ghci nil)
  ;; :config
  ;; (add-hook 'haskell-mode-hook 'inferior-haskell-mode) 
  )

;;; 20-haskell.el ends here
