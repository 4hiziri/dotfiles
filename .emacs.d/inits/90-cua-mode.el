;; problem on linux
;; override C-y

(use-package cua-mode
  :bind (("C-x SPC" . cua-set-rectangle-mark))
  :init
  (cua-mode t)
  ;; デフォルトキーバインドを無効化
  (setq cua-enable-cua-keys nil))
