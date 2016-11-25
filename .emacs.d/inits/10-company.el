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
  (bind-key "M-." 'company-show-location company-active-map)
  (defun company--insert-candidate2 (candidate)
    (when (> (length candidate) 0)
      (setq candidate (substring-no-properties candidate))
      (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
	  (insert (company-strip-prefix candidate))
	(if (equal company-prefix candidate)
	    (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
	  (insert candidate))
	)))

  (defun company-complete-common2 ()
    (interactive)
    (when (company-manual-begin)
      (if (and (not (cdr company-candidates))
	       (equal company-common (car company-candidates)))
	  (company-complete-selection)
	(company--insert-candidate2 company-common))))

  (define-key company-active-map [tab] 'company-complete-common2))
