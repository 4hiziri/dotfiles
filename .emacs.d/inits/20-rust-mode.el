;;; rust-mode --- rust mode
;;; Commentary:
;; Cargo Minor mode.
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
;;; Code:

(use-package rustic
  :ensure t
  :defer t
  :init
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (setenv "RUST_BACKTRACE" "full")
  (setenv "RUST_LOG" "rls::=debug")
  (add-hook 'rustic-mode-hook
			(lambda ()
			  (racer-mode t)
			  (dumb-jump-mode t)
			  (highlight-symbol-mode t)
			  (rainbow-delimiters-mode t)
			  (message "test")
			  (smartparens-mode t)
			  (lsp-rust-enable)))
  :mode ("\\.rs\\'" . rustic-mode)
  :commands (rustic-mode)
  :config
  (use-package dumb-jump
	:ensure t)
  (use-package highlight-symbol
	:ensure t))

(use-package cargo
  :defer t)

;; (use-package rust-mode
;;   :defer t
;;   :init
;;   (add-hook 'rust-mode-hook 'cargo-minor-mode)
;;   (add-hook 'rust-mode-hook 'turn-on-smartparens-mode)
;;   (add-hook 'rust-mode-hook 'hs-minor-mode)
;;   :config
;;   (setq rust-format-on-save t))

(use-package company-racer
  :defer t
  :init
  (defun my-conf-company-racer ()
	(local-set-key (kbd "TAB") #'company-indent-or-complete-common)
	(local-set-key (kbd "C-c <tab>") #'rust-format-buffer))
  (setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")
  (setq company-racer-executable "~/.cargo/bin/racer")

  ;; hooks
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (add-hook 'rust-mode-hook 'my-conf-company-racer)
  (add-to-list 'company-backends 'company-racer)
  :config
  (setq company-tooltip-align-annotations t))

;;; Usage
;; M-. find-difinition, does not support macro yet.
;; F1, help or completion
;; M-x racer-describe
;; source download: rustup component add rust-src

(use-package racer
  :init
  (defun my-conf-racer ()
	(local-set-key (kbd "M-.") #'racer-find-definition)
	;;(local-set-key (kbd "TAB") #'racer-complete-or-indent)
	)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'rust-mode-hook 'my-conf-racer))


;; TODO error check
(use-package flycheck-rust
  :init
  (defun my-conf-flycheck-rust ()
	(setq flycheck-checker 'cargo))
  (add-hook 'rust-mode-hook 'my-conf-flycheck-rust)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; available in racer-find-difinition?
;; global
;; (use-package cl-lib)
;; (defadvice helm-gtags-dwim
;;     (around update-libpath activate)
;;   (setenv "GTAGSLIBPATH"
;;           (cl-case major-mode
;;             (rust-mode (file-truename
;;                         ;; rustのソースコードへのパスを指定する
;;                         "~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src"))
;;             (t nil)))
;;   ad-do-it)

;; (require 'helm-gtags)
;; ;; (add-hook 'go-mode-hook (lambda () (helm-gtags-mode)))
;; ;; (add-hook 'python-mode-hook (lambda () (helm-gtags-mode)))
;; ;; (add-hook 'ruby-mode-hook (lambda () (helm-gtags-mode)))
;; (add-hook 'rust-mode-hook (lambda () (helm-gtags-mode)))
;; (setq helm-gtags-path-style 'root)
;; (setq helm-gtags-auto-update t)
;; (add-hook 'helm-gtags-mode-hook
;;           '(lambda ()
;;              (local-set-key (kbd "M-g") 'helm-gtags-dwim)
;;              (local-set-key (kbd "M-s") 'helm-gtags-show-stack)
;;              (local-set-key (kbd "M-p") 'helm-gtags-previous-history)
;;              (local-set-key (kbd "M-n") 'helm-gtags-next-history)))

;;; 20-rust-mode.el ends here
