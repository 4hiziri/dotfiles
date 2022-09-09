;;; 10-auto-save -- buffer auto-save
;;; Commentary:

;;; Code:
(use-package auto-save-buffers-enhanced
  :config
  ;; auto save target buffer rule
  (setq auto-save-buffers-enhanced-include-regexps '(".+"))
  ;; not-saveと.ignoreは除外する
  (setq auto-save-buffers-enhanced-exclude-regexps '("^not-save" "\\.ignore$"))
  ;; Wroteのメッセージを抑制
  (setq auto-save-buffers-enhanced-quiet-save-p t)
  (auto-save-buffers-enhanced t)
  )

;;; 10-auto-save.el ends here
