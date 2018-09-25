;; Goのパスを通す
(add-to-list 'exec-path (cl-concatenate 'string
					   (string-trim-right
					    (shell-command-to-string "go env GOROOT"))
					   "/bin"))
(add-to-list 'exec-path (expand-file-name "/home/tkgsy/.go/bin"))

;; 必要なパッケージのロード
(use-package company-go
  :defer t
  :init 
  (add-hook 'go-mode-hook 'company-mode)
  (add-hook 'go-mode-hook 'flycheck-mode)
  (add-hook 'go-mode-hook (lambda ()
			    (set (make-local-variable 'company-backends) '(company-go))
			    (company-mode))))

(use-package go-mode
  :defer t
  :init
  (add-hook 'go-mode-hook (lambda ()
			    ;; FIXME: need this?
			    (setq indent-tabs-mode t)
			    (setq tab-width 4)
			    (smartparens-mode)
			    (add-hook 'before-save-hook 'gofmt-before-save)))
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump) ;; TODO: overwritten, change or delete
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c i") 'go-goto-imports)
  (local-set-key (kbd "C-c d") 'godoc)
  ;; bigger popup window
  (setq company-tooltip-limit 20)
  ;; decrease delay before autocompletion popup shows
  (setq company-idle-delay 0.3)
  ;; remove annoying blinking
  (setq company-echo-delay 0)
  ;; start autocompletion only after typing
  (setq company-begin-commands '(self-insert-command)))
