;;; puni
;;; Commentary:
;; :TODO usage
;; :TODO めっちゃ誤爆するのでキーバインド変える
;;; Code:

(use-package puni
  :demand t
  :init
  (puni-global-mode)
  (defun my/puni-forward-delete-char (arg)
    (interactive "p")
    (dotimes (_ arg)
      (puni-forward-delete-char)))
  (defun my/puni-backward-delete-char (arg)
    (interactive "p")
    (dotimes (_ arg)
      (puni-backward-delete-char)))
  :bind (:map puni-mode-map
              ("C-c r" . puni-slurp-forward)
              ("C-c l" . puni-barf-forward)
              ("M-(" . puni-wrap-round)
              ("M-s" . puni-splice)
              ("M-r" . puni-raise)
              ("M-U" . puni-splice-killing-backward)
              ("M-z" . puni-squeeze)
              ("C-d" . my/puni-forward-delete-char)
              ("C-h" . my/puni-backward-delete-char)
              ;; 括弧の対応を崩す削除をC-cに移す
              ("C-c h" . delete-backward-char)
              ("C-c d" . delete-char))
  :config
  (use-package elec-pair
    :ensure nil
    :init
    (electric-pair-mode)))

;;; 80-puni.el ends here
