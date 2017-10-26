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
 '(init-loader-show-log-after-init 'error-only))
(init-loader-load "~/.emacs.d/inits")


(defun conflict-check (set1 set2)
  (let ((same (intersection set1 set2)))
    (if (> (length set1) (length set2))
	(set-difference set1 same)
      (set-difference set2 same))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(irony-additional-clang-options (quote ("-std=c++11")))
 '(package-selected-packages
   (quote
    (rocket-chat caml flycheck racer flycheck-ocaml tuareg php-mode async cask cider company dash git-commit helm helm-core irony ivy magit-popup package-build rust-mode s slime with-editor yasnippet async-await promise zenburn-theme yatex yatemplate xclip web-mode w3m use-package undo-tree toml-mode summarye smex smartrep smartparens slime-company simpleclip sequential-command request redo+ recentf-ext rainbow-delimiters quickrun py-yapf py-autopep8 projectile prodigy popwin point-undo paredit pallet nyan-mode multiple-cursors markdown-mode magit jedi init-loader idle-highlight-mode htmlize hl-todo hl-line+ helm-swoop helm-migemo helm-descbinds helm-company helm-ag google-translate flycheck-rust flycheck-irony flycheck-cask fish-mode expand-region exec-path-from-shell ensime elpy drag-stuff ctags-update company-racer company-jedi company-irony clojure-cheatsheet cargo avy auto-save-buffers-enhanced auto-install auto-async-byte-compile ag ace-jump-mode ace-isearch ac-skk ac-helm ac-cider)))
 '(rc-default-server "https://rc.net.itc.nagoya-u.ac.jp")
 '(rc-default-username "tkgsy"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
(put 'erase-buffer 'disabled nil)
