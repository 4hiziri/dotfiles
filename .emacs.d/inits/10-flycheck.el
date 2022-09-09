;;; 10-flycheck.el --- syntax checker
;;; Commentary:
;;; Code:

(use-package flycheck
  :defer t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

;;; 10-flycheck.el ends here
