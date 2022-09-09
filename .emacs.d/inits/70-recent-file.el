;;; recentf --- recentf conf
;;; Commentary:
;; FIXME: void 821c
;;; Code:

;;recentfile
(use-package recentf-ext
  :bind (("M-f" . recentf-open-files))
  :config
  (setq recentf-max-menu-items 500))

;;; 70-recent-file.el ends here
