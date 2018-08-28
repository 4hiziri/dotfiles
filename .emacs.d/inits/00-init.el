;;; 00-init.el -- Summary
;;; Commentary:
;; still undivided settings

;;; Code:

;; ミニバッファに時計を表示
(setq display-time-string-forms
 '((format "%s/%s(%s)%s:%s"
		 month day dayname
		 24-hours minutes
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

;;; 00-init.el ends here
