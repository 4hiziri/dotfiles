;;; 10-auto-save -- buffer auto-save
;;; Commentary:

;;; Code:
;;auto-save
(use-package auto-save-buffers-enhanced
  :defer t
  :config
  ;; 特定のファイルのみ有効にする
  (setq auto-save-buffers-enhanced-include-regexps '(".+")) ;全ファイル
  ;; not-save-fileと.ignoreは除外する
  (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save-file" "\\.ignore$"))
  ;; Wroteのメッセージを抑制
  (setq auto-save-buffers-enhanced-quiet-save-p t)
  )

;;; 10-auto-save.el ends here
