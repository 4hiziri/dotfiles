(use-package consult
  :bind
  ;; Helm のキーバインドに近い操作感にするための割り当て例
  (("C-x b" . consult-buffer)       ; helm-mini の代わり
   ("M-y"   . consult-yank-pop)     ; helm-show-kill-ring の代わり
   ("M-s"   . consult-line)         ; helm-swoop の代わり (C-s から呼ぶ人も多い)
   ("C-x r b" . consult-bookmark)   ; ブックマーク
   ("M-g g" . consult-goto-line)    ; 指定行へジャンプ
   ("M-g i" . consult-imenu))       ; helm-imenu の代わり

  :init

  :custom
  ;; デフォルトでプレビュー有効はなんだかんだ重いので、
  ;; プレビューはデフォルト無効化。
  ;; (consult-preview-key 'any)
  (consult-preview-key nil)
  ;; プレビュー機能は M-. にバインド。
  (consult-preview-key "M-."))
