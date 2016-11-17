;;; 10-auto-complete -- Summary
;;; Commentary:
;; P130-131 利用可能にする

;;; Code:
(use-package auto-complete-config
  :bind (("C-c ;" . ac-mode-mop))
  :config
  (ac-config-default)
  ;; auto-completeのポップアップメニューでC-n/C-pが使えるようにする
  (setq ac-use-menu-map t)
  (put 'pwd 'disabled t))
;;; 10-auto-complete.el ends here
