(use-package flymake
  :ensure nil
  :hook (prog-mode-hook . flymake-mode)
  :custom
  (flymake-show-diagnostics-at-end-of-line t)
  :bind (:map flymake-mode-map
              ("C-c ! n" . flymake-goto-next-error)
              ("C-c ! p" . flymake-goto-previous-error)))
