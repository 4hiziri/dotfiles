;;; 00-init.el -- Summary
;;; Commentary:
;; still undivided settings
;;; Code:

;; config

;; :TODO 表示されてない、doom-mode-lineの方で設定必要?
;; ミニバッファに時計を表示
(eval-when-compile
  (defvar display-time-string-forms))
(setopt display-time-string-forms
	    '((format "%04d/%02d/%02d(%s) %02d:%02d"
				  (string-to-number year)
				  (string-to-number month)
				  (string-to-number day)
				  dayname
				  (string-to-number 24-hours)
				  (string-to-number minutes))))
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

(setq-default tab-width 4)
(setq tab-stop-list
      '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; misc packages
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

;;; 00-init.el ends here
