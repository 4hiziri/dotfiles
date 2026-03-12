;;; 02-input.el --- Summary
;;; Commentary:
;; setting for input method
;; now, adopt skk

;;; Code:
;; 日本語の設定
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setopt buffer-file-coding-system 'utf-8)
(setopt buffer-file-coding-system 'utf-8)
(setopt default-process-coding-system '(utf-8 . utf-8))
(setopt file-name-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default indent-tabs-mode nil) ; tab -> spaces
(setq-default show-trailing-whitespace t) ; highlight space at line end

;; clip board, paste
(setq select-enable-clipboard t)

;; ansi-color
(use-package ansi-color
  :ensure nil
  :commands (ansi-color-for-comint-mode-on))

;;; 02-input.el ends here
