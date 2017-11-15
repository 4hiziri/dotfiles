;; ;; ctags.elの設定
;; (use-package ctag
;;   :defer t
;;   :init
;;   (setq tags-revert-without-query t)
;;   (setq ctags-command "ctags -R -e --fields=\"+afikKlmnsSzt\" ")
;;   :bind (("<f5>" . ctags-create-or-update-tags-table)
;; 	 ("M-." . ctags-search))
;;   :config
;;   )
