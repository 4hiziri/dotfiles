;;; rainbow-delimiters --- color ()
;;; Commentary:
;;; Code:

(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 100))))

(use-package rainbow-delimiters
  :defer t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors))

;;; 10-rainbow-delimiters.el ends here
