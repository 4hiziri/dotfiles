(use-package doom-themes
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :custom-face
  (doom-modeline-bar ((t (:background "#6272a4"))))
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :custom
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-eicon nil)
  (doom-modeline-minor-modes nil)
  :hook
  (elpaca-after-init-hook . doom-modeline-mode)
  (doom-modeline-mode-hook . main)
  :config
  (line-number-mode 0)
  (column-number-mode 0)
  (doom-modeline-def-modeline 'main
    ;; workspace-number is not defined
	                          '(bar workspace-name window-number matches buffer-info remote-host buffer-position parrot selection-info)
	                          '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs)))
