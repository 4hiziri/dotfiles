(use-package c-mode
  :straight nil
  :defer t
  :init
  (defun my-conf-c-mode-common ()
    (c-set-style "gnu")
    (bind-key "C-c c" 'compile c-mode-map)
    (bind-key "C-c d" 'gdb c-mode-map))
  (add-hook 'c-mode-common-hook 'my-conf-c-mode-common)
  (add-hook 'c-mode-common-hook 'flycheck-mode)
  (add-hook 'c-mode-common-hook 'hs-minor-mode)
  (add-hook 'c-mode-common-hook 'turn-on-smartparens-mode)
  (setq flycheck-gcc-language-standard ))

;; semantic-refactoring

(use-package irony
  :defer t
  :config
  (flycheck-irony-setup)
  (setq irony-additional-clang-options '("-std=c++17")) 
  (add-to-list 'company-backends 'company-irony)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-common-hook 'irony-mode))
