;;; 10-autoinsert.el --- config
;;; Commentary:
;; tempelへ以降

;;; Code:

(use-package autoinsert
  :ensure nil
  :init
  (setopt  auto-insert-directory "~/.emacs.d/template/" )
  :hook
  (find-file-hooks . auto-insert)
  :config
  (setq auto-insert-alist
		(append '(("\\.tex" . "template.tex")
				  auto-insert-alist))))

;;; 10-autoinsert.el ends here
