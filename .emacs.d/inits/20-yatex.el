;;; YaTeX

;;; Code:

;; yatex-mode の起動
(use-package yatex
  :mode ("\\.tex$" . yatex-mode)
  :init
  (setq YaTeX-kanji-code nil))

;; 文章作成時の日本語文字コード
;; 0: no-converion
;; 1: Shift JIS (windows & dos default)
;; 2: ISO-2022-JP (other default)
;; 3: EUC
;; 4: UTF-8
