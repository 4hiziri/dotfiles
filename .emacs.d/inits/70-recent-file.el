;;; recentf --- recentf conf
;;; Commentary:
;; FIXME: void 821c
;;; Code:

(use-package recentf
  :ensure nil
  :init
  (setopt recentf-max-saved-items 200) ; 記録するファイルの数
  (recentf-mode 1))

;;recentfile
(use-package recentf-ext
  :bind
  (("M-f" . recentf-open-files))
  :config
  (setopt recentf-max-menu-items 500))

;; Persist history over Emacs restarts
(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

;;; 70-recent-file.el ends here
