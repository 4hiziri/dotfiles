;;; init.el --- emacs init
;;; Commentary:
;;; init.el
;;; Code:

;; for elpaca
(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                  :ref nil :depth 1 :inherit ignore
                  :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                  :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
    (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
          ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                          ,@(when-let* ((depth (plist-get order :depth)))
                              (list (format "--depth=%d" depth) "--no-single-branch"))
                          ,(plist-get order :repo) ,repo))))
          ((zerop (call-process "git" nil buffer t "checkout"
                    (or (plist-get order :ref) "--"))))
          (emacs (concat invocation-directory invocation-name))
          ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                    "--eval" "(byte-recompile-directory \".\" 0 'force)")))
          ((require 'elpaca))
          ((elpaca-generate-autoloads "elpaca" repo)))
        (progn (message "%s" (buffer-string)) (kill-buffer buffer))
      (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Install elpaca use-package support
(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setopt use-package-always-ensure t)) ;; これで常に:ensure tになる
;; (setq elpaca-use-package-integrate-config t)
(setq use-package-verbose t)
(elpaca-wait)

;; M-x edit kill emacs server
(defalias 'exit 'save-buffers-kill-emacs)

;; load-path を追加する関数を定義
(defun add-to-load-path (paths)
  "LOAD-PATHにPATHSを追加する."
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
                                  "elpaca"
                                  "conf"
                                  "public_repos"
                                  ".cask"))

;; 初期設定ロード
(use-package init-loader
  :ensure (:wait t))
(init-loader-load "~/.emacs.d/inits/") ; :configに書くとqueueに二重登録されてロードが重複するので注意

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file :no-error-if-file-is-missing)

(setq-default bidi-display-reordering nil) ;; 右から左へ読む処理を無効化
(setq-default require-final-newline t) ;; 末尾改行を強制
(global-auto-revert-mode +1) ;; 変更をバッファに反映

(defun conflict-check (set1 set2)
  (let ((same (intersection set1 set2)))
    (if (> (length set1) (length set2))
    (set-difference set1 same)
      (set-difference set2 same))))

(put 'erase-buffer 'disabled nil)
(put 'set-goal-column 'disabled nil)

(use-package exec-path-from-shell)

(save-place-mode 1)
(which-function-mode 1)
(global-whitespace-mode 1)
(setopt whitespace-style (remq 'lines whitespace-style))
(setopt whitespace-action '(auto-cleanup))

(provide 'init)
;;; init.el ends here
