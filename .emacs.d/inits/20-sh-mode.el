;; :TODO 勝手にcompletion-at-point-functionsを設定するから直す
;; :TODO lspに対応させれば良さそう

(add-to-list 'major-mode-remap-alist
             '(sh-mode . bash-ts-mode))

;; (use-package sh-script
;;   :ensure nil
;;   :defer t
 
;;   )
