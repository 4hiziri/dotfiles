;;; 00-init.el -- Summary
;;; Commentary:
;; still undivided settings

;;; Code:

;; ミニバッファに時計を表示
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

;; ;;;  P100 現在行のハイライト
;; (defface my-hl-line-face
;;   ;; 背景がdarkならば背景色を紺に
;;   '((((class color) (background dark))
;;      (:background "dark slate gray" t))
;;     ;; 背景がlightならば背景色を緑に
;;     (((class color) (background light))
;;      (:background "ForestGreen" t))
;;     (t (:bold t)))
;;   "hl-line's my face")
;; (setq hl-line-face 'my-hl-line-face)
;; (global-hl-line-mode t)

(use-package hl-line+
  :config
  (set-face-background 'hl-line "ForestGreen")
  (toggle-hl-line-when-idle))

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
  (defvar uniquify-buffer-name-style 'post-forward-angle-brackets))

;;template
(auto-insert-mode)
(defvar auto-insert-directory "~/projects/dotfiles/.emacs.d/insert/")
(define-auto-insert "\\.c" "c-template.c")

;; linum
(use-package linum
  :config
  (global-linum-mode)
  (setq linum-format "%d "))

;;; 00-init.el ends here
