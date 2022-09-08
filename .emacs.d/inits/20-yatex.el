;;; YaTeX --- TeX mode
;;; Commentary:

;;; Code:

;; yatex-mode の起動
(use-package yatex
  :disabled t
  :mode ("\\.tex$" . yatex-mode)
  :init
  (setq YaTeX-kanji-code nil))

;; 文章作成時の日本語文字コード
;; 0: no-converion
;; 1: Shift JIS (windows & dos default)
;; 2: ISO-2022-JP (other default)
;; 3: EUC
;; 4: UTF-8

;;; 20-yatex.el ends here
