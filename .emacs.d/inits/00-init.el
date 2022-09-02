;;; 00-init.el -- Summary
;;; Commentary:
;; still undivided settings
;;; Code:

;; config

;; ミニバッファに時計を表示
(eval-when-compile (defvar display-time-string-forms)) ;; to suppress error
(setq display-time-string-forms
	  '((format "%04d/%02d/%02d(%s) %02d:%02d"
				(string-to-number year)
				(string-to-number month)
				(string-to-number day)
				dayname
				(string-to-number 24-hours)
				(string-to-number minutes)
				)))
(display-time)

;; 対応する括弧を強調表示
(show-paren-mode t)

;; バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
			 (cons ".*" "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
	  `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; 大昔のサンプルコード、不要だが参考のため残す
;;dtwをdelete-trailing-whitespaceのエイリアスにする
(defalias 'dtw 'delete-trailing-whitespace)

;;履歴拡張
(setq history-length 3000)

;;キーストローク
(setq echo-keystrokes 0.1)

;;ffap
(ffap-bindings)

;;template
(auto-insert-mode)
(defvar auto-insert-directory "~/projects/dotfiles/.emacs.d/insert/")
(define-auto-insert "\\.c" "c-template.c")

(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; misc packages
(use-package uniquify
  :config
  (defvar uniquify-buffer-name-style 'post-forward-andle-brackets)
  (defvar uniquify-ignore-buffers-re "*[^*]+*")
  ;; dir/buffer
  (defvar uniquify-buffer-name-style 'post-forward-angle-brackets)
  :straight nil)

(use-package linum
  :config
  (global-linum-mode)
  (setq linum-format "%2d |"))

(use-package w3m
  :defer t)

(use-package sequential-command
  :defer t)

(use-package bind-key)

;;; 00-init.el ends here
