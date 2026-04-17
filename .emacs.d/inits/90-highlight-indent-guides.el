(use-package highlight-indent-guides
  :demand t
  :custom
  (highlight-indent-guides-method 'column)
  (highlight-indent-guides-responsive "stack")
  :init
  (setq highlight-indent-guides-mode t))
