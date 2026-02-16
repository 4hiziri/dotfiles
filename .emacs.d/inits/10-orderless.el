;; 補完候補の絞り込み

(use-package orderless
  :defer t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-styles '(orderless basic))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)
  (orderless-matching-styles '(orderless-literal orderless-prefixes orderless-regexp orderless-initialism))
  :config
  ;; migemoでローマ字検索を有効にする
  (defun orderless-migemo (component)
      (let ((pattern (downcase (migemo-get-pattern component))))
        (condition-case nil
            (progn (string-match-p pattern "") pattern)
          (invalid-regexp nil))))
  (add-to-list 'orderless-matching-styles 'orderless-migemo))
