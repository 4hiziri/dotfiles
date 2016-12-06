;; 次の入力項目に飛ぶには、TAB
(define-key global-map (kbd "C-x i") nil)
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :bind (:map yas-minor-mode-map
              ("C-x i i" . yas-insert-snippet) ;; 既存スニペットを挿入する
              ("C-x i n" . yas-new-snippet) ;; 新規スニペットを作成するバッファを用意する
              ("C-x i v" . yas-visit-snippet-file) ;; 既存スニペットを閲覧・編集する
              ("C-x i l" . yas-describe-tables)
              ("C-x i g" . yas-reload-all))
  :config
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"))
  (yas-global-mode 1)
  (setq yas-prompt-functions '(yas-ido-prompt)))

