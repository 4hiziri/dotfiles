;;; 10-auto-async-byte-compile -- Summary
;;; Commentary:
;; https://qiita.com/hirocarma/items/358a919510689db2cdfa
;;; Code:
;;auto-async-byte-compile バイトコンパイル
(use-package auto-async-byte-compile
  :disabled t
  :config
  (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))

;;; 10-auto-async-byte-compile.el ends here
