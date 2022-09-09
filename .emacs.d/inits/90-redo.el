;;; redo+ --- expand redo
;;; Commentary
;; TODO: usage
;;; Code:

(use-package redo+
  :init
  (unbind-key "M-/")
  :bind (("M-/" . 'redo)))

;;; 90-redo.el ends here
