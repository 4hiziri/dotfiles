(use-package orderless
    :init
    (setq completion-styles '(orderless basic)
          completion-category-defaults nil
          completion-category-overrides nil)
    :custom
    ;; Configure a custom style dispatcher (see the Consult wiki)
    ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
    ;; (orderless-component-separator #'orderless-escapable-split-on-space)
    (completion-styles '(orderless basic))
    (completion-category-overrides '((file (styles partial-completion))))
    (completion-category-defaults nil) ;; Disable defaults, use our settings
    (completion-pcm-leading-wildcard t)
    :config
    ;; migemoでローマ字検索を有効にする
    (with-eval-after-load 'migemo
      (defun orderless-migemo (component)
        (let ((pattern (downcase (migemo-get-pattern component))))
          (condition-case nil
              (progn (string-match-p pattern "") pattern)
            (invalid-regexp nil))))
      (add-to-list 'orderless-matching-styles 'orderless-migemo))

    ;; corfuはorderless-flexで絞り込む
    (with-eval-after-load 'corfu
      (add-hook 'corfu-mode-hook
                (lambda ()
                  (setq-local orderless-matching-styles '(orderless-flex))))))
