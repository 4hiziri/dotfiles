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
(defvar uniquify-buffer-name-style 'post-forward-andle-brackets)
(defvar uniquify-ignore-buffers-re "*[^*]+*")
(defvar uniquify-buffer-name-style 'post-forward-angle-brackets)

(if (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode)
  (use-package linum
  :config
  (global-linum-mode)
  (setq linum-format "%03d |")))


(use-package w3m
  :defer t
  :init (setq browse-url-browser-function 'w3m-browse-url))

(defvar-local my/smart-nav-orig-pos nil
  "移動前のカーソル位置を記憶するバッファローカル変数")

(defun my/smart-beginning-of-line-cycle ()
  "C-a連打サイクル: 行頭(インデント無視) -> ページ先頭 -> 元の位置"
  (interactive)
  (cond
   ;; 3回目（または2回目以降で既に先頭にいる場合）：元の位置へ
   ((and (eq last-command this-command)
         (= (point) (point-min)))
    (when my/smart-nav-orig-pos
      (goto-char my/smart-nav-orig-pos)
      (setq my/smart-nav-orig-pos nil)))
   ;; 2回目：ページ（バッファ）先頭へ
   ((eq last-command this-command)
    (goto-char (point-min)))
   ;; 1回目：行頭へ
   (t
    ;; Markerを使って位置を記憶（編集でズレないように）
    (setq my/smart-nav-orig-pos (point-marker))
    (back-to-indentation)
    ;; すでにインデント位置なら本当の行頭へ
    (when (= (point) my/smart-nav-orig-pos)
      (move-beginning-of-line nil)))))

(defun my/smart-end-of-line-cycle ()
  "C-e連打サイクル: 行末 -> ページ末尾 -> 元の位置"
  (interactive)
  (cond
   ;; 3回目：元の位置へ
   ((and (eq last-command this-command)
         (= (point) (point-max)))
    (when my/smart-nav-orig-pos
      (goto-char my/smart-nav-orig-pos)
      (setq my/smart-nav-orig-pos nil)))
   ;; 2回目：ページ（バッファ）末尾へ
   ((eq last-command this-command)
    (goto-char (point-max)))
   ;; 1回目：行末へ
   (t
    (setq my/smart-nav-orig-pos (point-marker))
    (move-end-of-line nil))))

;; キーバインドの上書き登録
(bind-key "C-a" #'my/smart-beginning-of-line-cycle)
(bind-key "C-e" #'my/smart-end-of-line-cycle)


;;; 00-init.el ends here
