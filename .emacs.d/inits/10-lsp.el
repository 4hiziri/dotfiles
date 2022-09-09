;;; lsp --- lsp config
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands lsp
  :ensure t)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package company-lsp
  :commands company-lsp)

;;; 10-lsp.el ends here
