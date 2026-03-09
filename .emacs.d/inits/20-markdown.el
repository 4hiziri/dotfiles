;;; 20-markdown.el --- markdown
;;; Commentary:

;;; Code:

;; treesitは機能が貧弱なので使わない
(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode)
  :bind (:map markdown-mode-map
			  ("C-c C-c m" . (lambda ()
							   (interactive)
							   (w3m-find-file (buffer-file-name)))))
  :hook (markdown-mode-hook tree-sitter-hl-mode)
  :custom
  (markdown-fontify-code-blocks-natively t))

;;; 20-markdown.el ends here
