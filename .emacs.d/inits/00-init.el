;;; 00-init.el -- Summary
;;; Commentary:
;; still undivided settings
;;; Code:

;; 対応する括弧を強調表示
(use-package paren
  :ensure nil
  :demand t
  :custom-face
  (show-paren-match ((nil (:background "#44475a" :foreground "#f1fa8c"))))
  :custom
  (show-paren-style 'mixed)
  (show-paren-when-point-inside-paren t)
  (show-paren-when-point-in-periphery t)
  :config
  (show-paren-mode t))

;; バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
             (cons ".*" "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;;履歴拡張
(setq history-length 3000)

;;キーストローク
(setq echo-keystrokes 0.1)

;; help -> backspace
(define-key key-translation-map [?\C-h] [?\C-?])

;;ffap
(ffap-bindings)

(setq-default tab-width 4)
(setq tab-stop-list
      '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; misc packages
(use-package uniquify
  :ensure nil
  :defer nil)
(defvar uniquify-buffer-name-style 'post-forward-andle-brackets)
(defvar uniquify-ignore-buffers-re "*[^*]+*")
(defvar uniquify-buffer-name-style 'post-forward-angle-brackets)

(if (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode)
  (use-package linum
    :demand t
    :config
    (global-linum-mode)
    (setq linum-format "%03d |")))

(use-package w3m
  :defer t
  :custom (browse-url-browser-function 'w3m-browse-url))

(use-package sequential-command
  :ensure (:host github :repo "HKey/sequential-command" :wait t)
  :demand t)

(use-package sequential-command-config
  :ensure nil
  :after sequential-command
  :demand t
  :config
  (sequential-command-setup-keys))

;; which-key config
(which-key-mode)

;; alternative interface for M-x
;; キーバインドがあるコマンドなら教えてくれる、便利
(use-package amx
  :demand t)

(use-package volatile-highlights
  :demand t
  :config
  (volatile-highlights-mode 1))

(use-package autorevert
  :ensure nil
  :demand t
  :config
  (global-auto-revert-mode))

(use-package delsel
  :ensure nil
  :demand t
  :config
  (delete-selection-mode))

;;; 00-init.el ends here
