;;; 10-autoinsert.el --- config
;;; Commentary:
;; obsolete

;;; Code:

(use-package autoinsert
  :defer t  
  :init
  (setq  auto-insert-directory "~/.emacs.d/template/" )
  (add-hook 'find-file-hooks 'auto-insert)
  :config
  (setq auto-insert-alist
		(append '(("\\.tex" . "template.tex")
				  auto-insert-alist))))

;;; 10-autoinsert.el ends here
