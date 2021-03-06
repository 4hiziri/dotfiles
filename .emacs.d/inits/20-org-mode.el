;;見出し作成
(use-package org
  :defer t
  :config
  (defun org-insert-upheading (arg)
    (interactive "P")
    (org-insert-heading arg)
    (cond ((org-on-heading-p) (org-do-promote))
	  ((org-at-item-p) (org-indent-item -1))))
  (defun org-insert-heading-dwim (arg)
    (interactive "p")
    (case arg
      (4 (org-insert-subheading nil))
      (16 (org-insert-upheading nil))
      (t (org-insert-heading nil))))
  (bind-key [M-return] 'org-insert-heading-dwim org-mode-map))
