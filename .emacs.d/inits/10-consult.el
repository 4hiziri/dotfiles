(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :bind
  ("C-x b" . consult-buffer)
  ("M-y"   . consult-yank-pop)     ; キルリングの履歴を出してくれる
  ("C-s"   . consult-line)         ; consultの賢いサーチ
  ("M-g o" . consult-outline)
  ("C-M-s" . nil)                  ; C-M-sをプレフィックスとして使うので外す
  ("C-M-s s" . isearch-forward)    ; これまでのisearch
  ("C-M-s C-s" . isearch-forward-regexp) ; regex
  ("C-M-s r" . consult-ripgrep)
  ("C-x r b" . consult-bookmark)   ; ブックマーク
  ("M-g g" . consult-goto-line)    ; 指定行へジャンプ
  ("M-g i" . consult-imenu)        ; imenu、今は空 :TODO あとで調べる
  ("C-x p b" . consult-project-buffer) ; C-x p b
  ("M-g f" . consult-flymake)
  (:map minibuffer-local-map
        :package emacs
        ("C-r" . consult-history))

  :custom
  (consult-preview-key 'any) ;; :TODO あとで適切なものだけプレビューするように設定
  ;; プレビュー機能をM-.にバインド
  ;; (consult-preview-key "M-.")
  (xref-show-xrefs-function  #'consult-xref)
  (xref-show-definitions-function  #'consult-xref)
  (consult-line-start-from-top t))

(use-package consult-flymake
  :ensure nil
  :after (consult flymake))
