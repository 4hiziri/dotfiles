;;; 20-markdown.el --- markdown
;;; Commentary:

;;; Code:

(use-package markdown-ts-mode
  :mode ("\\.md\\'" . markdown-ts-mode)
  :bind (:map markdown-ts-mode-map
			  ("C-c C-c m" . (lambda ()
							   (interactive)
							   (w3m-find-file (buffer-file-name)))))
  :custom
  (markdown-fontify-code-blocks-natively t))

;;; 20-markdown.el ends here
