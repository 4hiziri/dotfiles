;;; 20-markdown.el --- markdown                      -*- lexical-binding: t; -*-

;; Copyright (C) 2017  tkgsy

;; Author: tkgsy <tkgsy@GoldenBat>
;; Keywords:

(use-package w3m)
(use-package markdown-mode
  :defer t)

(define-key markdown-mode-map "\C-c\C-cm"
    (lambda ()
      (interactive)
      (w3m-find-file (buffer-file-name))))

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

