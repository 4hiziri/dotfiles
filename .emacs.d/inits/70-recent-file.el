;;; recentf --- recentf conf
;;; Commentary:
;;; Code:

(use-package recentf
  :ensure nil
  :custom
  (recentf-max-saved-items 50) ; 記録するファイルの数
  (recentf-exclude '(".recentf", "^/.ssh:"))
  (recentf-auto-cleanup 'never)
  :init
  (recentf-mode 1))

;;recentfile
(use-package recentf-ext
  :bind
  (("M-f" . recentf-open-files))
  :config
  (setopt recentf-max-menu-items 500))

;; Persist history over Emacs restarts
(savehist-mode 1)

;;; 70-recent-file.el ends here
