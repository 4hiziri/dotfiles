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
(use-package init-loader
	     :config
	     (init-loader-load "~/.emacs.d/inits"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(irony-additional-clang-options (quote ("-std=c++11")))
 '(package-selected-packages
   (quote
    (cargo toml-mode ac-cider ac-helm ac-skk ac-slime ag auto-install
	   auto-save-buffers-enhanced bind-key clojure-test-mode ctags emacs-cl fold-dwim
	   helm-ag helm-descbinds helm-migemo hideshowvis ido-migemo init-loader
	   markdown-mode paredit python-mode quickrun rainbow-delimiters scala-mode
	   slamhound sml-mode swift-mode undo-tree wgrep yatex flymake-cursor
	   flymake-python-pyflakes elpy rust-mode py-autopep8 pyenv-mode py-yapf flycheck
	   smartrep auto-async-byte-compile color-moccur egg egg-grep sequential-command
	   clj-refactor ctags-update company-jedi slime-company helm-company yasnippet
	   with-editor projectile ivy helm-core helm git-commit drag-stuff dash hl-line+
	   bison-mode ace-isearch wgrep-helm wgrep-ag solarized-theme zenburn-theme
	   hc-zenburn-theme flycheck-rust flycheck-scala-sbt google-translate
	   company-racer racer yatemplate sticky smartparens helm-bind-key
	   helm-c-yasnippet fish-mode simpleclip xclip web-mode slime sbt-mode s
	   package-build nyan-mode magit-popup magit ensime diminish company cider async
	   company-irony flycheck-irony hl-todo w3m lua-mode restclient request)
    <<<<<<< HEAD
    (request restclient lua-mode w3m hl-todo flycheck-irony company-irony async cider company diminish ensime magit magit-popup nyan-mode package-build s sbt-mode slime web-mode xclip simpleclip fish-mode helm-c-yasnippet helm-bind-key smartparens sticky yatemplate racer company-racer google-translate flycheck-scala-sbt flycheck-rust hc-zenburn-theme zenburn-theme solarized-theme wgrep-ag wgrep-helm ace-isearch bison-mode hl-line+ dash drag-stuff git-commit helm helm-core ivy projectile with-editor yasnippet helm-company slime-company company-jedi ctags-update clj-refactor sequential-command egg-grep egg color-moccur auto-async-byte-compile smartrep flycheck py-yapf pyenv-mode py-autopep8 rust-mode elpy flymake-python-pyflakes flymake-cursor yatex wgrep undo-tree swift-mode sml-mode slamhound scala-mode rainbow-delimiters quickrun python-mode paredit markdown-mode init-loader ido-migemo hideshowvis helm-migemo helm-descbinds helm-ag fold-dwim emacs-cl ctags clojure-test-mode bind-key auto-save-buffers-enhanced auto-install ag ac-slime ac-skk ac-helm ac-cider)))
=======
(toml-mode cargo request w3m hl-todo flycheck-irony company-irony async cider company diminish ensime magit magit-popup nyan-mode package-build s sbt-mode slime web-mode xclip simpleclip fish-mode helm-c-yasnippet helm-bind-key smartparens sticky yatemplate racer company-racer google-translate flycheck-scala-sbt flycheck-rust hc-zenburn-theme zenburn-theme solarized-theme wgrep-ag wgrep-helm ace-isearch bison-mode hl-line+ dash drag-stuff git-commit helm helm-core ivy projectile with-editor yasnippet helm-company slime-company company-jedi ctags-update clj-refactor sequential-command egg-grep egg color-moccur auto-async-byte-compile smartrep flycheck py-yapf pyenv-mode py-autopep8 rust-mode elpy flymake-python-pyflakes flymake-cursor yatex wgrep undo-tree swift-mode sml-mode slamhound scala-mode rainbow-delimiters quickrun python-mode paredit markdown-mode init-loader ido-migemo hideshowvis helm-migemo helm-descbinds helm-ag fold-dwim emacs-cl ctags clojure-test-mode bind-key auto-save-buffers-enhanced auto-install ag ac-slime ac-skk ac-helm ac-cider)))
>>>>>>> b4c1b6b6054bb9714112737c6760d886544082c1
 '(py-indent-offset 4)
 '(swift-repl-excutable "swift"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
