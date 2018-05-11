(global-set-key (kbd "C-x C-c") 'server-edit)
;; M-x edit kill emacs server
(defalias 'exit 'save-buffers-kill-emacs)

;; load-path を追加する関数を定義
(defun add-to-load-path (paths)
  "LOAD-PATHを追加する関数."
  (dolist (default-directory paths paths)
    (add-to-list 'load-path default-directory)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	(normal-top-level-add-subdirs-to-load-path))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
;; 存在するディレクトリに対してのみpathに追加
(defun path-if-exists (&rest paths)
  (let ((ret nil))
    (dolist (path paths ret)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(when (file-exists-p default-directory)
	  (push default-directory ret))))))

(add-to-load-path (path-if-exists "elisp"
				  "elpa"
				  "conf"
				  "public_repos"
				  ".cask"))

;;; P115-116 Emacs Lisp Package Archive（ELPA）──Emacs Lispパッケージマネージャ
;; package.elの設定
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives
	                    '("melpa" . "http://melpa.milkbox.net/packages/") t)
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))

;; use-package -- package util
(require 'use-package)
(require 'bind-key)

;;init-loader
(use-package init-loader)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default)))
 '(init-loader-show-log-after-init (quote error-only))
 '(irony-additional-clang-options (quote ("-std=c++11")))
 '(package-selected-packages
   (quote
    (ghub pyvenv arduino-mode ac-cider ac-helm ac-skk ace-isearch ace-jump-mode ag auto-async-byte-compile auto-install auto-save-buffers-enhanced avy cargo clojure-cheatsheet company-irony company-jedi company-racer ctags-update drag-stuff elpy ensime exec-path-from-shell expand-region fish-mode flycheck-cask flycheck-irony flycheck-rust google-translate helm-ag helm-company helm-descbinds helm-migemo helm-swoop hl-line+ hl-todo htmlize idle-highlight-mode init-loader jedi magit markdown-mode multiple-cursors nyan-mode pallet paredit point-undo popwin prodigy projectile py-autopep8 py-yapf quickrun rainbow-delimiters recentf-ext redo+ request sequential-command simpleclip slime-company smartparens smartrep smex summarye toml-mode undo-tree use-package w3m web-mode xclip yatemplate yatex zenburn-theme promise async-await yasnippet with-editor slime s rust-mode package-build magit-popup ivy irony helm-core helm git-commit dash company cider cask async php-mode tuareg flycheck-ocaml racer flycheck caml helm-w3m ggtags helm-gtags sbt-mode find-file-in-project f clojure-mode yaml-mode go-mode enh-ruby-mode inf-ruby rocket-chat ruby-electric auto-highlight-symbol point-pos)))
 '(rc-default-server "https://rc.net.itc.nagoya-u.ac.jp")
 '(rc-default-username "tkgsy"))

(init-loader-load "~/.emacs.d/inits")

(defun conflict-check (set1 set2)
  (let ((same (intersection set1 set2)))
    (if (> (length set1) (length set2))
	(set-difference set1 same)
      (set-difference set2 same))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'erase-buffer 'disabled nil)
(put 'set-goal-column 'disabled nil)
