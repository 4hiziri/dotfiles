;; ctags.elの設定
(use-package ctag
  :defer t
  :bind (("<f5>" . ctags-create-or-update-tags-table))
  :config
  (setq tags-revert-without-query t)
  (setq ctags-command "ctags -e -R "))
