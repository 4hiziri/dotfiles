(use-package rust-mode
  :defer t)

(use-package company-racer
  :defer t
  :init
  (setq racer-rust-src-path "~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")
  (setq rust-format-on-save t)
  ;; hooks
  (add-hook 'rust-mode-hook #'racer-mode)
  ;;  (add-hook 'rust-mode-hook #'rustfmt-enable-on-save) obsolete
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (add-to-list 'company-backends 'company-racer)
  
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t))

;; (use-package racer
;;   :defer
;;   :init
;;   (add-hook 'rust-mode-hook #'racer-mode)
;;   (add-hook 'racer-mode-hook #'company-mode)
;;   (add-hook 'rust-mode-hook
;;           (lambda ()
;;             (setq flycheck-checker 'cargo)))
;;   (add-hook 'rust-mode-hook 
;; 	    '(lambda () 
;; 	       (racer-activate)
;; 	       (local-set-key (kbd "M-.") #'racer-find-definition)
;; 	       (local-set-key (kbd "TAB") #'racer-complete-or-indent)))
;;   :config
;;   ;; bind-key
;; )
