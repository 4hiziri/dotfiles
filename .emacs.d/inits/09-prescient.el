(use-package prescient
  :custom
  (completion-styles '(prescient))
  (completion-category-defaults nil)
  (completion-category-overrides nil)
  (prescient-aggressive-file-save 1)
  :config
  (with-eval-after-load 'migemo
    (defun my/prescient-regexp-regexp-advice (orig-fun query &rest args)
      "Advice function to replace QUERY with (migemo-get-pattern query)."
      (let ((migemo-query (migemo-get-pattern query)))
        (apply orig-fun migemo-query args)))
    (advice-add 'prescient-regexp-regexp :around #'my/prescient-regexp-regexp-advice))
  (prescient-persist-mode 1))
