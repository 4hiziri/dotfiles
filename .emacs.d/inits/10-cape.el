;; :TODO 調べる

(use-package cape
  ;; :hook ((prog-mode
  ;;         text-mode
  ;;         conf-mode
  ;;         eglot-managed-mode
  ;;         lsp-completion-mode) . my/set-super-capf)
  :custom
  (cape-dabbrev-check-other-buffers nil)
  :config
  (defun my/set-super-capf (&optional arg)
    (setq-local completion-at-point-functions
                (list (cape-capf-noninterruptible
                       (cape-capf-buster
                        (cape-capf-properties
                         (cape-capf-super
                          (if arg
                              arg
                            (car completion-at-point-functions))
                          ; #'tempel-expand
                          #'cape-dabbrev
                          #'cape-file)
                         :sort t
                         :exclusive 'no))))))

  ; (add-to-list 'completion-at-point-functions #'tempel-expand)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-tex)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-abbrev)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol))
