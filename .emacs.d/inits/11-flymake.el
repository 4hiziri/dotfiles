(use-package flymake
  :ensure nil
  :hook prog-mode
  :custom
  (flymake-diagnostic-functions '(eglot-flymake-backend))
  (flymake-no-changes-timeout 0.3) ; 入力停止後0.3秒
  (flymake-start-on-save-buffer t)
  (flymake-fringe-indicator-position nil)
  (flymake-suppress-zero-counters t)
  (flymake-show-diagnostics-at-end-of-line t)
  :bind (:map flymake-mode-map
              ("M-n" . flymake-goto-next-error)
              ("M-p" . flymake-goto-previous-error)))
