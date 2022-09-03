;;; yatemplate ---- template?
;;; Commentary:
;; TODO: usage
;;; Code:

(use-package yatemplate
  :config
  (yatemplate-fill-alist)
  (auto-insert-mode 1)
  (defun find-file-hook--yatemplate ()
    "yatemplateのsnippetのテストができるようにするためにsnippet-modeにする"
    (when (string-match "emacs.*/templates/" buffer-file-name)
      (let ((mode major-mode))
	(snippet-mode)
	(setq-local yas--guessed-modes (list mode)))))
  (add-hook 'find-file-hook 'find-file-hook--yatemplate)
  (defun after-save-hook--yatemplate ()
    "yatemplateファイル保存後、auto-insert-alistに反映させる"
    (when (string-match "emacs.*/templates/" buffer-file-name)
      (yatemplate-fill-alist)))
  (add-hook 'after-save-hook 'after-save-hook--yatemplate))

;;; 81-yatemplate.el ends here
