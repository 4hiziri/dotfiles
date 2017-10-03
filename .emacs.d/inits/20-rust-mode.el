(use-package rust-mode
  :defer t
  :config
  (setq rust-format-on-save t))

;; cargo-minor-mode
;; Cargo Minor mode.
;; Provides a number of key combinations and functions for managing Cargo.
;; Current supported Cargo Key Combinations:
;;  * C-c C-c C-e - cargo-process-bench
;;  * C-c C-c C-b - cargo-process-build
;;  * C-c C-c C-l - cargo-process-clean
;;  * C-c C-c C-d - cargo-process-doc
;;  * C-c C-c C-v - cargo-process-doc-open
;;  * C-c C-c C-n - cargo-process-new
;;  * C-c C-c C-i - cargo-process-init
;;  * C-c C-c C-r - cargo-process-run
;;  * C-c C-c C-x - cargo-process-run-example
;;  * C-c C-c C-s - cargo-process-search
;;  * C-c C-c C-t - cargo-process-test
;;  * C-c C-c C-u - cargo-process-update
;;  * C-c C-c C-c - cargo-process-repeat
;;  * C-c C-c C-f - cargo-process-current-test
;;  * C-c C-c C-o - cargo-process-current-file-tests
;;  * C-c C-c C-m - cargo-process-fmt
;;  * C-c C-c C-k - cargo-process-check
;;  * C-c C-c C-K - cargo-process-clippy
(use-package cargo
  :defer t
  :init
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package company-racer
  :defer t
  :init
  (setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")
  ;; hooks
  (add-hook 'rust-mode-hook #'racer-mode)
  ;;  (add-hook 'rust-mode-hook #'rustfmt-enable-on-save) obsolete
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (add-hook 'rust-mode-hook
	    '(lambda ()
	       (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
	       (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
    (add-to-list 'company-backends 'company-racer)
  :config
;;  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t))

(use-package racer
  :defer
  :init
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'rust-mode-hook
          (lambda ()
            (setq flycheck-checker 'cargo)))
  (add-hook 'rust-mode-hook 
	    '(lambda () 
	       (racer-activate)
	       (local-set-key (kbd "M-.") #'racer-find-definition)
	       (local-set-key (kbd "TAB") #'racer-complete-or-indent)))
  :config
  ;; bind-key
  )


;; TODO error check
(load "~/.emacs.d/elpa/flycheck-cargo.el")
(add-hook 'rust-mode-hook
          (lambda ()
            (setq flycheck-checker 'cargo)))
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
