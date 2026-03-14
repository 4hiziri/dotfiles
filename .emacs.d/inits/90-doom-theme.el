(use-package doom-themes
  :demand t
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :custom-face
  (doom-modeline-bar ((t (:background "#6272a4"))))
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(use-package battery
  :ensure nil
  :config
  (setq battery-status-function 'battery-linux-sysfs))

;; first-time, run nerd-icons-install-fonts
(use-package doom-modeline
  :custom
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-eicon t)
  (doom-modeline-minor-modes t)
  (line-number-mode 1)
  (column-number-mode 1)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-lsp-icon t)
  (doom-modeline-time-icon t)
  (doom-modeline-time-live-icon t)
  (doom-modeline-time-analogue-clock t)
  (doom-modeline-time t)
  (doom-modeline-position-line-format '("L%l"))
  (doom-modeline-position-column-format '("C%c"))
  (doom-modeline-position-column-line-format '("%l:%c"))
  (doom-modeline-buffer-encoding t)
  (doom-modeline-battery t)
  (doom-modeline-remote-host t)
  (doom-modeline-env-enable-python t)
  (doom-modeline-env-enable-ruby t)
  (doom-modeline-env-enable-perl t)
  (doom-modeline-env-enable-go t)
  (doom-modeline-env-enable-elixir t)
  (doom-modeline-env-enable-rust t)
  (doom-modeline-env-python-executable "python")
  (doom-modeline-env-ruby-executable "ruby")
  (doom-modeline-env-perl-executable "perl")
  (doom-modeline-env-go-executable "go")
  (doom-modeline-env-elixir-executable "iex")
  (doom-modeline-env-rust-executable "rustc")
  :hook
  (elpaca-after-init . doom-modeline-mode)
  (doom-modeline-mode . main)
  :config
  ;; parrot-mode保留、true/false、on/offなどのトグルができるモード
  ;; compilation保留、バックグラウンドでのテストやビルドの状態を表示
  (doom-modeline-def-modeline 'main
	'(bar workspace-name window-number matches buffer-info remote-host buffer-position selection-info buffer-encoding misc-info)
	'(time misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs battery)))
