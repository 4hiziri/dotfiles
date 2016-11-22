(use-package company
  :defer t
  :init
  (global-company-mode)
  :config    
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (bind-key "C-n" 'company-select-next company-active-map)
  (bind-key "C-p" 'company-select-previous company-active-map)
  (bind-key "C-d" 'company-show-doc-buffer company-active-map)
  (bind-key "M-." 'company-show-location company-active-map))
