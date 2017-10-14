;; point-undoの設定
(use-package point-undo
  :defer t
  :bind (("C-c p C-u" . point-undo)
	 ("C-c p C-r" . point-redo)))
