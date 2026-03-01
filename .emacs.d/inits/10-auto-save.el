;;; 10-auto-save -- buffer auto-save
;;; Commentary:

;;; Code:
(use-package auto-save-buffers-enhanced
  :demand t
  ;; なぜか:customだと変数の値がうまく反映されないのでinitで設定
  :init
  (setq auto-save-buffers-enhanced-include-regexps '(".+"))
  ;; not-saveと.ignoreは除外する
  (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save" "\\.ignore$"))
  ;; Wroteのメッセージを抑制
  (setq auto-save-buffers-enhanced-quiet-save-p t)
  (setq auto-save-buffers-enhanced-interval 10)
  :config
  (auto-save-buffers-enhanced t))

;;; 10-auto-save.el ends here
