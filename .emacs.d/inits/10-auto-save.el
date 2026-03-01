;;; 10-auto-save -- buffer auto-save
;;; Commentary:

;;; Code:
(use-package auto-save-buffers-enhanced
  :demand t
  :custom
  ;; auto save target buffer rule
  (auto-save-buffers-enhanced-include-regexps '(".+"))
  ;; not-saveと.ignoreは除外する
  (auto-save-buffers-enhanced-exclude-regexps '("^not-save" "\\.ignore$"))
  ;; Wroteのメッセージを抑制
  (auto-save-buffers-enhanced-quiet-save-p t)
  (auto-save-buffers-enhanced-interval 600)
  :config
  (auto-save-buffers-enhanced t))

;;; 10-auto-save.el ends here
