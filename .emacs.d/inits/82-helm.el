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
  (helm-migemo-mode 1)
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
  (dind-key "C-:" 'helm-company company-mode-map)
  (dind-key "C-:" 'helm-company company-active-map))

;;helm-descbinds
(use-package helm-descbinds
  :defer t
  :config
  (helm-descbinds-mode))

;;the silver searcher
(use-package helm-ag
  :defer t)

(use-package helm-migemo
  :defer t
  :config
  ;;; この修正が必要
  (with-eval-after-load "helm-migemo"
    (defun helm-compile-source--candidates-in-buffer (source)
      (helm-aif (assoc 'candidates-in-buffer source)
	  (append source
		  `((candidates
		     . ,(or (cdr it)
			    (lambda ()
			      ;; Do not use `source' because other plugins
			      ;; (such as helm-migemo) may change it
			      (helm-candidates-in-buffer (helm-get-current-source)))))
		    (volatile) (match identity)))
	source))
    ;; [2015-09-06 Sun]helm-match-plugin -> helm-multi-match変更の煽りを受けて
    (defalias 'helm-mp-3-get-patterns 'helm-mm-3-get-patterns)
    (defalias 'helm-mp-3-search-base 'helm-mm-3-search-base)))
