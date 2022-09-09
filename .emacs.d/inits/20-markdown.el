;;; 20-markdown.el --- markdown
;;; Commentary:

;;; Code:

(use-package w3m
  :defer t)

(use-package w3m)
(use-package markdown-mode)

(define-key markdown-mode-map "\C-c\C-cm"
    (lambda ()
      (interactive)
      (w3m-find-file (buffer-file-name))))

(setq markdown-fontify-code-blocks-natively t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
=======
(use-package markdown-mode
  :defer t
  :mode ("\\.md\\'" . markdown-mode)
  :bind (:map markdown-mode-map
			  ("C-c C-c m" . (lambda ()
							   (interactive)
							   (w3m-find-file (buffer-file-name))))))
>>>>>>> 522423c1abf1ae16ec440f1d424db5b7f70e9b5e

;;; 20-markdown.el ends here
