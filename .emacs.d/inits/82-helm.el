;;helm
(use-package helm
  :defer t
  :init
  (bind-key "C-c C-y" 'helm-show-kill-ring)
  (bind-key "C-x C-b" 'helm-for-files)
  (bind-key "M-x" 'helm-M-x)
  (bind-key "M-f" 'helm-recentf)
  (bind-key "M-y" 'helm-show-kill-ring)
  (bind-key "C-c i" 'helm-imenu)
  (bind-key "C-x b" 'helm-buffers-list)
  (bind-key "C-x C-f" 'helm-find-files)
  (bind-key "C-c C-b" 'helm-descbinds global-map)
  (bind-key "C-c C-s" 'helm-do-ag global-map)
  :config
  (helm-mode 1)
;  (helm-migemo-mode 1)
  ;;emulate kill-line in mini-helm
  ;; Emulate `kill-line' in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))
  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only if CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))
  (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
    "Transform the pattern to reflect my intention"
    (let* ((pattern (ad-get-arg 0))
	   (input-pattern (file-name-nondirectory pattern))
	   (dirname (file-name-directory pattern)))
      (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
      (setq ad-return-value
	    (concat dirname
		    (if (string-match "^\\^" input-pattern)
			;; '^' is a pattern for basename
			;; and not required because the directory name is prepended
			(substring input-pattern 1)
		      (concat ".*" input-pattern))))))
  (bind-key "TAB" 'helm-execute-persistent-action helm-find-files-map)
  (bind-key "TAB" 'helm-execute-persistent-action helm-read-file-map))

;;helm-auto-complete
;; (use-package ac-helm
;;   :defer t
;;   :init
;;   (bind-key "C-c ;" 'ac-complete-with-helm)
;;   
;;   :config
;;   (bind-key "C-c ;" 'ac-complete-with-helm ac-complete-mode-map))

(use-package helm-company
  :defer t
  :init
  ;; :TODO
  (bind-key "C-:" 'helm-company company-mode-map)
  (bind-key "C-:" 'helm-company company-active-map))

;;helm-descbinds
(use-package helm-descbinds
  :defer t
  :config
  (helm-descbinds-mode))

;;the silver searcher
(use-package helm-ag
  :defer t
  :bind (("C-c g" . helm-ag)
	 ("C-c k" . backward-kill-sexp))
  :config
  ;;; ag以外の検索コマンドも使える
  ;; (setq helm-ag-base-command "grep -rin")
  ;; (setq helm-ag-base-command "csearch -n")
  ;; (setq helm-ag-base-command "pt --nocolor --nogroup")
  ;; (setq helm-ag-base-command "rg --vimgrep --no-heading")
  ;; 現在のシンボルをデフォルトのクエリにする
  (setq helm-ag-insert-at-point 'symbol)

  (defun helm-ag-dot-emacs ()
    ".emacs.d以下を検索"
    (interactive)
    (helm-ag "~/.emacs.d/")))
