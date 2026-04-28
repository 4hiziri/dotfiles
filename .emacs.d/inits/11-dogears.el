(use-package dogears
  :bind (:map global-map
              ("M-g d" . dogears-go)
              ("M-g M-b" . dogears-back)
              ("M-g M-f" . dogears-forward)
              ("M-g M-d" . dogears-list)
              ("M-g M-D" . dogears-sidebar))
  :custom
  (dogears-list '(seq-home seq-end))
  :init
  (dogears-mode 1))
