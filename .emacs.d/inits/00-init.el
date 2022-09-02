;;; 00-init.el -- Summary
;;; Commentary:
;; still undivided settings
;;; Code:

;; ミニバッファに時計を表示
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

;;dtwをdelete-trailing-whitespaceのエイリアスにする
(defalias 'dtw 'delete-trailing-whitespace)

;;履歴拡張
(setq history-length 1000)

;;キーストローク
(setq echo-keystrokes 0.1)

;;ffap
(ffap-bindings)

;;uniquify
(use-package uniquify
  :config
  (defvar uniquify-buffer-name-style 'post-forward-andle-brackets)
  (defvar uniquify-ignore-buffers-re "*[^*]+*")
  ;; dir/buffer
  (defvar uniquify-buffer-name-style 'post-forward-angle-brackets)
  :straight nil)

;;template
(auto-insert-mode)
(defvar auto-insert-directory "~/projects/dotfiles/.emacs.d/insert/")
(define-auto-insert "\\.c" "c-template.c")

;; linum
(use-package linum
  :config
  (global-linum-mode)
  (setq linum-format "%d "))

(use-package w3m
  :defer t)

(use-package sequential-command
  :defer t)

;; tab-width
(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;;; 00-init.el ends here
