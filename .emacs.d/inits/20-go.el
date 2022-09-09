;;; go-mode --- go-mode conf
;;; Commentary:

;; (defvar go-mode-map
;;   (let ((m (make-sparse-keymap)))
;;     (unless (boundp 'electric-indent-chars)
;;       (define-key m "}" #'go-mode-insert-and-indent)
;;       (define-key m ")" #'go-mode-insert-and-indent))
;;     (define-key m (kbd "C-c C-a") #'go-import-add)
;;     (define-key m (kbd "C-c C-j") #'godef-jump)
;;     (define-key m (kbd "C-x 4 C-c C-j") #'godef-jump-other-window)
;;     (define-key m (kbd "C-c C-d") #'godef-describe)
;;     (define-key m (kbd "C-c C-f") 'go-goto-map)
;;     m)
;;   "Keymap used by ‘go-mode’.")

;; TODO: test keybind

;;; Code:

;; Goのパスを通す
(when (file-exists-p (expand-file-name "$HOME/.go/bin"))
  (add-to-list 'exec-path
			   (cl-concatenate 'string
							   (string-trim-right
								(shell-command-to-string "go env GOROOT"))
							   "/bin")))


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
  :bind (:map go-mode-map
			  ("M-." . godef-jump)
			  ("C-c C-r" . go-remove-unused-import)
			  ("C-c i" . go-goto-imports)
			  ("C-c d" . godoc))
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  ;; (local-set-key (kbd "M-.") 'godef-jump) ;; TODO: overwritten, change or delete
  ;; (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  ;; (local-set-key (kbd "C-c i") 'go-goto-imports)
  ;; (local-set-key (kbd "C-c d") 'godoc)
  ;; bigger popup window
  (setq company-tooltip-limit 20)
  ;; decrease delay before autocompletion popup shows
  (setq company-idle-delay 0.3)
  ;; remove annoying blinking
  (setq company-echo-delay 0)
  ;; start autocompletion only after typing
  (setq company-begin-commands '(self-insert-command)))

;;; 20-go.el ends here
