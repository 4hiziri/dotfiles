;;; 20-markdown.el --- markdown
;;; Commentary:

;;; Code:

(use-package w3m
  :defer t)

(use-package markdown-mode
  :defer t
  :mode ("\\.md\\'" . markdown-mode)
  :bind (:map markdown-mode-map
			  ("C-c C-c m" . (lambda ()
							   (interactive)
							   (w3m-find-file (buffer-file-name)))))
  :config
  (setq markdown-fontify-code-blocks-natively t))

;;; 20-markdown.el ends here
