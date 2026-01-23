   (use-package prescient
    :config
    (setq prescient-aggressive-file-save t)
    (prescient-persist-mode +1))

  (use-package corfu-prescient
    :after corfu
    :config
    (with-eval-after-load 'orderless
      (setq corfu-prescient-enable-filtering nil))
    (corfu-prescient-mode +1))
