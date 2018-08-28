;;; 83-ace-isearch.el --- search                     -*- lexical-binding: t; -*-
;; Keywords: local, tools, files

(use-package avy
  :defer t)

(use-package ace-isearch 
  :config
  (global-ace-isearch-mode 1))
