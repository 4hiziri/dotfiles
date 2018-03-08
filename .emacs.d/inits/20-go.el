;; Goのパスを通す
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin/"))

;; go get で入れたツールのパスを通す
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
			    (setq indent-tabs-mode nil)
			    (setq tab-width 4)))
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump) ;; TODO: overwritten, change or delete
  ;; bigger popup window
  (setq company-tooltip-limit 20)
  ;; decrease delay before autocompletion popup shows
  (setq company-idle-delay .3)
  ;; remove annoying blinking
  (setq company-echo-delay 0)
  ;; start autocompletion only after typing
  (setq company-begin-commands '(self-insert-command)))