;;; cc-mode --- C mode
;;; Commentary:
;; /home/tkgsy/src/emacs-28.1/lisp/progmodes/cc-mode.el
;;; Code:

(use-package flycheck-irony
  :defer t)

(use-package irony
  :defer t
  :init
  (add-to-list 'company-backends 'company-irony)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-common-hook 'irony-mode)
  :config
  (flycheck-irony-setup)
  (setq irony-additional-clang-options '("-std=c++17")))

(use-package cc-mode
  :straight nil
  :defer t
  :mode ("\\.c\\'" . c-mode)
  :mode ("\\.cpp\\'" . c++-mode)
  :init
  (add-hook 'c-mode-common-hook 'helm-gtags-mode)
  (add-hook 'c-mode-common-hook 'flycheck-mode)
  (add-hook 'c-mode-common-hook 'hs-minor-mode)
  (add-hook 'c-mode-common-hook 'turn-on-smartparens-mode)
  (add-hook 'c-mode-common-hook 'company-mode)
  (add-hook 'c-mode-common-hook (lambda ()
				  ;; duno why but doesn't load bind-key
				  ;; hook by lambda
				  (c-set-style "gnu")
				  ;; (bind-key "C-c c" 'compile c-mode-map)
				  ;; (bind-key "C-c d" 'gdb c-mode-map)
				  ;; (bind-key "M-." 'helm-gtags-dwim c-mode-map)
				  ;; (bind-key "M-s" 'helm-gtags-show-stack c-mode-map) ; :TODO same keybind with smartparens
				  ;; (bind-key "M-p" 'helm-gtags-previous-history c-mode-map)
				  ;; (bind-key "M-n" 'helm-gtags-next-history c-mode-map)

				  ;; (bind-key "M-." 'helm-gtags-dwim c++-mode-map)
				  ;; (bind-key "M-s" 'helm-gtags-show-stack c++-mode-map)
				  ;; (bind-key "M-p" 'helm-gtags-previous-history c++-mode-map)
				  ;; (bind-key "M-n" 'helm-gtags-next-history c++-mode-map)
				  ))
  :bind (:map c-mode-map
		 ("C-c c" . compile)
		 ("C-c d" . gdb)
		 ("M-." . helm-gtags-dwim)
		 ("M-s" . helm-gtags-show-stack)
		 ("M-p" . helm-gtags-previous-history)
		 ("M-n" . helm-gtags-next-history)
		 :map c++-mode-map
		 ("M-." . helm-gtags-dwim)
		 ("M-s" . helm-gtags-show-stack)
		 ("M-p" . helm-gtags-previous-history)
		 ("M-n" . helm-gtags-next-history))
  :config
  (setq flycheck-gcc-language-standard "c++17"))

;;; 20-cc-mode.el ends here
