(use-package tabnine
  :defer nil
  :hook ((prog-mode . tabnine-mode)
         (text-mode . tabnine-mode)
         (kill-emacs . tabnine-kill-process))
  :bind (:map  tabnine-completion-map
	     ("TAB" . nil)
         ("<tab>" . nil))
  :init
  (tabnine-start-process)
  (global-tabnine-mode +1))

(use-package cape
  :hook (((prog-mode
           text-mode
           conf-mode
           eglot-managed-mode
           lsp-completion-mode) . my/set-super-capf))
  :config
  (setq cape-dabbrev-check-other-buffers nil)

  (defun my/set-super-capf (&optional arg)
    (setq-local completion-at-point-functions
                (list (cape-capf-noninterruptible
                       (cape-capf-buster
                        (cape-capf-properties
                         (cape-capf-super
                          (if arg
                              arg
                            (car completion-at-point-functions))
                          #'tempel-complete
                          #'tabnine-completion-at-point
                          #'cape-dabbrev
                          #'cape-file)
                         :sort t
                         :exclusive 'no))))))

  (add-to-list 'completion-at-point-functions #'tempel-complete)
  (add-to-list 'completion-at-point-functions #'tabnine-completion-at-point)
  (add-to-list 'completion-at-point-functions #'cape-file t)
  (add-to-list 'completion-at-point-functions #'cape-tex t)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev t)
  (add-to-list 'completion-at-point-functions #'cape-keyword t))
