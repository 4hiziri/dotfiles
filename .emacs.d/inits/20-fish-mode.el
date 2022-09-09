;;; fish-mode --- fish-mode conf
;;; Commentary:
;;; Code:

(use-package fish-mode
  :disabled t
  :defer t
  :init
  (add-hook 'fish-mode-hook
			(lambda ()
			  (add-hook 'before-save-hook 'fish_indent-before-save))))

;;; 20-fish-mode.el ends here
