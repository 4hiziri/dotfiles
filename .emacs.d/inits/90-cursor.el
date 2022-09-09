;;; cursor --- cursor
;;; Commentary:
;; TODO: research
;;; Code:

(use-package point-undo
  :bind (("<f7>" . point-undo)
		 ("C-<f7>" . point-redo)))

(use-package goto-chg
  :bind (("<f8>" . goto-last-change)
		 ("C-<f8>" . goto-last-change-reverse)))

;;; 90-cursor.el ends here
